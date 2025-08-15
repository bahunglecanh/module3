<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Danh sách người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/styles.css" rel="stylesheet"/>
    <style>
        .search-actions { gap: 12px; }
    </style>
    
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">User Manager</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/users">Danh sách</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users?action=create">Thêm mới</a></li>
            </ul>
        </div>
    </div>
</nav>

<main class="container py-4">
    <div class="page-header">
        <h1 class="h3">Danh sách người dùng</h1>
        <p class="text-muted">Quản lý người dùng với giao diện hiện đại.</p>
    </div>

    <div class="content-card">
        <div class="d-flex flex-column flex-md-row align-items-stretch align-items-md-center justify-content-between search-actions mb-3">
            <form class="w-100 w-md-auto" action="${pageContext.request.contextPath}/users" method="get">
                <input type="hidden" name="action" value="search"/>
                <div class="input-group">
                    <input class="form-control" type="text" name="country" placeholder="Tìm theo quốc gia"/>
                    <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                </div>
            </form>
            <div class="d-flex mt-2 mt-md-0">
                <a class="btn btn-success" href="${pageContext.request.contextPath}/users?action=create">Them nguoi dung</a>
                <a class="btn btn-outline-secondary ms-2" href="${pageContext.request.contextPath}/users?action=sort">Sap xep theo ten</a>
                <a class="btn btn-warning ms-2" href="${pageContext.request.contextPath}/users?action=transaction">Test Transaction</a>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-light">
                <tr>
                    <th class="text-nowrap">ID</th>
                    <th>Họ tên</th>
                    <th>Email</th>
                    <th>Quốc gia</th>
                    <th class="text-center">Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty listUser}">
                    <tr>
                        <td colspan="5" class="text-center text-muted py-4">Chưa có người dùng nào.</td>
                    </tr>
                </c:if>
                <c:forEach var="user" items="${listUser}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.country}</td>
                        <td class="text-center">
                            <a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}">Sửa</a>
                            <a class="btn btn-sm btn-danger ms-1" href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
