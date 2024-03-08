Sets
    planes /largo, mediano, corto/;

Parameters
    precio(planes) /largo 67, mediano 50, corto 35/,
    ganancia_neta(planes) /largo 4.2, mediano 3, corto 2.3/;

Scalar 
    limite_inversion /1.5e9/,
    limite_pilotos /2/,
    limite_instalaciones /40/,
    cantidad_maxima_aviones /30/;

Variables
    x(planes)  cantidad de aviones de cada tipo
    Z;

Positive Variables x;

Equations
    Fobj,
    inversion_total,
    cantidad_aviones,
    cantidad_pilotos,
    cantidad_instalaciones;

Fobj..    Z =e= sum(planes, ganancia_neta(planes) * x(planes));
inversion_total.. sum(planes, precio(planes) * x(planes)) =l= limite_inversion;

cantidad_aviones.. sum(planes, x(planes)) =l= cantidad_maxima_aviones;

cantidad_pilotos.. x('corto') =l= limite_pilotos;

cantidad_instalaciones.. x('mediano') + 5/3 * x('largo') =l= limite_instalaciones;

Model compra_aviones /all/;
Solve compra_aviones using mip maximizing Z;
