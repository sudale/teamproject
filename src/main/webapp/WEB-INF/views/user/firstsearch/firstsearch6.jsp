<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo/favicon.ico" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/content.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	type="text/css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>



<!-- 부트스트랩 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<!-- jquery ui -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- x,y좌표 위도,경도로 바꾸기 -->
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.5/proj4.js"></script>
지도추가
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=83bfuniegk&submodules=geocoder"></script>
 -->
<%-- <!-- css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/firstsearchmain.css">
 --%>


<style type="text/css">
@media screen and (min-width: 768px) {
	#adv-search {
		width: 500px;
		margin: 0 auto;
	}
	.dropdown.dropdown-lg {
		position: static !important;
	}
	.dropdown.dropdown-lg .dropdown-menu {
		min-width: 500px;
	}
}

.noresult {
	font-family: Brezel Grotesk, Helvetica Neue, Helvetica, Arial,
		sans-serif;
	font-weight: 400;
}

#sort {
	padding: 5px 5px 5px 5px;
	color: #00AEF0;
	border: 1px solid #00AEF0;
	border-radius: 3px;
}

.text-left {
	color: black;
}
</style>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript">
let aname;
function collectInfo(){
	let countRoom=$("#countRoom").val();
	let countPeople=$("#countPeople").val();
	$("#showInfo").val("객실"+countRoom+"인원"+countPeople);
}
$(function(){
	//자동완성 - 지윤
	$("#searchHotel").autocomplete({
		source:function(request,response){
			let aname=$("#searchHotel").val();
			$.ajax({
				type:'get',
				url:"/project/lhjcjy/ajax/auto",
				data:{"aname":aname,"aaddress":aname},
				dataType:"json",
				success:function(data){
					response(
						$.map(data.list,function(item){
							return{
								label:item,
								value:item
							}
						})		
					)
				}
			})
		},
		select:function(event,ui){
			console.log(ui);
			console.log(ui.item.label);
			console.log(ui.item.value);
		},
		focus:function(event,ui){
			return false; //한글 에러잡기
		},
		minLength:1,//최소글자수
		autoFocus:true, //첫번째 항목 자동 포커스a 기본값 false
		 classes: {    //잘 모르겠음
             "ui-autocomplete": "highlight"
         },
		delay:500, //검색창에 글자 쓰고 autocomplete되기까지 딜레이 시간ms)
		//disabled:true, //자동완성기능 끄기
		//position:{my:"right top", at:"right bottom"},
		close:function(event){
			console.log(event);
		}
	}).autocomplete( "instance" )._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
        return $( "<li>" )    //기본 tag가 li로 되어 있음 
        .append( "<div>" + item.value +"</div>" )    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
        .appendTo( ul );
 	};
 	
 	//숙소이름 자동완성 검색에 아무것도 안써져있을때 수행 -지영
 	$("#searchHotelname").focusout(function() {
 		if($(this).val()==""){
 			aname="";
 			callList();
 		}
 	});
 	//숙소이름 자동완성 검색 -지영
	$("#searchHotelname").autocomplete({
		source:function(request,response){
			let aname=$("#searchHotelname").val();
			$.ajax({
				type:'get',
				url:"/project/hjy/ajax/auto",
				data:{"aname":aname,"aaddress":aname,"firstaaddress":"${aaddress }"},
				dataType:"json",
				success:function(data){
					console.log(data)
					response(
						$.map(data.list,function(item){
							return{
								label:item,
								value:item
							}
						})		
					)
				}
			})
		},
		select:function(event,ui){
			aname =ui.item.value;
			console.log("aname",aname)
			callList();
		},
		focus:function(event,ui){
			return false; //한글 에러잡기
		},
		minLength:1,//최소글자수
		autoFocus:true, //첫번째 항목 자동 포커스a 기본값 false
		 classes: {    //잘 모르겠음
             "ui-autocomplete": "highlight"
         },
		delay:500, //검색창에 글자 쓰고 autocomplete되기까지 딜레이 시간ms)
		//disabled:true, //자동완성기능 끄기
		//position:{my:"right top", at:"right bottom"},
		close:function(event){
			//if(event.)
			//console.log("event",event)
		}
	}).autocomplete( "instance" )._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
        return $( "<li>" )    //기본 tag가 li로 되어 있음 
        .append( "<div>" + item.value +"</div>" )    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
        .appendTo( ul );
 	};
 	
 	//즐겨찾기 체크박스 클릭 시 실행되는 ajax
	$("#favorite ul li input").click(function() {
		if("${mid}"=="undifined" || "${mid}"==""){
        	var confirmcheck=confirm("로그인 하셔야 이용할 수 있는 서비스입니다. 로그인 하시겠습니까?")
        	if(confirmcheck	){
        		location.href = "${pageContext.request.contextPath }/jhr/login";
				$(this).prop('checked',false)
        	}else{
				$(this).prop('checked',false)
        	}
        }else{
			callList();
		}
	})
	
	//편의시설 체크박스 클릭 시 실행되는 ajax 
	$("#facilities input").click(function() {
 		callList()
	})
		
	//무료시설 체크박스 클릭 시 실행되는 ajax 
	$("#forFree input").click(function() {
 		callList()
	})
	
	//거리를 통한 검색의 select옵션이 변경되었을때 실행될 함수 
 	$("#locationamount").change(function() {
 		let grade;
		let star;
		//성급 몇인지 뽑아오는부분
 		for (var i =1; i <= 5; i++) {
 			if($("#grade"+i).attr('style')=="background-color: #FF346E opacity:0.8;"){
 				grade = $("#grade"+i).attr('id')
 				grade = grade.substring(5)
 				break;
 			};
		}
 		 //리뷰별점 몇인지 뽑아오는부분
 		for (var i =1; i <= 5; i++) {
 			if($("#star"+i).attr('style')=="background-color: #00AEF0 opacity:0.8;"){
 				star = $("#star"+i).attr('id')
 				star = star.substring(4)
 				break;
 			};
		}
 		
    	for (var i = 0; i < circle.length; i++) {
	    	circle[i].setMap(null);
	    	circle.shift();
		}
    	let templist= new Array(); 
		checklist(templist)
    	if($(this).val()=="none"){
    		list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star,aname)
    	}else{
    	makeCircle(locationmap,locationmarker.getPosition(),$(this).val());
		list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[0]],locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[2]],$(this).val(),grade,star,aname);
    	}
		
    })
    
	//지도로 보기 클릭시 효과 
	$("#gomap").click(function() {
		let grade;
		let star;
		//성급 몇인지 뽑아오는부분
 		for (var i =1; i <= 5; i++) {
 			if($("#grade"+i).attr('style')=="background-color: #00AEF0; opacity:0.8;"){
 				grade = $("#grade"+i).attr('id')
 				grade = grade.substring(5)
 				break;
 			};
		}
 		//리뷰별점 몇인지 뽑아오는부분
 		for (var i =1; i <= 5; i++) {
 			if($("#star"+i).attr('style')=="background-color: #00AEF0; opacity:0.8;"){
 				star = $("#star"+i).attr('id')
 				star = star.substring(4)
 				break;
 			};
		}
	  if($("#gomap").html()=="지도로 보기"){
		  $("#gomap").html("돌아가기")
		  $("#location").attr('class','collapse')
		  $("#list").empty();
		  
		  let html = "<div id='gomapchange' style='width:100%; height:1050px;'></div>";
		  $("#list").append(html);
		  let templist= new Array(); 
		  checklist(templist)
		  gomapchange(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star)
		}else{
	    	  $("#gomap").html("지도로 보기")
	    	  $("#location").attr('class','collapse show')
			  $("#list").empty();
	    	  let templist= new Array(); 
			  checklist(templist)
			  if($("#locationamount").val()!="none"){
				  list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[0]],locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[2]],$("#locationamount").val(),grade,star,aname)
			  }else{
				  list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star,aname);
			  }
	  	}
	})
 	
 	//전체 정렬
	$("#sort").change(function(){
		let sort = $(this).val();
		let templist = new Array();
		checklist(templist)
 		callList()
	})
	
   	// 평점 div박스
  	$(".star_section_field").click(function(){
		let restar = $(this).attr("id");
		$(this).siblings().attr('style','background-color: none');
		for (var i =0; i <= 5-restar.substring(4); i++) {
			$("#star"+(Number(restar.substring(4))+i)).attr('style','background-color: #00AEF0; opacity:0.8;');
		}
	 	callList()
	});
   	
	/* // 성급 div박스
 	$(".grade_section_field").click(function(){
		let agrade = $(this).attr("id");
		$(this).siblings().attr('style','background-color: #FF346E');
		for (var i =0; i <= 6-agrade.substring(5); i++) {
			$("#grade"+(Number(agrade.substring(5))+i)).attr('style','background-color: #00AEF0; opacity:0.8;');
		}
		callList();
	});		
	 */
	
  		
  	//슬라이더 관련 실행
	slider(${minmax.minsum},${minmax.maxsum})
    $('#count_min').change(function(){
    	$('#slider').slider('values',0,$(this).val());
   	})
   	$('#count_max').change(function(){
    	$('#slider').slider('values',1,$(this).val());
   	})
});

