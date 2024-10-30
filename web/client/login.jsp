<%-- 
    Document   : login
    Created on : Jun 21, 2024, 3:17:16 AM
    Author     : an
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Đăng nhập</title>
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
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100" style="background-image: url('${pageContext.request.contextPath}/template/login/images/bg-01.jpg');">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                    <form class="login100-form validate-form" action="login" method="POST">
                        <span class="login100-form-title p-b-49">Đăng nhập</span>
                        <!-- Display error message if it exists -->

                        <% if (request.getAttribute("error") != null) { %>

                        <div class="alert alert-danger"><%= request.getAttribute("error") %></div>

                        <% } %>


                        <div class="wrap-input100 validate-input m-b-23" data-validate="Tên đăng nhập không được trống">
                            <span class="label-input100">Tên đăng nhập</span>
                            <input class="input100" type="text" name="username" placeholder="username">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Mật khẩu không được trống">
                            <span class="label-input100">Mật khẩu</span>
                            <input class="input100" type="password" name="password" placeholder="password">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>
                        <div class="container-login100-form-btn p-t-17">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn" name="submit">Đăng nhập</button>
                            </div>
                        </div>
                        <div class="flex-col-c p-t-17">
                            <span class="txt1 p-b-17">Hoặc đăng ký để sử dụng</span>
                            <a href="register.jsp" class="txt2">Đăng ký</a>
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
