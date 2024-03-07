model Problem_1

//Problem 1.
//Use of the van der Waals equation of state to calculate molar volume and compressibility factor for a gas.

//The problem has 3 parts: 
//a. Calculate the molar volume and compressibility factor for gaseous ammonia  at a pressure P = 56 atm and a temperature T = 450 K using the van der Waals equation of state.
// b. Repeat the calculations for the following reduced pressures: Pr = 1, 2, 4, 10, and 20.
// c. How does the compressibility factor vary as a function of Pr.?


// Numerical methods
// Solution of a single nonlinear algebraic equation.


parameter Real R(unit="atm.lit/gmol.K") = 0.08206 "General gas constant";
parameter Real Tc(unit = "K") = 405.5 "Critical temperature of ammonia";
parameter Real Pc(unit="atm") = 111.3 "Critical pressure of ammonia";

Real a "van der Walls constant a";
Real b(start=0.1) "van der Walls constant b";
Real V,Z;

parameter Real P(unit="atm") = 56;
parameter Real T(unit="K") = 450;

parameter Real Pr[5] = {1,2,4,10,20};
Real P_new[5], Z_new[5];
Real V_new[5];

equation

a = 27/64 * (R^2 * Tc^2)/Pc;
b = ( R * Tc ) / ( 8 * Pc );
(P+a/V^2)*(V-b)=R*T;
Z = P*V/(R*T);

for i in 1:5 loop
(P_new[i]+a/V_new[i]^2)*(V_new[i]-b)=R*T;
Pr[i] = P_new[i]/Pc;
Z_new[i] = P_new[i]*V_new[i]/(R*T);
end for;


end Problem_1;
