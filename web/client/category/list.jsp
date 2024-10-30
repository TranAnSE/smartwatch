<%-- 
    Document   : list
    Created on : Jul 14, 2024, 8:48:28 PM
    Author     : an
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <section class="shop_section layout_padding">
        <div class="container">
            <div class="row">
                <c:forEach var="row" items="${categories}">
                <div class="col-md-3">
                    <div class="box bg-yellow">
                        <a href="${pageContext.request.contextPath}/client/watch-list?action=category&id=${row.categoryID}">
                            <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/category-watch.jpg" />
                            <div class="text-center py-2"><b>${row.categoryName}</b></div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>

