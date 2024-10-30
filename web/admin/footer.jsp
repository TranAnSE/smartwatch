<%-- 
    Document   : footer
    Created on : Jul 15, 2024, 3:12:37 PM
    Author     : an
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Watch Store</title>
        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/template/adminlte/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="${pageContext.request.contextPath}/template/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- bs-custom-file-input -->
        <script src="${pageContext.request.contextPath}/template/adminlte/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
        <!-- Sweet Alert 2 -->
        <script src="${pageContext.request.contextPath}/template/adminlte/plugins/sweetalert2/sweetalert2.all.min.js"></script>
        <!-- Select2 -->
        <script src="${pageContext.request.contextPath}/template/adminlte/plugins/select2/js/select2.full.min.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/template/adminlte/dist/js/adminlte.min.js"></script>
        <!-- ChartJS -->
        <script src="${pageContext.request.contextPath}/template/adminlte/plugins/chart.js/Chart.min.js"></script>
        <!-- My style -->
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    </head>
    <body>
        <script>
            $('.select2').select2({
                theme: 'bootstrap4'
            });
        </script>
    </body>
</html>
