<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>


<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- 파비콘 이미지 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/logo/favicon.ico" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board_all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">



<style type="text/css">

.writebtn{}


#sidebar-wrapper {
    position: fixed;
    height: 625px;
    width: 250px;
    margin-left: -250px;
    background: #EBEDEF;
    overflow-x: hidden;
    overflow-y: auto;
  }
 


  </style>
</head>
<body>

	<div class="header">
		<jsp:include page="../includes/header.jsp" flush="true"/>
	</div>
	
	
	<div class="sub_content">
	
	<input type="hidden" name="bcate" id="bcate" value="${bcate }">	
	
	
	<div class="board_content">
	
	<h2 class="mem_title">공지사항</h2>
				<div class="headline">아이럽 제주의 새로운 소식을 확인하세요.</div>
				
				
	<!-- 글쓰기버튼 -->
	<div class="other_content">
			<input type="button" onclick="clickForm()" value="글쓰기" class="btn writebtn">
			
	</div>
		
		
		<table class="table">
		<colgroup>
		<col width="30%">
		<col width="50%">
		<col width="15%">
		
	</colgroup>
	
			<tr class="table_title">
				
				
				<th class="table_writer">작성자</th>
				<th>글제목</th>
				<th class="table_date" >작성일</th>
			</tr>
			
			<c:forEach var="vo" items="${list }">
				<tr class="table_content" lang="en">
					<fmt:formatDate value="${vo.brdate }" pattern="YY-MM-dd" var="brdate"/>	
					
					<td lang="en"  class="">${vo.mid }</td>
					<td><a href="/project/hjy/board/detail?bid=${vo.bid }" lang="en">${vo.btitle }</a></td>
					<td class="" lang="en">${brdate }</td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="board_search">
			<form action="${pageContext.request.contextPath }/hjy/board/all" class="searchbox">
				<select name = "field" class="box_margin">
					<option value="btitle" <c:if test="${field=='btitle' }">selected</c:if>>제목</option>
					<option value="mid" <c:if test="${field=='mid' }">selected</c:if>>글쓴이</option>
					<option value="bcontent" <c:if test="${field=='bcontent' }">selected</c:if>>내용</option>
				</select>
				<input type="text" name ="keyword" value="${keyword }" class="form-control box_margin">
				<input type="submit" value="검색" class="btn btn-default">
			</form>
		</div>
		
	
		<div class="pagebox">
				<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
					<c:choose>
						<c:when test="${pu.pageNum==i }"><!-- 현재페이지 -->
							<a href="/project/hjy/board/all?pageNum=${i }&field=${field}&keyword=${keyword}">
							<span lang="en">[${i }]</span>
							</a>
						</c:when>
						<c:otherwise>
							<a href="/project/hjy/board/all?pageNum=${i }&field=${field}&keyword=${keyword}">
							<span style='color:gray;'>[${i }]</span>
							</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		
			
		
		
			
			
	</div>
	
	</div>
	
	<div class="footer">
		<jsp:include page="../includes/footer.jsp" flush="true"/>
	</div>
</body>
<script type="text/javascript">
function clickForm(){
	console.log("글쓰기");
	var bcate=$("#bcate").val();
	location.href='${pageContext.request.contextPath }/hjy/board/newPost?bcate='+bcate;
}
</script>
</html>