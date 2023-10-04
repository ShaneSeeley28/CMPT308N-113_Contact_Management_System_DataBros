create database if not exists phase03;
use phase03;

CREATE TABLE places (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  location POINT NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO places (name, location)
VALUES
  ('Mt. Everest', POINT(27.9881, 86.9250)),
  ('Mont St. Michel', POINT(48.6361, -1.5115)),
  ('Macchu Picchu', POINT(-13.2263, 72.4973)),
  ('Pamukkale', POINT(37.9137, -29.1187)),
  ('Delicate Arch', POINT(38.7436, 109.4993));

SELECT name, ST_DISTANCE(location, POINT(-73.9819, 40.7681)) AS distance
FROM places
ORDER BY distance;

create table geom (g GEOMETRY);
explain geom;

ALTER TABLE geom ADD pt POINT;
ALTER TABLE geom DROP pt;

INSERT INTO geom VALUES (ST_GeomFromText('POINT(1 1)'));
SET @g = 'POINT(1 1)';
INSERT INTO geom VALUES (ST_GeomFromText(@g));
select * from geom;

SET @g = 'LINESTRING(0 0,1 1,2 2)';
INSERT INTO geom VALUES (ST_GeomFromText(@g));
SET @g = 'POLYGON((0 0,10 0,10 10,0 10,0 0),(5 5,7 5,7 7,5 7, 5 5))';
INSERT INTO geom VALUES (ST_GeomFromText(@g));
SET @g = 'GEOMETRYCOLLECTION(POINT(1 1),LINESTRING(0 0,1 1,2 2,3 3,4 4))';
INSERT INTO geom VALUES (ST_GeomFromText(@g));
select St_AsText(g) from geom;