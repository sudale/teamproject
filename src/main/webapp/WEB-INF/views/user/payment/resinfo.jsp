<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
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
	href="${pageContext.request.contextPath}/resources/css/board_all.css">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css">





<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 -->

<style>
input {
	-webkit-appearance: auto;
}

.box {
	/* float: left;
	width: 650px;
	border: solid 1px;
	border-color: #BDBDBD;
	border-image: liner-gradient(to right, gray, white);
	margin: 2% 2% 2% 2%;
	padding: 7px; */
	
}

.hotel {
	/* float: left;
	border: solid 1px;
	width: 25%;
	border-color: #BDBDBD;
	margin: 2% 1% 1% 2%; */
	
}

.totalinfo {
	/* float: left;
	border: solid 1px;
	width: 25%;
	border-color: #BDBDBD;
	margin: 1% 1% 1% 2%; */
	
}

.bill {
	/* float: left;
	border: solid 1px;
	margin: 1% 1% 1% 2%; */
	
}

.labelpadding {
	margin: 10px 10px 20px 0px;
}

.sInput {
	width: 450px;
	height: 30px;
}
</style>
</head>
<body>
	<div class="header">
		<jsp:include page="../includes/header.jsp" flush="true" />
	</div>


	<div class="sub_content">

		<div class="reservation_wrap">


			<h2 class="mem_title">에약 페이지️</h2>
			<div class="headline">아이럽제주 예약 페이지 진행해주세요.</div>


			<form class="reservation_form" id="insertOk"
				action="${pageContext.request.contextPath }/phj/reservationOk">
				<input type="hidden" id="rroomnum" name="rroomnum"
					value="${rroomnum }"> <input type="hidden" name="sum"
					value="${sum }"> <input type="hidden" id="ramount"
					name="ramount" value="${ramount }"> <input type="hidden"
					id="mid" name="mid" value="${mid }"> <input type="hidden"
					id="riid" name="riid" value="${riid }"> <input
					type="hidden" id="rcheckin" name="rcheckin" value="${startday } ">
				<input type="hidden" id="rcheckout" name="rcheckout"
					value="${endday }"> <input type="hidden" id="rcancel"
					name="rcancel" value="N"> <input type="hidden" id="aid"
					name="aid" value="${aid }"> <input type="hidden"
					id="rimaxper" name="rimaxper" value="rimaxper"> <input
					type="hidden" name="breakfastfee" value="breakfastfee"
					style="border: none"> <input type="hidden" name="bedfee"
					value="bedfee" style="border: none"> <input type="hidden"
					name="totalbreakfee" value="0"> <input type="hidden"
					name="totalbedfee" value="0"> <input type="hidden"
					id="personfee" name="personfee" value="personfee"
					style="border: none"> <input type="hidden"
					id="breakfastfee" name="breakfastfee" value="0"
					style="border: none"> <input type="hidden" id="bedfee"
					name="bedfee" value="0" style="border: none">



				<div class="totalinfo">
					<h2 id="hotelInfo" class="reser_title">숙소 정보️🏠</h2>

					<div class="reservation_room">
						<h3 class="room_title">${mid}님의 예약현황</h3>

					<table class="table">
					
						<tr>
							<th>룸타입</th>
							<td lang="en" id="roomtype"></td>
						</tr>
						<tr>
							<th>체크인</th>
							<td lang="en">${startday }</td>
						</tr>
						<tr>
							<th>체크아웃</th>
							<td lang="en">${endday }</td>
						</tr>
						<tr>
							<th>개당 방 금액</th>
							<td lang="en">${sum }</td>
						</tr>
						<tr>
							<th>방 개수</th>
							<td lang="en">${rroomnum }개</td>
						</tr>
						<tr>
							<th>부가서비스</th>
							<td id="service"></td>
						</tr>
						<tr>
							<th>조식추가요금</th>
							<td lang="en" id="totalbreakfee">0</td>
						</tr>
						<tr>
							<th>침대추가요금</th>
							<td lang="en" id="totalbedfee">0</td>
						</tr>
						<tr>
							<th>인원추가요금</th>
							<td ><input type="text" name="personfee" value="personfee" lang="en"
								style="border: none"></td>
						</tr>
					</table>
					</div>
				</div>
				<!-- totalinfo end -->
				
				
				<div class="reser_box">
					<h2 class="reser_title">고객님의 정보를 입력해 주세요.</h2>

					<ul>
						<li class="join-field"><label for=""> 영문이름</label> <input
							id="engName" name="rresname" type="text" class="form-control" lang="en"
							required size="70px" placeholder="투숙객의 이름을 입력해주세요."
							onfocus="this.placeholder=''"
							onblur="this.placeholder='투숙객의 이름을 입력해주세요.'"></li>

						<li class="join-field"><label for=""> 이메일</label> <input
							type="text" id="email" oninput="checkEmail()"lang="en"
							class="form-control" style="color: gray" required size="70px"
							placeholder="오탈자에 주의해 주세요" onfocus="this.placeholder=''"
							onblur="this.placeholder='오탈자에 주의해 주세요'"></li>


						<li class="join-field"><label for=""> 이메일 재입력</label> <input
							type="text" name="rresemail" id="emailcheck" size="70px" lang="en"
							oninput="checkEmail()" class="form-control">
							</li>
							
							<div id="emailOk"></div>


						<li class="join-field"><label for=""> 전화번호(선택 사항)</label> <input
							type="text" id="rresphone" name="rresphone" size="70px" lang="en"
							class="form-control"></li>

						<div>추가사항</div>

						<li class="join-field"><label for=""> 조식 추가 </label> <input 
							style="width: 60px;" type="number" name="rexbreaknum" lang="en"
							id="rexbreaknum" value="0" min="0" max="rexperson"></li>

						<li class="join-field"><label for=""> 침대 추가 </label> <input
							style="width: 60px;" type="number" name="rexbed" id="rexbed" lang="en"
							value="0" min="0" max="1"></li>

						<li class="join-field"><label for=""> 인원추가 </label> <input
							style="width: 60px; border: none;" type="text" name="rexperson" lang="en"
							id="rexperson" value="0">
							<p style="color: #BDBDBD;">*검색 기준 현재 추가 인원</p></li>

					</ul>


					<div class="speci_add">

						<p>
							특별 요청 사항 반영 여부는 숙소 여건에 따라 달라질 수 있습니다.
							<span>예약 완료 즉시 요청 사항을 숙소/호스트에게 전달 하겠습니다.</span>
						</p>
						<p><input type="checkbox" id="check1" required="required">
						본인은 이용약관에 동의하며 18세 이상임을 확인합니다.
						</p>
						

						
							<input
								type="submit" value="마지막 단계로 이동하기" class="btn btn_join"  id="resOk"><br>
						
					</div>
					<!-- speci_add end  -->


				</div>


			</form>

		</div>
	</div>

	<div class="footer" style="clear: both;">
		<jsp:include page="../includes/footer.jsp" flush="true" />
	</div>
