<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>PHP buổi 2</title>
    <style>
        .warning{
            color: red;

        }
    </style>
</head>
<body>
    
    <form action="login.php" method="post">
        <!-- gửi thông tin đi: post, lấy thông tin: get -->
        <h1>Đăng nhập</h1>
        <div>
            <input type="text" name="username" placholder="Tên đăng nhập">
        </div>
        <div>
            <input type="password" name="password" placholder="Mật khẩu">
        </div>
        <div>
            <input type="submit" value="Đăng nhập">
        </div>
    </form>
    <?php
        if(isset($_POST['username']) && isset($_POST['password'])){
            // Nếu tên đăng nhập = admin
            // Mật khẩu 123 thì cho phép người dùng vào trang chủ
            $tenDN = $_POST['username'];
            $matKhau = $_POST['password'];
            // tên biến = $_tên method['name trong input']
            // echo $tenDN;
            if($tenDN == 'admin' && $matKhau == '123'){
                session_start();
                $_SESSION["username"] = $tenDN;
                header('location: trangchu.php');
            }
            else{
                echo "<p class='warning'>Sai thông tin đăng nhập</p>";
            }
        }

        

        


    ?>
</body>
</html>