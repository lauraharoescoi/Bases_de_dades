/*Exercici 1.a*/

SELECT p.nom, c.NomCiutat, SUM(t.PreuTractament) AS total
FROM pacient p, 
	INNER JOIN visita v ON p.NumPacient = v.NumPacient 
		AND v.DataCita BETWEEN ('01/05/2019' AND '31/05/2019')
	INNER JOIN doctor d ON v.NSS = d.NSS
	INNER JOIN tractament t ON v.CodiTractament = t.CodiTractament
	INNER JOIN ciutat c ON p.CP-pacient = c.CP
GROUP BY p.nom, c.NomCiutat
HAVING COUNT(DISTINCT v.NSS) > 5
ORDER BY total DESC
LIMIT 5

/*Exercici 1.b*/

R1 = Doctor (NomDoctor = 'Josep Cugat') [NSS]
R2 = Tractament (PreuTractament > 300) [CodiTractament]
R3 = R1 * Visita [NumPacient, CodiTractament]
R4 = R2 * R3 [NumPacient]
R5 = R4 * Pacient [NumPacient, NomPacient]