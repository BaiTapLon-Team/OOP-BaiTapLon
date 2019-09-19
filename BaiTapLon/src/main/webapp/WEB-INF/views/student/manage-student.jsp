<%--
  Created by IntelliJ IDEA.
  User: Duy Phuc
  Date: 9/5/2019
  Time: 8:28 AM
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
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/admin.css"/>">
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/teacher-manage.css"/>">
</head>

<body>
<div class="wrapper">
    <div class="sidebar">
        <div class="logo"><a href="#">Management</a></div>
        <div class="info"><i class="fal fa-user-circle"></i> Name Admin</div>
        <div class="nav">
            <c:set var="name" value="${sessionScope.admin.name }"/>
            <c:if test="${ name != NULL }">
                <a href="<c:url value="/admin/info"/>">Thông tin</a>
                <a href="<c:url value="/manage-student"/> ">Sinh viên</a>
                <a href="<c:url value="/manage-teacher"/> ">Giáo viên</a>
            </c:if>
            <c:if test="${ name == NULL }">
                <a href="<c:url value="/teacher/info"/>">Thông tin</a>
                <a href="<c:url value="/manage-student"/> ">Sinh viên</a>
            </c:if>
            <a href="<c:url value="/teacher/list-question"/>">Câu hỏi</a>
            <a href="<c:url value="/teacher/scores-table"/>">Bảng điểm</a>
        </div>
    </div>
    <div class="main">
        <div class="navbar">
            <span class="content-titel"><i class="fal fa-users"></i> Quản lý sinh viên</span>
            <a href="<c:url value="/logout"/>" class="logout">Đăng xuất</a>
        </div>
        <div class="content">
            <div class="action">
                <h1>Danh sách sinh viên</h1>
                <a href="<c:url value="/manage-student/add-student"/> " class="add-content">Thêm mới</a>
                <form action="<c:url value="/manage-student/search"/>" class="search-from" method="get">
                    <input type="search" name="search" placeholder="Search records">
                    <input type="submit" name="submit" value="Search">
                </form>
            </div>
            <table class="table">
                <tr>
                    <th>STT</th>
                    <th>Mã SV</th>
                    <th>Username</th>
                    <th>Họ và tên</th>
                    <th>Ngày sinh</th>
                    <th>Địa chỉ</th>
                    <th>Giới tính</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Mã GVQL</th>
                    <th>Action</th>
                </tr>
                <c:set var="i" value="0"/>
                <c:forEach var="student" items="${ students }">
                    <tr>
                        <td>${ i = i+1 }</td>
                        <td>${student.id}</td>
                        <td>${student.username}</td>
                        <td>${student.name}</td>
                        <td>${student.birthday}</td>
                        <td>${student.address}</td>
                        <td>${student.gender}</td>
                        <td>${student.email}</td>
                        <td>${student.phone}</td>
                        <td>${student.magv}</td>
                        <td><a class="action-ob" href="<c:url value="/manage-student/edit?id=${student.id}"/> ">Sửa</a><a class="action-ob" href="<c:url value="/manage-student/edit-delete?id=${student.id}"/> ">Xóa</a></td>
                    </tr>
                </c:forEach>
            </table>
            <div class="pagination">
                <span>Showing 1 to 10 of 40 entries</span>
                <ul class="">
                    <c:if test="${ currPage == 1 }">
                        <li><a href="#">«</a></li>
                    </c:if>
                    <c:if test="${ currPage > 1 }">
                        <li><a class="prev" href="?page=${currPage-1}">«</a></li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${ totalPage }" step="1">
                        <li><a href="?page=${i}">${ i }</a></li>
                    </c:forEach>
                    <c:if test="${ currPage == totalPage }">
                        <li><a href="#">»</a></li>
                    </c:if>
                    <c:if test="${ currPage < totalPage }">
                        <li><a href="?page=${currPage+1}">»</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
        <div class="footer">© 2019 codesieungu, made with love for a better web</div>
    </div>
</div>
</body>
</html>