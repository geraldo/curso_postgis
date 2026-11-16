-- Quin codi té la comarca del Bages?
SELECT DISTINCT(codi_comar)
FROM limit_admin.municipis
WHERE nom_comar = 'Bages'

-- Llistar els municipis que hi ha a la comarca del Baix Llobregat?
SELECT nom_muni
FROM limit_admin.municipis
WHERE nom_comar = 'Baix Llobregat'

-- Llistar els municipis que tenen més de 1000 metres d’altitud i més de 1000 habitants?
SELECT nom_muni, altitud_m, poblacio
FROM limit_admin.municipis
WHERE altitud_m > 1000 AND poblacio > 1000;

-- Llistar els municipis que tenen més de 200 km2?
SELECT nom_muni, aream5000
FROM limit_admin.municipis
WHERE aream5000 > 200;

-- Llistar els 10 municipis més grans
SELECT nom_muni, aream5000
FROM limit_admin.municipis
ORDER BY aream5000 DESC
LIMIT 10;