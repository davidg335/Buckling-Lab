# Buckling-Lab
EK 301 Statics Buckling Lab Code

Preliminary Design Report:

BU EK 301 Statics Preliminary Design Report. This portion involved developing a computational program to analyze a truss as well as creating two potential designs for a truss given a set of specifications. The purpose of the truss analysis computational program is to quickly analyze potential designs and view the successes and failures of every design. Using the feedback, modifications can be made to the designs until all specifications are fulfilled. Specifically, the program provides information on the reaction forces of all members, which member will buckle first, the maximum external force before buckling occurs, cost of the truss, and the ratio between load and cost of the truss. Using our computational program, two viable options for trusses have been designed to fit all provided specifications for the Truss Project.

I included 4 input files to similate the forces in a truss depending on its external load applied to a joint.

Methodology:
To automate the calculation of member tension forces in each truss depending on a given load, we wrote a MATLAB script. The script accepts an input file with the connection matrix C, the matrices of reaction forces in the x and y directions Sx and Sy respectively, the vectors of x and y coordinates X and Y respectively, and the vector of applied external loads L. Now, let m be the number of members and n be the number of joints in the input truss. Given the inputs, the script then constructs a matrix A where for columns 1 through m, column j represents forces induced by member j. The final three columns represent forces induced by Sx1,Sy1, and Sy2. For rows 1 through n, row i represents forces applied along the x axis to joint i and for rows n+1 through 2n, row i represents forces applied along the y axis to joint i. Row i and column j of A represents the force applied to joint i by force j along the x axis if i≤n and the force applied to joint i-n by force j along the x axis if i>n.
To determine the reaction forces of the pin support, roller support, and the members of the truss, we applied mldivide() to solve the system of linear equations Ax=L, where x is a column vector containing the member force and the support force variables.
The algorithm also calculates the member to buckle first. The pcrit values were calculated using the class formula pcrit=3654.533 oz*L-2.119 ± 1.685 oz. For members in compression, we then found the load required for each member to fail by calculating Rm for each member using  Tm = Rm × W where W is the load inputted into the program and Tm is the tension induced by the inputted load. After calculing  Rm, we found the load required for each member in compression to fail Wfail =−pcrit Rm. The member in compression with the lowest Wfail value will buckle first as the weight increases from zero and we denote this Wfail value Wmax .
To determine the cost of the truss, we calculated the length of each member using the distance formula and the X and Y vectors. We then summed the lengths of each member and calculated the cost where Cost = C1 J + C2L and C1 = $10/joint , C2 = $1/ in.
The theoretical max load to cost ratio is WmaxCost.