<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  /web/model1/member/info.jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>회원 정보 보기</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="info.me" name="f" method="post">
    <input type="hidden" name="picture" value="">
    <table>
        <caption>회원정보보기</caption>
        <tr>
            <td rowspan="6" width="30%">
                <img src="picture/${mem.picture}" width="200" height="200" id="pic"><br>
                </td>
            <th width="20%">아이디</th>
            <td>${mem.id}</td>
        </tr>
        <tr>
            <th>이름</th>
            <td>${mem.name}</td>
        </tr>
        <tr>
            <th>성별</th>
            <td>${mem.gender==1?"남":"여"}</td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td>${mem.tel}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${mem.email}</td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="updateForm.me?id=${mem.id}">[수정]</a>
                <c:if test="${sessionScope.login!='admin'&& param.id!='admin'}">
                <a href="deleteForm.me?id=${mem.id}">[탈퇴]</a>
                </c:if>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
