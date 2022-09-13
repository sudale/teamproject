<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 파비콘 이미지 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/favicon.ico" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">


<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#idoverlap").click(function() {
			let mid = $("#mid").val();
			$.ajax({
				url : "/project/checkId/" + mid,
				dataType : "json",
				success : function(data) {
					if (data.using == true) {
						$("#idcheck").html("사용중인 아이디입니다.");
					} else {
						$("#idcheck").html("사용가능한 아이디입니다.");
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="../includes/header.jsp" flush="true" />
	</div>


	<div class="contents membership">
		<div class="contents_container membership_container">
			<h2 class="mem_title">회원가입</h2>
			<div class="headline">아이럽제주를 다양하게 이용하실려면 회원가입을 진행해주세요.</div>

			<form method="post"
				action="${pageContext.request.contextPath }/jhr/join"
				enctype="multipart/form-data" class="join_form"
				onsubmit="return check()">

				<h3>
					회원정보입력 <span class="point_color"><small>*은 필수입력
							항목입니다.</small></span>
				</h3>

				<div class="join1">

					<ul>
						<li class="join-field"><label for="">
						<span class="point_color">*</span>이름</label> 
								
						<input type="text" name="mname"
							class="" maxlength="12" lang="en"
							placeholder="한글 또는 영문으로 입력해주세요."></li>



						<li class="join-field"><label for=""><span
								class="point_color">*</span>아이디</label> <input type="text" name="mid"
							class="" maxlength="15" id="mid" lang="en"
							placeholder="아이디를 입력해주세요."> <span id="result"></span>
							<button type="button" class="ui_button" id="idoverlap">중복확인</button>
							<span id="idcheck" class="idoverlap"
							style="color: #ee1c25; font-size: 13.125px; line-height: 34px;"></span>
						</li>



						<li class="join-field"><label for=""><span
								class="point_color">*</span>비밀번호</label> <input type="password"
							name="mpw" class="" maxlength="20" id="mpw" lang="en"
							placeholder="비밀번호를 입력해주세요."> 
							<span class="point_color ex">8-15자리의 영문/숫자를 함께 입력해주세요.</span>
						</li>
						


						<li class="join-field"><label for=""><span
								class="point_color">*</span>비밀번호 확인</label> <input type="password"
							name="pwd2" class="" maxlength="20" id="pwd2" lang="en"
							placeholder="입력하신 비밀번호를 다시 한번 입력해주세요."></li>


						<li><label for=""><span class="point_color">*</span>이메일</label>
							<input type="email" name="memail" class="" lang="en"
							placeholder="이메일주소를 입력해주세요."></li>

						<li><label for=""><span class="point_color">*</span>생년월일</label>
							<input type="date" name="mbirth" class="" lang="en"
							maxlength="20" placeholder="생년월일 8자리를 입력해주세요. (ex.19990625)">
						</li>


						<li><label for=""><span class="point_color">*</span>휴대폰
								번호</label> <input type="text" name="mphone" lang="en" class=""
							maxlength="15" placeholder="휴대폰 번호를 입력해주세요. (숫자만 입력가능합니다.)">
						</li>

						<li class="filebox">프로필사진
						<label for="ex_file"><div class="btn-upload">파일 업로드하기</div></label>
						
						 <input type="file" name="profile" id="ex_file" class="file">
							</li>
	


					</ul>


				</div>
				<!--  join1 -->


				
				
				<div class="confirm-btn">
					<input type="submit" class="btn btn_join" value="가입">
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
			var id = document.getElementsByName("mid")[0];
			var pwd1 = document.getElementsByName("mpw")[0];
			var pwd2 = document.getElementsByName("pwd2")[0];
			var email = document.getElementsByName("memail")[0];
			var ereg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var birth = document.getElementsByName("mbirth")[0];
			var phone = document.getElementsByName("mphone")[0];
			if (name.value.trim() == "") {
				alert("이름을 입력하세요.");
				name.focus();
				return false;
			}
			if (id.value.trim() == "") {
				alert("아이디를 입력하세요.");
				id.focus();
				return false;
			}
			if (pwd1.value.trim() == "") {
				alert("비밀번호를 입력하세요.");
				pwd.focus();
				return false;
			}
			if (pwd1.value.length<8 || pwd1.value.length>15) {
				alert("비밀번호는 8-15자리의 영문/숫자를 함께 입력해주세요.");
				pwd1.focus();
				return false;
			}
			if (pwd2.value.trim() == "") {
				alert("비밀번호 확인을 입력하세요.");
				pwd.focus();
				return false;
			}
			if (pwd1.value != pwd2.value) {
				alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				pwd1.value = "";
				pwd2.value = "";
				pwd1.focus();
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
			if (birth.value.trim() == "") {
				alert("생년월일을 입력하세요.");
				birth.focus();
				return false;
			}
			if (phone.value.trim() == "") {
				alert("휴대폰번호를 입력하세요.");
				phone.focus();
				return false;
			}
			if (phone.value.indexOf("-") != -1) {
				alert("휴대폰번호에 숫자만 입력해주세요.");
				phone.focus();
				return false;
			}
			if (phone.value.length<10 || phone.value.length>12) {
				alert("휴대폰번호는 11자리를 입력해주세요.");
				pwd1.focus();
				return false;
			}
			alert("회원가입에 성공했습니다!");
			return true;
		}
	</script>
</body>
</html>