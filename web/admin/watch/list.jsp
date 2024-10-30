<%-- 
    Document   : list
    Created on : Jul 16, 2024, 8:52:20 AM
    Author     : an
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="config.Helper" %>
<jsp:include page="/admin/header.jsp"></jsp:include>

    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Watches</li>
            </ol>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <a href="${pageContext.request.contextPath}/admin/list-watches?action=add" class="btn btn-primary"><i class="fas fa-plus"></i> Add Watch</a>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr class="bg-success">
                            <th>Watch ID</th>
                            <th>Watch Name</th>
                            <th>Thumbnail</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Trademark</th>
                            <th>Category</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="watch" items="${watches}">
                            <tr>
                                <td>${watch.watchID}</td>
                                <td>${watch.watchName}</td>
                                <td><a href="${pageContext.request.contextPath}${watch.thumbnail}" target="_blank"><img height="50" src="${pageContext.request.contextPath}${watch.thumbnail}" alt="" /></a></td>
                                <td>${watch.description}</td>
                                <td>${Helper.Currency(watch.price)}</td>
                                <td>${watch.trademark}</td>
                                <td>${watch.categoryID}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/list-watches?action=edit&id=${watch.watchID}" class="btn btn-warning"><i class="fas fa-marker"></i></a>
                                    <a href="${pageContext.request.contextPath}/admin/list-watches?action=delete&id=${watch.watchID}" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/admin/footer.jsp"></jsp:include>
