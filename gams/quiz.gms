Sets
    U /1, 2, 3/,
    T /manana, tarde/;

Parameter
    Csetup(U) /1 2800, 2 2000, 3 1900/,
    Cproc(U) /1 5, 2 3, 3 8/,
    Capacidad(U) /1 1900, 2 1700, 3 2900/,
    Dmanana /2500/,
    Dtarde /3500/,
    DeltaDtarde /100/;

Variables
    x(U, T) binary,
    Z       resultado;

Equation
    CapacidadTotalManana,
    CapacidadTotalTarde,
    UnaVezAlDia(U),
    FuncionObjetivo;

CapacidadTotalManana..
    sum(U, Capacidad(U) * x(U, 'manana')) =g= Dmanana;

CapacidadTotalTarde..
    sum(U, Capacidad(U) * x(U, 'tarde')) =g= Dtarde + DeltaDtarde;

UnaVezAlDia(U)..
    sum(T, x(U, T)) =l= 1;

FuncionObjetivo..
    Z =e= sum((U, T), (Csetup(U) + Cproc(U) * Capacidad(U)) * x(U, T));

Model ProduccionPortatiles /all/;

Option solver=cplex;

Solve ProduccionPortatiles using mip minimizing Z;
