<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/2/2019
  Time: 10:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="vi">--%>

<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
<%--    <title>Bảng điểm</title>--%>
<%--    &lt;%&ndash;    <link rel="stylesheet" href="./font-icon/fontawesome-pro-5.5.0-web/css/all.css">&ndash;%&gt;--%>
<%--    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/admin.css"/> ">--%>
<%--</head>--%>

<%--<body>--%>
<%--<div class="wrapper">--%>
<%--    <div class="sidebar">--%>
<%--        <div class="logo"><a href="#">Sinh Viên</a></div>--%>
<%--        <div class="info"><i class="fal fa-user-circle"></i>${student.name}</div>--%>
<%--        <div class="nav">--%>
<%--            <a href="${pageContext.request.contextPath}/student/info">Thông tin</a>--%>
<%--            <a href="${pageContext.request.contextPath}/sinhvien/thi-trac-nghiem">Câu Hỏi</a>--%>
<%--            <a href="${pageContext.request.contextPath}/sinhvien/bang-diem">Bảng điểm</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="main">--%>
<%--        <div class="navbar">--%>
<%--            <span class="content-titel"><i class="fal fa-users"></i> Sinh Viên</span>--%>
<%--            <a href="<c:url value="/logout"/>" class="logout">Đăng xuất</a>--%>
<%--        </div>--%>
<%--        <!-- nội dung đặt trong content -->--%>
<%--        <div class="content">--%>
<%--            <div class="action">--%>
<%--                <a href="" class="add-content">Điểm: ${scores}/50</a>--%>
<%--                <form action="#" class="search-from">--%>
<%--                    <input type="search" name="search" placeholder="Search records">--%>
<%--                    <input type="submit" name="submit" value="Search">--%>
<%--                </form>--%>
<%--            </div>--%>
<%--            <table class="table">--%>
<%--                <tr style="color: blue">--%>
<%--                    <th>STT</th>--%>
<%--                    <th>Câu Hỏi</th>--%>
<%--                    <th>Đáp Án Của Bạn</th>--%>
<%--                    <th>Đáp Án Đúng</th>--%>
<%--                </tr>--%>
<%--                <c:forEach begin="0" end="${sQuesionList.size()-1}" var="index">--%>
<%--                    <tr>--%>
<%--                        <td>${index+1}</td>--%>
<%--                        <td>${sQuesionList[index].content}</td>--%>
<%--                        <td>${sQuesionList[index].answer}</td>--%>
<%--                        <td>${sQuesionList[index].correct}</td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--            </table>--%>
<%--            <div class="pagination">--%>
<%--                <span>Showing 1 to 10 of 40 entries</span>--%>
<%--                <ul class="">--%>
<%--                    <li><a href="#0"><</a></li>--%>
<%--                    <li><a href="#0">1</a></li>--%>
<%--                    <li><a href="#0">2</a></li>--%>
<%--                    <li><a href="#0">3</a></li>--%>
<%--                    <li><a href="#0">></a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="footer">© 2019 codesieungu, made with love for a better web</div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Xem lại bài làm</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/style2.css"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/css/scoresStudent.css"/> ">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
            integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
            crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
            integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
            crossorigin="anonymous"></script>

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
            <li >
                <a href="<c:url value="/student/info"/> ">Thông tin cá nhân</a>
            </li>
            <li >
                <a href="<c:url value="/sinhvien/thi-trac-nghiem"/> ">Làm bài thi</a>
            </li>
            <li class="active">
                <a href="<c:url value="/sinhvien/bang-diem"/> ">Xem lại bài làm</a>
            </li>
            <li>
                <a href="#">Đổi mật khẩu</a>
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
                <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-align-justify"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <a class="btn btn-danger ml-auto" href="<c:url value="/logout"/>" role="button">Đăng xuất</a>
                </div>
            </div>
        </nav>

        <div class="main">
            <div class="action">
                <h1>Xem lại đáp án</h1>
                <form class="form-inline" action="#" method="GET">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
            <div class="table-responsive">
                <h4>Điểm: ${scores}/50</h4>
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Câu Hỏi</th>
                        <th>Đáp Án Của Bạn</th>
                        <th>Đáp Án Đúng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach begin="0" end="${sQuesionList.size()-1}" var="index">
                        <tr>
                            <td>${index+1}</td>
                            <td>${sQuesionList[index].content}</td>
                            <td>${sQuesionList[index].answer}</td>
                            <td>${sQuesionList[index].correct}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>

<!-- jQuery CDN - Slim version (=without AJAX) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<!-- Popper.JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
        crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
        integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
        crossorigin="anonymous"></script>
<!-- jQuery Custom Scroller CDN -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

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