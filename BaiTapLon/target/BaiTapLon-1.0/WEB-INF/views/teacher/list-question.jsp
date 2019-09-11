<%--
  Created by IntelliJ IDEA.
  User: Duy Phuc
  Date: 9/11/2019
  Time: 10:37 AM
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
    <link rel="stylesheet" href="<c:url value="/resources/css/admin.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/listQuestion.css" />">
</head>

<body>
<div class="wrapper">
    <div class="sidebar">
        <div class="logo"><a href="#">Sinh Viên</a></div>
        <div class="info"><i class="fal fa-user-circle"></i> Name student</div>
        <div class="nav">
            <a href="<c:url value="/teacher/info"/>">Thông tin</a>
            <a href="<c:url value="/manage-student"/>">Sinh viên</a>
            <a href="#">Câu hỏi</a>
            <a href="#">Bảng điểm</a>
        </div>
    </div>
    <div class="main">
        <div class="navbar">
            <span class="content-titel"><i class="fal fa-users"></i> Thông tin cá nhân</span>
            <a href="#" class="logout">Đăng xuất</a>
        </div>
        <div class="content">
            <div class="action">
                <h1>Danh sách câu hỏi</h1>

                <button onclick="showModal()" class="add-content">Thêm mới</button>
            </div>
            <form method="post" action="#">
                <c:forEach var="index" begin="0" end="${questionList.size() - 1}">
                    <!-- mỗi class question là 1 câu hỏi -->
                    <div class="question">
                        <input type="hidden" name="questionID${index}" value="${questionList[index].questionID}">
                        <div class="content-question">
                            <h2>Câu 1: Can I park here?</h2>
                            <button type="button" onclick="showModalEditQuestion()">Sửa</button>
                            <a href="#">Xóa</a>
                        </div>
                        <h3><input type="radio" checked="checked" name="${index}" id="${index}"
                                   value="${questionList[index].anwserA}"> Sorry, I did that.</h3>
                        <h3><input type="radio" name="${index}" id="${index}"
                                   value="${questionList[index].anwserB}"> It's the same place.</h3>
                        <h3><input type="radio" name="${index}" id="${index}"
                                   value="${questionList[index].anwserC}"> Only for half an hour.</h3>
                        <h3><input type="radio" name="${index}" id="${index}"
                                   value="${questionList[index].anwserD}"> Sorry, I did that.</h3>
                    </div>

                    <div class="question">
                        <input type="hidden" name="questionID${index}" value="${questionList[index].questionID}">
                        <div class="content-question">
                            <h2>Câu 2: Can I park here?</h2>
                            <button type="button" onclick="showModalEditQuestion()">Sửa</button>
                            <a href="#">Xóa</a>
                        </div>
                        <h3><input type="radio" checked="checked" name="${index}" id="${index}"
                                   value="${questionList[index].anwserA}"> Sorry, I did that.</h3>
                        <h3><input type="radio" name="${index}" id="${index}"
                                   value="${questionList[index].anwserB}"> It's the same place.</h3>
                        <h3><input type="radio" name="${index}" id="${index}"
                                   value="${questionList[index].anwserC}"> Only for half an hour.</h3>
                        <h3><input type="radio" name="${index}" id="${index}"
                                   value="${questionList[index].anwserD}"> Sorry, I did that.</h3>
                    </div>
                </c:forEach>
            </form>

        </div>
        <div class="footer">© 2019 codesieungu, made with love for a better web</div>
    </div>
</div>


<!-- class modal này là form thêm mới câu hỏi chỉnh sửa action để thêm -->
<div class="modal">
    <div class="modal-dialog">
        <h1>Thêm câu hỏi</h1>
        <form action="#" method="GET">
            <label for="_content">Nội dung câu hỏi</label>
            <textarea name="content" id="_content"></textarea>
            <label for="_correct">Đáp án đúng</label>
            <input type="text" name="correct" id="_correct">
            <label for="_answer_a">Đáp án A</label>
            <input type="text" name="answer_a" id="_answer_a">
            <label for="_answer_b">Đáp án B</label>
            <input type="text" name="answer_b" id="_answer_b">
            <label for="_answer_c">Đáp án C</label>
            <input type="text" name="answer_c" id="_answer_c">
            <label for="_answer_d">Đáp án D</label>
            <input type="text" name="answer_d" id="_answer_d">
            <div class="btn">
                <input type="submit" value="Thêm mới">
                <button class="hide" onclick="hideModal()" type="button">Đóng</button>
            </div>
        </form>
    </div>
</div>

<div class="modal-edit-question">
    <div class="modal-dialog">
        <h1>Chỉnh sửa câu hỏi</h1>
        <form action="#" method="GET">
            <label for="content">Nội dung câu hỏi</label>
            <textarea name="content" id="content"></textarea>
            <label for="correct">Đáp án đúng</label>
            <input type="text" name="correct" id="correct">
            <label for="answer_a">Đáp án A</label>
            <input type="text" name="answer_a" id="answer_a">
            <label for="answer_b">Đáp án B</label>
            <input type="text" name="answer_b" id="answer_b">
            <label for="answer_c">Đáp án C</label>
            <input type="text" name="answer_c" id="answer_c">
            <label for="answer_d">Đáp án D</label>
            <input type="text" name="answer_d" id="answer_d">
            <div class="btn">
                <input type="submit" value="Chỉnh sửa">
                <button class="hide" onclick=" hideModalEditQuestion()" type="button">Đóng</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    var modal = document.getElementsByClassName("modal")[0];
    function showModal() {
        modal.style.top = "0px";
    }
    function hideModal() {
        modal.style.top = "-3000px";
    }

    var modalEdit = document.getElementsByClassName("modal-edit-question")[0];
    function showModalEditQuestion(test1, test2) {
        modalEdit.style.top = "0px";

    }
    function hideModalEditQuestion() {
        modalEdit.style.top = "-3000px";
    }
</script>
</body>

</html>