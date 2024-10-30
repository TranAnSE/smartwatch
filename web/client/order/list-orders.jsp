<%-- 
    Document   : list
    Created on : Jul 14, 2024, 8:48:46 PM
    Author     : an
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="config.Helper" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp"></jsp:include>
    <section class="container layout_padding">
        <div class="heading_container heading_center">
            <h2>Đơn hàng của tôi</h2>
        </div>
        <table class="table mt-5">
            <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Tổng số tiền</th>
                    <th>Trạng thái</th>
                    <th>Ngày đặt</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.orderID}</td>
                    <td>${Helper.Currency(order.totalMoney)}</td>
                    <td><c:out value="${order.payment == 1 ? 'Đã thanh toán' : 'Chưa thanh toán'}"/></td>
                    <td>${Helper.Date(order.createAt)}</td>
                    <td><a href="${pageContext.request.contextPath}/client/order-details?id=${order.orderID}" class="btn btn-primary btn-sm">Xem chi tiết</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
