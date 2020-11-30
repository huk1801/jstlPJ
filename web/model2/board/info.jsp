<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.BoardDAO" %>
<%@ page import="model.Board" %><%--
  Created by IntelliJ IDEA.
  User: GDJ30
  Date: 2020-11-20
  Time: 오후 4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
2. 게시판의 info.jsp 페이지 구현하기

1. num 파라미터 저장

2. num값의 게시물을 db에서 조회.

    Board BoardDao.selectOne(num)

3. num값의 게시물의 조회수 증가시키기

    void BoardDao.readcntAdd(num)

4. 조회된 게시물 화면에 출력.
--%>
<html>
<head>
    <title>게시물 상세보기</title>
    <link rel="stylesheet" href="../../css/main.css">
    <style>
        td {text-align: left}
        th { width: 25%}
        #content {vertical-align: text-top; text-align: left; height: 250px}
        #option,#file {text-align: center}
    </style>
</head>
<body>
<table><caption>게시물 상세보기</caption>
    <tr>
        <th>글쓴이</th>
        <td>${board.name}</td>
    </tr>
    <tr>
        <th>제목</th>
        <td>${board.subject}</td>
    </tr>
    <tr>
        <th>내용</th>
        <td id="content">${board.content}</td>
    </tr>
    <tr>
        <th>첨부파일</th>
        <td id="file">
            <c:if test="${empty board.file1}">
                &nbsp;
            </c:if>
            <c:if test="${!empty board.file1}">
            <a href="./file/${board.file1}">${board.file1}</a>
            </c:if>
        </td>
    </tr>
    <tr>
        <td id="option" colspan="2">
            <a href="replyForm.do?num=${board.num}">[답변]</a>
            <a href="updateForm.do?num=${board.num}">[수정]</a>
            <a href="deleteForm.do?num=${board.num}">[삭제]</a>
            <a href="list.do">[목록]</a>
        </td>
    </tr>
</table>
</body>
</html>
