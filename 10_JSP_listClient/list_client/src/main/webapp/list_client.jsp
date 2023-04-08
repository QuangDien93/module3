<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Diennguyenquang
  Date: 07/04/2023
  Time: 08:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hiển thị danh sách khách hàng</title>
</head>
<body>
<div>
    <div> Danh sách khách hàng</div>
    <div>
        <table>
            <thead>
            <tr> Tên</tr>
            <tr> ngày sinh</tr>
            <tr> Địa chỉ</tr>
            <tr> Hình ảnh</tr>
            </thead>
            <tbody>
            <c:forEach items="${listClient}" var="client">
                <tr>
                    <td>${client.name}</td>
                    <td>${client.birthday}</td>
                    <td>${client.address}</td>
                    <td><img src="/image/${client.image}" width="50px"></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
