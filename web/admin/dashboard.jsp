<%-- 
    Document   : dashboard
    Created on : Jul 15, 2024, 8:26:43 PM
    Author     : an
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<section class="content-header">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-home"></i></a></li>
            <li class="breadcrumb-item active">Thống kê</li>
        </ol>
    </div>
</section>

<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-6">
                <div class="small-box bg-info">
                    <div class="inner">
                        <h3>${categoryCount}</h3>
                        <p>Danh mục</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-th"></i>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/category" class="small-box-footer">Xem chi tiết <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-3 col-6">
                <div class="small-box bg-success">
                    <div class="inner">
                        <h3>${watchCount}</h3>
                        <p>Đồng hồ</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/list-watches" class="small-box-footer">Xem chi tiết <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-3 col-6">
                <div class="small-box bg-warning">
                    <div class="inner">
                        <h3>${orderCount}</h3>
                        <p>Đơn hàng</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-boxes"></i>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/list-orders" class="small-box-footer">Xem chi tiết <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-3 col-6">
                <div class="small-box bg-danger">
                    <div class="inner">
                        <h3>${sliderCount}</h3>
                        <p>Slider</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-images"></i>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/slider" class="small-box-footer">Xem chi tiết <i class="fas fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-info">
                        <h5 class="mb-0">Số lượng đồng hồ theo từng danh mục</h5>
                    </div>
                    <div class="card-body">
                        <canvas id="canvas1"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-info">
                        <h5 class="mb-0">Số lượng đơn hàng theo từng tháng</h5>
                    </div>
                    <div class="card-body">
                        <canvas id="canvas2"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-info">
                        <h5 class="mb-0">Tổng doanh thu theo từng tháng</h5>
                    </div>
                    <div class="card-body">
                        <canvas id="canvas3"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Chart 1: Số lượng đồng hồ theo từng danh mục
        const ctx1 = document.getElementById('canvas1').getContext('2d');
        const categoryLabels = [];
        const categoryData = [];
        <c:forEach var="category" items="${categoryWatchCounts}">
            categoryLabels.push("${category.categoryName}");
            categoryData.push(${category.count});
        </c:forEach>
        new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: categoryLabels,
                datasets: [{
                    label: 'Số lượng đồng hồ',
                    data: categoryData,
                    backgroundColor: 'rgba(54, 162, 235, 0.6)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            }
        });

        // Chart 2: Số lượng đơn hàng theo từng tháng
        const ctx2 = document.getElementById('canvas2').getContext('2d');
        const orderLabels = [];
        const orderData = [];
        <c:forEach var="order" items="${orderCountsByMonth}">
            orderLabels.push("${order.monthName}");
            orderData.push(${order.count});
        </c:forEach>
        new Chart(ctx2, {
            type: 'line',
            data: {
                labels: orderLabels,
                datasets: [{
                    label: 'Số lượng đơn hàng',
                    data: orderData,
                    backgroundColor: 'rgba(75, 192, 192, 0.6)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            }
        });

        // Chart 3: Tổng doanh thu theo từng tháng
        const ctx3 = document.getElementById('canvas3').getContext('2d');
        const revenueLabels = [];
        const revenueData = [];
        <c:forEach var="revenue" items="${revenuesByMonth}">
            revenueLabels.push("${revenue.monthName}");
            revenueData.push(${revenue.money});
        </c:forEach>
        new Chart(ctx3, {
            type: 'line',
            data: {
                labels: revenueLabels,
                datasets: [{
                    label: 'Tổng doanh thu',
                    data: revenueData,
                    backgroundColor: 'rgba(255, 206, 86, 0.6)',
                    borderColor: 'rgba(255, 206, 86, 1)',
                    borderWidth: 1
                }]
            }
        });
    });
</script>
