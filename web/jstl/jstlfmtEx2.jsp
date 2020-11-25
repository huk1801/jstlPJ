<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Muro
  Date: 2020-11-25
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>형식 관련 태그 예제 2</title>
</head>
<body>
<h3>Format 된 숫자를 일반 숫자로 변경</h3>
<fmt:parseNumber value="20,000" var="num1" pattern="##,###"/>
<fmt:parseNumber value="10,000" var="num2" pattern="##,###"/>
<fmt:formatNumber value="${num1}" var="snum1" pattern="##,###"/>
<fmt:formatNumber value="${num2}" var="snum2" pattern="##,###"/>
<fmt:formatNumber value="${num1+num2}" var="snum3" pattern="##,###"/>
합 : ${num1} + ${num2} = ${num1 + num2}<br>
${snum1} + ${snum2} = ${snum3}<br>

<h3>Format 된 날짜를 날짜형으로 변경</h3>
<fmt:parseDate value="2020-12-25 12:00:00" pattern="yyyy-MM-dd HH:mm:ss" var="day"/>
${day}<br>
문제 : 2020-12-25 의 요일 <출력하기br></출력하기br>
<fmt:formatDate value="${day}" pattern="yyyy-MM-dd E요일"/>
</body>
</html>
