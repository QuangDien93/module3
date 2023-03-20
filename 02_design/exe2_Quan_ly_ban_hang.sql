create database `Quan_Ly_Ban_Hang`;
use `Quan_Ly_Ban_Hang`;
create table Customer(
cID int not null primary key,
cName varchar(45) null,
cAge int null
);
create table OrderTotal(
odID int primary key,
cID int not null,
oDate datetime not null,
totalPrice int,
foreign key (cID) references Customer (cID)
);
create table Product(
pID int primary key,
pName varchar(45),
pPrice int
);
create table OrderDetail(
ODetailID int not null auto_increment primary key ,
odID int not null,
pID int not null,
oQty int not null,
foreign key (odID) references OrderTotal (odID),
foreign key (pID) references Product (pID)
);
use Quan_Ly_ban_hang;
--- thêm dữ liệu vào bảng Customer---
insert into customer
values 	(1, 'Minh Quan', 10),
		(2, 'Ngoc Oanh', 20),
        (3, 'Hong Ha', 50);
--- thêm dữ liệu vào bảng ordertotal---
insert into ordertotal (odID, cID, oDate)
values	(1,1,'2006-03-21'),
		(2,2,'2006-03-23'),
        (3,1,'2006-03-16');
--- Thêm dữ liệu vào bảng Product ---
insert into product
values 	(1, 'May giat', 3),
		(2, 'Tu lanh', 5),
        (3, 'Dieu hoa', 7),
        (4, 'Quat', 4),
        (5, 'Bep dien', 2);
--- Thêm dữ liệu vào bảng Orderdetail ---
insert into orderdetail (odID,pID,oQty)
values 	(1,1,3),
		(1,3,7),
        (1,4,2),
        (2,1,1),
        (3,1,8),
        (2,5,4),
        (2,3,3);
        
--- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Ordertotal---
select odID, cID, oDate
from ordertotal;

--- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.cID, customer.cName,product.pName
from customer join ordertotal on customer.cID = ordertotal.cID
				join orderdetail on ordertotal.odID = orderdetail.odID
				join product on orderdetail.pID = product.pID;
                
--- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.cName
from customer left join ordertotal on customer.cID = ordertotal.cID
where ordertotal.cID is null;

--- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn,--- sum(oQty*pPrice) as totalPrice
select ordertotal.odID, ordertotal.oDate, sum(oQty*pPrice) as totalPrice
from ordertotal join orderdetail on ordertotal.odID = orderdetail.odID
				join product on orderdetail.pID = product.pID
group by ordertotal.odID
order by totalPrice desc;