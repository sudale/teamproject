<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>

<!-- 파비콘 이미지 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/favicon.ico" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findidresult.css">
 --%>

</head>
<body>
<div class="header">
	<jsp:include page="../includes/header.jsp" flush="true"/>
</div>

<div class="sub_content">
<div class="findid">
	<div class="findid_container">
		<h2 class="title">아이디 찾기 결과</h2>
		<h3 lang="en">${findName} 님의 아이디는 
		 <span class="findidresult">${findidResult}</span> 입니다. </h3>
		
		
		<div class="confirm-btn btn_area">
		
			<a class="btn btn_default" href="${pageContext.request.contextPath }/jhr/login">로그인</a>
			<a class="btn btn_default home" href="${pageContext.request.contextPath }/" style="margin-left:20px;">홈</a>
			
		</div>	
		
	</div>
</div>
</div>

<div class="footer">
	<jsp:include page="../includes/footer.jsp" flush="true"/>
</div>
</body>
</html>