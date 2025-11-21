CREATE DATABASE if not exists quan_ly_phim;
USE quan_ly_phim;
-- 1. Bảng thể loại
CREATE TABLE IF NOT EXISTS the_loai (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten_the_loai VARCHAR(50) NOT NULL
);

-- 2. Bảng vai trò
CREATE TABLE IF NOT EXISTS vai_tro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten_vai_tro VARCHAR(20) NOT NULL
);

-- 3. Bảng quốc gia
CREATE TABLE IF NOT EXISTS quoc_gia (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten_quoc_gia VARCHAR(50) NOT NULL
);

-- 4. Bảng người dùng
CREATE TABLE IF NOT EXISTS nguoi_dung (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten_dang_nhap VARCHAR(50) NOT NULL,
    mat_khau VARCHAR(50) NOT NULL,
    ho_ten VARCHAR(50),
    email VARCHAR(50),
    sdt VARCHAR(10),
    vai_tro_id INT,
    ngay_sinh DATETIME,
    FOREIGN KEY (vai_tro_id) REFERENCES vai_tro(id)
);

-- 5. Bảng phim
CREATE TABLE IF NOT EXISTS phim (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten_phim VARCHAR(255) NOT NULL,
    dao_dien_id INT,
    nam_phat_hanh INT,
    poster VARCHAR(255),
    quoc_gia_id INT,
    so_tap INT,
    trailer VARCHAR(255),
    mo_ta TEXT,
    FOREIGN KEY (dao_dien_id) REFERENCES nguoi_dung(id),
    FOREIGN KEY (quoc_gia_id) REFERENCES quoc_gia(id)
);

-- 6. Bảng phim - diễn viên
CREATE TABLE IF NOT EXISTS phim_dien_vien (
    id INT PRIMARY KEY AUTO_INCREMENT,
    phim_id INT,
    dien_vien_id INT,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (dien_vien_id) REFERENCES nguoi_dung(id)
);

-- 7. Bảng phim - thể loại
CREATE TABLE IF NOT EXISTS phim_the_loai (
    id INT PRIMARY KEY AUTO_INCREMENT,
    phim_id INT,
    the_loai_id INT,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (the_loai_id) REFERENCES the_loai(id)
);

-- 8. Bảng tập phim
CREATE TABLE IF NOT EXISTS tap_phim (
    id INT PRIMARY KEY AUTO_INCREMENT,
    so_tap INT,
    tieu_de VARCHAR(255),
    phim_id INT,
    thoi_luong FLOAT,
    trailer VARCHAR(255),
    FOREIGN KEY (phim_id) REFERENCES phim(id)
);

-- chạy đoạn này để xóa tất cả dữ liệu trong cả 8 bảng
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE phim_dien_vien;
TRUNCATE TABLE phim_the_loai;
TRUNCATE TABLE tap_phim;
TRUNCATE TABLE phim;
TRUNCATE TABLE nguoi_dung;
TRUNCATE TABLE the_loai;
TRUNCATE TABLE quoc_gia;
TRUNCATE TABLE vai_tro;

SET FOREIGN_KEY_CHECKS = 1;

-- Thêm dữ liệu vào các bảng
INSERT INTO vai_tro (ten_vai_tro) VALUES
('Admin'),
('Đạo diễn'),
('Diễn viên'),
('Người dùng');

INSERT INTO quoc_gia (ten_quoc_gia) VALUES
('Việt Nam'), ('Mỹ'), ('Anh'), ('Pháp'), ('Hàn Quốc'),
('Nhật Bản'), ('Trung Quốc'), ('Ấn Độ'), ('Thái Lan'), ('Singapore'),
('Nga'), ('Đức'), ('Ý'), ('Tây Ban Nha'), ('Brazil'),
('Canada'), ('Úc'), ('Mexico'), ('Thổ Nhĩ Kỳ'), ('Ả Rập Saudi'),
('UAE'), ('Nam Phi'), ('Argentina'), ('Chile'), ('Thụy Điển'),
('Na Uy'), ('Phần Lan'), ('Đan Mạch'), ('Hà Lan'), ('Bỉ');

INSERT INTO the_loai (ten_the_loai) VALUES
('Hành động'), ('Tình cảm'), ('Hài hước'), ('Kinh dị'), ('Phiêu lưu'),
('Hoạt hình'), ('Tài liệu'), ('Khoa học viễn tưởng'), ('Âm nhạc'), ('Gia đình'),
('Chiến tranh'), ('Tội phạm'), ('Lịch sử'), ('Thần thoại'), ('Chính kịch'),
('Thể thao'), ('Viễn Tây'), ('Trinh thám'), ('Giả tưởng'), ('Thiếu nhi'),
('Anime'), ('Siêu anh hùng'), ('Học đường'), ('Cổ trang'), ('Võ thuật'),
('Hình sự'), ('Tâm lý'), ('Hài kịch đen'), ('Kịch nghệ'), ('Phim ngắn');

