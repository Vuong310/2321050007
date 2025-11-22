<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buổi 1 php</title>
</head>
<body>
    <!-- code để giữa php và ? -->
    <?php
        //In ra màn hình
        echo "Hello world! <br>";

        echo "Hi!";
        
        // Biến
        // Cú pháp: $ + tên biến = giá trị của biến
        $ten = "Vương Linh";
        $tuoi = 20;
        // Nối chuỗi dùng dấu chấm
        echo $ten . " " . $tuoi . " tuổi<br>";
        
        // Hằng
        // Cú pháp: define("tên hằng", "giá trị của hằng")
        define("soPi","3.14");
        echo soPi . "<br>";

        // Phân biệt '' và ""
        // nháy đơn thì hiểu là chuỗi ký tự bình thường
        // nháy kép thì có biến trong câu sẽ gọi biến
        echo "$ten" . "<br>";
        echo '$ten' . "<br>";

        // Chuỗi
        # Kiểm tra độ dài của chuỗi
        echo strlen($ten) . "<br>";
        # Đếm số từ 
        echo str_word_count($ten) . "<br>";
        # Tìm kiếm ký tự trong chuỗi
        // tìm vị trí xuất hiện đầu tiên của ký tự trong chuỗi
        echo strpos($ten,"L") . "<br>";
        # Thay thế ký tự trong chuỗi
        // str_replace("ký tự muốn thay thế","ký tự thay thế",tên biến)
        echo str_replace("Vương","Hà",$ten) . "<br>";

        // Toán tử
        $soThuNhat = 10;
        $soThuHai = 5;
        # + - * /
        # += -= *= /+
        # so sánh: == != >= <= ===
        echo $soThuNhat . $soThuHai . "<br>";

        // Câu điều kiện
        // if("Điều kiện"){
        //     nhóm lệnh
        // }
        // elseif("Điều kiện"){
        //     nhóm lệnh
        // }
        // else{
        //     nhóm lệnh
        // }
        // Ví dụ: kiểm tra tổng của số thứ nhất và số thứ 2: nếu nhỏ hơn 15 thì in ra nhỏ hơn 15
        // nếu = 15 thì in ra tổng = 15
        // còn lại in ra lớn hơn 15
        $tong = $soThuNhat + $soThuHai;
        if($tong < 15){
            echo "$tong nhỏ hơn 15";
        }
        elseif($tong == 15){
            echo "$tong = 15";
        }
        else{
            echo "$tong lớn hơn 15";
        }

        // switch case
        $color = "red";
        switch ($color){
            case "red":
                echo "is red";
                break;
            case "blue":
                echo "is blue";
                break;
            case "yellow":
                echo "is yellow";
                break;
            case "green":
                echo "is green";
                break;
            default:
                echo "no color";
                break;
        }

        // for
        for ($i=0; $i < 10; $i++) { 
            echo $i . "<br>";
        }

        // Mảng
        $mang = ["An","Nhật Anh","Vũ Anh"];
        // đếm phần tử
        echo count($mang) . "<br>";
        // gọi 1 phần tử xác định
        echo $mang[1] . "<br>";
        // in cả mảng
        print_r($mang);
        echo "<br>";
        // đổi giá trị phần tử trong mảng
        $mang[0] = "Hải Anh";
        print_r($mang);
        echo "<br>";
        // thêm một phần tử vào mảng
        $mang[] = "Thanh Tâm";
        print_r($mang);
        echo "<br>";
        // xóa
        unset($mang[3]);
        print_r($mang);
        echo "<br>";
    ?>
</body>
</html>