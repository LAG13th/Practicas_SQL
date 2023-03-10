/* Parte 1 */
select 57 from ALUMNOS;

/* Parte 2 */
select sqrt(23) from ALUMNOS;

/* Parte 3 */
select to_char(sqrt(23),'9D999') from alumnos;

/* Parte 4 */
Select NOMBRE,upper(substr(nombre,-3,3)) as TRESLETRAS
from alumnos
order by nombre desc;

/* Parte 5 */
select dni, nombre, apellido1, apellido2, direccion,
       substr(TELEFONO,1,3)||' '||substr(TELEFONO,4,3)||' '||substr(TELEFONO,7,3) as telefono,
       edad, cif, email
from alumnos;

/* Parte 6 */
select n_curso, add_months(FECHA_INICIO,1) , add_months(fecha_fin,1) , cod_curso, dni_profesor
from cursos;

/* Parte 7 */
select n_curso,FECHA_INICIO + (45/(24*60)) ,fecha_fin + (45/(24*60)) , cod_curso, dni_profesor
from cursos;

/* Parte 8 */
select N_CURSO,FECHA_INICIO,FECHA_FIN, abs(round(months_between(FECHA_INICIO,FECHA_FIN)*30)) as dias_de_diferencia
from cursos;

/* Parte 9 */
select N_CURSO,to_char(FECHA_INICIO,'fmDay dd "de" month "de" yyyy"," hh:mm am') as Fecha_de_Inicio,
       to_char(FECHA_fin,'fmdd "de" dd month "de" yyyy"," hh:mm am') as Fecha_de_Fin,
       abs(round(months_between(FECHA_INICIO,FECHA_FIN)*30))
from cursos;

/* Parte 10 */
select extract(day from last_day(sysdate)) as dias_del_mes
from ALUMNOS;

/* Parte 11 */
Select (to_number(to_char('01/01/2023')))
from alumnos;
select round(abs(sysdate - to_date('01-01-2024','dd-mm-yyyy'))) as Hasta_año_nuevo
from alumnos;

/* Parte 12 */
select round(abs(to_date('01-01-2000','dd-mm-yyyy') - to_date('01-01-2024','dd-mm-yyyy'))) as dias_trascurridos
from alumnos;

/* Parte 13 */
select NOMBRE,APELLIDO1,APELLIDO2
from ALUMNOS
where substr(APELLIDO1,1,1)='S' and substr(APELLIDO2,1,1)='S';

/* Parte 14 */
select NOMBRE,APELLIDO1,APELLIDO2
from alumnos
where substr(APELLIDO1,1,1) = substr(apellido2,1,1);

/* Parte 15 */
select replace(DIRECCION,' ')
from alumnos;
/* Parte 16 */
select * from CURSOS;
select n_curso,cod_curso, to_number(to_char(FECHA_FIN,'HH')) - to_number(to_char(FECHA_INICIO,'HH'))
from cursos;

/* Parte 17 */
select nombre,APELLIDO1,APELLIDO2,
case
    when telefono is null then 'Sin_telefono'
    when substr(telefono,1,1)=6 then 'Fijo'
    When substr(telefono,1,1)=9 then ' Movil'
    end
from alumnos;

/* Parte 18 */
select NOMBRE,APELLIDO1,APELLIDO2,
       regexp_substr(DIRECCION,'^+[[:alpha:]]+ ') as Tipo_via,
       regexp_replace(regexp_replace(DIRECCION,'^[[:alpha:]]+'), '([0-9]|s/n)+$') as Nombre_de_Via,
       regexp_substr(DIRECCION,'([0-9]|s/n)+$')
from ALUMNOS;
select DIRECCION from ALUMNOS;

/* Parte 19 */
select NOMBRE,APELLIDO1,APELLIDO2,
       regexp_replace(regexp_substr(DIRECCION,'^+[[:alpha:]]+ '),'c|C ','Calle') as Tipo_via,
       regexp_replace(regexp_replace(DIRECCION,'^[[:alpha:]]+'), '([0-9]|s/n)+$') as Nombre_de_Via,
       regexp_substr(DIRECCION,'([0-9]|s/n)+$')
from ALUMNOS;

/* Parte 20 */
select nombre,APELLIDO1,APELLIDO2,upper(regexp_replace(APELLIDO1,'[aeiouáíóúéAEIOUÁÉÍÓÚÉ]'))
                                      ||upper(substr(APELLIDO2,1,3))
                                      ||upper(substr(NOMBRE,1,1)) as Nombre_Usuario
from ALUMNOS;

/* Parte 21 */
select N_CURSO,FECHA_INICIO,FECHA_FIN
from cursos
where to_char(FECHA_INICIO,'D')<=3;

/* Parte 22 */
select
decode(extract(day from last_day(to_date('1/2/'||(extract(year from SYSDATE)),'dd/mm/yyyy'))),29,'Bisiesto','No Bisiento')
from ALUMNOS;

/* Parte 23 */
select
    regexp_count(NOMBRE,'[áéíóúÚÓÁÉÍ]')
                                        +
    regexp_count(APELLIDO1,'[áéíóúÚÓÁÉÍ]')
                                        +
    regexp_count(APELLIDO2,'[áéíóúÚÓÁÉÍ]')
from ALUMNOS;
