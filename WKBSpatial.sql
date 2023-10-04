create database if not exists phase03;
use phase03;

drop table geom;
create table geom (g GEOMETRY, wkb blob);

SET @g = ST_GeomFromText('POINT(1 -1)');
SELECT LENGTH(@g);

SELECT HEX(@g);
