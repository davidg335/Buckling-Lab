clear;

%load('PracticeProblemInput (2).mat');
%load('TrussDesignA_DylannDavidArnaldo_A2.mat');
%load('TrussDesignAv2_DylannDavidArnaldo_A2.mat');
load('TrussDesignAv3_DylannDavidArnaldo_A2.mat');
%load('TrussDesignB_DylannDavidArnaldo_A2.mat');

name="A";

exLoad=max(L);
numMembers=size(C,2);
numJoints=size(C,1);
numForces=numMembers+3;
totalLength=0; %total length of material used for each member
memberLengths=zeros(numMembers,1);

%set up A to have 2*num_joints rows and 3+num_members columns
A = zeros(numJoints*2,numForces);

% n_1: first node for joint col found, n_2 is second one found 
%setting values for first numMembers columns
for col=1:numMembers
    n_1=-1;
    for row_x=1:numJoints
        if C(row_x,col)==1
            if n_1==-1
                n_1=row_x;
            else
                n_2=row_x;
                [unitVec, r]=calcUnitVec(n_1,n_2,X,Y);
                % x values of unit vector
                A(n_1,col)=unitVec(1);
                A(n_2,col)=unitVec(1)*-1;
                %y values of unit vector
                A(n_1+numJoints,col)=unitVec(2);
                A(n_2+numJoints,col)=unitVec(2)*-1;

                %add length of member to totalLength
                totalLength=totalLength+r;
                memberLengths(col)=r;
                break;
            end
        end
    end
end

%setting values for Sx, Sy values:
for row=1:size(Sx,1)
    for col=1:size(Sy,2)
        A(row,col+numMembers)=Sx(row,col);
        A(row+numJoints,col+numMembers)=Sy(row,col);
    end
end
%disp(A)

solvedForces=mldivide(A,L);
date=datetime("today");
cost=10*numJoints + 1*totalLength;
[wFail,memBuckleFirst]=calcWFail(memberLengths,exLoad,solvedForces(1:numMembers));


% Display the truss information in the specified format
fprintf('\n\n\\%% EK301, Section A2, Group XX: Dylann Palmer|Arnaldo Bisbal|David Gardner, %s\n', string(date));
fprintf('\nTruss Name: %s \n', name);
fprintf('Load: %.2f oz\n', exLoad);

% Member forces in oz
fprintf("\nReaction forces in oz\n");
for i = 1:numMembers
    if solvedForces(i)>.001
        fprintf('m%d: %.3f (T)\n', i, solvedForces(i));
    elseif solvedForces(i)<-.001
        fprintf('m%d: %.3f (C)\n', i, solvedForces(i)*-1);
    else
        fprintf('m%d: %.3f (n/a)\n', i, 0);
    end
end

% Reaction forces in oz
fprintf("\nReaction forces in oz\n");
fprintf('Sx1: %.3f\n', solvedForces(numMembers + 1));
fprintf('Sy1: %.3f\n', solvedForces(numMembers + 2));
fprintf('Sy2: %.3f\n', solvedForces(numMembers + 3));


fprintf('\nCost of truss: $%.2f\n', cost);
fprintf('Member to buckle first: m%.0f\n',memBuckleFirst);
fprintf('Maximum external force before buckling: %.2f oz\n',wFail);
fprintf('Theoretical max load/cost ratio: %.4f oz/$\n\n\n', wFail / cost);



%input types: double,double,bool
function [unitVec,r] = calcUnitVec(joint_1,joint_2,X,Y)
joint_1=cast(joint_1,"uint32");
joint_2=cast(joint_2,"uint32");

%disp([X(joint_2),X(joint_1)]);
%disp([Y(joint_2),Y(joint_1)]);

unitVec=[X(joint_2)-X(joint_1), Y(joint_2)-Y(joint_1)];
r=sqrt((X(joint_1)-X(joint_2))^2+(Y(joint_1)-Y(joint_2))^2);
unitVec=unitVec./r;

%disp(unitVec);
end

%input types: 1-D matrix with length numMembers, double, 1-D matrix with length numMembers
function [w_fail,memBuckleFirst] = calcWFail(memberLengths,f_external,memberTensions)
memberW_fails=Inf(size(memberLengths,1),1);
for member=1:size(memberLengths)
    if abs(memberTensions(member))>.001
         r_m=memberTensions(member)/f_external;
         p_crit=3654.533*(memberLengths(member)^(-2.119));
         w_fail_m=-p_crit/r_m;
         if w_fail_m>0
             memberW_fails(member)=w_fail_m;
         end
    end
end

disp_all_W_fails=true;
if disp_all_W_fails
    for mem= 1:size(memberLengths,1)
        fprintf("%.3f\n",memberW_fails(mem));
        %fprintf("Member %.0f: %.3f\n",mem,memberW_fails(mem));
    end
end
%fprintf('%s \n\n %s \n\n %s \n\n %s', r_m,p_crit,w_fail_m, memberW_fails)
[w_fail,memBuckleFirst]=min(memberW_fails);
%disp(memberW_fails);
end


