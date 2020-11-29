<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Muro
  Date: 2020-11-27
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    alert("${msg}")
    <c:if test="${opner}">
        opner.location.href="${url}";
    </c:if>
    <c:if test="${!opner}">
        location.href="${url}";
    </c:if>
    <c:if test="${closer}">
        self.close;
    </c:if>
</script>
