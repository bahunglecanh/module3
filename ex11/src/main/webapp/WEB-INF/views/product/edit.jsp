<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Cập nhật sản phẩm</title>
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
<h1 class="h4">Cập nhật sản phẩm</h1>

<form class="mt-3" method="post" action="${pageContext.request.contextPath}/products">
    <input type="hidden" name="action" value="edit"/>
    <input type="hidden" name="id" value="${product.id}"/>
    <div class="mb-3">
        <label class="form-label">Tên sản phẩm</label>
        <input class="form-control" type="text" name="name" value="${product.name}" required/>
    </div>
    <div class="mb-3">
        <label class="form-label">Giá</label>
        <input class="form-control" type="number" name="price" step="0.01" min="0" value="${product.price}" required/>
    </div>
    <div class="mb-3">
        <label class="form-label">Danh mục</label>
        <select class="form-select" name="categoryId">
            <option value="">Chọn danh mục</option>
            <c:forEach var="category" items="${categories}">
                <option value="${category.id}" ${product.categoryId == category.id ? 'selected' : ''}>${category.name}</option>
            </c:forEach>
        </select>
    </div>
    <div class="mb-3">
        <label class="form-label">Mô tả</label>
        <textarea class="form-control" name="description" rows="3">${product.description}</textarea>
    </div>
    <div class="mb-3">
        <label class="form-label">Nhà sản xuất</label>
        <input class="form-control" type="text" name="manufacturer" value="${product.manufacturer}"/>
    </div>
    <div>
        <button class="btn btn-primary" type="submit">Cập nhật</button>
        <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/products">Hủy</a>
    </div>
</form>
</div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

