<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    /web/model1/member/updateForm.jsp
    1. id 파라미터 정보 조회
    2. login 정보 조회
        -로그아웃 : "로그인 하세요" 출력. loginForm.jsp 페이지 이동.
    3. 내 정보 아닌 경우 면서, admin도 아닌경우
        - 내정보만 수정 가능합니다. 출력. main.jsp 페이지 이동
    4. id 정보를 db에서 읽어 Member 객체에 저장
    5. Member 객체를 화면에 출력.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 수정</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="update.me" name="f" method="post" onsubmit="return inputcheck(this)">
    <input type="hidden" name="picture" value="${mem.picture}">
    <table>
        <caption>회원정보수정</caption>
        <tr>
            <td rowspan="4" valign="bottom">
                <img src="picture/${mem.picture}" width="200" height="200" id="pic"><br>
                <font size="1"><a href="javascript:win_upload()">사진수정</a></font>
            </td>
            <th>아이디</th>
            <td><input type="text" name="id" readonly value="${mem.id}">
            </td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><input type="text" name="name" value="${mem.name}">
            </td>
        </tr>
        <tr>
            <th>성별</th>
            <td><input type="radio" name="gender" value="1" ${mem.gender==1?"checked":""}>남
                <input type="radio" name="gender" value="2" ${mem.gender==2?"checked":""}>여
            </td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td colspan="2"><input type="text" name="tel" value="${mem.tel}">
            </td>
        </tr>
        <tr>
            <th>이메일</th>
            <td colspan="2"><input type="text" name="email" value="${mem.email}">
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <input type="submit" value="회원수정">
                <c:if test="${sessionScope.login.equals('admin') || param.id.equals('admin')}">
                <input type="button" value="비밀번호수정" onclick="win_passchg()">
                </c:if>
            </td>
        </tr>
    </table>
</form>
<script>
    function inputcheck(f) {
        if(f.pass.value == "") {
            alert("비밀번호를 입력하세요");
            f.pass.focus();
            return false;
        }
    }
    function win_passchg() {
        var op = "width=500, height=250, left=50, top=150";
        open("passwordForm.me", "", op);
    }
    function win_upload() {
        var op = "width=500, height=150, left=50, top=150";
        open("pictureForm.me","",op);
    }
</script>
</body>
</html>