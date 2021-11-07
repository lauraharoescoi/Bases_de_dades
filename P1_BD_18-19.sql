/*Exercici 1.a*/

SELECT p.NomPacient, c.nom-ciutat, SUM(t.PreuTractament) AS Total
FROM Pacient p
	INNER JOIN Ciutat c ON p.CP-pacient = c.CP-pacient
	INNER JOIN Visita v ON p.NumPacient = v.NumPacient
	INNER JOIN Tractament t ON v.CodiTractament = t.CodiTractament
	INNER JOIN Dentista d ON v.NSS = d.NSS
GROUP BY p.NomPacient, c.nom-ciutat
HAVING v.DataCita BETWEEN ('01/10/2018' AND '31/10/2018') AND COUNT(DISTINCT d.NSS) > 3
ORDER BY Total DESC
LIMIT 10


/*Exercici 1.b*/

R1 = Dentista(NomDentista = 'Josep Ramón Pelegrí') [NSS]
R2 = Tractament(PreuTractament > 100) [CodiTractament]
R3 = R1 * Visita [NumPacient, CodiTractament]
R4 = R2 * R3 [NumPacient]
R5 = R4 * Pacient [NumPacient, NomPacient]