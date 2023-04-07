<%--
  Created by IntelliJ IDEA.
  User: Diennguyenquang
  Date: 07/04/2023
  Time: 07:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ứng dụng Product Discount Calculator</title>
</head>
<body>
<form action="/display-discount" >
  <div>
    <p>Product Description</p>
    <input type="text" name="description">
    <p>List Price</p>
    <input type="number" name="price">
    <p>Discount Percent</p>
    <input type="number" name="percent">
    <input type="submit" value="canculate">
  </div>
</form>
</body>
</html>
