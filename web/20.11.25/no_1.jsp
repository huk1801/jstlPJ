<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Muro
  Date: 2020-11-25
  Time: 오후 4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jstl을 이용한 간단한 계산</title>
</head>
<body>
<input type="text" name="num1" value="${param.num1}" size="5">
<select name="op">
    <option>+</option>
    <option>-</option>
    <option>*</option>
    <option>/</option>
</select>
<script>
    var op = '${param.op}';
    if (op == '') op = "+"
    document.forms[0].op.value = op;
</script>
<input type="text" name="num2" value="${param.num2}" size="5">
<input type="submit" value="=">
<c:out value="${param.num1 + param.num2}"/>
</form>

</body>
</html>
