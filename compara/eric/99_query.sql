USE AdventureWorks2022

SELECT TOP 1 FirstName, COUNT(*) AS Frecuencia
FROM Person.Person
WHERE LEN(FirstName) = 10
GROUP BY FirstName
ORDER BY COUNT(*) DESC;