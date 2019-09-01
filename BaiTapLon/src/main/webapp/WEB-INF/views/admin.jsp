<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/27/2019
  Time: 2:36 PM
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
    <title>Admin</title>
    <link rel="stylesheet" href="./font-icon/fontawesome-pro-5.5.0-web/css/all.css">
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/admin.css" />">
</head>

<body>
<div class="wrapper">
    <div class="sidebar">
        <div class="logo"><a href="#">Management</a></div>
        <div class="info"><i class="fal fa-user-circle"></i> Name Admin</div>
        <div class="nav">
            <a href="#">Thông tin</a>
            <a href="#">Giáo viên</a>
            <a href="#">Sinh viên</a>
            <a href="#">Câu hỏi</a>
            <a href="#">Bảng điểm</a>
        </div>
    </div>
    <div class="main">
        <div class="navbar">
            <span class="content-titel"><i class="fal fa-users"></i> Quản lý giáo viên</span>
            <a href="#" class="logout">Đăng xuất</a>
        </div>
        <div class="content">
            <div class="action">
                <a href="" class="add-content">Thêm mới</a>
                <form action="#" class="search-from">
                    <input type="search" name="search" placeholder="Search records">
                    <input type="submit" name="submit" value="Search">
                </form>
            </div>
            <table class="table">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                    <th scope="col">Handle</th>
                    <th scope="col">Action</th>
                </tr>
                <tr>
                    <td>Hello</td>
                    <td>Hello</td>
                    <td>Hello</td>
                    <td>Hello</td>
                    <td><i class="fal fa-user-edit"></i> <i class="fal fa-user-times"></i></td>
                </tr>
            </table>
            <div class="pagination">
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
        <div class="footer">© 2019 codesieungu, made with love for a better web</div>
    </div>
</div>
</body>
</html>