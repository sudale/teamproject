<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이럽 숙소등록</title>

<!-- 파비콘 이미지 -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/favicon.ico" />


<!------ Include the above in your HEAD tag ---------->


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=83bfuniegk&submodules=geocoder"></script>

</head>



<body>

	<div class="header">
		<jsp:include page="../includes/header.jsp" flush="true" />
	</div>


	<div class="hotel_reg_container">

		<form method="post" class="host_regform"
			action="${pageContext.request.contextPath }/hjy/hotelreq"
			enctype="multipart/form-data">


			<!--  -->
			<div class="join1">
			
				<h2 class="mem_title">숙소등록</h2>
				<div class="headline">호스트님, 🏠숙소정보를 입력해주세요.</div>


				<!-- 객실기본정보 start -->
				<div class="room_basic">
					<h3 class="room_title">객실 기본 정보</h3>

					<ul>
						<li class="join-field"><label for=""> <span
								class="point_color">*</span> 카테고리
						</label> <input type="text" name="acate" class="input" maxlength="12"
							lang="en" placeholder="카테고리를 입력해주세요."></li>


						<li class="join-field"><label for=""><span
								class="point_color">*</span>숙박업소명</label> <input type="text"
							name="aname" class="input" lang="en" placeholder="숙박업소명을 입력해주세요."></li>



						<li class="join-field"><label for=""><span
								class="point_color">*</span>전화번호</label> <input type="tel" name="aphone"
							class="input" maxlength="20" lang="en"
							placeholder="'-' 없이 전화번호를 입력해주세요."></li>

						<li class="room_map">

							<div class="add_input">
								<label for=""><span class="point_color">*</span>주소</label> 
								<input
									type="text" id="find" name="aaddress" placeholder="주소를 입력해주세요."> <input
									type="button" value="주소 검색" onclick="go()">
							</div>

							<div id="map" style="width: 100%; height: 400px;">
								<input type="hidden" name="aycoordi" id="xcoordi"> <input
									type="hideen" name="axcoordi" id="ycoordi">
							</div>
						</li>

						<li class="join-field"><label for=""> <span
								class="point_color">*</span>총객실수
						</label> <input type="text" name="atotalroom" class="input" lang="en"
							placeholder="총 객실수를 입력해주세요."></li>



						<li><label for=""><span class="point_color">*</span>숙소성급</label>

							<div class="star-rating space-x-4 mx-auto">
								<input type="radio" id="5-stars" name="agrade" value="5"
									v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
								<input type="radio" id="4-stars" name="agrade" value="4"
									v-model="ratings" /> <label for="4-stars" class="star">★</label>
								<input type="radio" id="3-stars" name="agrade" value="3"
									v-model="ratings" /> <label for="3-stars" class="star">★</label>
								<input type="radio" id="2-stars" name="agrade" value="2"
									v-model="ratings" /> <label for="2-stars" class="star">★</label>
								<input type="radio" id="1-star" name="agrade" value="1"
									v-model="ratings" /> <label for="1-star" class="star">★</label>
							</div></li>

						<li><label for=""><span class="point_color">*</span>숙소
								소개</label> <input type="text" name="adetail" class="input"
							placeholder="숙소 소개를 입력해주세요."></li>

						<li class="filebox">대표이미지1 <label for=""><div
									class="btn-upload">파일 업로드하기</div></label> 
									<input type="file"
							name="file" id="file" class="file input" multiple="multiple">
						</li>


					</ul>
				</div>
				<!-- 객실기본정보 end -->


				<!-- 객실 세부정보 start -->

				<div class="room_detail">
					<h3 class="room_title">객실 세부 정보</h3>
					<div id="roomInfoadd"></div>

					<input type="button" onclick="roomInfoAdd()" value="객실세부정보 추가"
						class="button">

					<script>
	  var cnt = 0;
	  function roomInfoAdd(){
		  for (var i = 0; i < cnt; i++) {
			$("#collapse"+i).attr('class','collapse')
			}
		  var roomInfo=`
		  <div id="c\${cnt}">
		    <div class="container" ><hr>
			  <div id="accordion">
			    <div class="card">
			   
			    <div class="card-header">
			    <a class="card-link" data-toggle="collapse" href="#collapse\${cnt}"> 접기/펼치기 </a>
			    <a href="javascript:deleteForm(\${cnt})" style="text-align: right; position: relative;">삭제</a>
		      
			    
			    <ul>
				<li class="join-field"><label for=""> <span
						class="point_color">*</span> 객실이름
				</label>
			   <input type="text" class="input" name="room_InfoVo[\${cnt}].riroomtype" placeholder="객실이름을 입력해주세요.">
			   
			    </ul>

		</div>
		
		
		    <div id="collapse\${cnt}" class="collapse show" data-parent="#accordion" >
		      <div class="card-body">
					
		      <ul>
				<li class="join-field">
				<label for=""> <span
						class="point_color">*</span> 객실수
				</label>
				
				<input type="text" name="room_InfoVo[\${cnt}].riroom" class="input" placeholder="객실수를 입력해주세요.">
				</li>
				
				<li class="join-field">
				<label for=""> <span
						class="point_color">*</span> 부가서비스
				</label>
				
						 <input type="text" name="room_InfoVo[\${cnt}].riservice" class="input" placeholder="부가서비스를 입력해주세요.">
				</li>
				
				
				<li class="join-field">
				<label for=""> <span
						class="point_color">*</span> 객실크기
				</label>
						<input type="text" name="room_InfoVo[\${cnt}].risize" class="input" placeholder="객실크기를 입력해주세요.">
				</li>
				
				<li class="join-field">
				<label for=""> <span
						class="point_color">*</span> 숙박 가능인원
				</label>
						<input type="text" name="room_InfoVo[\${cnt}].riminper" class="input" placeholder="숙박가능인원을 입력해주세요.">
				</li>
				
				<li class="join-field">
				<label for=""> <span
						class="point_color">*</span> 숙박최대인원
				</label>
						 <input type="text" name="room_InfoVo[\${cnt}].rimaxper" class="input" placeholder="숙박최대인원을 입력해주세요.">
				</li>
				
				<li class="join-field">
				<label for=""> <span
						class="point_color">*</span>성수기 1박 기본요금
				</label>
						 <input type="text" name="room_InfoVo[\${cnt}].ripeak" class="input" placeholder="성수기 1박 기본요금 입력해주세요.">
				</li>
				
				<li class="join-field">
				<label for=""> <span
						class="point_color">*</span>준성수기 1박 기본요금
				</label>
					<input type="text" name="room_InfoVo[\${cnt}].risemipeak" class="input" placeholder="준성수기 1박 기본요금 입력해주세요.">
				</li>
				
				<li class="join-field">
				<label for=""> <span
						class="point_color">*</span>비수기 1박 기본요금
				</label>
						<input type="text" name="room_InfoVo[\${cnt}].rioff" class="input" placeholder="비수기 1박 기본요금 입력해주세요.">
				</li>
				
			
				
				<li class="filebox"> <label for="file">대표이미지2</label> 
				<input type="file"
		name="file" id="file2" class="file input" multiple="multiple">
	      </li>
	   
				
	  	<li class="filebox">추가 이미지1 <label for="addfile1"><div
		class="btn-upload">파일 업로드하기</div></label> 
		<input type="file"
name="file" id="addfile1" class="file input" multiple="multiple">
  </li>
  
  
	<li class="filebox">추가 이미지2 <label for="addfile2"><div
	class="btn-upload">파일 업로드하기</div></label> 
	<input type="file"
name="file" id="addfile2" class="file input" multiple="multiple">
</li>


<h1 style="font-family: sans-serif; font-size:18px;">추가요금 설정</h1>

<li class="join-field">
<label for=""> <span
		class="point_color">*</span>인원 추가비용
</label>
		<input type="text" name="additional_feeVo[\${cnt}].afpersonnel" class="input">
</li>

<li class="join-field">
<label for=""> <span
		class="point_color">*</span>조식추가비용
</label>
		 <input type="text" name="additional_feeVo[\${cnt}].afbreakfast" class="input">
		   
</li>

<li class="join-field">
<label for=""> <span
		class="point_color">*</span>침대추가비용
</label>
		<input type="text" name="additional_feeVo[\${cnt}].afbed" class="input">
		   
</li>
			    </ul>
			    </div>
			    
		         </div>
				</div>
		       </div>
		      </div>
		     </div>
	        </div>
		  </div>`;
		  $("#roomInfoadd").append(roomInfo);
		  cnt++;
	  }
	  function deleteForm(delCount){
		  if($("#roomInfoadd").children().length!=1){
			  $("#c"+delCount).remove();
		  }else{
			  alert('최소 1개 이상의 세부정보가 포함되어야 합니다.')
		  }
	  }
  </script>

				</div>
				<!-- 객실 세부정보 end -->


				<!-- 객실 시즌정보 start -->

				<div class="room_detail">
					<h3 class="room_title">객실 시즌 정보</h3>



					<div id="periodInfoAdd"></div>
					<hr>
					<input type="button" onclick="periodInfoAdd()" value="시즌정보 추가"
						class="button">


					<script>
	  var periodCnt = 0;
	  function periodInfoAdd(){
		  for (var i = 0; i < periodCnt; i++) {
			$("#period"+i).attr('class','collapse')
		}
		  var roomInfo=`<div id="p\${periodCnt}"><div class="container" ><hr>
			  <div id="accordion">
			    <div class="card">
			    <div class="card-header">
			    <a class="card-link" data-toggle="collapse" href="#period\${periodCnt}"> 접기/펼치기 </a>
			    <a href="javascript:deleteperiodForm(\${periodCnt})" style="text-align: right; position: relative;">삭제</a><br>
		        
				<ul>
				<li class="join-field">
				<label for=""> <span
						class="point_color">*</span> 시즌 
				</label>
						<select name = "periodVo[\${periodCnt}].peseason" class="">
				    	<option value="비수기">비수기</option>
				    	<option value="준성수기">준성수기</option>
				    	<option value="성수기">성수기</option>
				    </select>
						</li>

					
					</ul>  
		</div>
		
		
		    <div id="period\${periodCnt}" class="collapse show" data-parent="#accordion">
		      <div class="card-body">
		      <ul>
		   
		      <li class="join-field"><label for=""> <span
				class="point_color">*</span> 시즌 시작날짜
	 	       </label>
				<input type="date" name="periodVo[\${periodCnt}].pestart" class="input">
				</li>
				
				<li class="join-field"><label for=""> <span
				class="point_color">*</span>시즌 끝날짜
	 	       </label>
				 <input type="date" name="periodVo[\${periodCnt}].peend" class="input">
				</li>
				
			   </ul>
		   
					</div>
					</div>
					</div>
					</div>
					</div>
		    </div>
		  </div>`;
		  $("#periodInfoAdd").append(roomInfo);
		  periodCnt++;
	  }
	  function deleteperiodForm(periodCnt){
		  if($("#periodInfoAdd").children().length!=1){
			  $("#p"+periodCnt).remove();
		  }else{
			  alert('최소 1개 이상의 시즌 정보가 포함되어야 합니다.')
		  }
		  
	  }
  </script>


				</div>
				<!-- 객실 시즌정보 end -->
			</div>


			<!--  -->



			<button type="submit">신청하기</button>
		</form>






	</div>
	<!-- hotel_reg_container end -->

	<div class="footer">
		<jsp:include page="../includes/footer.jsp" flush="true" />
	</div>

