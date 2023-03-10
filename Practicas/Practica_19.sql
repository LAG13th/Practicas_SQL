-- Parte 1
Select NOMBRE
from PERSONAS
where N_PADRE is null and N_MADRE is null;


-- Parte 2
select p.nombre as Hijo,p2.Nombre as Padre,p3.Nombre as Madre
from personas p
join personas p2 on (p.n_padre=p2.n_persona)
join personas p3 on (p.n_madre=p3.n_persona);


-- Parte 3
select p.nombre as Hijo,p2.Nombre as Padre,p3.Nombre as Madre
from personas p
left outer join personas p2 on (p.n_padre=p2.n_persona)
left outer join personas p3 on (p.n_madre=p3.n_persona);


-- Parte 4
select p3.nombre as Padre,p2.NOMBRE as madre,count(p.nombre) as hijos
from personas p
 join PERSONAS p2 on(p.n_madre=p2.n_persona)
 join personas p3 on (p.n_padre=p3.N_PERSONA)
group by p2.nombre,p3.nombre
order by count(p.nombre) desc,Padre,madre;




-- Parte 5
select p.NOMBRE as madre
from personas p
join PERSONAS p2 on(p.n_madre=p2.n_persona)
where p.SEXO='M';

select p2.NOMBRE as madre,count(p.nombre) as hijas
from personas p
 join PERSONAS p2 on(p.n_madre=p2.n_persona)
having count(p.nombre)=2 and p.sexo='M'
group by p2.nombre,p.sexo;

-- Parte 6
select p2.nombre as Padre,  p.nombre as hijos
from PERSONAS p
join personas p2 on (p.n_padre=p2.N_persona)
where substr(p.nombre,1,1)=substr(p2.nombre,1,1);

select * from PERSONAS;
-- Parte 7


-- Parte 8
select p2.nombre as Madre,p3.NOMBRE as Abuela
from PERSONAS p
join personas p2 on(p.N_Madre=p2.N_persona)
join personas p3 on (p2.N_madre=p3.N_persona)
where p.sexo='M' and p2.sexo='M'
group by p2.nombre, p3.NOMBRE;

-- Parte 9
select p.nombre, p2.nombre
from PERSONAS p
right join PERSONAS p2 on (p.N_PADRE=p2.N_PERSONA)
where p.nombre is null and p2.sexo='H';


-- Parte 10


-- Parte 11

