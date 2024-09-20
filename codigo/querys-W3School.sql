-- Obtén los nombres de los productos cuyo precio sea mayor a 50.

SELECT ProductName
FROM Products
WHERE Price>50;

-- Lista los empleados que cumplen años en el mes de Septiembre.

SELECT * 
FROM Employees
WHERE MONTH(BirthDate) = 9;

-- Muestra los detalles de los pedidos que han sido enviados por los transportistas con ID 1 2 o 3.

SELECT * 
FROM Orders
WHERE ShipperID IN (1, 2, 3);

-- Obtén una lista de todos los productos, ordenados por precio de forma descendente.

SELECT ProductName, Price 
FROM Products
ORDER BY Price DESC;

-- Muestra el nombre de los productos junto con el nombre del proveedor correspondiente.

SELECT P.ProductName, S.SupplierName
FROM Products P
JOIN Suppliers S ON P.SupplierID = S.SupplierID;

-- Muestra el nombre de los productos cuyo proveedor no sea de Estados Unidos.

SELECT P.ProductName
FROM Products P
JOIN Suppliers S ON P.SupplierID = S.SupplierID
WHERE S.Country <> 'USA';

-- Obtén los nombres de los clientes y el número de orden de aquellos que realizaron pedidos cuyo precio total supere los 500.

SELECT C.CustomerName, O.OrderID
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY C.CustomerName, O.OrderID
HAVING SUM(P.Price * OD.Quantity) > 500;


-- Muestra cuántos productos tiene cada categoría.

SELECT C.CategoryName, COUNT(P.ProductID) AS TotalProductos
FROM Categories C
JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryName;

-- Lista los proveedores que suministran más de 5 productos.

SELECT S.SupplierName, COUNT(P.ProductID) AS TotalProductos
FROM Suppliers S
JOIN Products P ON S.SupplierID = P.SupplierID
GROUP BY S.SupplierName
HAVING COUNT(P.ProductID) > 5;

-- Obtén el nombre de los clientes y el total de pedidos realizados por cada uno.

SELECT C.CustomerName, COUNT(O.OrderID) AS TotalPedidos
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerName;
