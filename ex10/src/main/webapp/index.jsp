<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <style>
        body {
            background: #e3f2fd;
            font-family: Arial, Helvetica, sans-serif;
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px 2px #90caf9;
            padding: 30px 30px 40px 30px;
        }
        h1 {
            text-align: center;
            font-size: 2.5em;
            font-weight: bold;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
        }
        th, td {
            padding: 18px 16px;
            text-align: left;
            font-size: 1.15em;
        }
        th {
            border-bottom: 2px solid #e3e3e3;
            font-weight: bold;
            text-align: left;
        }
        tr {
            border-bottom: 1px solid #e3e3e3;
        }
        tr:last-child {
            border-bottom: none;
        }
        td img {
            width: 80px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 2px 8px #bdbdbd44;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Danh sách khách hàng</h1>
    <table>
        <tr>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>
        <c:forEach var="customer" items="${customers}">
            <tr>
                <td>${customer.getName()}</td>
                <td>${customer.getBirthDate()}</td>
                <td>${customer.getAddress()}</td>
                <td><img src="${customer.getImage()}" alt="Ảnh khách hàng"></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>