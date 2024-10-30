<%-- 
    Document   : list
    Created on : Jul 15, 2024, 7:18:35 PM
    Author     : an
--%>

<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>
<%@page import="config.Helper" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"></jsp:include>

    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item active">Đơn hàng</li>
            </ol>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="bg-success">
                                <th>Mã đơn hàng</th>
                                <th>Tài khoản</th>
                                <th>Tổng đơn hàng</th>
                                <th>Ngày mua</th>
                                <th>Trạng thái</th>
                                <th width="163">Công cụ</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var = "order" items = "${orders}">
                            <tr>
                                <td>${order.orderID}</td>
                                <td>${order.username}</td>
                                <td>${Helper.Currency(order.totalMoney)}</td>
                                <td>${Helper.Date(order.createAt)}</td>
                                <td>${Helper.Span(order.payment == 1, "Đã thanh toán", "Chưa thanh toán")}</td>
                                <td>
                                    <c:if test="${order.payment == 0}">
                                        <a href="${pageContext.request.contextPath}/admin/list-orders?action=payment&id=${order.orderID}" class="btn btn-primary"><i class="fas fa-money-check-alt"></i></a>
                                        </c:if>
                                    <a onclick="removeRow('${order.orderID}')" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                                    <a href="${pageContext.request.contextPath}/client/order-details?id=${order.orderID}" class="btn btn-info"><i class="fas fa-eye"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<script>
    function removeRow(id) {
        if (confirm('Are you sure you want to delete this order?')) {
            window.location.href = '/admin/order?action=delete&id=' + id;
        }
    }
</script>
<jsp:include page="../footer.jsp"></jsp:include>