//가격 range slider 
function slider(minsum,maxsum){
 $('#slider').slider({
     orientation:'horizontal',
      min:Number(minsum),
      max:Number(maxsum),
      step:10000,
      range:true,
      values:[minsum,maxsum],
      create:function(e, ui){ //text 박스에 value값 나타냄
          $('#count_min').val(minsum);
          $('#count_max').val(maxsum);
      },
      change:function(e,ui){ //value 가 change 되었을 때
          $('#count_min').val(ui.values[0]);
          $('#count_max').val(ui.values[1]);
          
  		let minprice=$("#count_min").val();
  		let maxprice=$("#count_max").val();
  		
  		$("#accommList").empty();
  		
  		callList();
      }
      
      
  });
}

//조건에 따른 list내역(지도로보기,리스트보기) 호출을 위한 반복function
function callList(){
	let grade;
	let star;
	let templist= new Array(); 
	checklist(templist);
	//성급 몇인지 뽑아오는부분
		for (var i =1; i <= 5; i++) {
			if($("#grade"+i).attr('style')=="background-color: #00AEF0; opacity:0.8;"){
				grade = $("#grade"+i).attr('id')
				grade = grade.substring(5)
				break;
			};
	}
		//리뷰별점 몇인지 뽑아오는부분
		for (var i =1; i <= 5; i++) {
			if($("#star"+i).attr('style')=="background-color: #00AEF0; opacity:0.8;"){
				star = $("#star"+i).attr('id')
				star = star.substring(4)
				break;
			};
	}
	//인근반경 거리가 상관없음이 아닐때
	if($("#locationamount").val()!="none"){
		//지도로보기로 지도가 펼쳐져 있을때				
	 	if($("#gomap").html()=="돌아가기"){
			gomapchange(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star,aname)
		//리스트가 나올때				
	 	}else{
			list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[0]],locationmarker.getPosition()[Object.keys(locationmarker.getPosition())[2]],$("#locationamount").val(),grade,star,aname)
	 	}
	}else{
		if($("#gomap").html()=="돌아가기"){
			gomapchange(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star,aname)
	 	}else{
			list(templist,$("#count_min").val(),$("#count_max").val(),$("#sort").val(),null,null,null,grade,star,aname)
	 	}
	}
}


