/*Exercici 1.a*/

SELECT cl.DNI-cl, cl.nom, COUNT(v.DNI-cl) AS total
FROM Clients cl
    INNER JOIN Vendes v ON cl.DNI-cl = v.DNI-cl
    INNER JOIN Cotxe ctx ON v.marca = ctx.marca
GROUP BY cl.DNI-cl, cl.nom
HAVING v.descompte < 5000 AND v.data BETWEEN ('01/01/2016' AND '31/12/2016') AND ctx.categoria = 'Luxe' AND COUNT(v.DNI-cl) >= 5
ORDER BY total DESC
LIMIT 10


/*Exercici 1.b*/

R1 = Vendes (data > '01/11/2021' AND data < '08/11/2021') [marca, DNI-cl, NSS]
R2 = Clients * Ciutat [idCiutat]
R3 = R2 (nom-ciutat = 'Barcelona') [DNI-cl]
R4 = R1 * R3 [marca, NSS]
R5 = R4 (marca = 'Seat') [NSS]
R6 = Empleats * R5
R7 = Empleats - R6 [DNI, nom]

