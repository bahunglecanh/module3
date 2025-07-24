use furama;

-- cau2
select * from nhan_vien
where (ho_ten like "H%" or ho_ten like "T%" or ho_ten like "K%")
and char_length(ho_ten)<=15; 
-- cau3
select * from khach_hang
where timestampdiff(year,ngay_sinh,curdate()) between 18 and 50
and (dia_chi like "%Quảng Trị%" or dia_chi like "%Đà Nẵng%");
-- cau4
select kh.ma_khach_hang,kh.ho_ten,count(hd.ma_hop_dong) as so_lan_dat_phong
from khach_hang kh
join loai_khach lk on kh.ma_loai_khach=lk.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang=hd.ma_khach_hang
where lk.ten_loai_khach="Diamond"
group by kh.ma_khach_hang,kh.ho_ten
order by so_lan_dat_phong asc;

-- --cau5

SELECT DISTINCT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu NOT IN (
    SELECT ma_dich_vu
    FROM hop_dong
    WHERE YEAR(ngay_lam_hop_dong) = 2021 AND MONTH(ngay_lam_hop_dong) IN (1,2,3)
);

-- --cau6
SELECT DISTINCT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu IN (
    SELECT ma_dich_vu
    FROM hop_dong
    WHERE YEAR(ngay_lam_hop_dong) = 2020
)
AND dv.ma_dich_vu NOT IN (
    SELECT ma_dich_vu
    FROM hop_dong
    WHERE YEAR(ngay_lam_hop_dong) = 2021
);

-- --cau7
SELECT DISTINCT ho_ten
FROM khach_hang;

-- cau8
SELECT MONTH(ngay_lam_hop_dong) AS thang, COUNT(*) AS so_lan_dat
FROM hop_dong
WHERE YEAR(ngay_lam_hop_dong) = 2021
GROUP BY MONTH(ngay_lam_hop_dong)
ORDER BY thang;

-- cau9
SELECT hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc,
       COALESCE(SUM(hdct.so_luong), 0) AS so_luong_dich_vu_di_kem
FROM hop_dong hd
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong;

-- cau10
SELECT DISTINCT dvdk.*
FROM khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE lk.ten_loai_khach = 'Diamond'
  AND (kh.dia_chi LIKE '%Vinh%' OR kh.dia_chi LIKE '%Quảng Ngãi%');

-- cau11
SELECT hd.ma_hop_dong, nv.ho_ten AS ho_ten_nv, kh.ho_ten AS ho_ten_kh,
       kh.so_dien_thoai, dv.ten_dich_vu,
       COALESCE(SUM(hdct.so_luong), 0) AS so_luong_dvdk,
       hd.tien_dat_coc
FROM hop_dong hd
JOIN nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
WHERE (MONTH(hd.ngay_lam_hop_dong) IN (10,11,12) AND YEAR(hd.ngay_lam_hop_dong) = 2020)
  AND hd.ma_dich_vu NOT IN (
    SELECT ma_dich_vu
    FROM hop_dong
    WHERE YEAR(ngay_lam_hop_dong) = 2021 AND MONTH(ngay_lam_hop_dong) BETWEEN 1 AND 6
)
GROUP BY hd.ma_hop_dong;


-- cau12
SELECT ma_dich_vu_di_kem, COUNT(*) AS so_lan_su_dung
FROM hop_dong_chi_tiet
GROUP BY ma_dich_vu_di_kem
HAVING COUNT(*) = (
    SELECT MAX(tong)
    FROM (
        SELECT COUNT(*) AS tong
        FROM hop_dong_chi_tiet
        GROUP BY ma_dich_vu_di_kem
    ) AS tmp
);

-- cau13
SELECT hdct.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, COUNT(*) AS so_lan_su_dung
FROM hop_dong_chi_tiet hdct
JOIN hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
HAVING COUNT(*) = 1;


-- cau14
SELECT nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
FROM nhan_vien nv
JOIN trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
JOIN bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
LEFT JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
  AND YEAR(hd.ngay_lam_hop_dong) BETWEEN 2020 AND 2021
GROUP BY nv.ma_nhan_vien
HAVING COUNT(hd.ma_hop_dong) <= 3;

-- cau15
DELETE FROM nhan_vien
WHERE ma_nhan_vien NOT IN (
    SELECT DISTINCT ma_nhan_vien
    FROM hop_dong
    WHERE YEAR(ngay_lam_hop_dong) BETWEEN 2019 AND 2021
);

