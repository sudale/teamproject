<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>

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


	<div class="sub_content">

		<div class="res_completion">

			<%-- <img src="${pageContext.request.contextPath }/resources/images/accommodations/approval.png" style="width:30%;height: 30%;">
	 --%>


			<h2 class="res_comp_tit"><strong lang="en">${mid }님</strong>️👋 예약이 완료되었습니다!</h2>
			<h3 class="res_comp_midtit">
				예약 확인은 <span class="mypagehref"><a href="${pageContext.request.contextPath }/user/kjy/mypage">마이페이지</a></span>에서 해주세요!
			</h3>
			<img src="${pageContext.request.contextPath }/resources/images/accommodations/approval2.svg">
			





		</div>

	</div>

	<div class="footer" style="clear: both;">
		<jsp:include page="../includes/footer.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">

	$(document).ready(function() {
		var mid = $("#mid").val();
		$.ajax({
			url : "/project/phj/checkReservation/" + mid,
			dataType : "json",
			success : function(e) {
				let info = "";
				info += e.rordernum

				$('#rnum').html(info);
			}
		})
	})
	rrodernum
</script>
</html>