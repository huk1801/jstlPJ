<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Muro
  Date: 2020-11-25
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>fmt 태그 : 인코딩</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<form method="post" name="f">
    이름 : <input type="text" name="name" value="${param.name}"><br>
    입사일 : <input type="text" name="hiredate" value="${param.hiredate}"><br>
    yyyy-MM-dd 형태로 입력 <br>
    <%--
        paramValues.job : job 파라미터들을 배열 리턴
        ${fn:join(배열,',')} : 배열의 요소들을 ,로 연결시켜서 문자열로 리턴
    --%>
    급여 : <input type="text" name="salary" value="${param.salary}"><br>
    <c:set var="jobs" value="${fn:join(paramValues.job, ',')}"/>
    담당업무 : <input type="checkbox" name="job" value="서무"
    <c:if test="${fn:contains(jobs,'서무')}">checked</c:if>>서무
            <input type="checkbox" name="job" value="개발"
    <c:if test="${fn:contains(jobs,'개발')}">checked</c:if>>개발
            <input type="checkbox" name="job" value="비서"
    <c:if test="${fn:contains(jobs,'비서')}">checked</c:if>>비서
            <input type="checkbox" name="job" value="운용"
    <c:if test="${fn:contains(jobs,'운용')}">checked</c:if>>운용<br>
    <input type="submit" value="전송">
</form>
<hr>
이름 : ${param.name}<br>
입사일 : ${param.hiredate}<br>
급여 : ${param.salary}<br>
담당업무 : ${param.job}<br>
담당업무 : <c:forEach var="j" items="${paramValues.job}">
    ${j} &nbsp;&nbsp;&nbsp;
</c:forEach><br>

<h3>입사일을 yyyy년 MM월 dd일 E요일 형태로 출력, 급여, 연봉 세자리마다, 출력, 연봉 : 급여*12</h3>
이름 : ${param.name}<br>
<c:catch var="formatexception">
    <fmt:parseDate value="${param.hiredate}" pattern="yyyy-MM-dd" var="hiredate"/>
</c:catch>
입사일 :
<c:if test="${formatexception==null}">
    <fmt:formatDate value="${hiredate}" pattern="yyyy년 MM월 dd일 E요일"/> <br>
</c:if>
<c:if test="${formatexception!=null}">
    입사일은 yyyy-MM-dd 형태로 입력하세요 <br>
</c:if>
급여 : <fmt:formatNumber value="${param.salary}" pattern="###,###"/> <br>
연봉 : <fmt:formatNumber value="${param.salary*12}" pattern="###,###"/> <br>
담당업무 : <c:forEach var="j" items="${paramValues.job}">
    ${j} &nbsp;&nbsp;&nbsp;
</c:forEach><br>
</body>
</html>
