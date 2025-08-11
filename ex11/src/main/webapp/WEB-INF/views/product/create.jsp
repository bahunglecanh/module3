<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Thêm sản phẩm</title>
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
<h1 class="h4">Thêm sản phẩm</h1>
<form class="mt-3" method="post" action="${pageContext.request.contextPath}/products">
    <input type="hidden" name="action" value="create"/>
    <div class="mb-3">
        <label class="form-label">Tên sản phẩm</label>
        <input class="form-control" type="text" name="name" required/>
    </div>
    <div class="mb-3">
        <label class="form-label">Giá</label>
        <input class="form-control" type="number" name="price" step="0.01" min="0" required/>
    </div>
    <div class="mb-3">
        <label class="form-label">Mô tả</label>
        <textarea class="form-control" name="description" rows="3"></textarea>
    </div>
    <div class="mb-3">
        <label class="form-label">Nhà sản xuất</label>
        <input class="form-control" type="text" name="manufacturer"/>
    </div>
    <div>
        <button class="btn btn-primary" type="submit">Lưu</button>
        <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/products">Hủy</a>
    </div>

</form>
</div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

