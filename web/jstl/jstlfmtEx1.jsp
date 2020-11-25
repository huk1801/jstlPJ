<%--
  Created by IntelliJ IDEA.
  User: Muro
  Date: 2020-11-25
  Time: 오전 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL 형식화 태그</title>
</head>
<body>
<h3> 숫자관련 형식 지정하기</h3>
<fmt:formatNumber value="500000" type="currency" currencySymbol="￦"/><br>
<fmt:formatNumber value="0.15" type="percent"/><br>
<fmt:formatNumber value="50000.345" pattern="###,###.00" /> <br>
<%-- 지역설정 --%>
<fmt:setLocale value="en_US"/>
<fmt:formatNumber value="500000" type="currency"/> <br>
<fmt:setLocale value="ko_KR"/>
<fmt:formatNumber value="500000" type="currency"/> <br>

<h3>날짜관련 현식 지정하기</h3>
<c:set var="today" value="<%=new java.util.Date()%>"/>
년월일 : <fmt:formatDate value="${today}" type="both" timeStyle="short" dateStyle="short"/><br>
시분초 : <fmt:formatDate value="${today}" type="both" timeStyle="long" dateStyle="long"/><br>
년월일시분초 : <fmt:formatDate value="${today}" type="both" timeStyle="full" dateStyle="full"/><br>
년월일시분초1 : <fmt:formatDate value="${today}" type="both" timeStyle="full" dateStyle="full" timeZone="GMT"/><br>
형식지정 : <fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 HH:mm:ss a E"/><br>
</body>
</html>
<%--
    XXXFormat 클래스
        format() : 자료형 => 형식화된 문자열
        parse() : 형식화된 문자열 => 자료형
--%>
