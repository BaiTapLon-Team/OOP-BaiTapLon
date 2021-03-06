<%--
  Created by IntelliJ IDEA.
  User: Duy Phuc
  Date: 9/2/2019
  Time: 10:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Thông tin cá nhân</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/style2.css"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/css/info.css"/> ">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

</head>

<body>

<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>Sinh Viên</h3>
        </div>

        <ul class="list-unstyled components">
            <p>${student.name}</p>
            <li class="active">
                <a href="<c:url value="/student/info"/> ">Thông tin cá nhân</a>
            </li>
            <li>
                <a href="<c:url value="/sinhvien/thi-trac-nghiem"/> ">Làm bài thi</a>
            </li>
            <li>
                <a href="<c:url value="/sinhvien/bang-diem"/> ">Xem lại bài làm</a>
            </li>
            <li>
                <a href="<c:url value="/student/editPass"/>">Đổi mật khẩu</a>
            </li>
            <li>
                <a href="#">Hỗ trợ</a>
            </li>
        </ul>
    </nav>

    <!-- Page Content  -->
    <div id="content">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">

                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-align-left"></i>
                    <span>Menu Sidebar</span>
                </button>
                <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-align-justify"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <a class="btn btn-danger ml-auto" href="<c:url value="/logout"/>" role="button">Đăng xuất</a>
                </div>
            </div>
        </nav>

        <div class="main">
            <div class="view-info">
                <h1 id="titel-info">Thông tin cá nhân sinh viên</h1>
                <c:url value="/student/info-edit" var="url"/>
                <form:form action="${url}" id="box-info" modelAttribute="student" method="post">
                    <div class="info">
                        <label for="masv">Mã sinh viên</label>
                        <form:input type="text" id="masv" value="${ student.id.trim() }"  path="id" disabled="true" name="masv"/>
                    </div>
                    <div class="info">
                        <label for="name">Họ và tên</label>
                        <form:input type="text" id="name" value="${ student.name.trim() }" path="name" name="name"/>
                    </div>
                    <div class="info">
                        <label for="username">Username</label>
                        <form:input type="text" id="username" value="${ student.username.trim() }" disabled="true" path="username" name="username"/>
                    </div>
                    <div class="info">
                        <label for="birthday">Ngày sinh</label>
                        <form:input type="text" id="birthday" value="${ student.birthday.trim() }" path="birthday" name="birthday"/>
                    </div>
                    <div class="info">
                        <label for="gender">Giới tính</label>
                        <form:input type="text" id="gender" value="${ student.gender.trim() }" path="gender" name="gender"/>
                    </div>
                    <div class="info">
                        <label for="address">Địa chỉ</label>
                        <form:input type="text" id="address" value=" ${ student.address.trim() }" path="address" name="address"/>
                    </div>
                    <div class="info">
                        <label for="phone">Số điện thoại</label>
                        <form:input type="text" id="phone" value="${ student.phone.trim() }" path="phone" name="phone"/>
                    </div>
                    <div class="info">
                        <label for="email">Email</label>
                        <form:input type="text" id="email" value="${ student.email.trim() }" path="email" name="email"/>
                    </div>
                    <div class="info">
                        <label for="magv">Giáo viên quản lý</label>
                        <form:input type="text" id="magv" path="magv"  disabled="true" value="${ student.magv.trim() }" name="magv"/>
                    </div>
                    <div class="save-info">
                        <input type="submit" value="Lưu thay đổi">
                    </div>
                </form:form>
            </div>
        </div>

    </div>
</div>

<!-- jQuery CDN - Slim version (=without AJAX) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Popper.JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#sidebar").mCustomScrollbar({
            theme: "minimal"
        });

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar, #content').toggleClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });
    });
</script>
</body>

</html>