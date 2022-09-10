<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

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



<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>


<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board_all.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
input[name="qfile"] {
	height: 40px;
}

.container {
	display: block;
	margin: 0 auto;
	margin-bottom: 50px;
}
</style>
<script>
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});

	$(document)
			.on(
					'click',
					'#btnList',
					function(e) {
						e.preventDefault();
						location.href = "${pageContext.request.contextPath}/hjy/board/${bcate}";
					});
</script>
</head>


<body>
	<div class="header">
		<jsp:include page="../includes/header.jsp" flush="true" />
	</div>


	<div class="sub_content">

		<div class="board_content">


			<div class="" role="main">
				<h2 class="mem_title">공지사항 글쓰기</h2>


				<form name="form" id="form" role="form"
					enctype="multipart/form-data" method="post"
					action="${pageContext.request.contextPath}/phj/board/boardinsert">
					<input type="hidden" id="bcate" name="bcate" value="${bcate }">
					<input type="hidden" id="mid" name="mid" value="${mid }"><br>


					<div class="mb-3">
						<label for="title">제목</label> <input type="text"
							class="form-control" name="btitle" id="btitle"
							placeholder="제목을 입력해 주세요">
					</div>
					<!-- 
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="reg_id" id="reg_id" placeholder="이름을 입력해 주세요">
				</div>
				 -->
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea class="form-control" rows="5" name="bcontent"
							id="bcontent" placeholder="내용을 입력해 주세요"></textarea>
					</div>
					<div class="mb-3">
						<label for="file">첨부파일</label> <input type="file"
							class="form-control" name="file"> <input type="file"
							class="form-control" name="file" style="margin-top: 5px;">
						<input type="file" class="form-control" name="file"
							style="margin-top: 5px;">
					</div>
				</form>
				<div style='text-align: center;'>
					<button type="button" class="btn" id="btnSave">등록</button>
					<button type="button" class="btn" id="btnList">취소</button>
				</div>
			</div>


		</div>
	</div>


	<div class="footer">
		<jsp:include page="../includes/footer.jsp" flush="true" />
	</div>

</body>
</html>