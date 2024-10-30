<%-- 
    Document   : form
    Created on : Jul 15, 2024, 11:10:31 P
    Author     : an
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Category" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>${watch != null ? "Edit" : "Add"} Watch</title>
        <link rel="stylesheet" href="<c:url value='../../template/home/css/custom.css'/>">
    </head>
    <body>
        <h1>${watch != null ? "Edit" : "Add"} Watch</h1>
        <form action="<c:url value='${pageContext.request.contextPath}/admin/list-watches'/>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${watch != null ? watch.watchID : ''}">
            <input type="hidden" name="action" value="${watch != null ? 'edit' : 'add'}">
            <div>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${watch != null ? watch.watchName : ''}" required>
            </div>
            <div>
                <label for="description">Description:</label>
                <input type="text" id="description" name="description" value="${watch != null ? watch.description : ''}" required>
            </div>
            <div>
                <label for="thumbnail">Thumbnail:</label>
                <input type="file" id="thumbnail" name="thumbnail" ${watch == null ? 'required' : ''}>
            </div>
            <div>
                <label for="price">Price:</label>
                <input type="text" id="price" name="price" value="${watch != null ? watch.price : ''}" required>
            </div>
            <div>
                <label for="trademark">Trademark:</label>
                <input type="text" id="trademark" name="trademark" value="${watch != null ? watch.trademark : ''}" required>
            </div>
            <div>
                <label for="category">Category:</label>
                <select id="category" name="category" required>
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.categoryID}" ${watch != null && category.categoryID == watch.categoryID ? 'selected' : ''}>${category.categoryName}</option>
                    </c:forEach>
                </select>
            </div>
            <div>
                <button type="submit">Save</button>
            </div>
        </form>
    </body>
</html>
