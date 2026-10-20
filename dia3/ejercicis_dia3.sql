-- Punts centrics de comarques grans
SELECT nom_comar, ST_Centroid(geom)
FROM limit_admin.comarques
WHERE ST_Area(geom) > 1000000000;

-- Llistar les 5 comarques de Catalunya amb més àrea (en km²)?
SELECT nom_comar, ST_Area(geom) AS area
FROM limit_admin.comarques
ORDER BY area DESC
LIMIT 5;

-- Llistar els 10 municipis de Catalunya amb més població?
SELECT nom_comar, poblacio
FROM limit_admin.municipis
ORDER BY poblacio DESC
LIMIT 10;

-- Suma de població del Barcelonès
SELECT sum(poblacio)
FROM limit_admin.municipis
WHERE nom_comar = 'Barcelonès';

-- Quants municipis tenen menys de 100 habitants
SELECT count(*)
FROM limit_admin.municipis
WHERE poblacio < 100;

-- Unificar geometrías por provincias
SELECT nom_prov, ST_Union(geom) as geom
FROM limit_admin.municipis
GROUP BY nom_prov;

-- Llistar el nombre de municipis que hi ha a cada comarca?
SELECT nom_prov, COUNT(*)
FROM limit_admin.municipis
GROUP BY nom_prov;

-- Llistar la població que hi ha a cada comarca de Catalunya?
SELECT nom_prov, SUM(poblacio)
FROM limit_admin.municipis
GROUP BY nom_prov;

-- Quins comarques tenen menys de 10 municipis
SELECT nom_comar, count(*)
FROM limit_admin.municipis
GROUP BY nom_comar
HAVING count(*) < 10;

-- Crear vista provincias
CREATE VIEW limit_admin.procincias AS
SELECT nom_prov, ST_Union(geom) as geom
FROM limit_admin.municipis
GROUP BY nom_prov;