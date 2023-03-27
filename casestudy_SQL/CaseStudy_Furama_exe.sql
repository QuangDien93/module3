select @@sql_mode;
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

--- câu 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *
from nhan_vien
where ((ho_ten like "h%") or (ho_ten like "t%") or (ho_ten like "k%"))and char_length(ho_ten) <=15;

--- câu 3:Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang
where (year(now())- year(ngay_sinh) >=18 and year(now())- year(ngay_sinh) <=50) and (dia_chi like "%Đà Nẵng%" or dia_chi like "%Quảng Trị%");

--- Câu 4: 

select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_hop_dong) as so_lan_dat
from khach_hang join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
					join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where loai_khach.ten_loai_khach = "Diamond"
group by khach_hang.ma_khach_hang
order by so_lan_dat;

--- câu 5:XXX
select distinct  khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, 
hop_dong.ma_hop_dong, dich_vu.ten_dich_vu, 
hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc,
sum(if (hop_dong_chi_tiet.so_luong is null,0, hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia)) + dich_vu.chi_phi_thue as Tong_Tien
from khach_hang  left join  loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
				left join 	hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
                 left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
                 left  join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
               left  join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
               group by hop_dong.ma_hop_dong;
   
  --- HOẶC
   SELECT
    ma_khach_hang,
    ho_ten,
    ten_loai_khach,
    t.ma_hop_dong,
    ten_dich_vu,
    ngay_lam_hop_dong,
    ngay_ket_thuc,
    (IFNULL(sum(so_luong * gia), 0) + IFNULL(t.cpt, 0)) tongtien
from
    khach_hang
    LEFT JOIN loai_khach USING(ma_loai_khach)
    LEFT JOIN hop_dong USING(ma_khach_hang)
    LEFT JOIN hop_dong_chi_tiet USING(ma_hop_dong)
    LEFT JOIN dich_vu_di_kem USING(ma_dich_vu_di_kem)
    LEFT JOIN (
        SELECT
            ten_dich_vu,
            ma_hop_dong,
            sum(chi_phi_thue) cpt
        from
            khach_hang
            LEFT JOIN hop_dong USING(ma_khach_hang)
            LEFT JOIN dich_vu USING(ma_dich_vu)
        GROUP BY
            ma_hop_dong
    ) t USING(ma_hop_dong)
GROUP BY
    ma_hop_dong;
   
               
---- Câu 6
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu join loai_dich_vu using (ma_loai_dich_vu)
where ma_dich_vu not in 
		(	
		select ma_dich_vu 
		from dich_vu join hop_dong using (ma_dich_vu)
		where ngay_lam_hop_dong >= "2021-01-01" and ngay_lam_hop_dong <= "2021-03-31"
        );

--- câu 7:
select distinct dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from 
	dich_vu 
    join loai_dich_vu using (ma_loai_dich_vu)
    join hop_dong using (ma_dich_vu)
where year(ngay_lam_hop_dong) = "2020" and ma_dich_vu not in 
	(
    select ma_dich_vu
    from dich_vu join hop_dong using (ma_dich_vu)
    where year(ngay_lam_hop_dong) = "2021");
    
--- câu