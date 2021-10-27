<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>오늘의 한복</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="resources/img/favicon.png" rel="icon">
  <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="resources/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="resources/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/css/style.css" rel="stylesheet">


<style>

.container {
    max-width: 1400px !important;
    }


li, dl {
    margin: 0;
    padding: 0;
    list-style: none;
}

.container .utility li {
    text-transform: uppercase;
    font-family: "ProximaNova-Regular","yg740";
    text-align: center;
    float: left;
}
.utility{
display: flex;
}
.utility a {
    width: 70px;
    height: 65px;
    padding: 12px 0;
    color: #000;
    display: block;
}
.icon-user-dark {
    background-image: url(resources/img/icon-user-dark.png);
}

.icon-sign-in-dark {
    background-image: url(resources/img/icon-sign-in-dark.png);
}
.icon-bag-dark {
    background-image: url(resources/img/icon-bag-dark.png);
}
.icon-list-dark {
    background-image: url(resources/img/icon-list-dark.png);
}
.icon-sign-out-dark {
    background-image: url(resources/img/icon-sign-out-dark.png);
}

.icon {
    display: inline-block;
    width: 25px;
    height: 25px;
    /* background: transparent no-repeat center; */
    vertical-align: top;
}
.container .utility strong {
    display: block;
    margin-top: 5px;
    font-size: 12px;
}
</style>
</head>

<body>


  <!-- ======= Header/Navbar ======= -->

  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault" aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      <a class="navbar-brand text-brand" href="mainhome"><img src="resources/img/logo.png" alt="" style="width:100%"/></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" href="mainhome">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="hb_list">Hanbok</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Community</a>
          </li>
        </ul>
      </div>
  <ul class="utility">
 				<C:if test="${empty sessionScope.logined_mem_id }">
                <li>
                    <a href="joinForm">
                        <span class="icon icon-user-dark"></span>
                        <strong>join</strong>
                    </a>
                </li>
                </C:if>
                <C:if test="${empty sessionScope.logined_mem_id }">
                <li>
                    <a href="loginForm">
                        <span class="icon icon-sign-in-dark"></span>
                        <strong>login</strong>
                    </a>
                </li>
                </C:if>
                <C:if test="${not empty sessionScope.logined_mem_id }">
                 <li>
                    <a href="logOutProc">
                        <span class="icon icon-sign-out-dark"></span>
                        <strong>logout</strong>
                    </a>
                </li>
                </C:if>
                <li>
                    <a href="basket">
                        <span class="icon icon-bag-dark"></span>
                        <strong id="basketCount">CART</strong>
                    </a>
                </li>
                <c:choose>
                <c:when test="${sessionScope.logined_mem_rank =='관리자'}">
                <li>
                    <a href="rentHistory_manager">
                        <span class="icon icon-list-dark"></span>
                        <strong>ORDER</strong>
                    </a>
                </li>
                </c:when>
                <c:otherwise>
                <li>
                    <a href="rentHistory">
                        <span class="icon icon-list-dark"></span>
                        <strong>ORDER</strong>
                    </a>
                </li>
                </c:otherwise>  
                </c:choose>  
        </ul>
  </div>
  </nav><!-- End Header/Navbar -->
 </body>
 </html>
 