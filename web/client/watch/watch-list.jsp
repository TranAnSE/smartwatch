<%-- 
    Document   : watch-list
    Created on : Jul 14, 2024, 8:49:15 PM
    Author     : an
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="config.Helper" %>
<jsp:include page="../header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="shop_section layout_padding">
    <div class="container">
        <form class="input-group mb-5" action="watch-list" method="GET">
            <input type="hidden" name="action" value="search">
            <div class="input-group-prepend">
                <label class="input-group-text bg-primary text-white">Tìm kiếm</label>
            </div>
            <input class="form-control" type="text" name="search" value="${param.search}" placeholder="Nhấp để tìm kiếm...">
            <div class="input-group-append">
                <button class="btn btn-primary">
                    <i class="fa fa-search fa-fw"></i>
                </button>
            </div>
        </form>

        <div class="row">
            <c:forEach var="row" items="${watches}">
                <div class="col-md-3">
                    <div class="box">
                        <a href="#">
                            <div class="img-box">
                                <img src="${pageContext.request.contextPath}${row.thumbnail}" alt="${row.watchName}">
                            </div>
                            <h6>${row.watchName}</h6>
                            <h6>Giá: <span>${Helper.Currency(row.price)}</span></h6>
                        </a>
                        <div class="btn-box">
                            <a href="${pageContext.request.contextPath}/client/cart?action=add&id=${row.watchID}" class="btn1">Thêm vào giỏ</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
