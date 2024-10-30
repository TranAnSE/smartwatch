<%-- 
    Document   : order-details
    Created on : Jul 14, 2024, 8:49:03 PM
    Author     : an
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="config.Helper" %>
<jsp:include page="../header.jsp"></jsp:include>
    <section class="container layout_padding">
        <h2 class="text-center text-primary">HOÁ ĐƠN - ${order.orderID}</h2>
    <br>
    <h4 class="text-primary"><b>I. THÔNG TIN CÁ NHÂN</b></h4>
    <p><b>Họ tên: </b>${user.fullName}</p>
    <p><b>Số điện thoại: </b>${user.phone}</p>
    <p><b>Email: </b>${user.email}</p>
    <br>
    <h4 class="text-primary"><b>II. CHI TIẾT ĐƠN HÀNG</b></h4>
    <table class="table table-bordered">
        <thead>
            <tr class="bg-success">
                <th>STT</th>
                <th>Tên đồng hồ</th>
                <th>Hình ảnh</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="orderDetail" items="${orderDetails}">
                <tr>
                    <td>${orderDetail.orderDetailID}</td>
                    <td>${orderDetail.watch.watchName}</td>
                    <td><a href="${pageContext.request.contextPath}${orderDetail.watch.thumbnail}" target="_blank"><img height="50" src="${pageContext.request.contextPath}${orderDetail.watch.thumbnail}" alt=""/></a></td>
                    <td>${Helper.Currency(orderDetail.watch.price)}</td>
                    <td>${orderDetail.quantity}</td>
                    <td>${Helper.Currency(orderDetail.watch.price * orderDetail.quantity)}</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="5"><b>Tổng: </b></td>
                <td>${Helper.Currency(order.totalMoney)}</td>
            </tr>
        </tbody>
    </table>
    <h4 class="text-primary"><b>III. TRẠNG THÁI ĐƠN HÀNG: ${order.payment == 1 ? 'Đã thanh toán' : 'Chưa thanh toán'}</b></h4>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script>
    window.print();
</script>