<%--
  Created by IntelliJ IDEA.
  User: Duy Phuc
  Date: 9/5/2019
  Time: 8:28 AM
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

    <title>Quản lý sinh viên</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/style2.css"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/css/manage.css"/>">
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
            <h3>QLSV</h3>
        </div>

        <ul class="list-unstyled components">
            <c:set var="name" value="${sessionScope.admin.name }"/>
            <c:if test="${ name != NULL }">
                <p>${sessionScope.admin.name }</p>
                <li>
                    <a href="<c:url value="/admin/info"/>">Thông tin cá nhân</a>
                </li>
                <li class="active">
                    <a href="<c:url value="/manage-student"/>">Quản lý sinh viên</a>
                </li>
                <li>
                    <a href="<c:url value="/manage-teacher"/>">Quản lý giáo viên</a>
                </li>
                <li>
                    <a href="<c:url value="/teacher/list-question"/>">Danh sách câu hỏi</a>
                </li>
                <li >
                    <a href="<c:url value="/teacher/scores-table"/>">Bảng điểm sinh viên</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/editPass"/>">Đổi mật khẩu</a>
                </li>
            </c:if>
            <c:if test="${ name == NULL }">
            <p>${sessionScope.teacher.name }</p>
            <li>
                <a href="<c:url value="/teacher/info"/>">Thông tin cá nhân</a>
            </li>
            <li class="active">
                <a href="<c:url value="/manage-student"/>">Quản lý sinh viên</a>
            </li>
            <li>
                <a href="<c:url value="/teacher/list-question"/>">Danh sách câu hỏi</a>
            </li>
            <li>
                <a href="<c:url value="/teacher/scores-table"/>">Bảng điểm sinh viên</a>
            </li>
            <li>
                <a href="<c:url value="/teacher/editPass"/>">Đổi mật khẩu</a>
                </c:if>
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
                <h1>Danh sách sinh viên</h1>
                <a class="btn btn-primary" href="<c:url value="/manage-student/add-student"/>" role="button">Thêm
                    mới</a>
                <form class="form-inline" action="<c:url value="/manage-student/search"/>" method="GET">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-striped">
                    <thead>
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
                    </thead>
                    <tbody>
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
                            <td>
                                <div style="display: flex">
                                <button type="button" class="action-ob" data-toggle="modal"
                                        data-target=".bd-example-modal-lg"
                                        onclick="showModalEdit('${student.id}', '${student.name}', '${student.username}', '${student.birthday}','${student.gender}', '${student.address}', '${student.email}', '${student.phone}', '${student.magv}')">
                                    Sửa
                                </button>
                                <a
                                        class="action-ob"
                                        href="<c:url value="/manage-student/edit-delete?id=${student.id}"/>">Xóa</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <nav aria-label="Page navigation example" style="float: right">
                    <ul class="pagination">
                        <c:if test="${ currPage == 1 }">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${ currPage > 1 }">
                            <li class="page-item">
                                <a class="page-link" href="?page=${currPage-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach var="i" begin="1" end="${ totalPage }" step="1">
                            <li class="page-item active"><a class="page-link" href="?page=${i}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${ currPage == totalPage }">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${ currPage < totalPage }">
                            <li class="page-item">
                                <a class="page-link" href="?page=${currPage+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa sinh viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <c:url value="/manage-student/edit-db" var="url"/>
                <form:form action="${url}" id="box-info" modelAttribute="student" method="post">
                    <div class="form-group">
                        <label for="masv" class="col-form-label">Mã sinh viên</label>
                        <form:input type="text" id="masv_" path="id" cssStyle="display: none"/>
                        <input class="form-control" type="text" id="masv" disabled="true"/>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-form-label">Họ và tên</label>
                        <form:input class="form-control" type="text" id="name" path="name"/>
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-form-label">Username</label>
                        <form:input class="form-control" type="text" id="username" disabled="true" path="username"/>
                    </div>
                    <div class="form-group">
                        <label for="birthday" class="col-form-label">Ngày sinh</label>
                        <form:input class="form-control" type="text" id="birthday" path="birthday"/>
                    </div>
                    <div class="form-group">
                        <label for="gender" class="col-form-label">Giới tính</label>
                        <form:input class="form-control" type="text" id="gender" path="gender"/>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-form-label">Địa chỉ</label>
                        <form:input class="form-control" type="text" id="address" path="address"/>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-form-label">Số điện thoại</label>
                        <form:input class="form-control" type="text" id="phone" path="phone"/>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-form-label">Email</label>
                        <form:input class="form-control" type="text" id="email" path="email"/>
                    </div>
                    <div class="form-group">
                        <label for="magv" class="col-form-label">Giáo viên quản lý</label>
                        <form:input class="form-control" type="text" id="magv" path="magv"/>
                    </div>
                    <input type="submit" id="submit" value="submit" style="display: none">
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submit()">Lưu thay đổi</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var modalEdit = document.getElementsByClassName("modal")[0];

    function showModalEdit(masv, name, username, birthday, gender, address, email, phone,  magv) {
        document.getElementById("masv").value = masv;
        document.getElementById("masv_").value = masv;
        document.getElementById("name").value = name;
        document.getElementById("username").value = username;
        document.getElementById("birthday").value = birthday;
        document.getElementById("gender").value = gender;
        document.getElementById("address").value = address;
        document.getElementById("phone").value = phone;
        document.getElementById("email").value = email;
        document.getElementById("magv").value = magv;
    }

    var x = document.getElementById("submit");

    function submit() {
        x.click();
    }
</script>
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