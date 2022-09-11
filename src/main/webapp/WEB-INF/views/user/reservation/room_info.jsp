<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 파비콘 이미지 -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/favicon.ico" />
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" type="text/css" />
	
	

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/js/jquery-ui.css">


<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=83bfuniegk&submodules=geocoder"></script>


</head>
<style>
.largeimg {
	border-radius: 10px;
	margin-right: 10px;
}

.amainimg {
	width: 100%;
	height: 100%;
	z-index: 1;
	border-radius: 10px;
}
</style>
<div class="header">
	<jsp:include page="../includes/header.jsp" />
</div>



<div class="sub_content">


	<!-- 이미지 크게 일단 하나 -->
	<div class="roomdetail_content">



		<div class="largeimgbox">

			<div class="largeimg">
				<img
					src="${pageContext.request.contextPath }/resources/images/accommodations/${accvo.amainimg}"
					class="amainimg">
			</div>

			<c:forEach var="vo" items="${list }" varStatus="status">
				<input type="hidden" value="${vo.aid }" id="aid">
				<c:if test="${riid eq vo.riid}">

					<div class="imgbox">
						<img
							src="${pageContext.request.contextPath }/resources/images/room_info/${vo.rimainimg }"
							id="smallimg1" class=""> <img
							src="${pageContext.request.contextPath }/resources/images/room_info/${vo.riextraimg1}"
							id="smallimg2" class="smallImg"> <img
							src="${pageContext.request.contextPath }/resources/images/room_info/${vo.riextraimg2}"
							id="smallimg3" class="smallImg">
					</div>

				</c:if>
				<c:if test="${riid ne vo.riid}">


					<div class="imgbox">
						<img
							src="${pageContext.request.contextPath }/resources/images/room_info/${vo.rimainimg }"
							id="smallimg1" class=""> <img
							src="${pageContext.request.contextPath }/resources/images/room_info/${vo.riextraimg1}"
							id="smallimg2" class="smallImg"> <img
							src="${pageContext.request.contextPath }/resources/images/room_info/${vo.riextraimg2}"
							id="smallimg3" class="smallImg">
					</div>



				</c:if>
			</c:forEach>


		</div>




		<div class="detail_info">

			<div class="view_title_wrap">


				<p class="anme">${accvo.aname}</p>
				<p class="agrade" lang="en">${accvo.agrade}등급
					<c:choose>
						<c:when test="${accvo.agrade == 5}">

							<span class="agrade_star"> <img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
								<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
								<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
								<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
								<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
							</span>
						</c:when>
						
						<c:when test="${accvo.agrade == 4}">
							<!-- <span class="star">★★★★☆</span> -->
							<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
							<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
							<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
						</c:when>
						<c:when test="${accvo.agrade==3 }">
							<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
							<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
							<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
						</c:when>
						<c:when test="${accvo.agrade==2 }">
							<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
							<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
						</c:when>
						<c:when test="${accvo.agrade==1 }">
							<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">

						</c:when>
						<c:when test="${accvo.agrade==0 }">
							<img class="star"
								src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
						</c:when>
						<c:otherwise>
							<span>☆☆☆☆☆test1</span>
						</c:otherwise>
					</c:choose>
				</p>

				<p class="adetail">${accvo.adetail}</p>
				


				<c:forEach var="vo" items="${list }" varStatus="status">
					<input type="hidden" value="${vo.aid }" id="aid">
					<c:if test="${riid eq vo.riid}">
						<div class="search_info">

							<h2 class="name"><i class="fa-solid fa-bed"></i></span> ${vo.riroomtype}</h2>

							
							<p class="subname"><i class="fa-solid fa-bell"></i><span class="serv">부가서비스</span>${vo.riservice}</p>

						</div>
					</c:if>


				</c:forEach>
			</div>




			<div class="price_wrap">

				<c:forEach var="vo" items="${list }" varStatus="status">
					<input type="hidden" value="${vo.aid }" id="aid">
				   
				     <c:if test="${riid eq vo.riid}">
						
						<div class="person_wrap">

							<p class="maxperson" lang="en"><i class="fa-solid fa-user-group"></i> 최대&nbsp;${vo.rimaxper}인</p>
							<p class="minperson" lang="en"><i class="fa-solid fa-user-large"></i>최소&nbsp;${vo.riminper}인</p>

							<p class="person" lang="en"><i class="fa-solid fa-user-check"></i> 현재&nbsp;${person}인</p>
						</div>

					</c:if>
				</c:forEach>


				<c:forEach var="vo" items="${list }" varStatus="status">
					<input type="hidden" value="${vo.aid }" id="aid">
					<c:if test="${riid eq vo.riid}">


						<p class="price" lang="en">
							요금세부정보 : ${vo.price} 
							<%-- <a href="javascript:void(0);" title="${vo.price}">요금세부정보</a> --%>
						</p>


						<p class="sumprice" lang="en">
							<span lang="en">₩</span>&nbsp;${vo.sum}
						</p>




						<!-- session에 id가 있는지 확인후 없을경우 로그인페이지로 -->
						<c:choose>
							<c:when test="${empty sessionScope.mid }">
							
								<input type="button" class="btn btn-primary" class="btn"
									value="바로예약" onclick="loginpage()">
							
							</c:when>
							<c:otherwise>
								<input type="button" class="btn btn-primary" class="btn"
									value="바로예약"
									onclick="location.href='${pageContext.request.contextPath }/phj/reservation?aid=${vo.aid}&riid=${vo.riid}&startday=${startday}&endday=${endday}&ramount=${person }&sum=${vo.sum }&roomnum=${roomnum}'">
							</c:otherwise>
						</c:choose>


					</c:if>
				</c:forEach>
			</div>
			<!-- price_wrap  -->


		</div>
		<!--detial info -->






		<div class="room_detailMap_wrap">
		
			<p class="aadress" lang="en"><i class="fa-solid fa-location-dot"></i> ${accvo.aaddress}</p>

			<div id="map" style="width: 100%; height: 400px;">
				<input type="text" name="aycoordi" id=${accvo.axcoordi }> <input
					type="text" name="axcoordi" id=${accvo.aycoordi }>
			</div>

		</div>



	</div>

