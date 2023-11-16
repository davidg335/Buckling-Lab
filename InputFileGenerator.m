% Input file With all this in mind, set up a general analysis code that will accept an input file
% with the following input parameters and their values:
% 1. The connection matrix C; (i.e.: C = [1 1 0 0 ... 0; 1 0 0 0 ... 0; ... ];)
% 2. The Sx matrix of reaction forces in the x-direction;
% 3. The Sy matrix of reaction forces in the y-direction;
% 4. The joint location vectors X and Y ;
% 5. The vector of applied external loads L.
% Save these parameters to a .mat file, using the following syntax in Matlab:
% save(‘TrussDesign1_MaryJoeBob_A1.mat’,‘C’,‘Sx’,‘Sy’,‘X’,‘Y’,‘L’)

toSave="Av3";

if toSave=="A"
    %Truss A
    numJoints=7;
    numMembers=11;
    C=[1,0,1,0,0,0,0,0,0,0,0;
       1,1,0,0,1,1,0,0,0,0,0;
       0,1,1,1,0,0,0,0,0,0,0;
       0,0,0,1,1,0,1,1,0,0,0;
       0,0,0,0,0,0,0,1,1,1,0;
       0,0,0,0,0,1,1,0,0,1,1;
       0,0,0,0,0,0,0,0,1,0,1];
    Sx=zeros(numJoints,3);
    Sx(1,1)=1;
    Sy=zeros(numJoints,3);
    Sy(1,2)=1;
    Sy(7,3)=1;
    X=[0,9,5,16.5,28,24,33];
    Y=[0,0,7,10,7,0,0]; % 8 values where changed from 7 from v1 to v2
    L=[0,0,0,0,0,0,0,0,0,0,0,0,32,0].';
    save("TrussDesignA_DylannDavidArnaldo_A2.mat",'C','Sx','Sy','X','Y','L');
elseif toSave=="Av2"
    %Truss Av2
    numJoints=7;
    numMembers=11;
    C=[1,0,1,0,0,0,0,0,0,0,0;
       1,1,0,0,1,1,0,0,0,0,0;
       0,1,1,1,0,0,0,0,0,0,0;
       0,0,0,1,1,0,1,1,0,0,0;
       0,0,0,0,0,0,0,1,1,1,0;
       0,0,0,0,0,1,1,0,0,1,1;
       0,0,0,0,0,0,0,0,1,0,1];
    Sx=zeros(numJoints,3);
    Sx(1,1)=1;
    Sy=zeros(numJoints,3);
    Sy(1,2)=1;
    Sy(7,3)=1;
    X=[0,9,5,16.5,28,24,33];
    Y=[0,0,8,10,8,0,0]; % 8 values where changed from 7 from v1 to v2
    L=[0,0,0,0,0,0,0,0,0,0,0,0,32,0].';
    save("TrussDesignAv2_DylannDavidArnaldo_A2.mat",'C','Sx','Sy','X','Y','L');
elseif toSave=="Av3"
    %Truss Av3
    numJoints=7;
    numMembers=11;
    C=[1,0,1,0,0,0,0,0,0,0,0;
       1,1,0,0,1,1,0,0,0,0,0;
       0,1,1,1,0,0,0,0,0,0,0;
       0,0,0,1,1,0,1,1,0,0,0;
       0,0,0,0,0,0,0,1,1,1,0;
       0,0,0,0,0,1,1,0,0,1,1;
       0,0,0,0,0,0,0,0,1,0,1];
    Sx=zeros(numJoints,3);
    Sx(1,1)=1;
    Sy=zeros(numJoints,3);
    Sy(1,2)=1;
    Sy(7,3)=1;
    X=[0,11,8,20,29,24,33];
    Y=[0,0,8,12,8,0,0]; % 8 values where changed from 7 from v1 to v2
    L=[0,0,0,0,0,0,0,0,0,0,0,0, 40.96,0].';
    save("TrussDesignAv3_DylannDavidArnaldo_A2.mat",'C','Sx','Sy','X','Y','L');
elseif toSave=="B"
    %Truss B
    numJoints=8;
    numMembers=13;
    C=[1,1,0,0,0,0,0,0,0,0,0,0,0;
       1,0,1,0,1,1,0,0,0,0,0,0,0;
       0,1,1,1,0,0,0,0,0,0,0,0,0;
       0,0,0,1,1,0,1,1,0,0,0,0,0;
       0,0,0,0,0,0,0,1,1,1,0,0,0;
       0,0,0,0,0,1,1,0,1,0,0,1,1;
       0,0,0,0,0,0,0,0,0,1,1,1,0;
       0,0,0,0,0,0,0,0,0,0,1,0,1];
    Sx=zeros(numJoints,3);
    Sx(1,1)=1;
    Sy=zeros(numJoints,3);
    Sy(1,2)=1;
    Sy(8,3)=1;
    X=[0,10,6,14,24,24,29,33];
    Y=[0,0,6,10,14,0,7,0];
    L=[0,0,0,0,0,0,0,0,0,0,0,0,0,47.15,0,0].';
    save("TrussDesignB_DylannDavidArnaldo_A2.mat",'C','Sx','Sy','X','Y','L');
end


