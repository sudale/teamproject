<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 권한 필요</title>

<!-- 파비콘 이미지 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/favicon.ico" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">


</head>
<body>

	<div class="header">
		<jsp:include page="../includes/header.jsp" flush="true" />
	</div>
	
		<div class="sub_content">
		
		<div id="login" class="login_container">
			<div class="login_contents">
				<ul class="tab_wrap">
					<li>
						<div class="tab_content">
							<div class="member_login_wrap">
								<div class="login_inner">
									<div class="login_box">
										<div class="login_title" style="text-align: center;">


											<h2>관리자 권한 필요 페이지 🥺 </h2>
											<h3 lang="en">관리자로 로그인 해주시길 바랍니다. </h3>
											<h4 class="call_back">
												<a href="${pageContext.request.contextPath }/">메인페이지로
													이동</a>
											</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		
		
		</div>
		
		<div class="footer">
		<jsp:include page="../includes/footer.jsp" flush="true" />
	</div>
	
 
</body>

</html>