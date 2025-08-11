<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Xóa sản phẩm</title>
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
        <h1 class="h4">Xóa sản phẩm</h1>
        <p>Bạn có chắc chắn muốn xóa sản phẩm "<strong>${product.name}</strong>" (ID: ${product.id})?</p>
        <form method="post" action="${pageContext.request.contextPath}/products">
            <input type="hidden" name="action" value="delete"/>
            <input type="hidden" name="id" value="${product.id}"/>
            <button class="btn btn-danger" type="submit">Xóa</button>
            <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/products">Hủy</a>
            
        </form>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

