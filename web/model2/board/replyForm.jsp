<%@ page import="model.BoardDAO" %>
<%@ page import="model.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    1. 원글의 num을 파라미터로 받는다.
    2. db에서 num의 게시물 조회하여 원글의 num, grp, grplevel, grpstep 정보를 정장
    3. 입력 화면 표시
 --%>
<html>
<head>
    <title>게시판 답글 쓰기</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="reply.do" method="post" name="f">
    <input type="hidden" name="num" value="${board.num}">
    <input type="hidden" name="grp" value="${board.grp}">
    <input type="hidden" name="grplevel" value="${board.grplevel}">
    <input type="hidden" name="grpstep" value="${board.grpstep}">
    <table><caption>게시판 답글 등록</caption>
        <tr>
            <th>글쓴이</th>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <th>제목</th>
            <td><input type="text"name="subject" value="RE:${board.subject}"></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" rows="15"></textarea></td>
        </tr>
        <tr>
            <td colspan="2"><a href="javascript:document.f.submit()">[답변글 등록]</a></td>
        </tr>
    </table>
</form>
</body>
</html>
