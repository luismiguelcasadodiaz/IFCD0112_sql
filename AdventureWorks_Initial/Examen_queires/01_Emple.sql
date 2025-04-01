/*


¿Cuántos empleados diferentes tienen más de 17 años trabajando en la empresa? ==> 7

*/

SELECT COUNT(*) AS NumEmpleados
FROM HumanResources.Employee
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) > 17;