<%-- 
    Document   : list
    Created on : Jul 15, 2024, 3:46:06 PM
    Author     : an
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"></jsp:include>

    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Danh mục</li>
            </ol>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <form action="category" method="post">
                        <input type="hidden" name="action" value="add">
                        <input type="text" name="name" placeholder="Enter category name">
                        <button type="submit" class="btn btn-primary">Add Category</button>
                    </form>
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Category ID</th>
                                <th>Category Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="category" items="${categories}">
                            <tr>
                                <td>${category.categoryID}</td>
                                <td>${category.categoryName}</td>
                                <td>
                                    <form action="category" method="post">
                                        <input type="hidden" name="action" value="edit">
                                        <input type="hidden" name="id" value="${category.categoryID}">
                                        <input type="text" name="name" value="${category.categoryName}">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </form>
                                    <form action="category" method="post">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${category.categoryID}">
                                        <button type="submit" class="btn btn-danger">Delete</button>
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