//지도로 보기 ajax받아와서 뿌려주기 
function gomapchange(facilities,minprice,maxprice,sort,axcoordi,aycoordi,distance,/* agrade,restar */){
	  let gomapchange = new naver.maps.Map('gomapchange', {
          center: new naver.maps.LatLng(ycoordi, xcoordi),
          zoom: 14
      })
	var latlngs = [];
    var contentString=[];
    var fac = "";
    for (var i = 0; i < facilities.length; i++) {
		fac+=facilities[i];
		if(i !=facilities.length-1){
			fac+=",";
		}
	}
	  /* $.ajax({
			url:"${pageContext.request.contextPath }/hjy/firstsearchajax",
			 async: false,
			 data:{"searchHotel":"${aaddress }","checkin":"${rcheckin }","checkout":"${rcheckout }","countRoom":"${countRoom }","countPeople":"${rimaxper}",
					"fac":fac,"minprice":minprice,"maxprice":maxprice,"sort":sort,"xcoordi":xcoordi,"ycoordi":ycoordi,"distance":distance,"restar":restar,"agrade":agrade,"autoaname":aname},
			type:"get",
			dataType:"json",
			success:function(data){
				if(data.code=='success'){
		        	for (var i = 0; i < data.list.length; i++) {
		        		let star="";
						if(data.list[i].restar == 5){
							star = "★★★★★";
						}else if(data.list[i].restar == 4){
							star="★★★★☆";
						}else if(data.list[i].restar == 3){
							star="★★★☆☆";
						}else if(data.list[i].restar == 2){
							star = "★★☆☆☆";
						}else if(data.list[i].restar == 1){
							star = "★☆☆☆☆";
						}else if(data.list[i].restar == 0){
							star="☆☆☆☆☆";
						}
		        		if(data.list[i].axcoordi>100){
							let listxy = changeXY(data.list[i].axcoordi,data.list[i].aycoordi);
							latlngs.push(new naver.maps.LatLng(listxy[0], listxy[1]));
		        		}else{
							latlngs.push(new naver.maps.LatLng(data.list[i].axcoordi, data.list[i].aycoordi));
		        		}
						if(data.list[i].amainimg==null){
							  let html = '<div class="iw_inner" style="padding:3px;">'+'<h5>'+star+'</h5>'+'<h3>'+data.list[i].aname+'</h3>'+'<h5>';
		    		          if(data.list[i].agrade!=null){
			    		          html+=data.list[i].agrade+'성급</h5>'
		    		          }
		    		          html+='<p>'+data.list[i].aaddress
		    		          +'<br> <img src="${pageContext.request.contextPath }/resources/images/accommodations/220i0z000000mulfw433F_Z_1080_808_R5_D.jpg" width="300" height="250" /><br>'
		    		          +'전화번호: '+data.list[i].aphone+' | 가격: '+data.list[i].amountsum+'원<br/>'
		    		          +"<br><button class='btn btn-outline-primary' onclick=\""
							  +"location.href='${pageContext.request.contextPath }/user/kjy/room_info?aid="+data.list[i].aid+"&riid="+data.list[i].riid
							  +"&person=${rimaxper}&roomnum=${countRoom}&startday=${rcheckin}+endday=${rcheckout}'\">예약하기</button>"
							  +'</p></div>'
							contentString.push(html)
					   }else{
						   let html = '<div class="iw_inner"style="padding:3px;">'+'<h5>'+star+'</h5>'+'<h3>'+data.list[i].aname+'</h3>'+'<h5>';
						   if(data.list[i].agrade!=null){
			    		          html+=data.list[i].agrade+'성급</h5>'
		    		          }
						   html+='<p>'+data.list[i].aaddress
		    		          +'<br /> <img src="${pageContext.request.contextPath }/resources/images/accommodations/'+data.list[i].amainimg+'"width="300" height="250"/><br />'
		    		          +'<br>전화번호: '+data.list[i].aphone+' <br><br> 가격: '+data.list[i].amountsum+'원<br/>'
		    		          +"<br><button class='btn btn-outline-primary' onclick=\""
							  +"location.href='${pageContext.request.contextPath }/user/kjy/room_info?aid="+data.list[i].aid+"&riid="+data.list[i].riid
							  +"&person=${rimaxper}&roomnum=${countRoom}&startday=${rcheckin}&endday=${rcheckout}'\">예약하기</button>"
							  +'</p></div>'
						   contentString.push(html)
						   }
    		        	}
					}
				}
		  })	
 */
		  var markerList = [];
		  for (var i=0, ii=latlngs.length; i<ii; i++) {
	          let marker = new naver.maps.Marker({
	              position: latlngs[i],
	              map: gomapchange
	          });
	          marker.set('seq', i);
	          
		      markerList.push(marker);
		      
		      marker.addListener('click', marckerClick);
		      
		      marker = null;
	  }

	  function marckerClick(e){
		  var marker = e.overlay;
	      seq = marker.get('seq');
	      var infowindow = new naver.maps.InfoWindow({
		      content: contentString[seq],
		      maxWidth: 200,
		      backgroundColor: "#eee",
		      borderColor: "#00AEF0",
		      borderWidth: 5,
		      anchorSize: new naver.maps.Size(30, 30),
		      anchorSkew: true,
		      anchorColor: "#eee",
		      pixelOffset: new naver.maps.Point(20, -20)
		  	});
	      
		  if (infowindow.getMap()) {
	          infowindow.close();
	      } else {
	          infowindow.open(gomapchange, marker);
	      }
	  }  
 }

