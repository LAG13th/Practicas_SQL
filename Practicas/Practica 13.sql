select * from PARTIDOS_COMPLETOS;

/*1 Parte*/
select sysdate from PARTIDOS_COMPLETOS;

/*2 Parte*/
select 673*134 from PARTIDOS_COMPLETOS;

/*3 Parte*/
select EQUIPO_CASA,EQUIPO_FUERA, GOLES_CASA||'-'||GOLES_FUERA as resultado,
        to_char(fecha,'fmdd "de" month "de" yyyy') as Fecha_Partido,
from PARTIDOS_COMPLETOS;

/*4 Parte*/
select EQUIPO_CASA,EQUIPO_FUERA,'('|| GOLES_CASA ||'-'||GOLES_FUERA||')' as resultado,
        to_char(fecha,'fmdd "de" month "de" yyyy') as Fecha_Partido,to_char(aforo,'9,999')
from PARTIDOS_COMPLETOS
where FECHA between to_date('2021-04-01','yyyy-mm-dd') and to_date('2021-04-30','yyyy-mm-dd');

/*5 Parte*/
select EQUIPO_CASA,EQUIPO_FUERA,'('|| GOLES_CASA ||'-'||GOLES_FUERA||')' as resultado,
        to_char(fecha,'fmdd "de" month "de" yyyy') as Fecha_Partido,to_char(aforo,'9,999')
from PARTIDOS_COMPLETOS
where to_char(FECHA,'fmday')='domingo';

/*6 Parte*/
select distinct estadio
from PARTIDOS_COMPLETOS;

/*7 Parte*/
Alter table PARTIDOS_COMPLETOS add clave varchar2(25)
    constraint partidos_completos_ck check (length(clave)>4);

alter table PARTIDOS_COMPLETOS drop (clave);

/*8 Parte*/
Update PARTIDOS_COMPLETOS
set clave=substr(EQUIPO_CASA,1,3)||substr(EQUIPO_CASA,-3) ||to_char(fecha,'fmddMONTH');
select EQUIPO_CASA,Fecha,clave
from PARTIDOS_COMPLETOS;

/*9 Parte*/
select distinct EQUIPO_CASA,CIUDAD_CASA
from PARTIDOS_COMPLETOS
where substr(EQUIPO_CASA,1,1) = substr(CIUDAD_CASA,1,1);

/*10 Parte*/
select EQUIPO_CASA
from PARTIDOS_COMPLETOS
where upper(substr(EQUIPO_CASA,1,1)) = upper(substr(EQUIPO_CASA,-1,1));


/*11 Parte*/
select distinct EQUIPO_CASA
from PARTIDOS_COMPLETOS
where   upper(equipo_casa) like '%'|| substr(EQUIPO_CASA,1,1) ||'%'