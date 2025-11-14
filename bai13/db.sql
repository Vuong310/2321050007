-- if not exists: không tồn tại thì chạy
CREATE DATABASE IF NOT EXISTS quan_ly_web_phim;
USE quan_ly_web_phim;
-- 1. Phim:
CREATE TABLE IF NOT EXISTS phim(
    id INT PRIMARY KEY,
    ten_phim VARCHAR (50),
    dao_dien_id INT,
    dien_vien_id INT,
    nam_phat_hanh INT,
    do_tuoi INT,
    quoc_gia_id INT,
    the_loai_id INT,
    so_tap INT,
    poster TEXT,
    mota TEXT
);
-- 2. Người dùng:
CREATE TABLE IF NOT EXISTS user(
    id INT,
    -- tai_khoan INT PRIMARY KEY,
    ten_dang_nhap VARCHAR (50),
    mat_khau VARCHAR(50),
    ho_ten VARCHAR(50),
    email VARCHAR(50),
    sdt VARCHAR(10),
    vai_tro_id INT,
    ngay_sinh DATETIME
);
-- 3. Thể loại:
CREATE TABLE IF NOT EXISTS the_loai(
    id INT PRIMARY KEY,
    ten_the_loai VARCHAR(50)
);
-- 4. Quốc gia:
CREATE TABLE IF NOT EXISTS quoc_gia(
    id INT PRIMARY KEY,
    ten_quoc_gia VARCHAR(20)

);
-- 5. Tập phim:
CREATE TABLE IF NOT EXISTS tap_phim(
    id INT PRIMARY KEY,
    phim_id INT,
    trailer VARCHAR(100),
    tieu_de VARCHAR(50),
    so_tap INT,
    thoi_luong FLOAT
);
-- 6. Quyền truy cập
CREATE TABLE IF NOT EXISTS quyen(
    id INT PRIMARY KEY,
    ten_vai_tro VARCHAR(20)
);
-- 7. Phim - Diễn viên
CREATE TABLE IF NOT EXISTS phim_dien_vien(
    id INT PRIMARY KEY,
    phim_id INT,
    dien_vien_id INT
);
-- 8. Phim - The loai
CREATE TABLE IF NOT EXISTS phim_dien_vien(
    id INT PRIMARY KEY,
    phim_id INT,
    the_loai_id INT
);
-- dựa vào cái khung, dựng csdl, viết câu lệnh để chạy nhiều lần không bị lỗi
-- viết câu lệnh để mỗi 1 bảng tạo khoảng 30 dữ liệu