//선호호텔체인,부대시설,무료시설 체크박스 선택되어있는지 체크해주는 function 
function checklist(templist){
	$("#facilities input").each(function(){
		if( $(this).is(":checked") == true ){
	      	var temId = $(this).attr('id');
	      	templist.push(temId);
		}
		});
	$("#forFree input").each(function(){
		if( $(this).is(":checked") == true ){
	      	var temId = $(this).attr('id');
	      	templist.push(temId);
		}
		});
	$("#favorite input").each(function(){
		if( $(this).is(":checked") == true ){
	      	var temId = $(this).attr('id');
	      	templist.push(temId);
		}
		});
}

//좌표(X,Y) 위도경도로 변환함수 
function changeXY(xcoordi,ycoordi){
	let xy=[];
	if(xcoordi*1>100){
		// point array 1
	    var point1 = [xcoordi*1, ycoordi*1]
	    var firstProjection = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs"; // from
	    var secondProjection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"; // to
	   
	    // #1. 변환한 위도 경도 값 저장
	    var lonAndLat1 = proj4(firstProjection, secondProjection, point1);// from 경위도
		xy.push(lonAndLat1[1])
		xy.push(lonAndLat1[0])
		console.log('변환계 사용')
	}else{
		xy.push(xcoordi)
		xy.push(ycoordi)
		console.log('변환계 사용안함')
	}
	return xy;
}

