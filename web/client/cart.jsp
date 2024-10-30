<%-- 
    Document   : cart
    Created on : Jul 15, 2024, 1:53:39 AM
    Author     : an
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="config.Helper" %>
<jsp:include page="header.jsp" />

<section class="container layout_padding">
    <div class="heading_container heading_center">
        <h2>Giỏ hàng của tôi</h2>
    </div>

    <table class="table mt-5">
        <thead>
            <tr>
                <th>STT</th>
                <th>Tên đồng hồ</th>
                <th>Hình ảnh</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
                <th>Xoá</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cart" items="${carts}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${cart.watch.watchName}</td>
                    <td><a href="${pageContext.request.contextPath}${cart.watch.thumbnail}" target="_blank"><img height="50" src="${pageContext.request.contextPath}${cart.watch.thumbnail}" alt="${cart.watch.watchName}" /></a></td>
                    <td>${Helper.Currency(cart.watch.price)}</td>
                    <td>
                        <form action="cart" method="GET">
                            <div class="input-group input-group-sm">
                                <input name="action" type="hidden" value="update" />
                                <input name="id" type="hidden" value="${cart.cartID}" />
                                <input min="1" style="width: 20px;" type="number" class="form-control" value="${cart.quantity}" name="quantity">
                                <div class="input-group-append">
                                    <button class="btn btn-primary"><i class="fa fa-save"></i></button>
                                </div>
                            </div>
                        </form>
                    </td>
                    <td>${Helper.Currency(cart.watch.price * cart.quantity)}</td>
                    <td><a href="cart?action=delete&id=${cart.cartID}">Xoá</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:if test="${not empty carts}">
        <div class="shop_section">
            <div class="btn-box">
                <a href="create-order" class="btn1">Tạo đơn hàng</a>
            </div>
        </div>
    </c:if>
</section>

<jsp:include page="footer.jsp" />