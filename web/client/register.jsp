<%-- 
    Document   : register
    Created on : Jun 21, 2024, 3:17:24 AM
    Author     : an
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<jsp:directive.include file="/config.jsp"></jsp:directive.include>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Đăng ký</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/login/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/login/fonts/iconic/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/login/vendor/animate/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/login/vendor/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/login/vendor/animsition/css/animsition.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/login/vendor/select2/select2.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/login/vendor/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/login/css/util.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/template/login/css/main.css">
        <style>
            .tips {
                display: none;
                background-color: #f9f9f9;
                border: 1px solid #ccc;
                padding: 10px;
                position: absolute;
                z-index: 1;
                width: 300px;
                top: 100%;
                left: 0;
                margin-top: 5px;
                font-size: 12px;
                color: #333;
                border-radius: 4px;
                box-shadow: 0px 0px 5px rgba(0,0,0,0.1);
            }

            .input-container {
                position: relative;
                display: inline-block;
            }

            .input-container:hover .tips {
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100" style="background-image: url('${pageContext.request.contextPath}/template/login/images/bg-01.jpg');">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                    <form class="login100-form validate-form" action="register" method="POST">
                        <span class="login100-form-title p-b-49">Đăng ký</span>

                        <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
                        <% } %>

                        <% if (request.getAttribute("success") != null) { %>
                        <div class="alert alert-success">
                            <%= request.getAttribute("success") %>
                            <script>
                                setTimeout(function () {
                                    window.location.href = 'login.jsp';
                                }, 5000);
                            </script>
                        </div>
                        <% } %>

                        <div class="wrap-input100 validate-input m-b-23 input-container" data-validate="Tên đăng nhập không được trống">
                            <span class="label-input100">Tên đăng nhập</span>
                            <input class="input100" type="text" name="username" value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                            <div class="tips">Username must be between 5 and 20 characters.</div>
                        </div>

                        <div class="wrap-input100 validate-input m-b-23 input-container" data-validate="Mật khẩu không được trống">
                            <span class="label-input100">Mật khẩu</span>
                            <input class="input100" type="password" name="password1">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                            <div class="tips">Password should be at least 8 characters long.</div>
                        </div>

                        <div class="wrap-input100 validate-input m-b-23 input-container" data-validate="Mật khẩu không được trống">
                            <span class="label-input100">Nhập lại mật khẩu</span>
                            <input class="input100" type="password" name="password2">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                            <div class="tips">Please re-enter your password to confirm.</div>
                        </div>

                        <div class="wrap-input100 validate-input m-b-23 input-container">
                            <span class="label-input100">Họ tên</span>
                            <input class="input100" type="text" name="fullname" value="<%= request.getAttribute("fullname") != null ? request.getAttribute("fullname") : "" %>">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                            <div class="tips">Full name must be between 3 and 30 characters and contain at least 2 words.</div>
                        </div>

                        <div class="wrap-input100 validate-input m-b-23 input-container">
                            <span class="label-input100">Số điện thoại</span>
                            <input class="input100" type="text" name="phone" value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                            <div class="tips">Phone number must be 10 digits.</div>
                        </div>

                        <div class="wrap-input100 validate-input m-b-23 input-container">
                            <span class="label-input100">Email</span>
                            <input class="input100" type="text" name="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                            <div class="tips">Please enter a valid email address.</div>
                        </div>

                        <div class="container-login100-form-btn p-t-17">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn" name="submit">Đăng ký</button>
                            </div>
                        </div>

                        <div class="flex-col-c p-t-17">
                            <span class="txt1 p-b-17">Hoặc đăng nhập để sử dụng</span>
                            <a href="login.jsp" class="txt2">Đăng nhập ngay</a>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/template/login/vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/template/login/vendor/animsition/js/animsition.min.js"></script>
        <script src="${pageContext.request.contextPath}/template/login/vendor/bootstrap/js/popper.js"></script>
        <script src="${pageContext.request.contextPath}/template/login/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/template/login/vendor/select2/select2.min.js"></script>
        <script src="${pageContext.request.contextPath}/template/login/vendor/daterangepicker/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/template/login/vendor/daterangepicker/daterangepicker.js"></script>
        <script src="${pageContext.request.contextPath}/template/login/vendor/countdowntime/countdowntime.js"></script>
        <script src="${pageContext.request.contextPath}/template/login/js/main.js"></script>
    </body>
</html>
