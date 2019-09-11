<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/2/2019
  Time: 10:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Bảng điểm</title>
    <%--    <link rel="stylesheet" href="./font-icon/fontawesome-pro-5.5.0-web/css/all.css">--%>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/admin.css"/> ">
</head>

<body>
<div class="wrapper">
    <div class="sidebar">
        <div class="logo"><a href="#">Sinh Viên</a></div>
        <div class="info"><i class="fal fa-user-circle"></i>${student.name}</div>
        <div class="nav">
            <a href="${pageContext.request.contextPath}/student/info">Thông tin</a>
            <a href="${pageContext.request.contextPath}/sinhvien/thi-trac-nghiem">Câu Hỏi</a>
            <a href="${pageContext.request.contextPath}/sinhvien/bang-diem">Bảng điểm</a>
        </div>
    </div>
    <div class="main">
        <div class="navbar">
            <span class="content-titel"><i class="fal fa-users"></i> Sinh Viên</span>
            <a href="<c:url value="/logout"/>" class="logout">Đăng xuất</a>
        </div>
        <!-- nội dung đặt trong content -->
        <div class="content">
            <div class="action">
                <a href="" class="add-content">Điểm: ${scores}/50</a>
                <form action="#" class="search-from">
                    <input type="search" name="search" placeholder="Search records">
                    <input type="submit" name="submit" value="Search">
                </form>
            </div>
            <table class="table">
                <tr style="color: blue">
                    <th>STT</th>
                    <th>Câu Hỏi</th>
                    <th>Đáp Án Của Bạn</th>
                    <th>Đáp Án Đúng</th>
                </tr>
                <c:forEach begin="0" end="${sQuesionList.size()-1}" var="index">
                    <tr>
                        <td>${index+1}</td>
                        <td>${sQuesionList[index].content}</td>
                        <td>${sQuesionList[index].answer}</td>
                        <td>${sQuesionList[index].correct}</td>
                    </tr>
                </c:forEach>
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
