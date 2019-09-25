<%--
  Created by IntelliJ IDEA.
  User: Duy Phuc
  Date: 9/18/2019
  Time: 12:57 AM
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

    <title>Quản lý giáo viên</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/style2.css"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/css/manage.css" />">
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
            <h3>Quản trị viên</h3>
        </div>

        <ul class="list-unstyled components">
            <p>${ admin.name }</p>
            <li>
                <a href="<c:url value="/admin/info"/>">Thông tin cá nhân</a>
            </li>
            <li>
                <a href="<c:url value="/manage-student"/>">Quản lý sinh viên</a>
            </li>
            <li class="active">
                <a href="<c:url value="/manage-teacher"/>">Quản lý giáo viên</a>
            </li>
            <li>
                <a href="<c:url value="/teacher/list-question"/>">Danh sách câu hỏi</a>
            </li>
            <li>
                <a href="<c:url value="/teacher/scores-table"/>">Bảng điểm sinh viên</a>
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
                <h1>Danh sách giáo viên</h1>
                <a class="btn btn-primary" href="<c:url value="/manage-teacher/add-teacher"/>" role="button">Thêm
                    mới</a>
                <form class="form-inline" action="<c:url value="/manage-teacher/search"/>" method="GET">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã GV</th>
                        <th>Username</th>
                        <th>Họ và tên</th>
                        <th>Ngày sinh</th>
                        <th>Địa chỉ</th>
                        <th>Giới tính</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Trình độ</th>
                        <th>Hệ số lương</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="i" value="0"/>
                    <c:forEach var="teacher" items="${ teachers }">
                        <tr>
                            <td>${ i = i+1 }</td>
                            <td>${teacher.id}</td>
                            <td>${teacher.username}</td>
                            <td>${teacher.name}</td>
                            <td>${teacher.birthday}</td>
                            <td>${teacher.address}</td>
                            <td>${teacher.gender}</td>
                            <td>${teacher.email}</td>
                            <td>${teacher.phone}</td>
                            <td>${teacher.qualifications}</td>
                            <td>${teacher.coefficientsSalary}</td>
                            <td><button type="button" class="action-ob" data-toggle="modal"
                                        data-target=".bd-example-modal-lg"
                                        onclick="showModalEdit('${teacher.id}', '${teacher.name}', '${teacher.username}', '${teacher.birthday}', '${teacher.gender}', '${teacher.address}', '${teacher.phone}', '${teacher.email}', '${teacher.qualifications}','${teacher.coefficientsSalary}')">Sửa</button><a
                                    class="action-ob" href="<c:url value="/manage-teacher/edit-delete?id=${teacher.id}"/>">Xóa</a></td>
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
                <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa giáo viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <c:url value="/manage-teacher/edit-db" var="url"/>
                <form:form action="${url}" id="box-info" modelAttribute="teacher" method="post">
                    <div class="form-group">
                        <label for="magv" class="col-form-label">Mã giáo viên</label>
                        <form:input class="form-control" type="text" id="magv_" path="id" name="magv" cssStyle="display: none"/>
                        <input class="form-control" type="text" id="magv" disabled="true" name="magv"/>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-form-label">Họ và tên</label>
                        <form:input class="form-control" type="text" id="name" path="name" name="name" />
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-form-label">Username</label>
                        <form:input class="form-control" type="text" id="username" disabled="true" path="username" name="username"/>
                    </div>
                    <div class="form-group">
                        <label for="birthday" class="col-form-label">Ngày sinh</label>
                        <form:input class="form-control" type="text" id="birthday" path="birthday" name="birthday"/>
                    </div>
                    <div class="form-group">
                        <label for="gender" class="col-form-label">Giới tính</label>
                        <form:input class="form-control" type="text" id="gender" path="gender" name="gender"/>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-form-label">Địa chỉ</label>
                        <form:input class="form-control" type="text" id="address" path="address" name="address"/>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-form-label">Số điện thoại</label>
                        <form:input class="form-control" type="text" id="phone" path="phone" name="phone"/>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-form-label">Email</label>
                        <form:input class="form-control" type="text" id="email" path="email" name="email"/>
                    </div>
                    <div class="form-group">
                        <label for="qualifications" class="col-form-label">Trình độ chuyên môn</label>
                        <form:input class="form-control" type="text" id="qualifications" path="qualifications" name="qualifications"/>
                    </div>
                    <div class="form-group">
                        <label for="coefficientsSalary" class="col-form-label">Hệ số lương</label>
                        <form:input class="form-control" type="text" id="coefficientsSalary" path="coefficientsSalary" name="coefficientsSalary"/>
                    </div>
                    <input type="submit"  id="submit" value="submit" style="display: none">
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
    function showModalEdit(magv, name, username, birthday, gender, address, phone, email, qualifications, coefficientsSalary) {
        document.getElementById("magv").value = magv;
        document.getElementById("magv_").value = magv;
        document.getElementById("name").value = name;
        document.getElementById("username").value = username;
        document.getElementById("birthday").value = birthday;
        document.getElementById("gender").value = gender;
        document.getElementById("address").value = address;
        document.getElementById("phone").value = phone;
        document.getElementById("email").value = email;
        document.getElementById("qualifications").value = qualifications;
        document.getElementById("coefficientsSalary").value = coefficientsSalary;
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