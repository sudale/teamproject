<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 파비콘 이미지 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/favicon.ico" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">

</head>

<body>
<form action="${pageContext.request.contextPath }/">
	예약아이디<input type="text" name="RID" value="1">
	총금액<input type="text" name="PTOTAL" value="${sum }">
	아이디<input type="text" name="MID" value="${mid }">
	객실아이디<input type="text" name="RIID" value="${riid }">
	<input type="submit" value="결제페이지">
</form>
</body>
</html>