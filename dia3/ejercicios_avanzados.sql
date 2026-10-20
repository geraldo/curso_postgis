-- listado de municipios que tocan el MASsís del MONtseny
SELECT m.codi_muni, m.nom_muni, m.poblacio, m.geom
FROM LIMIT_admin.municipis AS m
LEFT JOIN medi_ambient.pein AS p
ON ST_Intersects(m.geom, p.geom) 
WHERE p.nom='MASsís del MONtseny'
GROUP BY m.codi_muni, m.nom_muni, m.poblacio, m.geom;

-- Provincia que tiene el municipi más pequeño
SELECT p.id, p.nomprov
FROM LIMIT_admin.provincies AS p
WHERE codi_prov = (
	SELECT codi_prov
	FROM LIMIT_admin.municipis
	ORDER BY ST_Area(geom) ASc 
	LIMIT 1 
);

-- 1- listado de municipios que están dentro del pein MONtseny
-- Eliminar la vista si existe
DROP VIEW IF EXISTS LIMIT_admin.v_munis_mONtseny CASCADE;
-- Crea la vista, habitantes de Cat
CREATE VIEW LIMIT_admin.v_munis_mONtseny AS
SELECT m.codi_muni, m.nom_muni, m.geom
FROM LIMIT_admin.municipis AS m, medi_ambient.espais_pein AS p
WHERE ST_Intersects(m.geom, p.geom) AND p.nom='MASsís del MONtseny'
GROUP BY m.codi_muni, m.nom_muni, m.geom;

-- 2- Superfície de intersección entre el municipio de Viladrau y el PEIN del MONtseny
-- Eliminar la vista si existe
DROP VIEW IF EXISTS LIMIT_admin.v_viladrau_mONtseny CASCADE;
-- Vista Viladrau intersectiON MONtseny
CREATE VIEW LIMIT_admin.vista_viladrau AS
  SELECT m.codi_muni, m.nom_muni,
   ST_IntersectiON(m.geom, p.geom) AS geom,
	   ST_Area(ST_IntersectiON(m.geom, p.geom))::numeric(12, 2) AS area_m2
  FROM LIMIT_admin.municipis AS m
   join medi_ambient.espais_pein AS p ON ST_Intersects(m.geom, p.geom)
  WHERE nom_muni = 'Viladrau';

-- 3- metros de rio por municipio, solo para el Tordera
-- Eliminar la vista si existe
DROP VIEW IF EXISTS LIMIT_admin.v_tordera_munis CASCADE;
-- Crea la vista LIMIT_admin.v_tordera_munis de Cat
CREATE VIEW LIMIT_admin.v_tordera_munis AS
  SELECT m.codi_muni, m.nom_muni, 
  ST_IntersectiON(ST_UniON(m.geom),ST_UniON(r.geom)) AS geom, 
  ST_Length(ST_IntersectiON(ST_UniON(m.geom),ST_UniON(r.geom)))::numeric(10,2) AS lONgitud
   FROM LIMIT_admin.municipis AS m
join medi_ambient.xarxa_rius_principal AS r ON ST_Intersects(m.geom, r.geom) 
   WHERE r.nom='la Tordera'
   GROUP BY m.codi_muni, m.nom_muni, r.nom
   ORDER BY lONgitud;