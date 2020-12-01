<%--
  Created by IntelliJ IDEA.
  User: GDJ30
  Date: 2020-11-30
  Time: 오후 4:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title><decorator:title /></title>
    <decorator:head/>   <%-- <head> 내부의 내용을 추가. <title> 제외--%>
    <link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
<table>
    <tr>
        <td colspan="3" align="right">
            자바/스프링 기반 빅데이터 플랫폼 개발자 양성과정 모델2 프로그램 연습
            <span style="float: right">
                <c:if test="${empty sessionScope.login}">
                    <a href="${path}/model2/member/loginForm.me">로그인</a>
                    <a href="${path}/model2/member/joinForm.me">회원가입</a>
                </c:if>
                <c:if test="${!empty sessionScope.login}">
                    ${sessionScope.login}님이 로그인 하셨습니다. &nbsp;&nbsp;
                    <a href="${path}/model2/member/logout.me">로그아웃</a>
                </c:if>
            </span>
        </td>
    </tr>
    <tr>
        <td width="15%" style="vertical-align: top">
            <a href="${path}/model2/member/main.me">회원관리</a><br>
            <a href="${path}/model2/board/list.do">게시판</a><br>
            <a href="${path}/model2/chat/chatForm.do">채팅</a><br>
        </td>
        <td colspan="2" style="text-align: left; vertical-align: top">
            <decorator:body/><%--<body> 태그의 내용이 추가됨.--%>
        </td>
    </tr>
    <tr>
        <td colspan="3">구디아카데미 Since 2016</td>
    </tr>
</table>
</body>
</html>
