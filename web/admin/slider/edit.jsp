<%-- 
    Document   : edit
    Created on : Jul 16, 2024, 6:27:44 AM
    Author     : an
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"></jsp:include>

    <section class="content-header">
        <div class="container-fluid">
            <h1>Edit Slider</h1>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/admin/slider" method="post">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="id" value="${slider.sliderID}">
                    <div class="form-group">
                        <label for="name">Slider Name</label>
                        <input type="text" name="name" id="name" class="form-control" value="${slider.sliderName}" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea name="description" id="description" class="form-control" required>${slider.description}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="thumbnail">Thumbnail</label>
                        <input type="text" name="thumbnail" id="thumbnail" class="form-control" value="${slider.thumbnail}" required>
                    </div>
                    <div class="form-group">
                        <label for="status">Status</label>
                        <select name="status" id="status" class="form-control" required>
                            <option value="1" <c:if test="${slider.status == 1}">selected</c:if>>Active</option>
                            <option value="0" <c:if test="${slider.status == 0}">selected</c:if>>Inactive</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

<jsp:include page="../footer.jsp"></jsp:include>
