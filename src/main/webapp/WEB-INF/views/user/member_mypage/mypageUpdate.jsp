<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지_회원 정보 수정</title>

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
<!-- 커밋 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/findid.css">
	
	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<form method="post"
		action="${pageContext.request.contextPath }/jhr/mypageUpdate"
		class="update_form" id="update_form" onsubmit="return check()"
		enctype="multipart/form-data">
		<h3>회원정보 수정</h3>
		<br>


		<div class="join1" style="margin-bottom: 10px !important;">
			<ul>

				<img id="profileimg" onerror="this.style.display='none'" style="max-width: 400px; max-height: 300px; box-sizing: border-box; margin-bottom: 10px;">

			


<li class="join-field"><label for=""><span
						class="point_color">*</span>프로필사진</label> <input type="file"
					name="profile" id="profile" class="file input_space" value="${vo.mprofile}">
					
					</li>
					
					


				<li class="join-field"><label for=""><span
						class="point_color">*</span>이름</label> <input type="text" id="mname"
					name="mname" class="input_space" value="${vo.mname}"
					readonly="readonly"></li>




				<li class="join-field"><label for=""><span
						class="point_color">*</span>아이디</label> <input type="text" id="mid"
					lang="en" name="mid" class="input_space" value="${vo.mid}"
					readonly="readonly"></li>





				<li><label for="">생년월일</label> <input type="text" id="mbirth"
					name="mbirth" lang="en" class="input_space" value="${vo.mbirth}"
					readonly="readonly"></li>



				<li><label for="">휴대폰번호</label> <input type="text" id="mphone"
					lang="en" name="mphone" class="input_space" value="${vo.mphone}">
				</li>



				<li><label for=""><span class="point_color">*</span>이메일</label>
					<input type="text" id="memail" lang="en" name="memail" class="input_space"
					value="${vo.memail}"></li>
					
	
						<%-- <li class="join-field">
						<label for=""><span class="point_color">*</span>비밀번호 변경</label> 
			
							<div class="ui_input2">
									<a href="${pageContext.request.contextPath }/jhr/mypageResetpw"><input
									type="button" value="비밀번호 변경" class="btn_pwd"></a>
							</div>
								
						</li> --%>
						
						
			</ul>
		</div>
	
		<div class="confirm-btn">
			<input type="submit" class="btn_join llog submit_btn" id="submit_btn"
				value="수정">
		</div>
	</form>


</body>
<script type="text/javascript">
	let mid = '${sessionScope.mid}';
	$.ajax({
		url : "/project/mypageupdate/" + mid,
		type : "get",
		dataType : "json",
		success : function(data) {
			$("#profileimg").prop(
					"src",
					"${pageContext.request.contextPath }/resources/images/members/"
							+ data.mprofile);
			$("#mname").val(data.mname);
			$("#mid").val(data.mid);
			$("#mbirth").val(data.mbirth);
			$("#mphone").val(data.mphone);
			$("#memail").val(data.memail);
		}
	});

	function check() {
		var email = document.getElementsByName("memail")[0];
		var ereg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var birth = document.getElementsByName("mbirth")[0];
		var phone = document.getElementsByName("mphone")[0];
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
			alert("휴대폰번호는 11자리까지만 입력 가능합니다.");
			pwd1.focus();
			return false;
		}
		return true;
	}

	$(function() {
		$("#submit_btn")
				.click(
						function(e) {
							e.preventDefault();
							var pop_up = confirm("수정하시겠습니까?");
							var form = $('#update_form')[0];
							var formData = new FormData(form);
							if (pop_up == true) {
								$.ajax({
									url : "/project/update",
									data : formData,
									processData : false,
									contentType : false,
									type : "post",
									dataType : "json",
									success : function(data) {
										if (data.code == 'success') {
											alert("회원정보 수정에 성공했습니다.");
											location.reload();
										} else {
											alert("회원정보 수정에 실패했습니다.");
										}
									}
								});
							} else if (pop_up == false) {
								location.href = "${pageContext.request.contextPath }/jhr/mypageUpdate";
							}
						});
	});
</script>
</html>