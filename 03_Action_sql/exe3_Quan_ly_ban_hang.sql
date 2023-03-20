
use `Quan_Ly_Ban_Hang`;

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