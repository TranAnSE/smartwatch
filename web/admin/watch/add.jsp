<%-- 
    Document   : add
    Created on : Jul 16, 2024, 6:36:02 AM
    Author     : an
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/admin/header.jsp"></jsp:include>

    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Add Watch</li>
            </ol>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <form method="POST" action="${pageContext.request.contextPath}/admin/list-watches">
                    <div class="form-group">
                        <label>Watch Name</label>
                        <input type="text" class="form-control" name="watchName" required>
                    </div>
                    <div class="form-group">
                        <label>Thumbnail (URL)</label>
                        <input type="text" class="form-control" name="thumbnail" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <input type="text" class="form-control" name="description" required>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input type="number" class="form-control" name="price" required>
                    </div>
                    <div class="form-group">
                        <label>Trademark</label>
                        <input type="text" class="form-control" name="trademark" required>
                    </div>
                    <div class="form-group">
                        <label>Category ID</label>
                        <input type="number" class="form-control" name="categoryID" required>
                    </div>
                    <input type="hidden" name="action" value="add">
                    <button type="submit" class="btn btn-primary">Add Watch</button>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/admin/footer.jsp"></jsp:include>

