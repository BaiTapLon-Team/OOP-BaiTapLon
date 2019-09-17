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
        <div class="logo"><a href="#">Giáo Viên</a></div>
        <div class="info"><i class="fal fa-user-circle"></i> ${teacher.name} </div>
        <div class="nav">
            <a href="<c:url value="/teacher/info"/>">Thông tin</a>
            <a href="<c:url value="/manage-student"/>">Sinh viên</a>
            <a href="#">Câu hỏi</a>
            <a href="<c:url value="/teacher/scores-table"/>">Bảng điểm</a>
        </div>
    </div>
    <div class="main">
        <div class="navbar">
            <span class="content-titel"><i class="fal fa-users"></i> Danh sách câu hỏi </span>
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
                            <h2>Câu ${index+1}: ${questionList[index].content}?</h2>
                            <button type="button" onclick="showModalEditQuestion('${questionList[index].questionID}', '${questionList[index].content}', '${questionList[index].correct}','${questionList[index].anwserA}', '${questionList[index].anwserB}', '${questionList[index].anwserC}', '${questionList[index].anwserD}')">Sửa</button>
                            <a href='<c:url value="/teacher/list-question/delete?id=${questionList[index].questionID}"/>' onclick="confirm('Bạn thật sự muốn xóa câu này')">Xóa</a>
                        </div>
                        <h3><input type="radio" checked="checked" name="${index}" id="${index}"
                                   value="${questionList[index].anwserA}"> ${questionList[index].anwserA} </h3>
                        <h3><input type="radio" name="${index}" id="${index}"
                                   value="${questionList[index].anwserB}"> ${questionList[index].anwserB} </h3>
                        <h3><input type="radio" name="${index}" id="${index}"
                                   value="${questionList[index].anwserC}"> ${questionList[index].anwserC} </h3>
                        <h3><input type="radio" name="${index}" id="${index}"
                                   value="${questionList[index].anwserD}"> ${questionList[index].anwserD} </h3>
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
        <c:url value="/teacher/list-question/add" var="url"></c:url>
        <form:form action="${url}" method="POST" modelAttribute="question">
            <label for="content">Nội dung câu hỏi</label>
            <form:textarea name="content" id="content" path="content"/>
            <label for="correct">Đáp án đúng</label>
            <form:input type="text" name="correct" id="correct" path="correct"/>
            <label for="answer_a">Đáp án A</label>
            <form:input type="text" name="answer_a" id="answer_a" path="anwserA"/>
            <label for="answer_b">Đáp án B</label>
            <form:input type="text" name="answer_b" id="answer_b" path="anwserB"/>
            <label for="answer_c">Đáp án C</label>
            <form:input type="text" name="answer_c" id="answer_c" path="anwserC"/>
            <label for="answer_d">Đáp án D</label>
            <form:input type="text" name="answer_d" id="answer_d" path="anwserD"/>
            <div class="btn">
                <input type="submit" value="Thêm">
                <button class="hide" onclick="hideModal()" type="button">Đóng</button>
            </div>
        </form:form>
    </div>
</div>


<div class="modal-edit-question">
    <div class="modal-dialog">
        <h1>Chỉnh sửa câu hỏi</h1>
        <form action="<c:url value="/teacher/list-question/edit"/>" method="GET">
            <input hidden id="questionID" type="hidden" name="questionID"/>
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
                <input type="submit" value="Cập nhật" onclick="confirm('Bạn có chắc cập nhật này !')">
                <button class="hide" onclick="hideModalEditQuestion()" type="button">Đóng</button>
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
    function showModalEditQuestion(questionId, content, correct, answer_a, answer_b, answer_c, answer_d) {
        modalEdit.style.top = "0px";
        document.getElementById("questionID").value = questionId;
        document.getElementById("_content").value = content;
        document.getElementById("_correct").value = correct;
        document.getElementById("_answer_a").value = answer_a;
        document.getElementById("_answer_b").value = answer_b;
        document.getElementById("_answer_c").value = answer_c;
        document.getElementById("_answer_d").value = answer_d;
    }
    function hideModalEditQuestion() {
        modalEdit.style.top = "-3000px";
    }
</script>
</body>

</html>