//위도 경도를 통해 거리 구하는 함수 -지영
function isdistancein(coords1, coords2) {
	var isdistanceinlat1 = coords1[0];
	var isdistanceinlon1 = coords1[1];
	var isdistanceinlat2 = coords2[0];
	var isdistanceinlon2 = coords2[1];
	function deg2rad(deg) {
	    return deg * (Math.PI/180)
	}
	var r = 6371; //지구의 반지름(km)
	var dLat = deg2rad(isdistanceinlat2-isdistanceinlat1);
	var dLon = deg2rad(isdistanceinlon2-isdistanceinlon1);
	var a = Math.sin(dLat/2) * Math.sin(dLat/2) + 
	Math.cos(deg2rad(isdistanceinlat1)) * Math.cos(deg2rad(isdistanceinlat2)) * 
	Math.sin(dLon/2) * Math.sin(dLon/2);
	var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	var d = r * c; // Distance in km
	return Math.round(d*1000);
}

//위의 검색조건,왼쪽 검색조건에 맞는 list뽑아주기 ajax
function list(facilities,minprice,maxprice,sort,xcoordi,ycoordi,distance,agrade,restar){
	let changecnt=0;
   $.ajax({
		url:"${pageContext.request.contextPath }/hjy/firstsearchajax",
		traditional :true,
		data:{"searchHotel":"${aaddress }","checkin":"${rcheckin }","checkout":"${rcheckout }","countRoom":"${countRoom }","countPeople":"${rimaxper}",
			"facilities":facilities,"minprice":minprice,"maxprice":maxprice,"sort":sort,"xcoordi":xcoordi,"ycoordi":ycoordi,"distance":distance,"restar":restar,"agrade":agrade,"autoaname":aname},
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.code=='success'){
			   $("#list").empty();
			   if(data.list.length==0){
				   $("#list").html("<div style='text-align: center;'><img style='width:200px;height:200px;'src = 'https://content.r9cdn.net/res/images/horizon/hotels/results/brands/hotelscombined/max-magnifying-glass.png?v=2ce4b5af1d8bd19e6264dabe7ceb3c51793b5f87&cluster=5'><br><Br><h3>조건에 맞는 호텔이 없습니다</h3></div>");
			   }else{
				   for (var i = 0; i < data.list.length; i++) {
					   let html = "";
					   //xcoordi값이 있을때
					   if(xcoordi){
						   	let testxy = changeXY(data.list[i].axcoordi,data.list[i].aycoordi)
						   //기준좌표
						   	let refcoordi = [xcoordi, ycoordi];
						   //db에서 불러온 좌표
							dbcoordi = [testxy[0],testxy[1]];
							console.log("숙소이름: "+data.list[i].aname);
							console.log("두개사이의 거리: "+isdistancein(refcoordi, dbcoordi),"m");
							console.log("distance: "+distance)
							
							if(isdistancein(refcoordi, dbcoordi)<=distance){
								   	html+="<div class='row mb-3'>";
									
									html+="<div class='row'>";
									html+="<div class='col-md-3'>";
									if(data.list[i].amainimg==null){
										html+="<img src='${pageContext.request.contextPath }/resources/images/accommodations/220i0z000000mulfw433F_Z_1080_808_R5_D.jpg' width='300' height='250'>";
									}else{
										html+="<img src='${pageContext.request.contextPath }/resources/images/accommodations/"+data.list[i].amainimg+"'width='300' height='250'>";
									}
									html+="</div>";
									
									html+="<div class='col-md-6'>";
									html+="<h3>"+data.list[i].aname+"</h3>";
									html+="<small>"+data.list[i].aaddress+"</small>";
									html+="<div id='map"+changecnt+"' style='width: 200px; height: 200px;'>지도넣기"
									html+="<input type='hidden' id='axcoordi"+changecnt+"' value="+data.list[i].axcoordi+">";
									html+="<input type='hidden' id='aycoordi"+changecnt+"' value="+data.list[i].aycoordi+">";
									html+="</div>";
									html+="</div>";
									
									
									/* html+="<div class='col-md-3' style='padding-left: 70px;'>";
									if(data.list[i].agrade !=null){
										html+="<h3>"+data.list[i].agrade+"성급</h3>";
									}
									html+="<h3>";
									if(data.list[i].restar==5){
										html+="★★★★★";
									}else if(data.list[i].restar==4){
										html+="★★★★☆";
									}else if(data.list[i].restar==3){
										html+="★★★☆☆";
									}else if(data.list[i].restar==2){
										html+="★★☆☆☆";
									}else if(data.list[i].restar==1){
										html+="★☆☆☆☆";
									}else{
										html+="☆☆☆☆☆";
									}
									html+="</h3>"; */
									html+="<h4>"+data.list[i].amountsum+"원</h4>";
									html+="<button class='btn btn-outline-primary' onclick=\"";
									html+="location.href='${pageContext.request.contextPath }/user/kjy/room_info?aid="+data.list[i].aid+"&riid="+data.list[i].riid+
											+"&person=${rimaxper}&roomnum=${countRoom}&startday=${rcheckin}&endday=${rcheckout}"
									html+="'\">예약하기</button>";
									html+="</div>";
									html+="</div>";
									html+="</div>";
									html+="</div>";
									html+="</div>";
									html+="</div>";
									changecnt++;
							   }
				   			}else{
								html+="<div class='row mb-3'>";
								
								html+="<div class='card'>";
								html+="<div class='card-body'>";
								html+="<div class='row'>";
								html+="<div class='col-md-3'>";
								if(data.list[i].amainimg==null){
									html+="<img src='${pageContext.request.contextPath }/resources/images/accommodations/220i0z000000mulfw433F_Z_1080_808_R5_D.jpg' width='300' height='250'>";
								}else{
									html+="<img src='${pageContext.request.contextPath }/resources/images/accommodations/"+data.list[i].amainimg+"'width='300' height='250'>";
								}
								html+="</div>";
								html+="<div class='col-md-6'>";
								html+="<h3>"+data.list[i].aname+"</h3>";
								html+="<small>"+data.list[i].aaddress+"</small>";
								html+="<div id='map"+i+"' style='width: 200px; height: 200px;'>지도넣기"
								html+="<input type='hidden' id='axcoordi"+i+"' value="+data.list[i].axcoordi+">";
								html+="<input type='hidden' id='aycoordi"+i+"' value="+data.list[i].aycoordi+">";
								html+="</div>";
								html+="</div>";
								/* html+="<div class='col-md-3'style='padding-left: 70px;'>";
								if(data.list[i].agrade !=null){
									html+="<h5>"+data.list[i].agrade+"성급</h5>";
								}
								html+="<h3>"
								if(data.list[i].restar==5){
									html+="★★★★★"
								}else if(data.list[i].restar==4){
									html+="★★★★☆"
								}else if(data.list[i].restar==3){
									html+="★★★☆☆"
								}else if(data.list[i].restar==2){
									html+="★★☆☆☆"
								}else if(data.list[i].restar==1){
									html+="★☆☆☆☆"
								}else{
									html+="☆☆☆☆☆"
								}
								html+="</h3>" */
								html+="<h4>"+data.list[i].amountsum+"원</h4>";
								html+="<button class='btn btn-outline-primary' onclick=\"";
								html+="location.href='${pageContext.request.contextPath }/user/kjy/room_info?aid="+data.list[i].aid+"&riid="+data.list[i].riid;
								html+="&person=${rimaxper}&roomnum=${countRoom}&startday=${rcheckin}&endday=${rcheckout}"
								html+="'\">예약하기</button>";
								html+="</div>";
								html+="</div>";
								html+="</div>";
								html+="</div>";
								html+="</div>";
								html+="</div>";
						   	}
					   $("#list").append(html);
				   }
			   }
				    if(changecnt!=0){
					    for (var i = 0; i < changecnt; i++) {
					  		mainMapList(i);
					   	}
					}else{
						for (var i = 0; i < data.list.length; i++) {
						    mainMapList(i);
						}
				   	}
				}else{
					alert("fail")
				}
			}
		})
	}

