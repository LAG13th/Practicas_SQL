/*Punto 2*/
select nombre,apellido1,apellido2,edad
from ALUMNOS
where edad<25;

/*Punto 3*/
select apellido2||' '|| apellido1||', '||nombre as "Nombre Completo" from alumnos;

/*Punto 4*/
select nombre, apellido1, apellido2
from alumnos
where telefono is null;

/*Punto 5*/
select nombre,apellido1,apellido2
from alumnos
where apellido1='Sánchez' and apellido2='Sánchez';

/*Punto 6*/
select nombre,apellido1,apellido2
from alumnos
where apellido1=apellido2;

/*Punto 7*/
select nombre,apellido1,apellido2
from alumnos
where telefono like '6%' or telefono like '7%';

/*Punto 8*/
select nombre,apellido1,apellido2,telefono
from alumnos
where telefono like '%5%5%';

/*Punto 9*/
select nombre,apellido1,apellido2,telefono
from alumnos
where telefono like '%5%5%' and edad>50;

/*Punto 10*/
select nombre,apellido1,apellido2,direccion
from alumnos
where direccion like '_ Mayor%';

select * from ALUMNOS;

/*Punto 11*/
select nombre,apellido1,apellido2,telefono
from alumnos
where edad=20 or edad=35 or edad=45;

/*Punto 12*/
select nombre,apellido1,apellido2
from alumnos
where apellido1 in ('C%','H%','S%');

/*Punto 13*/
select nombre,apellido1,apellido2,EDAD,edad+10
from alumnos;

/*Punto 14*/
select nombre,apellido1,APELLIDO2
from ALUMNOS
where apellido1 between 'M' and 'T';

/*Punto 15*/
delete from alumnos where telefono is null;
rollback;

/*Punto 16*/
alter table CLASES.ALUMNOS add(
    email varchar2(100)
    );

update alumnos set email = nombre||apellido1||'@academiabosco.es';


/*Punto 17*/
alter table alumnos
    modify telefono constraint alumnos_ck check(telefono <> telefono like '9%' and telefono like '6%' and telefono like '7%');


