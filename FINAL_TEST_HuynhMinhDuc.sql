/* 1. Lấy thông tin về Mã đơn hàng, mã sản phẩm, mã khách hàng, 
số lượng sản phẩm của những dòng dữ liệu thỏa điều kiện Ship Mode là Standard Class
*/
SELECT order_id, product_id, customer_id, quantity, ship_mode
FROM sales
where ship_mode = 'Standard Class'

/* 2. Lấy thông tin về những mã đơn hàng của những dòng dữ liệu thỏa mãn điều kiện sản phẩm 
(Product ID) thuộc nhóm category là Office Supplies và có quantity > 3
*/
SELECT product_id
FROM sales
where category='Office Supplies' and quantity > 3

/* 3. Thống kê số lượng mã đơn hàng, số lượng các loại sản phẩm (product ID), tổng 
doanh thu và tổng lợi nhuận theo từng Category, sắp xếp theo thứ tự giảm dần của doanh thu
*/
SELECT category, COUNT(order_id) as Madonhang, COUNT(product_id) as MaSanPham, SUM(sales) AS TongDoanhThu, SUM(profit) AS TongLoiNhuan
FROM sales
group by category
ORDER by SUM(sales) DESC

/* 4. Với mỗi loại Ship mode, lấy ra thông tin khách hàng (Customer ID), 
số lượng đơn hàng sao cho có số lượng đơn hàng theo hình thức Ship mode đó là nhiều nhất.
*/
SELECT ship_mode, customer_id as ThongTinKhachHang, COUNT(order_id) as SoLuongDonHang
FROM sales
GROUP by ship_mode

/* 5. Viết 1 câu query trả về 1 table với điều kiện như sau: 
+Với mỗi dòng dữ liệu, thêm 1 column có tên là totalSaleBefore: 
+Tổng số doanh thu của các đơn hàng mà trước đó customer đó thực hiện (Bao gồm cả đơn hàng hiện tại)
*/
SELECT customer_id, COUNT(order_id), COUNT(ship_date), sum(sales) as totalSaleBefore
from sales
GROUP by customer_id
