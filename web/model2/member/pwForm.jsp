<%--
  Created by IntelliJ IDEA.
  User: GDJ30
  Date: 2020-11-20
  Time: 오후 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비밀번호찾기</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<h3>비밀번호 찾기</h3>
<form action="pw.me" method="post">
    <table>
        <tr>
            <th>아이디</th>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <th>이메일</th>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td><input type="text" name="tel"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="비밀번호 찾기"></td>
        </tr>
    </table>
</form>
</body>
</html>
