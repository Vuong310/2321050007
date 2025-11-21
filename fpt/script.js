let danhSachPhim = [
    {
        id: 1,
        tenphim: "Quỷ Bí Chi Chủ",
        namPhatHanh: 2025,
        tuoi: 16,
        thoiLuong: "13 tập",
        quocGia: "Trung Quốc",
        poster: "img/ngang/poster.jpg",
        title: "img/title/chuatehuyenbi.png",
        // title: "Chúa Tể Huyền Bí",
        trailer: "https://www.youtube.com/embed/ovdhbWbhgm4",
    },
    {
        id: 2,
        tenphim: "Mưa Đỏ",
        namPhatHanh: 2025,
        tuoi: 16,
        thoiLuong: "2 giờ",
        quocGia: "Việt Nam",
        poster: "img/ngang/muado.jpeg",
        title:"",
        trailer:"https://www.youtube.com/embed/BD6PoZJdt_M",
    },
    {
        id: 3,
        tenphim: "Bỗng Dưng Trúng Số",
        namPhatHanh: 2022,
        tuoi: 13,
        thoiLuong: "1.9 giờ",
        quocGia: "Hàn Quốc",
        poster: "img/ngang/bongdungtrungso.jpg",
        title:"Bỗng Dưng Trúng Số",
        trailer:"https://www.youtube.com/embed/D3KbO3QF-lg"
    },
    {
        id: 4,
        tenphim: "Cám",
        namPhatHanh: 2024,
        tuoi: 18,
        thoiLuong: "2 giờ",
        quocGia: "Việt Nam",
        poster: "img/ngang/cam.jpg",
        title:"",
        trailer:"https://www.youtube.com/embed/_8qUFEmPQbc",
    },
    {
        id: 5,
        tenphim: "Conan movie 27",
        namPhatHanh: 2024,
        tuoi: 13,
        thoiLuong: "1.8 giờ",
        quocGia: "Nhật Bản",
        poster: "img/ngang/conan.png",
        title:"Conan: Ngôi Sao 5 Cánh Một Triệu Đô",
        trailer:"https://www.youtube.com/embed/C4pG3GbhQZw",
    },
    {
        id: 6,
        tenphim: "Minions",
        namPhatHanh: 2015,
        tuoi: 3,
        thoiLuong: "1.5 giờ",
        quocGia: "Mỹ",
        poster: "img/ngang/minion.jpg",
        title:"Minions",
        trailer:"https://www.youtube.com/embed/P9-FCC6I7u0",
    },
    {
        id: 7,
        tenphim: "Kungfu Panda 4",
        namPhatHanh: 2024,
        tuoi: 3,
        thoiLuong: "1.6 giờ",
        quocGia: "Mỹ",
        poster: "img/ngang/kungfupanda.jpg",
        title:"",
        trailer:"https://www.youtube.com/embed/_inKs4eeHiI",
    },
    {
        id: 8,
        tenphim: "Đi tìm Nemo",
        namPhatHanh: 2003,
        tuoi: 3,
        thoiLuong: "1.7 giờ",
        quocGia: "Mỹ",
        poster: "img/ngang/findingnemo.jpeg",
        title:"Đi Tìm Nemo",
        trailer:"https://www.youtube.com/embed/SPHfeNgogVs",
    },
    {
        id: 9,
        tenphim: "Mắt Biếc",
        namPhatHanh: 2019,
        tuoi: 13,
        thoiLuong: "1.9 giờ",
        quocGia: "Việt Nam",
        poster: "img/ngang/matbiec.jpg",
        title:"Mắt Biếc",
        trailer:"https://www.youtube.com/embed/ITlQ0oU7tDA",
    }
];

let phimHienTai = danhSachPhim[0];

let banner = document.getElementsByClassName("anhcochu")[0];
let nam = document.getElementsByClassName('nam')[0];
let tuoi = document.getElementsByClassName('tuoi')[0];
let thoiLuong = document.getElementsByClassName('thoiLuong')[0];
let quocGia = document.getElementsByClassName('quocGia')[0];
let title = document.getElementsByClassName('title_img')[0];
let trailer = document.getElementById('bannerVideo');
let trangThai = true;

function chonPhim(idPhim) {
    // Nếu không truyền idPhim => tự tăng sang phim kế tiếp
    // if (!idPhim) {
    //     let indexNow = danhSachPhim.indexOf(phimHienTai); //indexOf: tìm vị trí xuất hiện đầu tiên
    //     indexNow++;
    //     if (indexNow >= danhSachPhim.length) indexNow = 0;
    //     idPhim = danhSachPhim[indexNow].id;
    // }
    for (let i = 0; i < danhSachPhim.length; i++) {
        if (danhSachPhim[i].id == idPhim) {
            // đổi ảnh
            banner.style.backgroundImage = `url('${danhSachPhim[i].poster}')`;
            // đổi toàn bộ phần thông tin bằng innerHTML
            nam.innerHTML = danhSachPhim[i].namPhatHanh;
            tuoi.innerHTML = "T"+danhSachPhim[i].tuoi;
            thoiLuong.innerHTML = danhSachPhim[i].thoiLuong;
            quocGia.innerHTML = danhSachPhim[i].quocGia;
            if(danhSachPhim[i].title.startsWith("img/title")){
                title.style.display = "block";
                title.src = danhSachPhim[i].title
            }
            else{
                document.getElementsByClassName("title")[0].innerHTML = danhSachPhim[i].title;
                document.getElementsByClassName("title")[0].style.display = "block";
                title.style.display = "none";
            }
            trailer.src = danhSachPhim[i].trailer;
            // cập nhật lại phim hiện tại
            phimHienTai = danhSachPhim[i];
        }
    }
}

function Trailer(){
    if(trangThai === true){
        banner.style.backgroundImage = "none";
        trailer.style.display = "block";
        trangThai = false;
    }
    else{
        banner.style.backgroundImage = `url('${phimHienTai.poster}')`;
        trailer.style.display = "none";
        trangThai = true;
    }
}



