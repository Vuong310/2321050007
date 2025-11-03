let danhSachPhim = [
    {
        id:1,
        tenphim: "Quỷ Bí Chi Chủ",
        namPhatHanh: 2025,
        tuoi: 16,
        thoiLuong:24,
        quocGia: "Trung Quốc",
        poster: "/img/poster.img",
        theLoai: "Phim hoạt hình"
    },
    {
        id:2,
        tenphim: "Conan",
        namPhatHanh: 2023,
        tuoi: 16,
        thoiLuong:1.5,
        quocGia: "Nhật Bản",
        poster: "/img/phim/conan.img",
        theLoai: "Phim hoạt hình"
    }
];
let phimHienTai = danhSachPhim[0];

let banner = document.getElementsByClassName('imgtroi')[0];
let nam = document.getElementsByClassName('nam')[0];

function chonPhim(idPhim){
    for (let i = 0; i<danhSachPhim.length;i++){
        if(danhSachPhim[i].id == idPhim){
            banner.img.src = danhSachPhim[i].poster;
            nam.innerHTML = danhSachPhim[i].namPhatHanh;
            document.getElementsByClassName('tuoi').innerHTML = danhSachPhim[i].tuoi;
            document.getElementsByClassName('thoiLuong').innerHTML = danhSachPhim[i].thoiLuong;
            document.getElementsByClassName('quocGia').innerHTML = danhSachPhim[i].quocGia;
        }
    }
}
