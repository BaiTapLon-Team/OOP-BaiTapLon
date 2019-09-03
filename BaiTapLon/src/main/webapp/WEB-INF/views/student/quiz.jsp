<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/31/2019
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thi trắc nghiệm</title>
    <link rel="stylesheet" href="./font-icon/fontawesome-pro-5.5.0-web/css/all.css">
    <style>
        @font-face {
            font-family: Comfortaa-Bold;
            /* font-family: Comfortaa-Light;
            font-family: Comfortaa-Medium;
            font-family: Comfortaa-Regular;
            font-family: Comfortaa[wght]; */
            src: url(../../../resources/font/Comfortaa-Bold.ttf);
            /* src: url(./font/Comfortaa-Light.ttf);
            src: url(./font/Comfortaa-Medium.ttf);
            src: url(./font/Comfortaa-Regular.ttf);
            src: url(./font/Comfortaa-SemiBold.ttf);
            src: url(./font/Comfortaa[wght].ttf); */
        }

        * {
            margin: 0;
            padding: 0
        }

        html,
        body {
            width: 100%;
            height: 100%;
            background-color: #ebeeef;
        }

        .wrappe-me {
            display: flex;
            width: 100%;
            height: 100%;
        }

        .wrappe-me .sidebar-me {
            width: 250px;
            height: 100%;
            background-image: linear-gradient(to bottom, #9999fd, #0085c1);
            text-align: center;
            font-family: Comfortaa-Bold;
            position: fixed;
            left: 0;
        }

        .sidebar-me .logo {
            width: 100%;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .sidebar-me .logo::before,
        .sidebar-me .info::before {
            content: "";
            position: absolute;
            height: 1px;
            background-color: rgb(199, 199, 199);
            width: calc(100% - 30px);
            bottom: 0;
            left: 0;
            margin-left: 15px;
        }

        .sidebar-me .logo a {
            text-decoration: none;
            color: white;
            font-size: 20px;
        }

        .sidebar-me .info {
            width: 100%;
            color: #fff;
            font-size: 20px;
            padding: 30px 0;
            box-sizing: border-box;
            position: relative;
        }

        .nav {
            padding: 50px 10px;
        }

        .nav a {
            display: block;
            padding: 20px;
            background-color: #fff;
            margin: 15px 0;
            border-radius: 15px;
            text-decoration: none;
            font-size: 20px;
            box-shadow: 0px 0px 0px;
            transition: 0.2s;
            color: #000;
        }

        .nav a:hover {
            box-shadow: 0px 3px 12px;
        }

        .main-me {
            width: calc(100% - 250px);
            height: 100%;
            position: absolute;
            right: 0;
        }

        .main-me .navbar {
            width: 100%;
            height: 60px;
            background-color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #e7e7e7;
            box-sizing: border-box;
            padding: 0px 40px;

        }

        .main-me .content-titel {
            display: inline-block;
            font-family: Comfortaa-Bold;
            font-size: 25px;
            padding: 20px;
        }

        .main-me .navbar .logout {
            display: inline-block;
            text-decoration: none;
            background-color: #dc3545;
            /* margin: 0 25px; */
            padding: 8px;
            font-size: 20px;
            color: #fff;
            border-radius: 5px;
        }

        .main-me .navbar .logout:focus {
            box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, .5);
        }

        .content {
            width: calc(100% - 80px);
            /* height: calc(100% - 180px); */
            background-color: #fff;
            margin: 40px;
            box-sizing: border-box;
            box-shadow: 0px 0px 1px 0px;
            padding: 30px;
            display: flex;
            flex-direction: column;
            border-radius: 5px;
        }




        .action {
            width: 100%;
            height: 70px;
            display: flex;
            justify-content: space-between;
            padding: 15px;
            box-sizing: border-box;
        }



        .action .add-content {
            background-color: #0085c1;
            text-decoration: none;
            color: #fff;
            padding: 8px;
            border-radius: 5px;
            font-size: 20px;
        }

        .action .search-from {}

        .action .search-from input[type="search"] {
            height: 100%;
            border-radius: 5px;
            border: 0;
            border: 1px solid #aaaaaa;
            outline: none;
            text-align: center;
            padding: 10px 15px;
            font-size: 20px;
            box-sizing: border-box;
        }

        .action .search-from input[type="search"]:focus {
            box-shadow: 0px 0px 2px;
        }

        .action .search-from input[type="submit"] {
            border: 0;
            border: 1px solid #aaaaaa;
            border-radius: 5px;
            font-size: 20px;
            background-color: #0085c1;
            color: #fff;
            padding: 7px 10px;
            box-sizing: border-box;
        }

        .table {
            display: table;
            width: 100%;
            text-align: center;
            border-collapse: collapse;
            border: 1px solid #dee2e6;
        }

        .table td, tr
        {
            border-top: 1px solid #dee2e6;
            padding: 10px 0px;
        }

        .table td {
            background-color: #ebeeef;
        }

        .pagination-me {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            align-items: center;
        }

        .pagination-me span {
            font-family: Comfortaa-Bold;
            font-size: 20px;
        }

        .pagination-me ul {
            display: flex;
            background-color: #ffffff;
            justify-content: flex-end;
            list-style: none;
            height: 50px;
            align-items: center;
            border-radius: 25px;
        }

        .pagination-me ul a {
            display: block;
            width: 40px;
            text-align: center;
            text-decoration: none;
            color: #000;
            margin: 3px;
            border-radius: 4px;
            height: 40px;
            line-height: 40px;
            border: 1px solid rgba(128, 128, 128, 0.486);
        }

        /* .pagination-me ul li:first-child a {
            border-radius: 20px 0 0 20px;
        }

        .pagination-me ul li:last-child a {
            border-radius: 0 20px 20px 0;
        } */

        .footer-me {
            width: 100%;
            height: 40px;
            background-color: #fff;
            /* position: fixed;
            bottom: 0; */
            border-top: 1px solid #e7e7e7;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
            font-family: Comfortaa-Bold;
        }
    </style>
</head>

<body>
<div class="wrappe-me">
    <div class="sidebar-me">
        <div class="logo"><a href="#">Sinh Viên</a></div>
        <div class="info"><i class="fal fa-user-circle"></i> ${student.name} </div>
        <div class="nav">
            <a href="#">Thông tin</a>
            <a href="#">Câu hỏi</a>
            <a href="#">Bảng điểm</a>
        </div>
    </div>
    <div class="main-me">
        <div class="navbar">
            <span class="content-titel"><i class="fal fa-users"></i> Sinh Viên</span>
            <a href="#" class="logout">Đăng xuất</a>
        </div>

        <!-- nội dung đặt trong content -->
        <div class="content">

            <div class="action">
                <form action="#" class="search-from">
                    <input type="search" name="search" placeholder="Search records">
                    <input type="submit" name="submit" value="Search">
                </form>
            </div>
            <form method="post" action="/BaiTapLon/ket-qua-thi">
                <table class="table">
                    <c:forEach var="index" begin="0" end="${questionList.size() - 1}">
                        <input type="hidden" name="questionID${index}" value="${questionList[index].questionID}" >
                    <tr><td colspan="2"> ${index + 1}: ${questionList[index].content} </td></tr>
                    <tr>
                        <td><input type="radio" checked="checked" name="${index}" id=${index}" value="${questionList[index].anwserA}"> ${questionList[index].anwserA}</td>
                        <td><input type="radio" name="${index}" id=${index}" value="${questionList[index].anwserB}">${questionList[index].anwserB}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="${index}" id=${index}" value="${questionList[index].anwserC}">${questionList[index].anwserC}</td>
                        <td><input type="radio" name="${index}" id=${index}" value="${questionList[index].anwserD}">${questionList[index].anwserD}</td>
                    </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="2"><input type="submit" class="action" value="Nộp Bài"></td>
                    </tr>
                </table>
            </form>
            <div class="pagination-me">
                <span>Showing 1 to 10 of 40 entries</span>
                <ul class="">
                    <li><a href="#0"><</a></li>
                    <li><a href="#0">1</a></li>
                    <li><a href="#0">2</a></li>
                    <li><a href="#0">3</a></li>
                    <li><a href="#0">></a></li>

                </ul>
            </div>
        </div>
        <div class="footer-me">© 2019 codesieungu, made with love for a better web</div>
    </div>
</div>
</body>
</html>