</div>


<div class="footer">
	<jsp:include page="../includes/footer.jsp" />
</div>
<!-- <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCIFdez0Bx1XuNNQ0eIa12BjxqJ0gFO6eA&callback=initMap&region=kr"></script>
 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-ui.js"></script>



<script type="text/javascript">
	$(function(){
		list(1);
		//사진 호버설정
		var scrollValue=0;
		$(window).scroll(function () { 
			scrollValue = $(document).scrollTop(); 
		});
		$("#imgbox img").hover(function(){
			var top=$(this).offset().top;
			var left=$(this).offset().left;
			var height=$(this).height();
			var img=$(this).attr("src");
			let str="<img src="+img+" id='addimg'>";
			if(top-300>scrollValue){
				$(str).appendTo("#content").css({
					border: '3px solid black',
					position:'absolute',
					top:top-303+'px',
					left:left+'px',
					width:'400px',
					height:'300px'
				});
			}else{
				$(str).appendTo("#content").css({
					border: '3px solid black',
					position:'absolute',
					top:top+height+'px',
					left:left+'px',
					width:'400px',
					height:'300px'
				});
			}
		},function(){
			$("#addimg").remove();
		});
	
		//툴팁효과
		$(".price").tooltip(); 
	
	});

	
	
	//리뷰 총점
	var aid=$("#aid").val();
	var sstar=0;
	var sumstar=0;
	var cnt=0;
	$.ajax({
		url:"${pageContext.request.contextPath }/user/kjy/review2",
		data:{"aid":aid},
		dataType:"json",
		success:function(d){
			sumstar=d.SUMSTAR;
			cnt=d.CNT;
			if(sumstar==1){
				sstar="★☆☆☆☆"
			}else if(sumstar==2){
				sstar="★★☆☆☆";
			}else if(sumstar==3){
				sstar="★★★☆☆";
			}else if(sumstar==4){
				sstar="★★★★☆";
			}else if(sumstar==5){
				sstar="★★★★★";
			}
			let html="<p class='sumstart'>"+cnt+"개의 리뷰 전체평점: "+sstar+"</p>";
			$("#starbox").append(html);
		}
	});
	//리뷰페이지
	function list(pageNum){
		$("#totalreview").empty();
		$.ajax({
			url:"${pageContext.request.contextPath }/user/kjy/review1",
			data:{"aid":aid,"pageNum":pageNum},
			dataType:"json",
			success:function(data){
				$(data.result).each(function(i,d){
					let retitle=d.retitle;
					let recontent=d.recontent;
					let rerdate=d.rerdate;
					let restar=d.restar;
					let mid=d.mid;
					if(restar==1){
						restar="★☆☆☆☆"
					}else if(restar==2){
						restar="★★☆☆☆";
					}else if(restar==3){
						restar="★★★☆☆";
					}else if(restar==4){
						restar="★★★★☆";
					}else if(restar==5){
						restar="★★★★★";
					}
					let html="<div id='review'>"+
					"<p class='retitle'>"+retitle+"</p>"+
					"<p class='reviewid'>(작성자: "+mid+")</p>"+
					"<p class='recontent'>"+recontent+"</p>"+
					"<p class='restar'>평점: "+restar+"</p>"+
					"</div>";
					$("#totalreview").append(html);
				});
				//페이징 처리
				let startPage=data.startPageNum;
				let endPage=data.endPageNum;
				let pageCount=data.totalPageCount;
				let pageHtml="";
				if(startPage>5){
					pageHtml += "<a href='javascript:list("+ (startPage-1) + ")'>이전</a>";
				}
				if(pageNum==null){
					pageHtml += "<a href='javascript:reservationlist("+ 1 + ")'><span style='color:blue'>"+ 1 + "</span></a> ";
					startPage++;
				}
				for(let i=startPage;i<=endPage;i++){
					if(i==pageNum){
						pageHtml += "<a href='javascript:list("+ i + ")'><span style='color:blue'>"+ i + "</span></a> ";
					}else if(pageNum==null){
						pageHtml += "<a href='javascript:reservationlist("+ i + ")'><span style='color:gray'>"+ i + "</span></a> ";
					}else{
						pageHtml += "<a href='javascript:list("+ i + ")'><span style='color:gray'>"+ i + "</span></a> ";
					}	
				}
				if(endPage<pageCount){
					pageHtml += "<a href='javascript:list("+ (endPage+1) + ")'>다음</a>";
				}
				$("#page").html(pageHtml);
			}
		});
	}
	
	//로그인 페이지로 이동
	function loginpage(){
		alert("로그인 페이지로 이동합니다.");
		location.href='${pageContext.request.contextPath }/jhr/login';
	}
	
</script>


<script>
var map = new naver.maps.Map("map");
var jeju = new naver.maps.LatLng(${accvo.axcoordi}, ${accvo.aycoordi});
map.setCenter(jeju);
var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(${accvo.axcoordi}, ${accvo.aycoordi}),
    map: map
});
</script>
</html>