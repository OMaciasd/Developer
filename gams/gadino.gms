Sets
i variables /X1, X2/;

Parameters
objetivo(i) Costo de procesamiento 
/
X1 4
X2 -2
/

Res(i) Restr 1
/
X1 7
X2 -2
/

Res2(i) Restr 2
/
X1 0
X2 1
/

Res3(i) Restr 3
/
X1 2
X2 -2
/
;

Scalar Res11 /14/;
Scalar Res22 /3/;
Scalar Res33 /3/;

Variables
X(i) costo
Z Costo total de produccion;

Integer Variable X;

Equations
Fobj Funcion objetivo
R1 Restr 1
R2 Restr 2
R3 Restriccion 3
;

Fobj.. Z=e=sum(i,objetivo(i)*X(i));
R1..sum(i,Res(i)*X(i))=l=Res11;
R2..sum(i,Res2(i)*X(i))=l=Res22;
R3..sum(i,Res3(i)*X(i))=l=Res33;

Model Punto2/all/;

Solve Punto2 using MIP maximizing Z;
Display X.l,Z.l;