</body>






<script type="text/javascript">
	function checkEmail(){
		var email=$("#email").val();
		var emailcheck=$("#emailcheck").val();
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	
		if(email==emailcheck){
			let com="입력하신 이메일 주소로 예약 확정서가 발송됩니다."
			$("#emailOk").html(com).css("color","#9FC93C");
		}else{
			let com="이메일'과 '이메일 재입력'에 입력된 이메일 주소가 일치하지 않습니다."
			$("#emailOk").html(com).css("color","#FF0000");
		}
	}
	$(document).on('focusout', '#email', function(e){
		e.preventDefault();
		var emailVal=$("#email").val();
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 검증에 사용할 정규식 변수 regExp에 저장 
		if (!regExp.test(email.value)) { 
			alert("이메일형식에 맞게 입력하세요."); 
		}
	});

	$('#rexbreaknum').on('change', function(){
		var rexbreaknum=$("#rexbreaknum").val();
		var breakfastfee=$("#breakfastfee").val();
		var totalbreakfastfee=rexbreaknum*breakfastfee;
		$('#totalbreakfee').text(totalbreakfastfee);
		$('input[name=totalbreakfee]').attr('value',totalbreakfastfee);
		console.log("체인지");
		console.log(breakfastfee);
		console.log(${breakfastfee });
	});
	
	$('#rexbed').on('change', function(){
		var rexbed=$("#rexbed").val();
		var bedfee=$("#bedfee").val();
		var totalbedfee=rexbed*bedfee;
		$('#totalbedfee').text(totalbedfee);
		$('input[name=totalbedfee]').attr('value',totalbedfee);
	});
	
	
	$(document).ready(function(){
/*		$('#insertOk').submit(function(e){
			e.preventDefault();
			var rid=0;
			var ramount=parseInt($("#ramount").val());
			var rcheckin=parseInt($("#rcheckin").val());
			var rcheckout=parseInt($("#rcheckout").val());
			var rresname=$("#engName").val();
			var rresemail=$("#emailcheck").val();
			var rresphone=$("#rresphone").val();
			var rexbreaknum=$("#rexbreaknum").val();
			var rexbed=$("#rexbed").val();
			var rexperson=$("#rexperson").val();
			var rcancel=$("#rcancel").val();
			var mid=$("#mid").val();
			var riid=parseInt($("#riid").val());
			var rordernum=0;
			console.log("눌렸냐");
			$.ajax({
				url:'/project/phj/reservation',
				data:JSON.stringify({"rid":rid,"rordernum":rordernum,"ramount":ramount,"rcheckin":rcheckin,"rcheckout":rcheckout,
					"rresname":rresname,"rresphone":rresphone,"rresemail":rresemail,"rexbreaknum":rexbreaknum,
					"rexbed":rexbed,"rexperson":rexperson,"rcancel":rcancel,"mid":mid,"riid":riid}),
				type:"post",
				dataType:"json",
				contentType:'application/json',
				success:function(data){
					console.log(data);
					if(data.code=='success'){
						console.log(data.code);
					}else{
						alert("실패");
					}
				}
			})
		}) */
		var aid=parseInt($("#aid").val());
		$.ajax({
			url:"/project/phj/accoinfo/"+aid,
			dataType:"json",			
			success:function(d){
				console.log(aid);
				let info="";
				
				info +="<h3>"+ d.aname +"</h3>"+ "<br>" +
				 "<img style='width:100%; height:100%;' src='${pageContext.request.contextPath }/resources/images/accommodations/"+d.amainimg+"'>" + "<br>" +
				 d.aphone + "<br>" +
				 d.aaddress;
				
				$("#hotelInfo").html(info);
			}
		})

		var riid=parseInt($("#riid").val());
		var ramount=parseInt($("#ramount").val());
		$.ajax({
			url:"/project/phj/roominfo/"+riid,
			dataType:"json",			
			success:function(data){
				console.log("방타입 : "+data.riroomtype);
				console.log("최대인원 : "+data.rimaxper);
				console.log("최소인원 : "+data.riminper);
				var rexperson=data.rimaxper-ramount;
				var extraperson=ramount-data.riminper
				console.log("인원추가 : " + rexperson);
				$('input[name=rimaxper]').attr('value',data.rimaxper);
				$('input[name=rexperson]').attr('max',rexperson);
				$('input[name=rexperson]').attr('value',extraperson < 0 ? 0 : extraperson);
				$('input[name=rexbreaknum]').attr('max',ramount);
				$('#roomtype').text(data.riroomtype);
				$('#service').text(data.riservice);
			}
		})
		$.ajax({
			url:"/project/phj/addfee/"+riid,
			dataType:"json",			
			success:function(e){
				console.log("인원추가 : "+e.personfee);
				console.log("침대추가 : "+e.bedfee);
				console.log("조식추가 : "+e.breakfastfee);
				var rexperson=$("#rexperson").val();
				$('input[name=personfee]').attr('value',e.personfee*rexperson);
				$('input[name=bedfee]').attr('value',e.bedfee);
				$('input[name=breakfastfee]').attr('value',e.breakfastfee);
			}
		})
	})
</script>
</html>