//db에 받아온 주소를 좌표로 변환해서 xcoordi, ycoordi에 저장하기+왼쪽 거리검색의 센터를 해당 좌표로 지정 -지영
function searchAddressToCoordinate(address) {
	naver.maps.Service.geocode({
	  query: address
	}, function(status, response) {
	  if (status === naver.maps.Service.Status.ERROR) {
	    if (!address) {
	      return alert('Geocode Error, Please check address');
	    }
	    return alert('Geocode Error, address:' + address);
	  }
/*
	  if (response.v2.meta.totalCount === 0) {
	    return alert('검색결과가 없습니다.');
	  }
*/
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
	locationmap.setCenter(point);
	});
}

//찍힌 좌표와 선택한 반경에 따라 원 그려주기
function makeCircle(locationmap,locationposition,size){
circle.push(
	new naver.maps.Circle({
        map: locationmap,
        center: locationposition,
        radius: size,//m단위의 반지름 입력
        fillColor: '#00AEF0',
        fillOpacity: 0.8
    })
);
}

//리스트에 호텔 위치에 맞는 지도 표시하기 -지영
function mainMapList(index){
	var mainmaplist = new Array();
	mainmaplist.push(index);
	if($("#axcoordi"+index).val()*1>100){
	    // point array 1
	    var point1 = [$("#axcoordi"+index).val()*1, $("#aycoordi"+index).val()*1]
	    var firstProjection = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs"; // from
	    var secondProjection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"; // to
	   
	    // #1. 변환한 위도 경도 값 저장
	    var lonAndLat1 = proj4(firstProjection, secondProjection, point1);// from 경위도
		
		var mainmap = new naver.maps.Map('map'+index, {
		   center: new naver.maps.LatLng(lonAndLat1[1], lonAndLat1[0]),
		    zoom: 15
		});
		
		var testmarker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(lonAndLat1[1],lonAndLat1[0]),
		    map: mainmap
		});
	}
	else{
		var hotelDetailMap = new naver.maps.Map('map'+index, {
		    center: new naver.maps.LatLng($("#axcoordi"+index).val(), $("#aycoordi"+index).val()),
		    zoom: 15
		});
	
		var hotelDetailmarker = new naver.maps.Marker({
		    position: new naver.maps.LatLng($("#axcoordi"+index).val(), $("#aycoordi"+index).val()),
		    map: hotelDetailMap
		});
	}
}
//체크인 날짜이동
function inMoveBefore(){ //버튼 클릭시 하루 전날로 이동
	let date = new Date($("#checkin").val());
	//console.log(date);
	let year = date.getFullYear();
	let month = (date.getMonth()+1) > 9 ? (date.getMonth()+1) : '0' + (date.getMonth()+1);
	let day = (date.getDate()-1) > 9 ? (date.getDate()-1) : '0' + (date.getDate()-1);
	//console.log(year + month + day);
	$("#checkin").val(year + "-" + month + "-" + day);	
}
function inMoveAfter(){ //버튼 클릭시 다음날로 이동
	let date = new Date($("#checkin").val());
	//console.log(date);
	let iyear = date.getFullYear();
	let imonth = (date.getMonth()+1) > 9 ? (date.getMonth()+1) : '0' + (date.getMonth()+1);
	let idate = (date.getDate()+1) > 9 ? (date.getDate()+1) : '0' + (date.getDate()+1);
	//console.log(ye + mo + da);
	$("#checkin").val(iyear + "-" + imonth + "-" + idate);	
}
//체크아웃 날짜이동
function outMoveBefore(){ //버튼 클릭시 하루 전날로 이동
	let date = new Date($("#checkout").val());
	let year = date.getFullYear();
	let month = (date.getMonth()+1) > 9 ? (date.getMonth()+1) : '0' + (date.getMonth()+1);
	let day = (date.getDate()-1) > 9 ? (date.getDate()-1) : '0' + (date.getDate()-1);
	$("#checkout").val(year + "-" + month + "-" + day);	
}

