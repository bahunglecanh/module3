<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa Danh mục</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css">
</head>
<body>
    <div class="container">
        <h1>Chỉnh sửa Danh mục</h1>
        
        <!-- Navigation -->
        <div class="navigation">
            <a href="${pageContext.request.contextPath}/categories">Danh mục</a> |
            <a href="${pageContext.request.contextPath}/products">Sản phẩm</a> |
            <a href="${pageContext.request.contextPath}/users">Người dùng</a>
        </div>

        <form action="${pageContext.request.contextPath}/categories" method="post" class="form">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="${category.id}">
            
            <div class="form-group">
                <label for="name">Tên danh mục *:</label>
                <input type="text" id="name" name="name" value="${category.name}" required maxlength="255">
            </div>
            
            <div class="form-group">
                <label for="description">Mô tả:</label>
                <textarea id="description" name="description" rows="4" cols="50">${category.description}</textarea>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Cập nhật danh mục</button>
                <a href="${pageContext.request.contextPath}/categories" class="btn btn-secondary">Hủy</a>
            </div>
        </form>
    </div>
</body>
</html>
