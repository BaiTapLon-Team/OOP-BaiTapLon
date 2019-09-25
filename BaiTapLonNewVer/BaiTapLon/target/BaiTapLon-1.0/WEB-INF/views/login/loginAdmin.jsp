<%--
  Created by IntelliJ IDEA.
  User: Duy Phuc
  Date: 9/1/2019
  Time: 9:41 PM
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
    <title>Đăng nhập</title>
    <link rel="icon" type="image/png" href="<c:url value="/resources/image/favicon.ico" />">
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/login.css" />">
</head>

<body>
<div class="container">
    <div id="header">
        <div id="bgr">
            <span id="form-titel">SIGN IN</span>
        </div>

    </div>
    <c:url value="/admin-login" var="url"/>
    <form action="${url}" class="form-content" method="post" >
        <div id="username">
            <span>Username</span>
            <input type="text" name="username" placeholder="Your Username" autocomplete="off">
        </div>
        <div id="password">
            <span>Password</span>
            <input type="password" name="password" placeholder="Your Password">

        </div>
        <div id="save-pass">
            <div class="remp">
                <input type="checkbox">
                <span>Remember me</span>
            </div>
            <a href="#">Forgot Password?</a>
        </div>
        <input type="submit" name="submit" value="Login">
    </form>
    <div id="error">${ error }</div>
</div>
</body>
</html>