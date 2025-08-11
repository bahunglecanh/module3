<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/styles.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">Product Manager</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/products?action=create">Thêm mới</a></li>
            </ul>
        </div>
    </div>
    
</nav>

<main class="container py-4">
    <div class="d-flex align-items-center justify-content-between mb-3">
        <h1 class="h4 m-0">Danh sách sản phẩm</h1>
        <form class="d-flex" method="get" action="${pageContext.request.contextPath}/products">
            <input type="hidden" name="action" value="search"/>
            <input class="form-control" type="text" name="name" placeholder="Nhập tên sản phẩm" value="${param.name != null ? param.name : searchName}"/>
            <button class="btn btn-primary ms-2" type="submit">Tìm</button>
        </form>
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
                        <th>Tên</th>
                        <th>Giá</th>
                        <th>Mô tả</th>
                        <th>NSX</th>
                        <th class="text-end">Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${products}" var="p">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.name}</td>
                            <td>${p.price}</td>
                            <td>${p.description}</td>
                            <td>${p.manufacturer}</td>
                            <td class="text-end actions">
                                <a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/products?action=view&id=${p.id}">Xem</a>
                                <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/products?action=edit&id=${p.id}">Sửa</a>
                                <a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/products?action=delete&id=${p.id}">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
        
    </c:choose>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

