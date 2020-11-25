<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Muro
  Date: 2020-11-25
  Time: 오전 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSTL EL함수 예제</title>
</head>
<body>
<c:set var="str1" value="Functions <태그>를 사용합니다."/>
<c:set var="str2" value="사용"/>
<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10"/>
length(str1) = ${fn:length(str1)} :str1 문자열 길이리턴 <br>
toUpperCase(str1) = ${fn:toUpperCase(str1)} : str1의 모든 문자를 대문자로 리턴 <br>
toLowerCase(str1) = ${fn:toLowerCase(str1)} : str1의 모든 문자를 서문자로 리턴 <br>
substring(str1,3,6) = ${fn:substring(str1, 3, 6)} : str1의 3~5까지의 부분 문자열 리턴 <br>
substringAfter(str1,str2) = ${fn:substringAfter(str1, str2)} : str1문자열에서 str2문자열 이후의 문자열 리턴<br>
substringBefore(str1,str2) = ${fn:substringBefore(str1, str2)} : str1문자열에서 str2문자열 이전의 문자열 리턴<br>
contians(str1,str2) = ${fn:contains(str1, str2)} : str1에 str2 문자열이 있니? <br>
trim(str1) = ${fn:trim(str1)} : 공백제게 <br>
replace(str1, " ", "-") = ${fn:replace(str1, " ", "-")} : " "을 "-" 문자열로 치환 <br>
split(tokens,',') : ,를 기준으로 문자열을 나눠서 배열로 리턴
<c:set var="arr" value="${fn:split(tokens, ',')}"/>
<c:forEach var="i" items="${arr}">${i} &nbsp;</c:forEach><br>
join(arr,'-') = ${fn:join(arr, '-')}<br>
</body>
</html>
