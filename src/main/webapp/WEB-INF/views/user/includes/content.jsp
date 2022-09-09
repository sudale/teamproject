<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>content.jsp</title>
<style>
.slide_des ul li:first-child {
	left: 0;
}

.slide_des ul li:nth-child(12) {
	left: -100%;
}

.slide_hotel ul li:first-child {
	left: 0;
}

.slide_hotel ul li:nth-child(10) {
	left: -100%;
}
</style>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" type="text/css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>


<script type="text/javascript">
	//fag 토글
	var acc_state = 0;
	function accodionAction(target) {
		//제이쿼리
		$(target).next().slideToggle(300);
	}
	
	$(function() {
		//인기 숙소 슬라이드
		$(".slider_des li:last").prependTo(".slider_des");
		$("#prevDes").click(function() {
			$(".slider_des").animate({
				left : 270
			}, function() {
				$(".slider_des li:last").prependTo(".slider_des")
				$(".slider_des").css({
					left : 0
				})
			});
		});
		$("#nextDes").click(function() {
			$(".slider_des").animate({
				left : -270
			}, function() {
				$(".slider_des li:first").appendTo(".slider_des")
				$(".slider_des").css({
					left : 0
				})
			});
		});
		
		
	
		// => 제주를 한 눈에
		$(".slider_jeju li:last").prependTo(".slider_jeju");
		$("#prevJeju").click(function() {
			$(".slider_jeju").animate({
				left : 259
			}, function() {
				$(".slider_jeju li:last").prependTo(".slider_jeju")
				$(".slider_jeju").css({
					left : 0
				})
			});
		});
		$("#nextJeju").click(function() {
			$(".slider_jeju").animate({
				left : -259
			}, function() {
				$(".slider_jeju li:first").appendTo(".slider_jeju")
				$(".slider_jeju").css({
					left : 0
				})
			});
		});

		var acc_state = 0;
		function accodionAction(target) {
			var panel = document.getElementsByClassName("faq_answer");
			var accordion_button = document
					.getElementsByClassName("faq_question_title");

			if (target.nextElementSibling.style.display == 'block') {
				target.nextElementSibling.style = "display:none;";
				target.classList.toggle("active");
			} else {
				for (i = 0; i < panel.length; i++) {
					panel[i].style.display = "none";
					accordion_button[i].classList.remove("active");
				}
				target.nextElementSibling.style = "display:block;";
				target.classList.toggle("active");
			}
		}

		function showID(id) {
			obj = document.getElementById(id);
			if (obj.style.display == "none")
				obj.style.display = "inline";
			else
				obj.style.display = "none";
		}

		$("#searchHotel").autocomplete({
			source : function(request, response) {
				let aname = $("#searchHotel").val();
				//console.log(aname);
				$.ajax({
					type : 'get',
					url : "/project/lhjcjy/ajax/auto",
					data : {
						"aname" : aname,
						"aaddress" : aname
					},
					dataType : "json",
					success : function(data) {
						console.log(data)
						response($.map(data.list, function(item) {
							return {
								label : item,
								value : item
							}
						}))
					}
				})
			},
			select : function(event, ui) {
				console.log(ui);
				console.log(ui.item.label);
				console.log(ui.item.value);
			},
			focus : function(event, ui) {
				return false; //한글 에러잡기
			},
			minLength : 1,//최소글자수
			autoFocus : true, //첫번째 항목 자동 포커스a 기본값 false
			classes : {
				"ui-autocomplete" : "highlight"
			},
			delay : 500, //검색창에 글자 쓰고 autocomplete되기까지 딜레이 시간ms)
			//disabled:true, //자동완성기능 끄기
			//position:{my:"right top", at:"right bottom"},
			close : function(event) {
				console.log(event);
			}
		}).autocomplete("instance")._renderItem = function(ul, item) { //요 부분이 UI를 마음대로 변경하는 부분
			return $("<li>") //기본 tag가 li로 되어 있음 
			.append("<div>" + item.value + "</div>") //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
			.appendTo(ul);
		};
		//체크인
		//버튼 클릭시 전날로 이동
		$(".date_btn_before")
				.on(
						'click',
						function() {
							let date = new Date($("#checkin").val());
							console.log(date);
							let year = date.getFullYear();
							let month = (date.getMonth() + 1) > 9 ? (date
									.getMonth() + 1) : '0'
									+ (date.getMonth() + 1);
							let day = (date.getDate() - 1) > 9 ? (date
									.getDate() - 1) : '0'
									+ (date.getDate() - 1);
							//console.log(year + month + day);
							$("#checkin").val(year + "-" + month + "-" + day);
						});
		//버튼 클릭시 다음날로 이동
		$(".date_btn_after")
				.on(
						'click',
						function() {
							let date = new Date($("#checkin").val());
							//console.log(date);
							let iyear = date.getFullYear();
							let imonth = (date.getMonth() + 1) > 9 ? (date
									.getMonth() + 1) : '0'
									+ (date.getMonth() + 1);
							let idate = (date.getDate() + 1) > 9 ? (date
									.getDate() + 1) : '0'
									+ (date.getDate() + 1);
							//console.log(ye + mo + da);
							$("#checkin").val(
									iyear + "-" + imonth + "-" + idate);
						});
		//체크아웃
		//버튼 클릭시 전날로 이동
		$(".date_btn_before_a")
				.on(
						'click',
						function() {
							let date = new Date($("#checkout").val());
							console.log(date);
							let year = date.getFullYear();
							let month = (date.getMonth() + 1) > 9 ? (date
									.getMonth() + 1) : '0'
									+ (date.getMonth() + 1);
							let day = (date.getDate() - 1) > 9 ? (date
									.getDate() - 1) : '0'
									+ (date.getDate() - 1);
							//console.log(year + month + day);
							$("#checkout").val(year + "-" + month + "-" + day);
						});
		//버튼 클릭시 다음날로 이동
		$(".date_btn_after_a")
				.on(
						'click',
						function() {
							let date = new Date($("#checkout").val());
							//console.log(date);
							let iyear = date.getFullYear();
							let imonth = (date.getMonth() + 1) > 9 ? (date
									.getMonth() + 1) : '0'
									+ (date.getMonth() + 1);
							let idate = (date.getDate() + 1) > 9 ? (date
									.getDate() + 1) : '0'
									+ (date.getDate() + 1);
							//console.log(ye + mo + da);
							$("#checkout").val(
									iyear + "-" + imonth + "-" + idate);
						});
	});
