<%--
  Created by IntelliJ IDEA.
  User: Duy Phuc
  Date: 9/2/2019
  Time: 11:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin</title>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/admin.css" />">
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/student-info.css" />">
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/teacher-info.css" />">
</head>

<body>
<div class="wrapper">
    <div class="sidebar">
        <div class="logo"><a href="#">Management</a></div>
        <div class="info"><i class="fal fa-user-circle"></i> ${ teacher.name } </div>
        <div class="nav">
            <a href="<c:url value="/teacher/info"/>">Thông tin</a>
            <a href="<c:url value="/teacher/manage-student"/>">Sinh viên</a>
            <a href="#">Câu hỏi</a>
            <a href="#">Bảng điểm</a>
        </div>
    </div>
    <div class="main">
        <div class="navbar">
            <span class="content-titel"><i class="fal fa-users"></i> Thông tin cá nhân</span>
            <a href="<c:url value="/logout"/>" class="logout">Đăng xuất</a>
        </div>
        <div class="content">
            <div class="view-info">
                <h1 id="titel-info">Thông tin giảng viên</h1>
                <c:url value="/teacher/info-edit" var="url"/>
                <form:form action="${url}" id="box-info" modelAttribute="teacher" method="post">
                    <div class="info">
                        <label for="magv">Mã giáo viên</label>
                        <form:input type="text" id="magv" value="${ teacher.id.trim() }"  path="id" disabled="true"/>
                    </div>
                    <div class="info">
                        <label for="name">Họ và tên</label>
                        <form:input type="text" id="name" value="${ teacher.name.trim() }" path="name"/>
                    </div>
                    <div class="info">
                        <label for="username">Username</label>
                        <form:input type="text" id="username" value="${ teacher.username.trim() }" disabled="true" path="username"/>
                    </div>
                    <div class="info">
                        <label for="birthday">Ngày sinh</label>
                        <form:input type="text" id="birthday" value="${ teacher.birthday.trim() }" path="birthday" />
                    </div>
                    <div class="info">
                        <label for="gender">Giới tính</label>
                        <form:input type="text" id="gender" value="${ teacher.gender.trim() }" path="gender"/>
                    </div>
                    <div class="info">
                        <label for="address">Địa chỉ</label>
                        <form:input type="text" id="address" value=" ${ teacher.address.trim() }" path="address"/>
                    </div>
                    <div class="info">
                        <label for="phone">Số điện thoại</label>
                        <form:input type="text" id="phone" value="${ teacher.phone.trim() }" path="phone"/>
                    </div>
                    <div class="info">
                        <label for="email">Email</label>
                        <form:input type="text" id="email" value="${ teacher.email.trim() }" path="email"/>
                    </div>
                    <div class="info">
                        <label for="qualifications">Trình độ chuyên môn</label>
                        <form:input type="text" id="qualifications" path="qualifications"  value="${ teacher.qualifications.trim() }" />
                    </div>
                    <div class="info">
                        <label for="coefficientsSalary">Hệ số lương</label>
                        <form:input type="text" id="coefficientsSalary" path="coefficientsSalary"  disabled="true" value="${ teacher.coefficientsSalary }" />
                    </div>
                    <div class="save-info">
                        <input type="submit" value="Lưu thay đổi">
                    </div>
                </form:form>
            </div>
        </div>
        <div class="footer">© 2019 codesieungu, made with love for a better web</div>
    </div>
</div>
</body>
</html>