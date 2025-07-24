
CREATE TABLE vi_tri (
    ma_vi_tri VARCHAR(10) PRIMARY KEY,
    ten_vi_tri VARCHAR(50)
);

CREATE TABLE trinh_do (
    ma_trinh_do VARCHAR(10) PRIMARY KEY,
    ten_trinh_do VARCHAR(50)
);

CREATE TABLE bo_phan (
    ma_bo_phan VARCHAR(10) PRIMARY KEY,
    ten_bo_phan VARCHAR(50)
);

CREATE TABLE nhan_vien (
    ma_nhan_vien VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(100),
    ngay_sinh DATE,
    so_cmnd VARCHAR(20),
    so_dien_thoai VARCHAR(20),
    email VARCHAR(100),
    dia_chi VARCHAR(255),
    ma_vi_tri VARCHAR(10),
    ma_trinh_do VARCHAR(10),
    ma_bo_phan VARCHAR(10),
    luong DECIMAL(15,2),
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

CREATE TABLE loai_khach (
    ma_loai_khach VARCHAR(10) PRIMARY KEY,
    ten_loai_khach VARCHAR(50)
);

CREATE TABLE khach_hang (
    ma_khach_hang VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(100),
    ngay_sinh DATE,
    gioi_tinh VARCHAR(10),
    so_cmnd VARCHAR(20),
    so_dien_thoai VARCHAR(20),
    email VARCHAR(100),
    dia_chi VARCHAR(255),
    ma_loai_khach VARCHAR(10),
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

CREATE TABLE kieu_thue (
    ma_kieu_thue VARCHAR(10) PRIMARY KEY,
    ten_kieu_thue VARCHAR(50)
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu VARCHAR(10) PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(50)
);

CREATE TABLE dich_vu (
    ma_dich_vu VARCHAR(10) PRIMARY KEY,
    ten_dich_vu VARCHAR(100),
    dien_tich FLOAT,
    chi_phi_thue DECIMAL(15,2),
    so_nguoi_toi_da INT,
    ma_kieu_thue VARCHAR(10),
    ma_loai_dich_vu VARCHAR(10),
    tieu_chuan_phong VARCHAR(100),
    mo_ta_tien_nghi_khac TEXT,
    so_tang INT,
    dien_tich_ho_boi FLOAT,
    dich_vu_mien_phi_di_kem TEXT,
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem VARCHAR(10) PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(100),
    don_vi VARCHAR(50),
    gia DECIMAL(15,2)
);

CREATE TABLE hop_dong (
    ma_hop_dong VARCHAR(10) PRIMARY KEY,
    ngay_lam_hop_dong DATE,
    ngay_ket_thuc DATE,
    tien_dat_coc DECIMAL(15,2),
    tong_tien DECIMAL(15,2),
    ma_nhan_vien VARCHAR(10),
    ma_khach_hang VARCHAR(10),
    ma_dich_vu VARCHAR(10),
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet VARCHAR(10) PRIMARY KEY,
    ma_hop_dong VARCHAR(10),
    ma_dich_vu_di_kem VARCHAR(10),
    so_luong INT,
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

INSERT INTO vi_tri (ma_vi_tri, ten_vi_tri) VALUES (1, 'Lễ tân');
INSERT INTO vi_tri (ma_vi_tri, ten_vi_tri) VALUES (2, 'Phục vụ');

INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES (1, 'Trung cấp');
INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES (2, 'Cao đẳng');
INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES (3, 'Đại học');
INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES (4, 'Sau đại học');
INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES (5, 'Thạc sĩ');
INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES (6, 'Tiến sĩ');
INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do) VALUES (7, 'Cử nhân');

INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan) VALUES (1, 'Sale – Marketing');
INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan) VALUES (2, 'Hành Chính');
INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan) VALUES (3, 'Phục vụ');
INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan) VALUES (4, 'Quản lý');
INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan) VALUES (5, 'Kỹ thuật');
INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan) VALUES (6, 'Bếp');
INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan) VALUES (7, 'An ninh');

INSERT INTO loai_khach (ma_loai_khach, ten_loai_khach) VALUES 
(1, 'Diamond'),
(2, 'Platinium'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Member'),
(6, 'VIP'),
(7, 'Normal'),
(8, 'Khác');


INSERT INTO kieu_thue (ma_kieu_thue, ten_kieu_thue) VALUES 
(1, 'Thuê theo năm'),
(2, 'Thuê theo tháng'),
(3, 'Thuê theo ngày'),
(4, 'Thuê theo giờ'),
(5, 'Thuê theo buổi'),
(6, 'Thuê theo tuần'),
(7, 'Thuê theo quý');


INSERT INTO loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu) VALUES 
(1, 'Villa'),
(2, 'House'),
(3, 'Room'),
(4, 'Karaoke'),
(5, 'Massage'),
(6, 'Thuê xe');