INSERT INTO nguoi_dung (ten_dang_nhap, mat_khau, ho_ten, email, sdt, vai_tro_id, ngay_sinh) VALUES
-- 1 Admin duy nhất
('admin1','pass1','Nguyen Van Admin','admin1@gmail.com','0900000001',1,'1980-01-01'),

-- 5 Đạo diễn
('director1','pass2','Tran Thi Dao Dien1','director1@gmail.com','0900000002',2,'1975-02-02'),
('director2','pass3','Tran Thi Dao Dien2','director2@gmail.com','0900000003',2,'1977-03-03'),
('director3','pass4','Tran Thi Dao Dien3','director3@gmail.com','0900000004',2,'1979-04-04'),
('director4','pass5','Tran Thi Dao Dien4','director4@gmail.com','0900000005',2,'1981-05-05'),
('director5','pass6','Tran Thi Dao Dien5','director5@gmail.com','0900000006',2,'1983-06-06'),

-- 12 Diễn viên
('actor1','pass7','Le Van Dien Vien1','actor1@gmail.com','0900000007',3,'1990-07-07'),
('actor2','pass8','Le Van Dien Vien2','actor2@gmail.com','0900000008',3,'1991-08-08'),
('actor3','pass9','Le Van Dien Vien3','actor3@gmail.com','0900000009',3,'1992-09-09'),
('actor4','pass10','Le Van Dien Vien4','actor4@gmail.com','0900000010',3,'1993-10-10'),
('actor5','pass11','Le Van Dien Vien5','actor5@gmail.com','0900000011',3,'1994-11-11'),
('actor6','pass12','Le Van Dien Vien6','actor6@gmail.com','0900000012',3,'1995-12-12'),
('actor7','pass13','Le Van Dien Vien7','actor7@gmail.com','0900000013',3,'1989-01-13'),
('actor8','pass14','Le Van Dien Vien8','actor8@gmail.com','0900000014',3,'1988-02-14'),
('actor9','pass15','Le Van Dien Vien9','actor9@gmail.com','0900000015',3,'1987-03-15'),
('actor10','pass16','Le Van Dien Vien10','actor10@gmail.com','0900000016',3,'1986-04-16'),
('actor11','pass17','Le Van Dien Vien11','actor11@gmail.com','0900000017',3,'1985-05-17'),
('actor12','pass18','Le Van Dien Vien12','actor12@gmail.com','0900000018',3,'1984-06-18'),

-- 12 Người dùng
('user1','pass19','Pham Thi User1','user1@gmail.com','0900000019',4,'1995-07-19'),
('user2','pass20','Pham Thi User2','user2@gmail.com','0900000020',4,'1996-08-20'),
('user3','pass21','Pham Thi User3','user3@gmail.com','0900000021',4,'1997-09-21'),
('user4','pass22','Pham Thi User4','user4@gmail.com','0900000022',4,'1998-10-22'),
('user5','pass23','Pham Thi User5','user5@gmail.com','0900000023',4,'1999-11-23'),
('user6','pass24','Pham Thi User6','user6@gmail.com','0900000024',4,'2000-12-24'),
('user7','pass25','Pham Thi User7','user7@gmail.com','0900000025',4,'2001-01-25'),
('user8','pass26','Pham Thi User8','user8@gmail.com','0900000026',4,'2002-02-26'),
('user9','pass27','Pham Thi User9','user9@gmail.com','0900000027',4,'2003-03-27'),
('user10','pass28','Pham Thi User10','user10@gmail.com','0900000028',4,'2004-04-28'),
('user11','pass29','Pham Thi User11','user11@gmail.com','0900000029',4,'2005-05-29'),
('user12','pass30','Pham Thi User12','user12@gmail.com','0900000030',4,'2006-06-30');

