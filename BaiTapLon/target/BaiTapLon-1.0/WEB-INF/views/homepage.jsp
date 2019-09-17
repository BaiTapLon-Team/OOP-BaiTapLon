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
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Home</title>
</head>
<body>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<header>
    <div class="collapse bg-info text-dark" id="navbarHeader">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-md-7 py-4">
                    <h4 class="text-dark">About</h4>
                    <p class="text-white">Nhóm 11 gồm các thành viên<br> - Phạm Duy Phúc<br> - Nguyễn Trọng Chung<br> -
                        Vũ Thị Ánh Tuyết<br> - Trần Văn Hải</p>
                </div>
                <div class="col-sm-4 offset-md-1 py-4">
                    <h4 class="text-dark">Contact</h4>
                    <ul class="list-unstyled">
                        <li><a href="https://join.skype.com/SbxrBmvcFtcw" class="text-white">Join in Skype</a></li>
                        <li><a href="https://www.facebook.com/duyphucit96" class="text-white">Follow on Facebook</a></li>
                        <li><a href="#" class="text-white">Email me</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="navbar navbar-dark bg-info box-shadow">
        <div class="container d-flex justify-content-between">
            <a href="#" class="navbar-brand d-flex align-items-center">
                <!--<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"-->
                <!--stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mr-2">-->
                <!--<path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>-->
                <!--<circle cx="12" cy="13" r="4"></circle>-->
                <!--</svg>-->
                <strong class="text-dark">Hệ Thống Giáo Dục Trực Tuyến</strong>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader"
                    aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon "></span>
            </button>
        </div>
    </div>
</header>

<main role="main">

    <section class="jumbotron text-center"
             style="background-image: url('https://31lz132jjnab134mc12u4xg5-wpengine.netdna-ssl.com/wp-content/uploads/2019/02/education-1170x240.jpg');background-size: 100%;">
        <div class="container">
            <h1 class="jumbotron-heading"> </h1>
            <p class="lead text-white"> <br>  <br>  <br>  <br>  <br> <br></p>
            <!--<p>-->
            <!--<a href="#" class="btn btn-primary my-2"> <br></a>-->
            <!--<a href="#" class="btn btn-secondary my-2"> <br></a>-->
            <!--</p>-->
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">

            <div class="row">

                <div class="col-md-4">
                    <a href="<c:url value="/student-login"/>">
                        <div class="card mb-4 box-shadow">
                            <img class="card-img-top"
                                 data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail"
                                 src="https://img.lovepik.com/element/40135/9981.png_860.png"
                                 alt="Card image cap">
                            <div class="card-body">
                                <p class="card-text text-info">Sinh Viên</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="<c:url value="/teacher-login"/>">
                        <div class="card mb-4 box-shadow">
                            <img class="card-img-top"
                                 data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail"
                                 src="https://i.imgur.com/P6ePvaj.png"
                                 alt="Card image cap">
                            <div class="card-body">
                                <p class="card-text text-info">Giáo Viên</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="<c:url value="/admin-login"/>">
                        <div class="card mb-4 box-shadow">
                            <img class="card-img-top"
                                 data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail"
                                 src="https://i.imgur.com/Sf3XaCO.png"
                                 alt="Card image cap">
                            <div class="card-body">
                                <p class="card-text text-info">Quản Trị Viên</p>
                            </div>
                        </div>
                    </a>
                </div>
                <!--<div class="col-md-4">-->
                <!--<div class="card mb-4 box-shadow">-->
                <!--<img class="card-img-top"-->
                <!--data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail"-->
                <!--alt="Card image cap">-->
                <!--<div class="card-body">-->
                <!--<p class="card-text">This is a wider card with supporting text below as a natural lead-in to-->
                <!--additional content. This content is a little bit longer.</p>-->
                <!--<div class="d-flex justify-content-between align-items-center">-->
                <!--<div class="btn-group">-->
                <!--<button type="button" class="btn btn-sm btn-outline-secondary">View</button>-->
                <!--<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>-->
                <!--</div>-->
                <!--<small class="text-muted">9 mins</small>-->
                <!--</div>-->
                <!--</div>-->
                <!--</div>-->
                <!--</div>-->
            </div>
        </div>
    </div>

</main>

<footer class="text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#">Back to top</a>
        </p>
        <p>@ This interface is made by Bootstrap 4</p>
        <!--<p>New to Bootstrap? <a href="../../">Visit the homepage</a> or read our <a href="../../getting-started/">getting-->
        <!--started guide</a>.</p>-->
    </div>
</footer>
</body>
</html>