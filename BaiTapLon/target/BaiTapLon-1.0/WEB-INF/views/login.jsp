<%--
  Created by IntelliJ IDEA.
  User: Duy Phuc
  Date: 8/26/2019
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng nhập</title>
    <link rel="icon" type="image/png" href="<c:url value="/resources/image/favicon.ico" />">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        @font-face {
            font-family: Comfortaa-Bold;
            /* font-family: Comfortaa-Light;
            font-family: Comfortaa-Medium;
            font-family: Comfortaa-Regular;
            font-family: Comfortaa[wght]; */
            /*src: url(./font/Comfortaa-Bold.ttf);*/
            src: url(<c:url value="/resources/font/Comfortaa-Bold.ttf" />);
            /* src: url(./font/Comfortaa-Light.ttf);
            src: url(./font/Comfortaa-Medium.ttf);
            src: url(./font/Comfortaa-Regular.ttf);
            src: url(./font/Comfortaa-SemiBold.ttf);
            src: url(./font/Comfortaa[wght].ttf); */
        }

        html,
        body {
            width: 100%;
            height: 100%;
            background-color: #ebeeef;
        }

        .container {
            width: 670px;
            background-color: white;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 15px;
            overflow: hidden;
            text-align: center;
            font-family: Comfortaa-Bold;
        }

        #header {
            width: 100%;
            height: 178px;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #header #bgr {
            width: 100%;
            height: 100%;
            background-image: url(<c:url value="/resources/image/bg-01.jpg" />);
            position: absolute;
            z-index: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #header #bgr::before {
            content: "";
            display: block;
            position: absolute;
            z-index: -1;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background-color: rgba(54, 84, 99, 0.7);
        }

        #header #form-titel {
            font-size: 50px;
            color: white;
        }

        .form-content {
            box-sizing: border-box;
            padding: 40px 40px 10px 40px;
        }

        #username,
        #password {
            margin: 30px 0;
        }
        #username span,
        #password span{
            display: inline-block;
            font-size: 20px;
            width: 110px;
            text-align: left;
        }
        #username input,
        #password input {
            padding: 15px 60px 15px 15px;
            margin-left: 20px;
            border: 0;
            outline: 0;
            border-bottom: 1px solid gray;
            width: 350px;
            text-align: center;
            font-size: 20px;
            font-family: Comfortaa-Bold;
        }


        #save-pass {
            display: flex;
            margin-left: 150px;
            margin-right: 30px;
            justify-content: space-between;
            align-items: center;
        }

        #save-pass a {
            color: black;
        }

        .form-content input[type="submit"] {
            width: 100px;
            height: 40px;
            background-color: #28a745;
            color: #fff;
            border: 0;
            border-radius: 10px;
            margin: 30px 0 0 0;
            font-size: 20px;
            font-family: Comfortaa-Bold;
            outline: none;
        }

        .form-content input[type="submit"]:hover {
            background-color: #218838;
        }

        .form-content input[type="submit"]:focus {
            box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, .5);
        }

        #error {
            height: 25px;
            padding: 10px 30px 30px 30px;
            text-align: center;
            font-size: 20px;
            color: red;
        }

    </style>
</head>

<body>
<div class="container">
    <div id="header">
        <div id="bgr">
            <span id="form-titel">SIGN IN</span>
        </div>

    </div>
    <form action="#" class="form-content" method="post">
        <div id="username">
            <span>Username</span>
            <input type="text" name="username" placeholder="Your Username" autocomplete="off">
        </div>
        <div id="password">
            <span>Password</span>
            <input type="password" name="password" placeholder="Your Password">

        </div>
        <div id="save-pass">
            <div class="remp">
                <input type="checkbox">
                <span>Remember me</span>
            </div>
            <a href="#">Forgot Password?</a>
        </div>
        <input type="submit" name="submit" value="Login">
    </form>
    <div id="error">This is a error.</div>
</div>
</body>

</html>