</body>



<script type="text/javascript">
$(document).ready(function(){
	roomInfoAdd();
	periodInfoAdd();
	  $('.input').focus(function(){
	    $(this).parent().find(".label-txt").addClass('label-active');
	  });

	  $(".input").focusout(function(){
	    if ($(this).val() == '') {
	      $(this).parent().find(".label-txt").removeClass('label-active');
	    };
	  });
	});
	
var xcoordi; 
var ycoordi; 

var map = new naver.maps.Map("map", {
	  center: new naver.maps.LatLng(37.3595316, 127.1052133),
	  zoom: 15,
	  mapTypeControl: true
	});

	var infoWindow = new naver.maps.InfoWindow({
	  anchorSkew: true
	});

	map.setCursor('pointer');

	function searchCoordinateToAddress(latlng) {

	  infoWindow.close();

	  naver.maps.Service.reverseGeocode({
	    coords: latlng,
	    orders: [
	      naver.maps.Service.OrderType.ADDR,
	      naver.maps.Service.OrderType.ROAD_ADDR
	    ].join(',')
	  }, function(status, response) {
	    if (status === naver.maps.Service.Status.ERROR) {
	      if (!latlng) {
	        return alert('ReverseGeocode Error, Please check latlng');
	      }
	      if (latlng.toString) {
	        return alert('ReverseGeocode Error, latlng:' + latlng.toString());
	      }
	      if (latlng.x && latlng.y) {
	        return alert('ReverseGeocode Error, x:' + latlng.x + ', y:' + latlng.y);
	      }
	      return alert('ReverseGeocode Error, Please check latlng');
	    }

	    var address = response.v2.address,
	        htmlAddresses = [];

	    if (address.jibunAddress !== '') {
	        htmlAddresses.push('[지번 주소] ' + address.jibunAddress);
	    }

	    if (address.roadAddress !== '') {
	        htmlAddresses.push('[도로명 주소] ' + address.roadAddress);
	    }

	    infoWindow.setContent([
	      '<div style="padding:10px;min-width:200px;line-height:150%;">',
	      '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
	      htmlAddresses.join('<br />'),
	      '</div>'
	    ].join('\n'));

	    infoWindow.open(map, latlng);
	  });
	}

	function searchAddressToCoordinate(address) {
	  naver.maps.Service.geocode({
	    query: address
	  }, function(status, response) {
/* 	    if (status === naver.maps.Service.Status.ERROR) {
	      if (!address) {
	        return alert('Geocode Error, Please check address');
	      }
	      return alert('Geocode Error, address:' + address);
	    } */

	    if (response.v2.meta.totalCount === 0) {
	      return alert('검색결과가 없습니다.');
	    }

	    var htmlAddresses = [],
	      item = response.v2.addresses[0],
	      point = new naver.maps.Point(item.x, item.y);
	      xcoordi = item.x;
	      ycoordi = item.y;

	    if (item.roadAddress) {
	      htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
	    }

	    if (item.jibunAddress) {
	      htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
	    }

	    if (item.englishAddress) {
	      htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
	    }

	    infoWindow.setContent([
	      '<div style="padding:10px;min-width:100px;line-height:150%;">',
	      '<h5 style="margin-top:5px;">검색 주소 : '+ address +'</h5><br />',
	      htmlAddresses.join('<br />'),
	      '</div>'
	    ].join('\n'));

	    map.setCenter(point);
	    infoWindow.open(map, point);
	  });
	}

	function initGeocoder() {
	  if (!map.isStyleMapReady) {
	    return;
	  }

	  map.addListener('click', function(e) {
	    searchCoordinateToAddress(e.coord);
	  });

	  $('#address').on('keydown', function(e) {
	    var keyCode = e.which;

	    if (keyCode === 13) { // Enter Key
	      searchAddressToCoordinate($('#address').val());
	    }
	  });

	  $('#submit').on('click', function(e) {
	    e.preventDefault();

	    searchAddressToCoordinate($('#address').val());
	  });

	  searchAddressToCoordinate('서울시');
	}

	naver.maps.onJSContentLoaded = initGeocoder;
	naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
	
	function go(){
		searchAddressToCoordinate($("#find").val())
		$("#xcoordi").val(xcoordi)
		$("#ycoordi").val(ycoordi)
	}
</script>



</html>