function outMoveAfter(){ //버튼 클릭시 다음날로 이동
	let date = new Date($("#checkout").val());
	//console.log(date);
	let oyear = date.getFullYear();
	let omonth = (date.getMonth()+1) > 9 ? (date.getMonth()+1) : '0' + (date.getMonth()+1);
	let odate = (date.getDate()+1) > 9 ? (date.getDate()+1) : '0' + (date.getDate()+1);
	//console.log(oyear + omonth + odate);
	$("#checkout").val(oyear + "-" + omonth + "-" + odate);
}
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="../includes/header.jsp" flush="true" />
	</div>




	<div class="sub_content">

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
										value="${aaddress}" />
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
										value="${countRoom }" />
								</div>

							</div>
						</div>
						<div class="search_insert countPeople">
							<div class="search_people_display">
								<i class="fa-regular fa-face-smile"></i>

								<div class="people_text">

									<input type="number" min="1" id="countPeople"
										name="countPeople" value="${rimaxper }" />

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
		<!-- top_container end -->






		<!--검색 결과나오는  콘텐츠 부분  -->


		<div class="mb-5 room_content">

			<div class="col-md-9 view_Rlist_wrap" id="list">

				<c:choose>
					<c:when test="${list.size()==0}">
						<h3>${nullmsg}</h3>
					</c:when>
					<c:otherwise>
						<c:forEach var="vo" items="${list }" varStatus="status">
							<div class="row mb-3 view_Rlist">

								<!-- <div class="card">
											<div class="card-body"> -->

								<div class=" view_Rimg">
									<c:choose>
										<c:when test="${vo.amainimg eq null or vo.amainimg==''}">
											<img
												src="${pageContext.request.contextPath }/resources/images/room_info/220i0z000000mulfw433F_Z_1080_808_R5_D.jpg">
										</c:when>
										<c:otherwise>
											<img
												src="${pageContext.request.contextPath }/resources/images/room_info/${vo.amainimg }">
										</c:otherwise>
									</c:choose>
								</div>


								<div class="col-md-6 view_Rinfo">

									<div class="room_Listtop">

										<h3 class="view_Rtitle">${vo.aname }</h3>
										<c:if test="${vo.agrade!=null}">
											<h3 class="view_Rgrade" lang="en">${vo.agrade}성급
												<c:choose>
													<c:when test="${vo.agrade == 5}">


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
													<c:when test="${vo.agrade == 4}">
														<!-- <span class="star">★★★★☆</span> -->
														<img class="star"
															src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
														<img class="star"
															src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
														<img class="star"
															src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
													</c:when>
													<c:when test="${vo.agrade==3 }">
														<img class="star"
															src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
														<img class="star"
															src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
														<img class="star"
															src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
													</c:when>
													<c:when test="${vo.agrade==2 }">
														<img class="star"
															src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
														<img class="star"
															src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
													</c:when>
													<c:when test="${vo.agrade==1 }">
														<img class="star"
															src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">

													</c:when>
													<c:when test="${vo.agrade==0 }">
														<img class="star"
															src="${pageContext.request.contextPath}/resources/images/room_info/star.svg">
													</c:when>
													<c:otherwise>
														<span>☆☆☆☆☆test1</span>
													</c:otherwise>
												</c:choose>



											</h3>
										</c:if>





										<h3 class="view_Radress" lang="en">
											<i class="fa-solid fa-location-dot"></i>${vo.aaddress }</h3>


									</div>


									<div class="room_Listbottom">  
										<h4 class="view_Rprice" lang="en"><span lang="en">₩</span> ${vo.amountsum}원</h4>
										<button class="btn btn-primary"
											onclick="location.href='${pageContext.request.contextPath }/user/kjy/room_info?aid=${vo.aid}&riid=${vo.riid }&person=${rimaxper}&roomnum=${countRoom}&startday=${rcheckin}&endday=${rcheckout}'">예약하기</button>
									</div>

								</div>



							</div>
							<!-- 	</div>
										</div> -->

						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>


		</div>



	</div>
	<!-- content end -->

	<div class="footer">
		<jsp:include page="../includes/footer.jsp" flush="true" />
	</div>
</body>
</html>