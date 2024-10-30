<%-- 
    Document   : list
    Created on : Jul 15, 2024, 3:46:06 PM
    Author     : an
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"></jsp:include>

    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Tài khoản</li>
            </ol>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Username</th>
                                <th>Full Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Status</th>
                                <th>Role</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.username}</td>
                                <td>${user.fullName}</td>
                                <td>${user.phone}</td>
                                <td>${user.email}</td>
                                <td>${user.status}</td>
                                <td>${user.role}</td>
                                <td>
                                    <form action="account" method="post">
                                        <input type="hidden" name="action" value="edit">
                                        <input type="hidden" name="username" value="${user.username}">
                                        <select name="status">
                                            <option value="1" ${user.status == 1 ? 'selected' : ''}>Active</option>
                                            <option value="0" ${user.status == 0 ? 'selected' : ''}>Inactive</option>
                                        </select>
                                        <select name="role">
                                            <option value="1" ${user.role == 1 ? 'selected' : ''}>Admin</option>
                                            <option value="2" ${user.role == 2 ? 'selected' : ''}>User</option>
                                        </select>
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../footer.jsp"></jsp:include>
