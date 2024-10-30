<%-- 
    Document   : index.jsp
    Created on : Jun 18, 2024, 3:48:35 AM
    Author     : an
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="config.Helper" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<!-- Slider section -->
<section class="slider_section">
    <div id="sliderCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <c:forEach var="slider" items="${sliders}">
                <div class="carousel-item ${slider eq sliders[0] ? 'active' : ''}">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="detail-box">
                                    <h1>${slider.sliderName}</h1>
                                    <p>${slider.description}</p>
                                    <div class="btn-box">
                                        <a href="#" class="btn1">Mua ngay</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="img-box">
                                    <img src="${pageContext.request.contextPath}${slider.thumbnail}" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <a class="carousel-control-prev" href="#sliderCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#sliderCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</section>
<!-- end slider section -->

<!-- Shop section -->
<section class="shop_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
            <h2>Đồng hồ mới nhất</h2>
        </div>
        <div class="row">
            <c:forEach var="watch" items="${watches}">
                <div class="col-md-3">
                    <div class="box">
                        <a href="#">
                            <div class="img-box">
                                <img src="${pageContext.request.contextPath}${watch.thumbnail}" alt="${watch.watchName}">
                            </div>
                            <h6>${watch.watchName}</h6>
                            <h6>Giá: <span>${Helper.Currency(watch.price)}</span></h6>
                            <div class="new"><span>Mới</span></div>
                        </a>
                        <div class="btn-box">
                            <a href="cart?action=add&id=${watch.watchID}" class="btn1">Thêm vào giỏ</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- end shop section -->

<jsp:include page="footer.jsp" />
