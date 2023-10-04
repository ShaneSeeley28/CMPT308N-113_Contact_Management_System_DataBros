create database if not exists phase03;
use phase03;

drop table geom;

create table geom (
	fid int,
    g GEOMETRY NOT NULL SRID 0,
    Spatial index(g));

insert into geom(fid, g) values
(1, ST_GeomFromText('POINT (1 1)')),
(2, ST_GeomFromText('POINT (3 3)')),
(3, ST_GeomFromText('POINT (5 5)'));

set @g1 = (select g from geom where fid=1);
set @g2 = (select g from geom where fid=3);

select St_AsText(@g1);
select St_AsText(@g2);

select ST_distance(@g1, @g2);