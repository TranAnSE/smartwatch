<%-- 
    Document   : add
    Created on : Jul 16, 2024, 6:27:34 AM
    Author     : an
--%>

<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"></jsp:include>

    <section class="content-header">
        <div class="container-fluid">
            <h1>Thêm mới Slider</h1>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/admin/slider" method="post">
                    <input type="hidden" name="action" value="add">
                    <div class="form-group">
                        <label for="name">Tên Slider</label>
                        <input type="text" name="name" id="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Mô tả</label>
                        <textarea name="description" id="description" class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="thumbnail">Thumbnail</label>
                        <input type="text" name="thumbnail" id="thumbnail" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="status">Trạng thái</label>
                        <select name="status" id="status" class="form-control" required>
                            <option value="1">Đang hoạt động</option>
                            <option value="0">Tạm dừng</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Thêm mới</button>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../footer.jsp"></jsp:include>
