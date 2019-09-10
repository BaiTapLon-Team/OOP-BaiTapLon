<%--
  Created by IntelliJ IDEA.
  User: Duy Phuc
  Date: 9/2/2019
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trang chủ</title>
</head>
<body>
<a href="<c:url value="/student-login"/>">Student</a>
<a href="<c:url value="/teacher-login"/>">Teacher</a>
<a href="<c:url value="/admin-login"/>">Admin</a>
</body>
</html>