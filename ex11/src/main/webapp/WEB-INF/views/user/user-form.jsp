<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Người dùng - Biểu mẫu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/styles.css" rel="stylesheet"/>
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
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/users">Danh sách</a></li>
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/users?action=create">Thêm mới</a></li>
            </ul>
        </div>
    </div>
    
</nav>

<main class="container py-4">
    <div class="page-header">
        <h1 class="h3">
            <c:choose>
                <c:when test="${user != null}">Chỉnh sửa người dùng</c:when>
                <c:otherwise>Thêm người dùng</c:otherwise>
            </c:choose>
        </h1>
        <p class="text-muted">Điền các thông tin bên dưới và lưu lại.</p>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="content-card">
                <form action="${pageContext.request.contextPath}/users" method="post" novalidate>
                    <c:if test="${user != null}">
                        <input type="hidden" name="id" value="${user.id}"/>
                        <input type="hidden" name="action" value="edit"/>
                    </c:if>
                    <c:if test="${user == null}">
                        <input type="hidden" name="action" value="create"/>
                    </c:if>

                    <div class="mb-3">
                        <label class="form-label" for="name">Họ tên</label>
                        <input class="form-control" id="name" type="text" name="name" value="${user.name}" placeholder="Nhập họ tên" required/>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="email">Email</label>
                        <input class="form-control" id="email" type="email" name="email" value="${user.email}" placeholder="name@example.com" required/>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="country">Quốc gia</label>
                        <input class="form-control" id="country" type="text" name="country" value="${user.country}" placeholder="Nhập quốc gia" required/>
                    </div>

                    <div class="d-flex justify-content-between">
                        <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/users">Quay lại</a>
                        <button class="btn btn-primary" type="submit">Lưu</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