</script>



<div class="content">

	<div class="top_container">
		<div class="search_container">
			<form class="search_content" method="post"
				action="${pageContext.request.contextPath }/lhjcjyhjy/firstsearch">



				<div class="search_insert_container">

					<div class="search_insert city">
						<div class="search_city_display">
							<i class="fa-sharp fa-solid fa-magnifying-glass"></i>
							<div class="city_text">
								<input type="text" id="searchHotel" name="searchHotel"
									placeholder="도시 또는 호텔명을 검색해 보세요" />
							</div>
						</div>
					</div>


					<div class="search_insert date">
						<div class="search_date_display">
							<div class="date_check">
								<div class="date_text">

									<div class="date_innertext">
										<input type="date" id="checkin" name="checkin"
											value="${rcheckin }">
									</div>
								</div>
								<button class="date_btn_before" type="button">
									<svg viewBox="0 0 8 5">
														<path d="M7 1.053L4.027 4 1 1" stroke="currentColor"
											fill="none" style="user-select: auto;"></path>
													</svg>
								</button>
								<button class="date_btn_after" type="button">
									<svg viewBox="0 0 8 5">
														<path d="M7 1.053L4.027 4 1 1" stroke="currentColor"
											fill="none" style="user-select: auto;"></path>
													</svg>
								</button>
							</div>
							<div class="date_sep"></div>
							<div class="date_check">
								<div class="date_text">
									<div class="date_innertext">
										<input type="date" id="checkout" name="checkout"
											value="${rcheckout }">
									</div>
								</div>
								<button class="date_btn_before_a" type="button">
									<svg viewBox="0 0 8 5">
														<path d="M7 1.053L4.027 4 1 1" stroke="currentColor"
											fill="none" style="user-select: auto;"></path>
													</svg>
								</button>
								<button class="date_btn_after_a" type="button">
									<svg viewBox="0 0 8 5">
														<path d="M7 1.053L4.027 4 1 1" stroke="currentColor"
											fill="none" style="user-select: auto;"></path>
													</svg>
								</button>
							</div>
						</div>
					</div>

					<!-- date end -->

					<div class="search_insert countRoom">
						<div class="search_room_display">
							<i class="fa-regular fa-bell"></i>


							<div class="room_text">
								<input type="number" min="1" id="countRoom" name="countRoom"
									placeholder="객실수" />
							</div>

						</div>
					</div>
					<div class="search_insert countPeople">
						<div class="search_people_display">
							<i class="fa-regular fa-face-smile"></i>

							<div class="people_text">
								<input type="number" min="1" id="countPeople" name="countPeople"
									placeholder="인원수" />
							</div>

						</div>
					</div>
					<div class="search_insert button_container">
						<button class="search_insert_button" type="submit" id="search">
							<span class="search_icon_container"> <span
								class="search_icon"> <i
									class="fa-sharp fa-solid fa-magnifying-glass"></i>
							</span>
							</span>
						</button>
					</div>
				</div>
			</form>


		</div>
	</div>





	<div class="main_content">
		<div class="popular">
			<div class="popular_destination">
				
						<div class="popular_title">
							<h2>인기 숙소 👋️</h2>
						</div>

						<div class="popular_des_content">

							<div class="prev_arr_des" id="prevDes">
								<svg viewBox="0 0 9 16">
									<path
										d="M7.89 15.87l1.07-1.05L2.23 8l6.73-6.82L7.89.13.12 8l7.77 7.87"></path>
								</svg>
							</div>

							<div class="popular_des_container " id="slidebox_des">
								<div id="slide_des" class="">
									<ul class="slider_des">
										<li><a href="#"> <img
												src="${pageContext.request.contextPath}/resources/images/main/lodging03.jpg">
												<div class="popular_des_text">
													<h3>_그날의 하도</h3>
													<h4>대한민국</h4>
												</div>
										</a></li>
										<li><a href="#"> <img
												src="${pageContext.request.contextPath}/resources/images/main/lodging04.jpg">
												<div class="popular_des_text">
													<h3>_애월노천탕소길</h3>
													<h4>대한민국</h4>
												</div>
										</a></li>
										<li><a href="#"> <img
												src="${pageContext.request.contextPath}/resources/images/main/lodging05.jpg">
												<div class="popular_des_text">
													<h3>_제주드루앙조천점</h3>
													<h4>대한민국</h4>
												</div>
										</a></li>

										<li><a href="#"> <img
												src="${pageContext.request.contextPath}/resources/images/main/lodging01.jpg"
												alt="">
												<div class="popular_des_text">
													<h3>_[스테이 이] 사계절 온수 풀, 함덕해변
														감성숙소.jpg</h3>
													<h4>제주시</h4>
												</div>
										</a></li>


										<li><a href="#"> <img
												src="${pageContext.request.contextPath}/resources/images/main/lodging02.jpg">
												<div class="popular_des_text">
													<h3>귤한가</h3>
													<h4>대한민국</h4>
												</div>
										</a></li>
										<li><a href="#"> <img
												src="${pageContext.request.contextPath}/resources/images/main/lodging07.jpg">
												<div class="popular_des_text">
													<h3>_별하비스테이 별동</h3>
													<h4>대한민국</h4>
												</div>
										</a></li>

										<li><a href="#"> <img
												src="${pageContext.request.contextPath}/resources/images/main/lodging09.jpg">
												<div class="popular_des_text">
													<h3>_제주벨룸리조트</h3>
													<h4>대한민국</h4>
												</div>
										</a></li>

										<li><a href="#"> <img
												src="${pageContext.request.contextPath}/resources/images/main/lodging10.jpg">
												<div class="popular_des_text">
													<h3>감성스테이유키</h3>
													<h4>대한민국</h4>
												</div>
										</a></li>

										<li><a href="#"> <img
												src="${pageContext.request.contextPath}/resources/images/main/lodging06.jpg">
												<div class="popular_des_text">
													<h3>_북촌리멤버</h3>
													<h4>대한민국</h4>
												</div>
										</a></li>
										<li><a href="#"> <img
												src="${pageContext.request.contextPath}/resources/images/main/lodging08.jpg">
												<div class="popular_des_text">
													<h3>_제주이막</h3>
													<h4>대한민국</h4>
												</div>
										</a></li>



									</ul>
								</div>
							</div>
							<div class="next_arr_des" id="nextDes">
								<svg viewBox="0 0 9 16">
									<path
										d="M1.11 15.87L.04 14.82 6.77 8 .04 1.18 1.11.13 8.88 8l-7.77 7.87"></path>
								</svg>
							</div>
						</div>

					
			</div>


		
				<div class="popular_jeju_container">
					<div class="popular_title">
						<h2>제주를 한 눈에 ✈️</h2>
					</div>
					
					
					<div class="popular_jeju_content">
						
						
							<div class="prev_arr_jeju" id="prevJeju">
								<svg viewBox="0 0 9 16">
									<path
										d="M7.89 15.87l1.07-1.05L2.23 8l6.73-6.82L7.89.13.12 8l7.77 7.87"></path>
								</svg>
							</div>
							<div class="popular_jeju_ul_container" id="slidebox_hotel">
								
									<ul class="slider_jeju">
										<li>
												<a href="#"> <img
													src="${pageContext.request.contextPath}/resources/images/main/arbisoftimages-2077628-cornersuite2-385203.jpg">
													<div class="popular_jeju_text">
														<h3>정동진 썬크루즈</h3>
														<h4>강릉, 대한민국</h4>
													</div>
												</a>
											
										</li>
										<li>
												<a href="#"> <img
													src="${pageContext.request.contextPath}/resources/images/main/revato-1832279-12076490-406677.jpg">
													<div class="popular_jeju_text">
														<h3>랜딩관 제주신화월드 호텔앤리조트</h3>
														<h4>서귀포시, 대한민국</h4>
													</div>
												</a>
											
										</li>
										<li>
											
												<a href="#"> <img
													src="${pageContext.request.contextPath}/resources/images/main/8c35d8f78260b5c9.jpg">
													<div class="popular_jeju_text">
														<h3>세인트존스 호텔</h3>
														<h4>강릉, 대한민국</h4>
													</div>
												</a>
											
										</li>
										<li>
										
												<a href="#"> <img
													src="${pageContext.request.contextPath}/resources/images/main/ice-93102-68043206_3XL-448106.jpg">
													<div class="popular_jeju_text">
														<h3>아난티 힐튼</h3>
														<h4>부산, 대한민국</h4>
													</div>
												</a>
											
										</li>
										<li>
											<a href="#"> <img
													src="${pageContext.request.contextPath}/resources/images/main/revato-1374678-10966835-896878.jpg">
													<div class="popular_jeju_text">
														<h3>라마다 제주 시티 호텔</h3>
														<h4>제주시, 대한민국</h4>
													</div>
												</a>	
										</li>
										
										<li>
												<a href="#"> <img
													src="${pageContext.request.contextPath}/resources/images/main/revato-10104-12548353-322377.jpg">
													<div class="popular_jeju_text">
														<h3>제주 신라 호텔</h3>
														<h4>서귀포시, 대한민국</h4>
													</div>
												</a>
										</li>
										<li>
											
												<a href="#"> <img
													src="${pageContext.request.contextPath}/resources/images/main/revato-1338436-11139252-293730.jpg">
													<div class="popular_jeju_text">
														<h3>신라스테이 해운대</h3>
														<h4>부산, 대한민국</h4>
													</div>
												</a>
										</li>
										<li>
												<a href="#"> <img
													src="${pageContext.request.contextPath}/resources/images/main/hotelsdotcom-600178-0e927fd0_w-821565.jpg">
													<div class="popular_jeju_text">
														<h3>라마다 속초 호텔</h3>
														<h4>속초, 대한민국</h4>
													</div>
												</a>
										</li>
										
										
										<li>
												<a href="#"> <img
													src="${pageContext.request.contextPath}/resources/images/main/revato-6730-9988634-820594.jpg">
													<div class="popular_hotel_text">
														<h3>파라다이스 호텔 부산</h3>
														<h4>부산, 대한민국</h4>
													</div>
												</a>
										</li>
										<li>
												<a href="#"> <img
													src="${pageContext.request.contextPath}/resources/images/main/revato-1865922-12031689-093701.jpg">
													<div class="popular_jeju_text">
														<h3>스카이베이 호텔 경포</h3>
														<h4>강릉, 대한민국</h4>
													</div>
												</a>
										</li>
									</ul>
							</div>
							
							
							<div class="next_arr_jeju" id="nextJeju">
								<svg viewBox="0 0 9 16">
									<path
										d="M1.11 15.87L.04 14.82 6.77 8 .04 1.18 1.11.13 8.88 8l-7.77 7.87"></path>
								</svg>
							</div>
		
					</div>
				</div>
			</div>
		
			<div class="faq_container">
				<h6 lang="en"> 자주 묻는 질문 (FAQ)</h6>
				<div class="faq_question">
					<div class="faq_column">
						<div class="faq_column_container">
							<div class="faq_column_content">
								<div class="faq_question_title" onclick="accodionAction(this);">
									<div class="faq_question_text">회원등급 시스템은 어떻게 운영되나요?</div>
									<button class="faq_question_arr">
										<svg viewBox="0 0 10 10">
											<path fill="currentColor"
												d="M4.4,7.32a0.84,0.84,0,0,0,1.2,0L9.07,3.85A0.84,0.84,0,0,0,7.88,2.67L5,5.55,2.12,2.67A0.84,0.84,0,0,0,.93,3.85Z"
												style="user-select: auto;"></path>
										</svg>
									</button>
								</div>
								<div class="faq_answer">회원등급은 적립된 활동점수에 따라 결정됩니다. 
								활동점수는 아이럽 제주 에서 숙소 예약 시 적립됩니다. </div>
							</div>
						</div>

						<div class="faq_column_container">
							<div class="faq_column_content">
								<div class="faq_question_title" onclick="accodionAction(this);">
									<div class="faq_question_text">회원등급 업그레이드는 어떻게 하나요?</div>
									<button class="faq_question_arr">
										<svg viewBox="0 0 10 10">
											<path fill="currentColor"
												d="M4.4,7.32a0.84,0.84,0,0,0,1.2,0L9.07,3.85A0.84,0.84,0,0,0,7.88,2.67L5,5.55,2.12,2.67A0.84,0.84,0,0,0,.93,3.85Z"
												style="user-select: auto;"></path>
										</svg>
									</button>
								</div>
								<div class="faq_answer">매월, 아이럽제주에서 최근 12개월간 적립한 활동점수를 산정한 후, 이에 따른 회원등급 조정 여부를 결정합니다. 
								회원등급 조정은 다음 달 2일 이전까지 완료됩니다.</div>
							</div>
						</div>
					</div>
					<div class="faq_column">
						<div class="faq_column_container">
							<div class="faq_column_content">
								<div class="faq_question_title" onclick="accodionAction(this);">
									<div class="faq_question_text"> 회원 전용 혜택은 무엇입니까?</div>
									<button class="faq_question_arr">
										<svg viewBox="0 0 10 10">
											<path fill="currentColor"
												d="M4.4,7.32a0.84,0.84,0,0,0,1.2,0L9.07,3.85A0.84,0.84,0,0,0,7.88,2.67L5,5.55,2.12,2.67A0.84,0.84,0,0,0,.93,3.85Z"
												style="user-select: auto;"></path>
										</svg>
									</button>
								</div>
								<div class="faq_answer">지금 회원가입하고 아이럽 코인을 적립해보세요! 예약금액 전액을 아이럽코인만으로 결제할 수 있습니다.</div>
							</div>
						</div>

						<div class="faq_column_container">
							<div class="faq_column_content">
								<div class="faq_question_title" onclick="accodionAction(this);">
									<div class="faq_question_text"> 리워드 받고 떠나는 여행</div>
									<button class="faq_question_arr">
										<svg viewBox="0 0 10 10">
											<path fill="currentColor"
												d="M4.4,7.32a0.84,0.84,0,0,0,1.2,0L9.07,3.85A0.84,0.84,0,0,0,7.88,2.67L5,5.55,2.12,2.67A0.84,0.84,0,0,0,.93,3.85Z"
												style="user-select: auto;"></path>
										</svg>
									</button>
								</div>
								<div class="faq_answer">아이럽제주  로열티 프로그램을 통해, 어떤 비용도 없이 쉽고 빠르게 리워드를 적립해 보세요! 회원 전용 특가 혜택을 누리거나, 예약 시 적립한 트립코인을 사용해 즉시 할인도 받을 수 있습니다.
								회원 전용 할인 및 특가 혜택이 제공됩니다.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>