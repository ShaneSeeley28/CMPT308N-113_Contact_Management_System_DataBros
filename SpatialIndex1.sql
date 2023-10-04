create database if not exists phase03;
use phase03;

create table geom (g GEOMETRY NOT NULL SRID 4326, SPATIAL INDEX(g));

describe geom;
select * from geom;

ALTER TABLE geom DROP INDEX g;