INSERT INTO phim (ten_phim, dao_dien_id, nam_phat_hanh, poster, quoc_gia_id, so_tap, trailer, mo_ta) VALUES
('The Shawshank Redemption', 2, 1994, 'shawshank.jpg', 2, 1, 'shawshank.mp4', 'Phim về hy vọng và tự do trong nhà tù'),
('The Godfather', 3, 1972, 'godfather.jpg', 2, 1, 'godfather.mp4', 'Bố già và thế giới mafia'),
('The Dark Knight', 4, 2008, 'dark_knight.jpg', 2, 1, 'dark_knight.mp4', 'Batman đối đầu Joker'),
('Pulp Fiction', 5, 1994, 'pulp_fiction.jpg', 2, 1, 'pulp_fiction.mp4', 'Phim tội phạm với cấu trúc phi tuyến tính'),
('Forrest Gump', 6, 1994, 'forrest_gump.jpg', 2, 1, 'forrest_gump.mp4', 'Cuộc đời kỳ diệu của Forrest Gump'),
('Inception', 2, 2010, 'inception.jpg', 2, 1, 'inception.mp4', 'Giấc mơ trong giấc mơ'),
('Fight Club', 3, 1999, 'fight_club.jpg', 2, 1, 'fight_club.mp4', 'Câu lạc bộ đánh nhau bí mật'),
('The Matrix', 4, 1999, 'matrix.jpg', 2, 1, 'matrix.mp4', 'Thế giới ảo và sự thức tỉnh'),
('Parasite', 5, 2019, 'parasite.jpg', 5, 1, 'parasite.mp4', 'Phim Hàn Quốc đoạt giải Oscar'),
('Interstellar', 6, 2014, 'interstellar.jpg', 2, 1, 'interstellar.mp4', 'Du hành không gian và thời gian'),
('Gladiator', 2, 2000, 'gladiator.jpg', 2, 1, 'gladiator.mp4', 'Chiến binh La Mã và sự trả thù'),
('Titanic', 3, 1997, 'titanic.jpg', 2, 1, 'titanic.mp4', 'Chuyện tình trên con tàu định mệnh'),
('Avengers: Endgame', 4, 2019, 'endgame.jpg', 2, 1, 'endgame.mp4', 'Cuộc chiến cuối cùng của Avengers'),
('Joker', 5, 2019, 'joker.jpg', 2, 1, 'joker.mp4', 'Hành trình trở thành Joker'),
('The Lion King', 6, 1994, 'lion_king.jpg', 2, 1, 'lion_king.mp4', 'Vua sư tử và hành trình trưởng thành'),
('Toy Story', 2, 1995, 'toy_story.jpg', 2, 1, 'toy_story.mp4', 'Đồ chơi sống động và tình bạn'),
('Coco', 3, 2017, 'coco.jpg', 2, 1, 'coco.mp4', 'Âm nhạc và thế giới bên kia'),
('Up', 4, 2009, 'up.jpg', 2, 1, 'up.mp4', 'Cuộc phiêu lưu bằng khinh khí cầu'),
('Finding Nemo', 5, 2003, 'nemo.jpg', 2, 1, 'nemo.mp4', 'Hành trình tìm con cá mất tích'),
('Spirited Away', 6, 2001, 'spirited_away.jpg', 6, 1, 'spirited_away.mp4', 'Cô bé lạc vào thế giới linh hồn'),
('Your Name', 2, 2016, 'your_name.jpg', 6, 1, 'your_name.mp4', 'Hoán đổi thân xác và định mệnh'),
('Dune', 3, 2021, 'dune.jpg', 2, 1, 'dune.mp4', 'Cuộc chiến giành hành tinh sa mạc'),
('Oppenheimer', 4, 2023, 'oppenheimer.jpg', 2, 1, 'oppenheimer.mp4', 'Cha đẻ bom nguyên tử'),
('Barbie', 5, 2023, 'barbie.jpg', 2, 1, 'barbie.mp4', 'Thế giới của Barbie và hiện thực'),
('The Batman', 6, 2022, 'batman.jpg', 2, 1, 'batman.mp4', 'Batman điều tra vụ án bí ẩn'),
('Soul', 2, 2020, 'soul.jpg', 2, 1, 'soul.mp4', 'Âm nhạc và ý nghĩa cuộc sống'),
('Logan', 3, 2017, 'logan.jpg', 2, 1, 'logan.mp4', 'Chuyến đi cuối cùng của Wolverine'),
('Arrival', 4, 2016, 'arrival.jpg', 2, 1, 'arrival.mp4', 'Giao tiếp với người ngoài hành tinh'),
('Mad Max: Fury Road', 5, 2015, 'mad_max.jpg', 2, 1, 'mad_max.mp4', 'Cuộc đua sinh tử trên sa mạc'),
('The Wolf of Wall Street', 6, 2013, 'wolf_wall.jpg', 2, 1, 'wolf_wall.mp4', 'Tham vọng và sa ngã trong tài chính');

INSERT INTO phim_dien_vien (phim_id, dien_vien_id) VALUES
(1, 7), (1, 8), (1, 9),
(2, 10), (2, 11),
(3, 12), (3, 13),
(4, 14), (4, 15),
(5, 16), (5, 17),
(6, 18), (6, 7),
(7, 8), (7, 9),
(8, 10), (8, 11),
(9, 12), (9, 13),
(10, 14), (10, 15),
(11, 16), (11, 17),
(12, 18), (12, 7),
(13, 8), (13, 9),
(14, 10), (14, 11),
(15, 12), (15, 13),
(16, 14), (16, 15),
(17, 16), (17, 17),
(18, 18), (18, 7),
(19, 8), (19, 9),
(20, 10), (20, 11),
(21, 12), (21, 13),
(22, 14), (22, 15),
(23, 16), (23, 17),
(24, 18), (24, 7),
(25, 8), (25, 9),
(26, 10), (26, 11),
(27, 12), (27, 13),
(28, 14), (28, 15),
(29, 16), (29, 17),
(30, 18), (30, 7);

