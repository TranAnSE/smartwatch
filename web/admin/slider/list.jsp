<%-- 
    Document   : list
    Created on : Jul 15, 2024, 8:08:59 PM
    Author     : an
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"></jsp:include>

<section class="content-header">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/admin/"><i class="fas fa-home"></i></a></li>
            <li class="breadcrumb-item active">Slider</li>
        </ol>
    </div>
</section>

<section class="content">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title"><a href="${pageContext.request.contextPath}/admin/slider?action=add" class="btn btn-primary">Add New</a></h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr class="bg-success">
                            <th>Name</th>
                            <th>Description</th>
                            <th>Thumbnail</th>
                            <th>Status</th>
                            <th width="200">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="slider" items="${sliders}">
                            <tr>
                                <td>${slider.sliderName}</td>
                                <td>${slider.description}</td>
                                <td><img src="${pageContext.request.contextPath}${slider.thumbnail}" alt="${slider.sliderName}" style="width: 100px;"></td>
                                <td>${slider.status == 1 ? "Active" : "Inactive"}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/slider?action=edit&id=${slider.sliderID}" class="btn btn-primary"><i class="fas fa-edit"></i></a>
                                    <a href="${pageContext.request.contextPath}/admin/slider?action=delete&id=${slider.sliderID}" class="btn btn-danger"><i class="fas fa-trash"></i></a>
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
