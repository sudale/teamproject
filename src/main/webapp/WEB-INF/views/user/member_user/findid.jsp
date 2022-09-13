<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/findid.css">
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


</head>
<body>
	<div class="header">
		<jsp:include page="../includes/header.jsp" flush="true" />
	</div>

	<div class="findid">
		<div class="findid_container">

			<div class="toparea">
				<h2 class="title">아이디 찾기</h2>
				<div class="headline">
					개인정보보호를 위해<br>본인 인증해주세요.
				</div>
			</div>


			<form method="post"
				action="${pageContext.request.contextPath }/jhr/findid"
				class="find_id" onsubmit="return check()">
				<h3>인증정보 입력</h3>



				<div class="join1">

					<ul>

						<li class="join-field"><label for="">이름
						</label> <input type="text" name="mname" id="name" class="" maxlength="15"
							lang="en" placeholder="한글 또는 영문으로 입력해주세요."></li>
							
							
							<li class="join-field"><label for=""> 
							이메일
						</label> <input type="text" name="memail" class="" 
							lang="en" placeholder="한글 또는 영문으로 입력해주세요.">
						
												
							</li>

						<div class="errmsg">${errMsg }</div>


					</ul>

				</div>

				<div class="submit_container">
					<input type="submit" value="찾기" class="submit_btn">
				</div>
			</form>
		</div>
	</div>

	<div class="footer">
		<jsp:include page="../includes/footer.jsp" flush="true" />
	</div>

	<script type="text/javascript">
		function check() {
			var name = document.getElementsByName("mname")[0];
			var email = document.getElementsByName("memail")[0];
			var ereg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if (name.value.trim() == "") {
				alert("이름을 입력하세요.");
				name.focus();
				return false;
			}
			if (email.value.trim() == "") {
				alert("이메일을 입력하세요.");
				email.focus();
				return false;
			}
			if (!ereg.test(email.value)) {
				alert("이메일형식에 맞게 입력하세요.");
				email.focus();
				return false;
			}
		}
	</script>
</body>
</html>