<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Danh mục</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css">
    <style>
        .search-box {
            margin: 20px 0;
            padding: 15px;
            background-color: #f5f5f5;
            border-radius: 5px;
        }
        .pagination {
            text-align: center;
            margin: 20px 0;
        }
        .pagination a {
            display: inline-block;
            padding: 8px 16px;
            margin: 0 4px;
            text-decoration: none;
            background-color: #f4f4f4;
            color: #333;
            border-radius: 4px;
        }
        .pagination a:hover {
            background-color: #ddd;
        }
        .pagination .current {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Quản lý Danh mục</h1>
        
        <!-- Navigation -->
        <div class="navigation">
            <a href="${pageContext.request.contextPath}/categories">Danh mục</a> |
            <a href="${pageContext.request.contextPath}/products">Sản phẩm</a> |
            <a href="${pageContext.request.contextPath}/users">Người dùng</a>
        </div>

        <!-- Search Form -->
        <div class="search-box">
            <form action="${pageContext.request.contextPath}/categories" method="get">
                <input type="hidden" name="action" value="search">
                <label for="keyword">Tìm kiếm theo tên:</label>
                <input type="text" id="keyword" name="keyword" value="${keyword}" placeholder="Nhập tên danh mục...">
                <button type="submit">Tìm kiếm</button>
                <a href="${pageContext.request.contextPath}/categories">Hiển thị tất cả</a>
            </form>
        </div>

        <!-- Action Buttons -->
        <div class="actions">
            <a href="${pageContext.request.contextPath}/categories?action=create" class="btn btn-primary">Thêm danh mục mới</a>
        </div>

        <!-- Results Info -->
        <c:if test="${not empty searchMode}">
            <p><strong>Kết quả tìm kiếm cho từ khóa: "${keyword}"</strong></p>
        </c:if>
        <c:if test="${empty searchMode}">
            <p>Tổng số danh mục: ${totalCategories} | Trang ${currentPage}/${totalPages}</p>
        </c:if>

        <!-- Categories Table -->
        <table class="data-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên danh mục</th>
                    <th>Mô tả</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="category" items="${categories}">
                    <tr>
                        <td>${category.id}</td>
                        <td>${category.name}</td>
                        <td>${category.description}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/categories?action=view&id=${category.id}">Xem</a> |
                            <a href="${pageContext.request.contextPath}/categories?action=edit&id=${category.id}">Sửa</a> |
                            <a href="${pageContext.request.contextPath}/categories?action=delete&id=${category.id}" 
                               onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty categories}">
                    <tr>
                        <td colspan="4" style="text-align: center;">Không tìm thấy danh mục nào.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <!-- Pagination -->
        <c:if test="${empty searchMode and totalPages > 1}">
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="${pageContext.request.contextPath}/categories?page=1">&laquo; Đầu</a>
                    <a href="${pageContext.request.contextPath}/categories?page=${currentPage - 1}">Trước</a>
                </c:if>
                
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span class="current">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/categories?page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <c:if test="${currentPage < totalPages}">
                    <a href="${pageContext.request.contextPath}/categories?page=${currentPage + 1}">Tiếp</a>
                    <a href="${pageContext.request.contextPath}/categories?page=${totalPages}">Cuối &raquo;</a>
                </c:if>
            </div>
        </c:if>
    </div>
</body>
</html>
