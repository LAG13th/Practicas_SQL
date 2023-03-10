select * from localidades;
select * from provincias;
select * from comunidades;

--Parte 1
select l.nombre,poblacion,p.nombre
from localidades l
join provincias p using (n_provincia);


--Parte 2
select p.nombre as Provincia,l.nombre as capital
from PROVINCIAS p
join LOCALIDADES l on (id_localidad =ID_CAPITAL);

--Parte 3
select p.nombre as Provincia,c.nombre as Comunidad,l.nombre as Localidad
from LOCALIDADES l
join provincias p using(n_provincia)
join comunidades c using (id_comunidad);

--Parte 4
select p.nombre as Provincia,
       c.nombre as Comunidad,
       l.nombre as Localidad,
       o.nombre as Capital_de_provincia
from LOCALIDADES l
join provincias p using(n_provincia)
join comunidades c using (id_comunidad)
join localidades o on (o.ID_LOCALIDAD=p.ID_CAPITAL);


--Parte 5
select p.nombre as Provincia,
       c.nombre as Comunidad,
       l.nombre as Localidad,
       cp.nombre as capital_de_provincia,
       cc.nombre as capital_de_comunidad
from LOCALIDADES l
join provincias p using(n_provincia)
join comunidades c using (id_comunidad)
join localidades cp on (cp.id_localidad=p.id_Capital)
join localidades cc on (cc.id_localidad=c.id_Capital);

--Parte 6
select l.nombre as Localidad, POBLACION,p.nombre as Provincia
from LOCALIDADES l
join PROVINCIAS p on (ID_LOCALIDAD=ID_CAPITAL)
where poblacion>200000
order by POBLACION asc;

--Parte 7
select c.nombre as Comunidad, POBLACION
from comunidades c
join LOCALIDADES on (ID_LOCALIDAD=ID_CAPITAL)
where poblacion>200000 and c.ID_CAPITAL=ID_localidad;


--Parte 8
select l.NOMBRE,l.poblacion,p.nombre provincia, cp.nombre capital, cp.POBLACION
from LOCALIDADES l
join PROVINCIAS p using (n_provincia)
join localidades cp on (cp.ID_LOCALIDAD=p.ID_CAPITAL)
where l.poblacion>cp.poblacion;


--Parte 9
select l.nombre localidades, p.nombre capital
from PROVINCIAS p
right join LOCALIDADES l on(ID_LOCALIDAD=id_capital)
where p.nombre is null;


--Parte 10
select p.nombre as capital,l.nombre as localidad
from PROVINCIAS p
join LOCALIDADES l on (ID_LOCALIDAD=ID_CAPITAL)
where p.nombre!=l.nombre;


--Parte 11
select c.NOMBRE,cc.nombre
from COMUNIDADES c
join comunidades cc using (id_comunidad);


--Parte 12
select ID_COMUNIDAD,count(*)
from PROVINCIAS
join COMUNIDADES  using (id_comunidad)
group by ID_COMUNIDAD
order by 1;

--Parte 13
select regexp_substr(p.NOMBRE,'Palencia'),count(*)
from PROVINCIAS p
join LOCALIDADES using (n_provincia)
group by regexp_substr(p.NOMBRE,'Palencia');


--Parte 14
select ID_COMUNIDAD,count(c.NOMBRE)
from LOCALIDADES l
join COMUNIDADES c on (ID_COMUNIDAD<ID_LOCALIDAD)
group by ID_comunidad,N_PROVINCIA
order by ID_COMUNIDAD;

select * from PROVINCIAS;
select * from LOCALIDADES;
select * from COMUNIDADES;
--Parte 15
select p.NOMBRE,ID_LOCALIDAD,l.NOMBRE
from provincias p
join localidades l using (n_provincia)
having sum(poblacion)>10000
group by p.nombre,ID_LOCALIDAD,l.NOMBRE
order by sum(poblacion) asc;

--Parte 16
select max(count(*))
    from PROVINCIAS p
    join LOCALIDADES l using(n_provincia)
    group by p.nombre;


--Parte 17
select p.nombre,sum(l.poblacion) as poblacion
from PROVINCIAS p
join COMUNIDADES c using (id_comunidad)
join LOCALIDADES l using (n_provincia)
where c.NOMBRE='Castilla y León'
group by p.nombre
order by POBLACION desc;

--Parte 18

select p.NOMBRE as Provincia,l.nombre as Localidad
from PROVINCIAS p
join LOCALIDADES l using (n_provincia)
join COMUNIDADES c using (id_comunidad)
where c.NOMBRE='Castilla y León'
order by POBLACION desc;


--Parte 19
select p.NOMBRE as Provincia,l.nombre as Localidad
from PROVINCIAS p
join LOCALIDADES l using (n_provincia)
join COMUNIDADES c using (id_comunidad)
where c.NOMBRE='Castilla y León' and  l.id_localidad!=c.ID_CAPITAL
order by POBLACION desc;

--Parte 20
select p.nombre, count(n_provincia) as Numero_de_localidades
from provincias p
join LOCALIDADES using(n_provincia)
having count(N_PROVINCIA)>200
group by p.nombre
order by count(N_PROVINCIA) desc;

--Parte 21
select p.nombre as Provincia,
       To_char(superficie,'999G999')||' '||'km2' as Superficie,
       to_char(sum(POBLACION),'9G999G999')||' '||'h' as Población
from provincias p
join localidades l using (n_provincia)
group by p.nombre,superficie
order by provincia;

--Parte 22
select p.nombre as Provincia,
       To_char(superficie,'999G999')||' '||'km2' as Superficie,
       to_char(sum(POBLACION),'9G999G999')||' '||'h' as Población,
       to_char(sum(poblacion)/superficie,'9G999G999')||' '||'h/km2' as Densidad
from provincias p
join localidades l using (n_provincia)
group by p.nombre,superficie
order by densidad desc;


--Parte 23
select c.NOMBRE as Comunidad,
       to_char(sum(poblacion),'999G999G999')||' '||'h' as Población
from comunidades c
join localidades l on(ID_LOCALIDAD>id_capital)
join provincias p using(n_provincia)
group by c.nombre
order by c.nombre asc;

--Parte 24
select l.nombre, l.poblacion
from localidades l
cross join(
        select nombre,POBLACION
        from LOCALIDADES
        where nombre='Palencia'
) p
where l.poblacion>p.poblacion
order by l.poblacion;


--Parte 25
select p.nombre, sum(l.poblacion) as Poblacion
from localidades l
join provincias p using (n_provincia)
cross join (
    select p.nombre,sum(poblacion) as Poblacion
    from localidades l
    join provincias p using (n_provincia)
    where p.nombre='Guipuzcoa'
    group by p.nombre
) g
group by p.nombre, g.Poblacion
having sum (l.poblacion)>g.Poblacion
order by sum(l.poblacion);