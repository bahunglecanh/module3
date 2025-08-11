<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Chi tiết sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/styles.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">Product Manager</a>
    </div>
    
</nav>

<main class="container py-4">
    <div class="content-card">
        <h1 class="h4">Chi tiết sản phẩm</h1>
        <dl class="row mt-3">
            <dt class="col-sm-3">ID</dt>
            <dd class="col-sm-9">${product.id}</dd>
            <dt class="col-sm-3">Tên</dt>
            <dd class="col-sm-9">${product.name}</dd>
            <dt class="col-sm-3">Giá</dt>
            <dd class="col-sm-9">${product.price}</dd>
            <dt class="col-sm-3">Mô tả</dt>
            <dd class="col-sm-9">${product.description}</dd>
            <dt class="col-sm-3">Nhà sản xuất</dt>
            <dd class="col-sm-9">${product.manufacturer}</dd>
        </dl>
        <div class="mt-3">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/products?action=edit&id=${product.id}">Sửa</a>
            <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/products?action=delete&id=${product.id}">Xóa</a>
            <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/products">Quay lại</a>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

