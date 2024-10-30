<%-- 
    Document   : list
    Created on : Jul 15, 2024, 11:10:24 PM
    Author     : an
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Watch List</title>
        <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
    </head>
    <body>
        <h1>Watch List</h1>
        <a href="<c:url value='/admin/list-watches?action=add'/>">Add New Watch</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Thumbnail</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Trademark</th>
                    <th>Category</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="watch" items="${listWatch}">
                    <tr>
                        <td>${watch.watchID}</td>
                        <td>${watch.watchName}</td>
                        <td><img src="${watch.thumbnail}" alt="${watch.watchName}" height="50"/></td>
                        <td>${watch.description}</td>
                        <td>${watch.price}</td>
                        <td>${watch.trademark}</td>
                        <td>${watch.categoryID}</td>
                        <td>
                            <a href="<c:url value='/admin/list-watches?action=edit&id=${watch.watchID}'/>">Edit</a>
                            <a href="<c:url value='/admin/list-watches?action=delete&id=${watch.watchID}'/>">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
