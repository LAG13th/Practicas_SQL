select *
from EXISTENCIAS;


--Parte 1
select N_ALMACEN,tipo,modelo,CANTIDAD
from EXISTENCIAS
where cantidad>=2000 and cantidad<=3000;


--Parte 2
select tipo,modelo,p.PRECIO_VENTA,e.N_ALMACEN,e.cantidad
from EXISTENCIAS e
join piezas p using(tipo,modelo);


--Parte 3
select e.nombre,e.localidad,s.tipo,s.modelo,s.PRECIO_COMPRA
from empresas e
join suministros s using(cif);


--Parte 4
select e.nombre,e.localidad,s.tipo,s.modelo,s.PRECIO_COMPRA
from empresas e
join suministros s using(cif);


--Parte 5
select p.n_pedido,e.nombre,initcap(to_char(fecha,'fmday "de" month "del año" yyyy')) as Fecha_Pedido
from pedidos p
join EMPRESAS e using(cif);


--Parte 6
select p.n_pedido,e.nombre,initcap(to_char(fecha,'"Trimestre" Q dy dd#mm#yyyy'))
from pedidos p
join EMPRESAS e using(cif);


--Parte 7
select nombre,TELEFONO
from empresas
where TELEFONO like '%1' or TELEFONO like '%3' or TELEFONO like '%5' or telefono like '%6';


--Parte 8
select NOMBRE,TELEFONO
from empresas
where telefono like '__2%' or telefono like '__4%' or telefono like '__6%' or telefono like '__8%';


--Parte 9
select distinct PROVINCIA
from empresas;


--Parte 10
select tipo,modelo,to_char(PRECIO_VENTA,'0D999L') as Precio_Venta,
       to_char(PRECIO_VENTA*0.21 + PRECIO_VENTA,'0D999L') as Precio_con_IVA
from piezas;


--Parte 11
Select DESCRIPCION,cantidad,tipo,modelo,precio_venta,
       decode(N_ALMACEN,1,'Primer Almacen',2,'Segundo Almacen',3,'Tercer Almacen') as Numero_Almacen
from EXISTENCIAS
join almacenes using(n_almacen)
join piezas using(tipo,modelo)
order by N_ALMACEN,tipo,MODELO;


--Parte 12
select nombre,TELEFONO
from empresas
where not regexp_like(telefono,'^[679][0-9]{8}$');


--Parte 13
select tipo,MODELO,CANTIDAD,N_ALMACEN
from EXISTENCIAS
right outer join piezas using (tipo,modelo)
where N_ALMACEN is null;



--Parte 14
select tipo,modelo,nvl(cast(N_ALMACEN as varchar2(2)),'Sin_almacen')
from EXISTENCIAS e
full outer join piezas p using (tipo,modelo)
join TIPOS_PIEZA t using (tipo);

select * from TIPOS_PIEZA;

--Parte 15
select e.nombre as Empresa1, a.nombre as Empresa2, a.provincia
from empresas e
cross join empresas a
where e.nombre>a.NOMBRE and e.PROVINCIA=a.PROVINCIA;






