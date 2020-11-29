<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<script type="text/javascript">
    img = opener.document.getElementById("pic");
    img.src="picture/${fname}";
    //db 저장을 위한 파라미터 설정
    opener.document.f.picture.value="${fname}";
    self.close();
</script>
