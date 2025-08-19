<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/styles.css" rel="stylesheet"/>
    <style>
        .search-filters {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .pagination {
            justify-content: center;
        }
    </style>
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
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products?action=create">Thêm mới</a></li>
            </ul>
        </div>
    </div>
</nav>

<main class="container py-4">
    <h1 class="h4 mb-4">Quản lý Sản phẩm</h1>
    
    <!-- Search Filters -->
    <div class="search-filters">
        <div class="row">
            <div class="col-md-4">
                <form method="get" action="${pageContext.request.contextPath}/products">
                    <input type="hidden" name="action" value="search"/>
                    <div class="input-group">
                        <input class="form-control" type="text" name="keyword" placeholder="Tìm kiếm sản phẩm..." value="${keyword}"/>
                        <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                    </div>
                </form>
            </div>
            <div class="col-md-3">
                <form method="get" action="${pageContext.request.contextPath}/products">
                    <input type="hidden" name="action" value="searchByCategory"/>
                    <select name="categoryId" class="form-select" onchange="this.form.submit()">
                        <option value="">Tất cả danh mục</option>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.id}" ${selectedCategoryId == category.id ? 'selected' : ''}>${category.name}</option>
                        </c:forEach>
                    </select>
                </form>
            </div>
            <div class="col-md-4">
                <form method="get" action="${pageContext.request.contextPath}/products" class="d-flex">
                    <input type="hidden" name="action" value="searchByPrice"/>
                    <input type="number" name="minPrice" placeholder="Giá từ" class="form-control me-2" value="${minPrice > 0 ? minPrice : ''}"/>
                    <input type="number" name="maxPrice" placeholder="Giá đến" class="form-control me-2" value="${maxPrice}"/>
                    <button type="submit" class="btn btn-outline-primary">Lọc</button>
                </form>
            </div>
            <div class="col-md-1">
                <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-secondary">Reset</a>
            </div>
        </div>
    </div>

    <!-- Results Info -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <div>
            <c:choose>
                <c:when test="${not empty searchMode}">
                    <span class="text-muted">Kết quả tìm kiếm: ${empty products ? 0 : products.size()} sản phẩm</span>
                </c:when>
                <c:otherwise>
                    <span class="text-muted">Tổng số: ${totalProducts} sản phẩm | Trang ${currentPage}/${totalPages}</span>
                </c:otherwise>
            </c:choose>
        </div>
        <a href="${pageContext.request.contextPath}/products?action=create" class="btn btn-success">Thêm sản phẩm mới</a>
    </div>

    <c:choose>
        <c:when test="${empty products}">
            <div class="alert alert-info">Không có sản phẩm nào.</div>
        </c:when>
        <c:otherwise>
            <div class="content-card">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Danh mục</th>
                        <th>Mô tả</th>
                        <th>Nhà sản xuất</th>
                        <th class="text-end">Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${products}" var="p">
                        <tr>
                            <td>${p.id}</td>
                            <td><strong>${p.name}</strong></td>
                            <td><fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫" /></td>
                            <td>
                                <c:if test="${not empty p.category}">
                                    <span class="badge bg-secondary">${p.category.name}</span>
                                </c:if>
                                <c:if test="${empty p.category}">
                                    <span class="text-muted">Chưa phân loại</span>
                                </c:if>
                            </td>
                            <td>${p.description}</td>
                            <td>${p.manufacturer}</td>
                            <td class="text-end actions">
                                <a class="btn btn-sm btn-outline-info" href="${pageContext.request.contextPath}/products?action=view&id=${p.id}">Xem</a>
                                <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/products?action=edit&id=${p.id}">Sửa</a>
                                <a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/products?action=delete&id=${p.id}" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>

    <!-- Pagination -->
    <c:if test="${empty searchMode and totalPages > 1}">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${currentPage > 1}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/products?page=1">Đầu</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/products?page=${currentPage - 1}">Trước</a>
                    </li>
                </c:if>
                
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <li class="page-item active">
                                <span class="page-link">${i}</span>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/products?page=${i}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/products?page=${currentPage + 1}">Tiếp</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/products?page=${totalPages}">Cuối</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </c:if>

    <!-- Search Results Pagination -->
    <c:if test="${not empty searchMode and not empty keyword and totalPages > 1}">
        <nav aria-label="Search results pagination">
            <ul class="pagination">
                <c:if test="${currentPage > 1}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/products?action=search&keyword=${keyword}&page=1">Đầu</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/products?action=search&keyword=${keyword}&page=${currentPage - 1}">Trước</a>
                    </li>
                </c:if>
                
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <li class="page-item active">
                                <span class="page-link">${i}</span>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/products?action=search&keyword=${keyword}&page=${i}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/products?action=search&keyword=${keyword}&page=${currentPage + 1}">Tiếp</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/products?action=search&keyword=${keyword}&page=${totalPages}">Cuối</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </c:if>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

