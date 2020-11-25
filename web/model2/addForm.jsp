<%--
  Created by IntelliJ IDEA.
  User: Muro
  Date: 2020-11-25
  Time: 오후 3:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Model2 연습</title>
</head>
<body>
<form action="add.me" method="post">
    <input type="text" name="num1" value="${param.num1}"> +
    <input type="text" name="num2" value="${param.num2}">
    <input type="submit" value="=">
    <input type="text"name="result" value="${result}">
</form>
</body>
</html>
