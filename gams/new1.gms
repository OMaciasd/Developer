Sets
    i /anillos, aretes, collares/;

Parameters
    ganancias(i) /anillos 1500, aretes 2400, collares 3600/,
    diamantecaratl(i) /anillos 4, aretes 3, collares 10/,
    diamantecarat2(i) /anillos 6, aretes 5, collares 9/;

Scalar diamantel /150/,
       diamante2 /160/,
       numerod /50/,
       numerom /100/;

Variables
    X(i)   cantidad de joyas tipo i a producir
    Z      ganancias estimadas por la producción de joyas;

Equations
    Fobj    funcion objetivo
    R1      restriccion diamante un medio
    R2      restriccion diamante un cuarto
    R3      restriccion gerencia
    R4      límite máximo de joyas a producir
    R5      límite de diamantes;

Fobj..    Z =e= sum(i, ganancias(i) * X(i));

R1.. sum(i, diamantecaratl(i) * X(i)) =l= diamantel;

R2.. sum(i, diamantecarat2(i) * X(i)) =l= diamante2;

R3.. sum(i, X(i)) =l= numerod;

R4.. sum(i, X(i)) =l= numerom;

* Restricción adicional para limitar el número total de diamantes utilizados
R5.. sum(i, diamantecaratl(i) * X(i) + diamantecarat2(i) * X(i)) =l= diamantel + diamante2;

* Resuelve el modelo
Model joyas /all/;
Solve joyas using MIP maximizing Z;
