-- 5 comarcAS mAS grandes
SELECT nom_comar, st_area(geom) AS area_m2, st_area(geom)/1000000 AS area_km2
FROM LIMIT_admin.comarques
ORDER BY ST_Area(geom) DESC
LIMIT 5;

-- comarcAS mAS grandes de 1000 km2
SELECT nom_comar, ST_ASEWKT(ST_Centroid(geom))
FROM LIMIT_admin.comarques
WHERE ST_Area(geom) > 1000000000;

-- Habitantes por provincia						 
SELECT m.codi_prov, sum(m.poblacio) AS habitantes
	-- , ST_UniON(geom) AS geom
FROM LIMIT_admin.municipis AS m
WHERE m.poblacio is not null
GROUP BY m.codi_prov;

-- Habitantes por comarca						 
SELECT m.nom_comar, sum(m.poblacio) AS habitantes
	-- , ST_UniON(geom) AS geom
FROM LIMIT_admin.municipis AS m
WHERE m.poblacio is not null
GROUP BY m.nom_comar
ORDER BY sum(m.poblacio) DESC;

-- CONtar cuantos municipios hay en cada comarca
SELECT nom_comar, count(nom_comar)
FROM LIMIT_admin.municipis
WHERE poblacio is not null
GROUP BY nom_comar;

-- listado de nombres de comarcAS y espacios del PEIN
SELECT 'comarca' AS origen , nom_comar AS nom
FROM limit_admin.comarques
UNION 
SELECT 'pein' AS origen, nom_pein AS nom
FROM medi_ambient.pein
ORDER BY origen, nom;
				  