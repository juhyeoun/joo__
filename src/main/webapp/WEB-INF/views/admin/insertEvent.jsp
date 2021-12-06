<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="../common/adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록 페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script>

</script>
<style type="text/css">
*{
	list-style: none;
}

li{
	padding: 5px;
}
</style>
</head>
<body id="page-top">

	<form action="/eventUpload.mdo" method="post" enctype="multipart/form-data">
		<div class="container-fluid">
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">이벤트 등록</h1>
			<br>
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-warning">이벤트 등록</h6>
				</div>
				<div class="card-body">
					<!-- 전체 frame -->
					<ul>
						<!-- 제목 -->
						<li class="title">
							<div>
								<div class="index">제목</div>
								<input class="title_text" type="text" name="title"
									style="width: 80%" required />
							</div>
						</li>
						<!-- 썸네일 이미지 업로드 -->
						<li class="img">
							<div>
								<div class="index">썸네일 이미지</div>
								<input type="file" name="thumb" required/>
							</div>
						</li>
						<!-- 이벤트 이미지 업로드 -->
						<li class="img">
							<div>
								<div class="index">이벤트 이미지</div>
								<input type="file" name="cont"required/>
							</div>
						</li>
						<!-- 기간 -->
						<li class="term">
							<div class="index">이벤트 기간</div>
							시작 : <input type="date" name="start" id="start" required> ~ 종료 : <input type="date" id="end" name="end" required>
						</li>
					</ul>
					<div align="center">
						<input style="padding: 5px" class="btn btn-warning btn-icon-split"
							type="submit" id="registerBtn" value="등록하기" />
					</div>
					<div align="right">
						<a href="/app/admin/getEventList" class="btn btn-light btn-icon-split">
							<span class="text">목록가기</span>
						</a>
					</div>
				</div>
			</div>

		</div>
	</form>

</body>
</html>