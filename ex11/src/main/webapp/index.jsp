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
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products">Danh sách</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products?action=create">Thêm mới</a></li>
            </ul>
        </div>
    </div>
    
</nav>

<main class="container py-4">
    <div class="page-header">
        <h1 class="h3">Quản lý sản phẩm</h1>
        <p class="text-muted">Ứng dụng mẫu theo kiến trúc MVC.</p>
    </div>
    <div class="row">
        <div class="col-md-8">
            <div class="content-card">
                <h2 class="h5">Bắt đầu</h2>
                <p>Chọn một thao tác bên dưới để bắt đầu làm việc với sản phẩm.</p>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/products">Xem danh sách</a>
                <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/products?action=create">Thêm sản phẩm</a>
            </div>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>