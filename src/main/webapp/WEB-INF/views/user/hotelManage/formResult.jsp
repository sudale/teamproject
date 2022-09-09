<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔등록 확인페이지</title>

<!-- 파비콘 이미지 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/favicon.ico" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">



</head>
<body>


<div class="header">
		<jsp:include page="../includes/header.jsp" flush="true"/>
	</div>

<div class="sub_container">


</div>

<div id="login" class="login_container">
	<div class="login_contents">
		<ul class="tab_wrap">
			<li>
				<div class="tab_content">
					<div class="member_login_wrap">
						<div class="login_inner">
							<div class="login_box">
								<div class="login_title" style="text-align: center;">
									신청이 완료되었습니다. <br>숙소 등록까지 약 7일이 소요됩니다.
									<br>
									<br>
									<a href="${pageContext.request.contextPath }/" style="color: #00AEF0;">메인페이지로 이동</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
</div>

<div class="footer">
		<jsp:include page="../includes/footer.jsp" flush="true"/>
</div>


</body>
</html>