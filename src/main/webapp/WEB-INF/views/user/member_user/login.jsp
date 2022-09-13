<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 파비콘 이미지 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/favicon.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">


</head>

<body>

	<div class="header">
		<jsp:include page="../includes/header.jsp" flush="true" />
	</div>
	<div id="login" class="login_container">
		<div class="login_contents">

			<div class="member_login_wrap">
				<div class="login_inner">
					<div class="login_box">
						<div class="login_title">
							<h2>로그인 해주세요.</h2>
							<h3 lang="en">Welcome! 제주의 모든 것, 아이럽 제주🎈</h3>
						</div>

						<form class="login_area" method="post"
							action="${pageContext.request.contextPath }/jhr/login">

							<div class="flied-input">
								<label for="userId"> <input type="text" name="mid"
									id="userId" class="login_id llog" maxlength="50" lang="en"
									placeholder="아이디를 입력해 주세요.">
								</label>
							</div>

							<div class="flied-input">
								<label for="userPwd"> <input type="password" name="mpw"
									id="userPwd" class="login_pwd llog" maxlength="15" lang="en"
									placeholder="비밀번호를 입력해 주세요.">
								</label>
							</div>

							<div class="errmsg">${errMsg }</div>

							<div class="confirm-btn">
								<input type="submit" class="btn_login llog" value="로그인">
							</div>

						</form>


						<div class="login_bot_wrap">
							<div class="login_menu">
								<a href="${pageContext.request.contextPath }/jhr/join">회원가입</a>
								<a href="${pageContext.request.contextPath }/jhr/findid">아이디
									찾기</a> 
								<%-- <a href="${pageContext.request.contextPath }/jhr/checkpw">비밀번호
									재설정</a> --%>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>

	<div class="footer">
		<jsp:include page="../includes/footer.jsp" flush="true" />
	</div>
</body>
</html>