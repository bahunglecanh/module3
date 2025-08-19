<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Quản lý sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/styles.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">Product Manager</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/categories">Danh mục</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products">Sản phẩm</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users">Người dùng</a></li>
            </ul>
        </div>
    </div>
    
</nav>

<main class="container py-4">
    <div class="jumbotron bg-light p-5 rounded-3 mb-4">
        <h1 class="display-4">Hệ thống Quản lý Sản phẩm</h1>
        <p class="lead">Ứng dụng quản lý sản phẩm với JDBC, CRUD, tìm kiếm và phân trang</p>
    </div>

    <div class="row">
        <div class="col-md-4 mb-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Quản lý Danh mục</h5>
                    <p class="card-text">Thêm, sửa, xóa và tìm kiếm danh mục sản phẩm.</p>
                    <a href="${pageContext.request.contextPath}/categories" class="btn btn-primary">Quản lý Danh mục</a>
                </div>
            </div>
        </div>
        
        <div class="col-md-4 mb-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Quản lý Sản phẩm</h5>
                    <p class="card-text">Thêm, sửa, xóa, tìm kiếm và phân trang sản phẩm.</p>
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Quản lý Sản phẩm</a>
                </div>
            </div>
        </div>
        
        <div class="col-md-4 mb-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Quản lý Người dùng</h5>
                    <p class="card-text">Quản lý thông tin người dùng hệ thống.</p>
                    <a href="${pageContext.request.contextPath}/users" class="btn btn-primary">Quản lý Người dùng</a>
                </div>
            </div>
        </div>
    </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>