<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔이 성공적으로 등록되었습니다.</title>

<!-- 파비콘 이미지 -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/favicon.ico" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">

</head>
<body>

	<div class="header">
		<jsp:include page="../includes/header.jsp" flush="true" />
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

										<c:choose>
											<c:when test="${result eq 'yes'}">
												<h2>숙소가 성공적으로 등록되었습니다.🎈</h2>
												<h4 class="call_back">
													<a href="${pageContext.request.contextPath }/">메인페이지로
														이동</a>
												</h4>
									</div>
									</c:when>
									<c:otherwise>
										<h2>
											호텔 등록을 거절했습니다.
											<h2>
									</c:otherwise>
									</c:choose>
									<br> <a href="javascript:self.close()">창 닫기</a>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="footer">
		<jsp:include page="../includes/footer.jsp" flush="true" />
	</div>

</body>
</html>