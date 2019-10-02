<%--
  Created by IntelliJ IDEA.
  User: Duy Phuc
  Date: 9/11/2019
  Time: 10:37 AM
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

    <title>Quản lý câu hỏi</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/style2.css"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/css/list-question.css"/> ">
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
                <li>
                    <a href="<c:url value="/manage-student"/>">Quản lý sinh viên</a>
                </li>
                <li>
                    <a href="<c:url value="/manage-teacher"/>">Quản lý giáo viên</a>
                </li>
                <li class="active">
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
            <li >
                <a href="<c:url value="/manage-student"/>">Quản lý sinh viên</a>
            </li>
            <li class="active">
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
                <h1>Danh sách câu hỏi</h1>
                <button type="button" class="btn btn-primary" data-toggle="modal"
                        data-target=".bd-example-modal-lg">Thêm mới
                </button>
                <form class="form-inline" action="#" method="GET">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
            <c:if test="${ (questionList.size() - 1) >= 0 }">
                <c:forEach var="index" begin="0" end="${questionList.size() - 1}">
                    <!-- mỗi class question là 1 câu hỏi -->
                    <div class="question">
                        <input type="hidden" name="questionID${index}" value="${questionList[index].questionID}">
                        <div class="content-question">
                            <h2>Câu ${index+1}: ${questionList[index].content}?</h2>
                            <div style="display: flex">
                                <button type="button"
                                        onclick="ModalEditQuestion('${questionList[index].questionID}', '${questionList[index].content}', '${questionList[index].correct}','${questionList[index].anwserA}', '${questionList[index].anwserB}', '${questionList[index].anwserC}', '${questionList[index].anwserD}')"
                                        data-toggle="modal" data-target=".bd-editQuestion-modal-lg">Sửa
                                </button>
                                <a href="<c:url value="/teacher/list-question/delete?id=${questionList[index].questionID}"/>"
                                   onclick="confirm('Bạn thật sự muốn xóa câu này')">Xóa</a>
                            </div>
                        </div>
                        <h3>A. ${questionList[index].anwserA}</h3>
                        <h3>B. ${questionList[index].anwserB}</h3>
                        <h3>C. ${questionList[index].anwserC}</h3>
                        <h3>D. ${questionList[index].anwserD}</h3>
                    </div>
                </c:forEach>
            </c:if>
        </div>

    </div>
</div>
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm mới câu hỏi</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <c:url value="/teacher/list-question/add" var="url"/>
                <form:form action="${url}" method="POST" modelAttribute="question">
                    <div class="form-group">
                        <label for="content-qs" class="col-form-label">Nội dung câu hỏi</label>
                        <form:textarea class="form-control" name="content" id="content-qs" path="content"/>
                    </div>
                    <div class="form-group">
                        <label for="correct" class="col-form-label">Đáp án đúng</label>
                        <form:input class="form-control" type="text" name="correct" id="correct" path="correct"/>
                    </div>
                    <div class="form-group">
                        <label for="answer_a" class="col-form-label">Đáp án A</label>
                        <form:input class="form-control" type="text" name="answer_a" id="answer_a" path="anwserA"/>
                    </div>
                    <div class="form-group">
                        <label for="answer_b" class="col-form-label">Đáp án B</label>
                        <form:input class="form-control" type="text" name="answer_b" id="answer_b" path="anwserB"/>
                    </div>
                    <div class="form-group">
                        <label for="answer_c" class="col-form-label">Đáp án C</label>
                        <form:input class="form-control" type="text" name="answer_c" id="answer_c" path="anwserC"/>
                    </div>
                    <div class="form-group">
                        <label for="answer_d" class="col-form-label">Đáp án D</label>
                        <form:input class="form-control" type="text" name="answer_d" id="answer_d" path="anwserD"/>
                    </div>
                    <input type="submit" id="submit" value="submit" style="display: none">
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submit()">Thêm mới</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal chỉnh sửa câu hỏi -->
<div class="modal fade bd-editQuestion-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalLabeleditQuestion">Chỉnh sửa câu hỏi</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="<c:url value="/teacher/list-question/edit"/>" method="GET">
                    <input hidden id="questionID" type="hidden" name="questionID"/>
                    <div class="form-group">
                        <label for="content-qs_" class="col-form-label">Nội dung câu hỏi</label>
                        <textarea class="form-control" name="content" id="content-qs_"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="correct_" class="col-form-label">Đáp án đúng</label>
                        <input class="form-control" type="text" name="correct" id="correct_"/>
                    </div>
                    <div class="form-group">
                        <label for="answer_a_" class="col-form-label">Đáp án A</label>
                        <input class="form-control" type="text" name="answer_a" id="answer_a_"/>
                    </div>
                    <div class="form-group">
                        <label for="answer_b_" class="col-form-label">Đáp án B</label>
                        <input class="form-control" type="text" name="answer_b" id="answer_b_"/>
                    </div>
                    <div class="form-group">
                        <label for="answer_c_" class="col-form-label">Đáp án C</label>
                        <input class="form-control" type="text" name="answer_c" id="answer_c_"/>
                    </div>
                    <div class="form-group">
                        <label for="answer_d_" class="col-form-label">Đáp án D</label>
                        <input class="form-control" type="text" name="answer_d" id="answer_d_"/>
                    </div>
                    <input type="submit" id="submit1" value="submit" style="display: none">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submit1()">Chỉnh sửa</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var modalEdit = document.getElementsByClassName("modal")[0];

    function ModalEditQuestion(questionId, content, correct, answer_a, answer_b, answer_c, answer_d) {
        document.getElementById("questionID").value = questionId;
        document.getElementById("content-qs_").value = content;
        document.getElementById("correct_").value = correct;
        document.getElementById("answer_a_").value = answer_a;
        document.getElementById("answer_b_").value = answer_b;
        document.getElementById("answer_c_").value = answer_c;
        document.getElementById("answer_d_").value = answer_d;
    }

    var x = document.getElementById("submit");

    function submit() {
        x.click();
    }

    var y = document.getElementById("submit1");

    function submit1() {
        y.click();
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