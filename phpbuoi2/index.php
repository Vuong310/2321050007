<?php
    // cookie
    #Lưu ở phía người dùng
    #Dùng cho những thông tin ít quan trọng
    $cookieName = "user";
    $cookieValue = "VuongLinh";
    // 86400 = 30 ngày
    setcookie($cookieName, $cookieValue, time()+(86400),"/");

    if(isset($_COOKIE[$cookieName])){
        echo "Cookie đã tồn tại";
    }
    else{
        echo "Cookie chưa tồn tại";
    }

    // session
    #Thông tin đăng nhập, giỏ hàng,...
    session_start();
    $_SESSION["name"] = "Vương Linh";

    echo $_SESSION["name"];
    

    


?>