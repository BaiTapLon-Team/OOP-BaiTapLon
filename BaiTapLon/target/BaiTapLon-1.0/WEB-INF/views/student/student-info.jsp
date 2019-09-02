<%--
  Created by IntelliJ IDEA.
  User: Duy Phuc
  Date: 9/2/2019
  Time: 10:07 AM
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
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/admin.css" />">
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/student-info.css" />">
</head>

<body>
<div class="wrapper">
    <div class="sidebar">
        <div class="logo"><a href="#">Management</a></div>
        <div class="info"><i class="fal fa-user-circle"></i> ${ student.name } </div>
        <div class="nav">
            <a href="#">Thông tin</a>
            <a href="${pageContext.request.contextPath}/sinhvien/thi-trac-nghiem">Câu hỏi</a>
            <a href="#">Bảng điểm</a>
        </div>
    </div>
    <div class="main">
        <div class="navbar">
            <span class="content-titel"><i class="fal fa-users"></i> Thông tin cá nhân</span>
            <a href="#" class="logout">Đăng xuất</a>
        </div>
        <div class="content">
            <div class="view-info">
                <h1 id="titel-info">Thông tin cá nhân sinh viên</h1>
                <form action="#">
                    <label for="name">Họ và tên</label>
                    <input type="text" id="name" value="${ student.name }">
                    <label for="address">Địa chỉ</label>
                    <input type="text" id="address" value="${ student.address }">
                </form>
            </div>
        </div>
        <div class="footer">© 2019 codesieungu, made with love for a better web</div>
    </div>
</div>
</body>
</html>