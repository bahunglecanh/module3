<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xem Danh mục</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css">
</head>
<body>
    <div class="container">
        <h1>Chi tiết Danh mục</h1>
        
        <!-- Navigation -->
        <div class="navigation">
            <a href="${pageContext.request.contextPath}/categories">Danh mục</a> |
            <a href="${pageContext.request.contextPath}/products">Sản phẩm</a> |
            <a href="${pageContext.request.contextPath}/users">Người dùng</a>
        </div>

        <div class="detail-view">
            <div class="detail-row">
                <label>ID:</label>
                <span>${category.id}</span>
            </div>
            
            <div class="detail-row">
                <label>Tên danh mục:</label>
                <span>${category.name}</span>
            </div>
            
            <div class="detail-row">
                <label>Mô tả:</label>
                <span>${category.description}</span>
            </div>
        </div>
        
        <div class="form-actions">
            <a href="${pageContext.request.contextPath}/categories?action=edit&id=${category.id}" class="btn btn-primary">Chỉnh sửa</a>
            <a href="${pageContext.request.contextPath}/categories" class="btn btn-secondary">Quay lại danh sách</a>
            <a href="${pageContext.request.contextPath}/categories?action=delete&id=${category.id}" 
               class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này?')">Xóa</a>
        </div>
    </div>
</body>
</html>
