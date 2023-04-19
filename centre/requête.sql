SELECT *
FROM sessions
WHERE date_debut > (SELECT date_fin FROM sessions WHERE id = 'ID_SESSION') OR date_fin < (SELECT date_debut FROM sessions WHERE id = 'ID_SESSION')


SELECT *
FROM sessions
WHERE etat = 'En cours d'inscription' AND nb_places > (SELECT COUNT(*) FROM inscriptions WHERE id_session = sessions.id)'


SELECT sessions.id, COUNT(*) AS nb_inscrits
FROM sessions
LEFT JOIN inscriptions ON sessions.id = inscriptions.id_session
GROUP BY sessions.id


SELECT sessions.*
FROM sessions
INNER JOIN inscriptions ON sessions.id = inscriptions.id_session
WHERE inscriptions.id_apprenant = 'ID_APPRENANT'




SELECT *
FROM sessions
WHERE id_formateur = 'ID_FORMATEUR'
ORDER BY date_debut ASC

SELECT apprenants.*
FROM apprenants
INNER JOIN inscriptions ON apprenants.id = inscriptions.id_apprenant
INNER JOIN sessions ON inscriptions.id_session = sessions.id
WHERE sessions.id = 'ID_SESSION' AND sessions.id_formateur = 'ID_FORMATEUR'



SELECT sessions.*
FROM sessions
WHERE sessions.id_formateur = 'ID_FORMATEUR'
 


SELECT *
FROM formateurs
WHERE id NOT IN (
  SELECT id_formateur
  FROM sessions
  WHERE (date_debut BETWEEN 'DATE_DEBUT' AND 'DATE_FIN') OR (date_fin BETWEEN 'DATE_DEBUT' AND 'DATE_FIN')
)



SELECT *
FROM sessions
WHERE id_formation = 'ID_FORMATION'



SELECT categories.nom, COUNT(sessions.id) AS nb_sessions
FROM categories
LEFT JOIN formations ON categories.id = formations.id_categorie
LEFT JOIN sessions ON formations.id = sessions.id_formation
GROUP BY categories.nom


SELECT categories.nom, COUNT(inscriptions.id) AS nb_inscrits
FROM categories
LEFT JOIN formations ON categories.id = formations.id_categorie
LEFT JOIN sessions ON formations.id = sessions.id_formation
LEFT JOIN inscriptions ON sessions.id = inscriptions.id_session
GROUP BY categories.nom





