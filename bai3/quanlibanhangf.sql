use quanlybanhang;
INSERT INTO Customer (cID, cName, cAge) VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

INSERT INTO `Order` (oID, cID, oDate, oTotalPrice) VALUES
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);

INSERT INTO Product (pID, pName, pPrice) VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

INSERT INTO OrderDetail (oID, pID, odQTY) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(2, 5, 1),
(3, 3, 4),
(3, 4, 3);

select  oID,oDate,oTotalPrice
from `order`;

select c.cName as CustomerName,
p.pName as ProductName
from customer c
join product p on c.cID=p.pID
join `order` o on c.cID=o.cID
join orderdetail od on c.cID=od.oID; 


select c.cName
from customer c
where c.cid not in
(select  distinct o.cID 
from `order` o);

select o.oID, o.oDate, SUM(od.odQTY * p.pPrice) as TotalPrice
from `order` o
join orderDetail od on o.oID = od.oID
join product p on od.pID = p.pID
group by o.oID, o.oDate;
