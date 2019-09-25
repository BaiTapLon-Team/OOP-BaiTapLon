<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/31/2019
  Time: 3:08 PM
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
    <title>Thi trắc nghiệm</title>
<%--    <link rel="stylesheet" href="./font-icon/fontawesome-pro-5.5.0-web/css/all.css">--%>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/admin.css"/> ">
</head>

<body>
<div class="wrapper">
    <div class="sidebar">
        <div class="logo"><a href="<c:url value="/student/info"/>">Sinh Viên</a></div>
        <div class="info"><i class="fal fa-user-circle"></i> ${student.name} </div>
        <div class="nav">
            <a href="<c:url value="/student/info"/>">Thông tin</a>
            <a href="<c:url value="/sinhvien/thi-trac-nghiem"/> ">Câu hỏi</a>
            <a href="<c:url value="/sinhvien/bang-diem"/>">Bảng điểm</a>
        </div>
    </div>
    <div class="main">
        <div class="navbar">
            <span class="content-titel"><i class="fal fa-users"></i> Sinh Viên</span>
            <a href="<c:url value="/logout"/> " class="logout">Đăng xuất</a>
        </div>

        <!-- nội dung đặt trong content -->
        <div class="content">

            <div class="action">
                <form action="#" class="search-from">
                    <input type="search" name="search" placeholder="Search records">
                    <input type="submit" name="submit" value="Search">
                </form>
            </div>
            <form method="post" action="<c:url value="/sinhvien/ket-qua-thi"/>">
                <table class="table">
                    <c:forEach var="index" begin="0" end="${questionList.size() - 1}">
                        <input type="hidden" name="questionID${index}" value="${questionList[index].questionID}" >
                    <tr><td colspan="2"> ${index + 1}: ${questionList[index].content} </td></tr>
                    <tr>
                        <td><input type="radio" checked="checked" name="${index}" id="${index}" value="${questionList[index].anwserA}"> ${questionList[index].anwserA}</td>
                        <td><input type="radio" name="${index}" id="${index}" value="${questionList[index].anwserB}">${questionList[index].anwserB}</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="${index}" id="${index}" value="${questionList[index].anwserC}">${questionList[index].anwserC}</td>
                        <td><input type="radio" name="${index}" id="${index}" value="${questionList[index].anwserD}">${questionList[index].anwserD}</td>
                    </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="2"><input type="submit" class="action" value="Nộp Bài"></td>
                    </tr>
                </table>
            </form>
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