INSERT INTO nhan_vien (
    ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, 
    ma_vi_tri, ma_trinh_do, ma_bo_phan
) VALUES
('1', 'Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
('2', 'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2'),
('3', 'Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'),
('4', 'Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4'),
('5', 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1'),
('6', 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'),
('7', 'Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'),
('8', 'Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'),
('9', 'Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4'),
('10', 'Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2');




INSERT INTO khach_hang (ma_khach_hang, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach) VALUES
(1, 'Lê Thị Lan', '1995-06-10', 'Nữ', '123456789', '0905123456', 'le.lan@example.com', 'Đà Nẵng', 1),
(2, 'Nguyễn Văn Nam', '1987-08-22', 'Nam', '234567891', '0906123457', 'nam.nguyen@example.com', 'Quảng Trị', 2),
(3, 'Trần Thị Hoa', '1990-11-15', 'Nữ', '345678912', '0907123458', 'hoa.tran@example.com', 'Huế', 3),
(4, 'Phạm Văn Tùng', '1985-03-05', 'Nam', '456789123', '0908123459', 'tung.pham@example.com', 'Hà Nội', 4),
(5, 'Đỗ Thị Mai', '1992-12-30', 'Nữ', '567891234', '0909123460', 'mai.do@example.com', 'Đà Nẵng', 5),
(6, 'Bùi Văn Lâm', '1989-07-19', 'Nam', '678912345', '0910123461', 'lam.bui@example.com', 'Quảng Trị', 1),
(7, 'Nguyễn Thị Hồng', '1996-01-22', 'Nữ', '789123456', '0911123462', 'hong.nguyen@example.com', 'Hải Phòng', 2),
(8, 'Hoàng Văn Phúc', '1991-10-10', 'Nam', '891234567', '0912123463', 'phuc.hoang@example.com', 'TP.HCM', 3),
(9, 'Lê Văn Sơn', '1988-04-05', 'Nam', '912345678', '0913123464', 'son.le@example.com', 'Đà Nẵng', 4),
(10, 'Trịnh Thị Diệu', '1993-09-18', 'Nữ', '123459876', '0914123465', 'dieu.trinh@example.com', 'Quảng Nam', 5),
(11, 'Vũ Văn Hùng', '1986-02-11', 'Nam', '234561987', '0915123466', 'hung.vu@example.com', 'Vinh', 1),
(12, 'Ngô Thị Yến', '1994-05-27', 'Nữ', '345673219', '0916123467', 'yen.ngo@example.com', 'Quảng Ngãi', 2),
(13, 'Đặng Văn Minh', '1997-11-13', 'Nam', '456784321', '0917123468', 'minh.dang@example.com', 'Đồng Nai', 3);


INSERT INTO dich_vu_di_kem (ma_dich_vu_di_kem, ten_dich_vu_di_kem, don_vi, gia) VALUES
(1, 'Massage toàn thân', 'Lần', 500000),
(2, 'Thuê xe máy', 'Ngày', 150000),
(3, 'Karaoke phòng VIP', 'Giờ', 300000),
(4, 'Bữa tối tại nhà hàng', 'Suất', 400000),
(5, 'Đưa đón sân bay', 'Lượt', 250000),
(6, 'Hồ bơi riêng', 'Ngày', 200000),
(7, 'BBQ ngoài trời', 'Suất', 350000),
(8, 'Hướng dẫn viên du lịch', 'Buổi', 600000),
(9, 'Bữa sáng buffet', 'Suất', 100000);

INSERT INTO dich_vu (ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, so_tang, dien_tich_ho_boi, dich_vu_mien_phi_di_kem) VALUES
(1, 'Villa Premium', 150.0, 10000000, 8, 1, 1, '5 sao', 'Hồ bơi riêng, BBQ', 2, 50.0, NULL),
(2, 'House Deluxe', 90.0, 5000000, 6, 2, 2, '4 sao', 'Phòng khách, bếp', 2, NULL, NULL),
(3, 'Room Standard', 45.0, 2000000, 2, 3, 3, NULL, NULL, NULL, NULL, 'Buffet sáng, nước suối'),
(4, 'Villa VIP', 200.0, 15000000, 10, 1, 1, '6 sao', 'Sân vườn, bể sục', 3, 70.0, NULL),
(5, 'House Family', 110.0, 6000000, 7, 2, 2, '4.5 sao', '2 phòng ngủ, bếp rộng', 2, NULL, NULL),
(6, 'Room Deluxe', 55.0, 2500000, 3, 3, 3, NULL, NULL, NULL, NULL, 'Buffet sáng, minibar'),
(7, 'Room Economy', 35.0, 1500000, 2, 4, 3, NULL, NULL, NULL, NULL, 'Nước suối'),
(8, 'Villa Garden', 140.0, 9500000, 6, 1, 1, '4.5 sao', 'Sân vườn, BBQ', 2, 40.0, NULL),
(9, 'House Couple', 80.0, 4000000, 4, 2, 2, '3 sao', 'Phòng ngủ đôi', 1, NULL, NULL);

INSERT INTO hop_dong (
    ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien,
    ma_nhan_vien, ma_khach_hang, ma_dich_vu
) VALUES
('1', '2020-12-08', '2020-12-08', 0, NULL, '3', '1', '3'),
('2', '2020-07-14', '2020-07-21', 200000, NULL, '7', '3', '1'),
('3', '2021-03-15', '2021-03-17', 50000, NULL, '3', '4', '2'),
('4', '2021-01-14', '2021-01-18', 100000, NULL, '7', '5', '5'),
('5', '2021-07-14', '2021-07-15', 0, NULL, '7', '2', '6'),
('6', '2021-06-01', '2021-06-03', 0, NULL, '7', '7', '6'),
('7', '2021-09-02', '2021-09-05', 100000, NULL, '7', '4', '4'),
('8', '2021-06-17', '2021-06-18', 150000, NULL, '3', '4', '1'),
('9', '2020-11-19', '2020-11-19', 0, NULL, '3', '4', '3'),
('10', '2021-04-12', '2021-04-14', 0, NULL, '10', '3', '5'),
('11', '2021-04-25', '2021-04-25', 0, NULL, '2', '2', '1'),
('12', '2021-05-25', '2021-05-27', 0, NULL, '7', '10', '1');


INSERT INTO hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet, so_luong, ma_hop_dong, ma_dich_vu_di_kem
) VALUES
('1', 5, '2', '4'),
('2', 8, '2', '5'),
('3', 15, '2', '6'),
('4', 1, '3', '1'),
('5', 11, '3', '2'),
('6', 1, '1', '3'),
('7', 2, '1', '2'),
('8', 2, '12', '2');