INSERT INTO phim_the_loai (phim_id, the_loai_id) VALUES
(1, 1), (1, 4),
(2, 1), (2, 13),
(3, 1), (3, 8),
(4, 1), (4, 3),
(5, 2), (5, 10),
(6, 8), (6, 1),
(7, 1), (7, 14),
(8, 8), (8, 1),
(9, 2), (9, 11),
(10, 8), (10, 1),
(11, 1), (11, 13),
(12, 2), (12, 10),
(13, 1), (13, 22),
(14, 14), (14, 3),
(15, 6), (15, 10),
(16, 6), (16, 10),
(17, 6), (17, 9),
(18, 6), (18, 5),
(19, 6), (19, 10),
(20, 6), (20, 8),
(21, 6), (21, 8),
(22, 2), (22, 8),
(23, 8), (23, 1),
(24, 13), (24, 1),
(25, 6), (25, 3),
(26, 8), (26, 1),
(27, 6), (27, 9),
(28, 8), (28, 2),
(29, 1), (29, 5),
(30, 1), (30, 13);

INSERT INTO tap_phim (so_tap, tieu_de, phim_id, thoi_luong, trailer) VALUES
(1, 'Tập 1: Khởi đầu', 1, 142, 'trailer1_1.mp4'),
(1, 'Tập 1: Gia đình mafia', 2, 175, 'trailer2_1.mp4'),
(1, 'Tập 1: Bóng tối trỗi dậy', 3, 152, 'trailer3_1.mp4'),
(1, 'Tập 1: Vụ nổ', 4, 154, 'trailer4_1.mp4'),
(1, 'Tập 1: Cuộc đời Forrest', 5, 144, 'trailer5_1.mp4'),
(1, 'Tập 1: Giấc mơ tầng sâu', 6, 148, 'trailer6_1.mp4'),
(1, 'Tập 1: Câu lạc bộ bí mật', 7, 139, 'trailer7_1.mp4'),
(1, 'Tập 1: Viên thuốc đỏ', 8, 136, 'trailer8_1.mp4'),
(1, 'Tập 1: Gia đình Park', 9, 132, 'trailer9_1.mp4'),
(1, 'Tập 1: Hố đen thời gian', 10, 169, 'trailer10_1.mp4'),
(1, 'Tập 1: Chiến binh La Mã', 11, 155, 'trailer11_1.mp4'),
(1, 'Tập 1: Tình yêu định mệnh', 12, 195, 'trailer12_1.mp4'),
(1, 'Tập 1: Cuộc chiến cuối cùng', 13, 181, 'trailer13_1.mp4'),
(1, 'Tập 1: Nụ cười Joker', 14, 122, 'trailer14_1.mp4'),
(1, 'Tập 1: Simba ra đời', 15, 88, 'trailer15_1.mp4'),
(1, 'Tập 1: Buzz và Woody', 16, 81, 'trailer16_1.mp4'),
(1, 'Tập 1: Ngày của người chết', 17, 105, 'trailer17_1.mp4'),
(1, 'Tập 1: Ông già khinh khí cầu', 18, 96, 'trailer18_1.mp4'),
(1, 'Tập 1: Nemo mất tích', 19, 100, 'trailer19_1.mp4'),
(1, 'Tập 1: Thế giới linh hồn', 20, 125, 'trailer20_1.mp4'),
(1, 'Tập 1: Sao đổi ngôi', 21, 106, 'trailer21_1.mp4'),
(1, 'Tập 1: Sa mạc Arrakis', 22, 155, 'trailer22_1.mp4'),
(1, 'Tập 1: Bom nguyên tử', 23, 180, 'trailer23_1.mp4'),
(1, 'Tập 1: Barbie thức tỉnh', 24, 114, 'trailer24_1.mp4'),
(1, 'Tập 1: Gotham hỗn loạn', 25, 176, 'trailer25_1.mp4'),
(1, 'Tập 1: Linh hồn lạc lối', 26, 101, 'trailer26_1.mp4'),
(1, 'Tập 1: Wolverine già nua', 27, 137, 'trailer27_1.mp4'),
(1, 'Tập 1: Ngôn ngữ ngoài hành tinh', 28, 116, 'trailer28_1.mp4'),
(1, 'Tập 1: Cuộc đua sinh tử', 29, 120, 'trailer29_1.mp4'),
(1, 'Tập 1: Phố Wall điên cuồng', 30, 180, 'trailer30_1.mp4');