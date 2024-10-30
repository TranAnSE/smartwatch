<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Watch Store</title>
        <link rel="icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/home/css/bootstrap.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/home/css/font-awesome.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/home/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/home/css/responsive.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
    </head>
    <body>
        <div class="hero_area">
            <div class="hero_social">
                <a href="">
                    <i class="fa fa-facebook" aria-hidden="true"></i>
                </a>
                <a href="">
                    <i class="fa fa-twitter" aria-hidden="true"></i>
                </a>
                <a href="">
                    <i class="fa fa-linkedin" aria-hidden="true"></i>
                </a>
                <a href="">
                    <i class="fa fa-instagram" aria-hidden="true"></i>
                </a>
            </div>

            <!-- header section strats -->
            <header class="header_section border-bottom">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/client/home">
                            <span>Smart Watch Store</span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/client/home">Trang chủ</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/client/watch-list">Đồng hồ</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/client/category">Danh mục</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/client/list-orders">Đơn hàng</a>
                                </li>
                            </ul>
                            <div class="user_option-box">
                                <% if (request.getSession().getAttribute("role") != null && request.getSession().getAttribute("role").equals(1)) { %>
                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <span>Quản trị</span>
                                </a>
                                <% } %>
                                <% if (request.getSession().getAttribute("username") != null) { %>
                                <div class="dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <span><%= request.getSession().getAttribute("fullname") %></span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/client/profile">Hồ sơ</a>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/client/logout">Đăng xuất</a>
                                    </div>
                                </div>
                                <a href="${pageContext.request.contextPath}/client/cart">
                                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                </a>
                                <% } else { %>
                                <a href="${pageContext.request.contextPath}/client/login">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <span>Đăng nhập</span>
                                </a>
                                <% } %>
                                <a href="${pageContext.request.contextPath}/client/watch-list">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </a>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
            <!-- end header section -->
