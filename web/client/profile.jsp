<%-- 
    Document   : profile
    Created on : Jul 16, 2024, 2:45:03 AM
    Author     : an
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<div class="container">
    <h2>Hồ sơ cá nhân</h2>
    <form action="${pageContext.request.contextPath}/client/profile" method="POST">
        <div class="form-group">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" class="form-control" id="username" name="username" value="${sessionScope.username}" readonly>
        </div>
        <div class="form-group">
            <label for="fullname">Họ tên:</label>
            <input type="text" class="form-control" id="fullname" name="fullname" value="${sessionScope.fullname}">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" value="${sessionScope.email}">
        </div>
        <div class="form-group">
            <label for="phone">Số điện thoại:</label>
            <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.phone}">
        </div>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
</div>

<jsp:include page="footer.jsp" />

