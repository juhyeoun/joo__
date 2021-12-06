<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../common/header.jsp" %>
<c:if test="${empty sessionScope.email }">
	<script>
		location.href = '/app/login'
	</script>
</c:if>
<!-- <script>
	function openWriteQna() {
		location.href="/writeQna";
	}
</script> -->
<body style="">
	
		<!-- container -->
		<div id="container">
			<!-- lnb -->
						
			
	<aside id="lnb">
		<h1>마이페이지</h1>
		<ul>
			<li><a href="myMipi" title="마이페이지">${user.name }님의 미피</a></li>
			<li><a href="orderList" title="내주문내역">내주문내역</a></li>
			<li><a href="#" title="내쿠폰">내쿠폰</a></li>
			<li class="active"><a href="myQnaList" title="내문의내역">내문의내역</a></li>
			<li><a href="myInfo_step1" title="정보수정">정보수정</a></li>
			<li><a href="/app/buket" title="장바구니">장바구니</a></li>
			<li><a href="drop_member" title="회원탈퇴">회원탈퇴</a></li>
			
		</ul>
	</aside>
			<!-- //lnb -->

			<!-- contents -->
			<section id="contents">
				<ul id="location">
					<li><a class="home" href="/app/">HOME</a></li>
					<li><span>마이페이지</span></li>
					<li><strong>내문의내역</strong></li>
				</ul>

				<div class="cont_top">
					<h1>내문의내역</h1>
				</div>

				<form id="myQnaListForm" name="myQnaListForm">
				<input type="hidden" id="mode" name="mode" value="01">
				<input type="hidden" id="cPage" name="cPage" value="1">
				<input type="hidden" id="seq" name="seq" value="">
				<input type="hidden" id="del_seq" name="del_seq" value="">
				
				<div class="list_search">
					<ul class="tabmenu2 l_search tabMotion">
						<!--
						<li><a href="#tabCon1"><span>제안과 문의내역</span></a></li>
						<li><a href="#tabCon2"><span>칭찬과 불만내역</span></a></li>
						-->
						<!--<li class="on"><a href="javascript:GoSwfUrl('MN100301');"><span>제안과 문의내역</span></a></li>-->
						<li class="on"><a href="javascript:goMyQnaList('01');"><span>제안과 문의내역</span></a></li>
						
					</ul>
					<div class="r_search">
						<!-- <select class="date_sel" title="검색기간 선택">
							<option value="">1개월</option>
							<option value="">3개월</option>
							<option value="">6개월</option>
						</select>
						<span class="datepicker_wrap"><input class="datepicker hasDatepicker" type="text" id="start_date" name="start_date" value="2021.11.02"><button type="button" class="ui-datepicker-trigger">기간조회</button></span> -
						<span class="datepicker_wrap"><input class="datepicker hasDatepicker" type="text" id="end_date" name="end_date" value="2021.12.02"><button type="button" class="ui-datepicker-trigger">기간조회</button></span>
						<a href="javascript:searchQnaList();" class="button h25 white">검색<span class="gt">&gt;</span></a> -->
						<a href="qnaplz" class="button h25 white">글쓰기<span class="gt">&gt;</span></a>
						
					</div>
				</div>
				<div id="tabCon1">
					<table class="tbl_style">
						<caption>제안과 문의내역 - 문의일, 제목, 처리상태, 설정 등 확인</caption>
						<colgroup>						
							<col style="width:120px">
							<col>
							<col style="width:90px">
							<col style="width:90px">
						</colsad>
							<tr>
								<th scope="col">문의일</th>
								<th scope="col">제목</th>
								<th scope="col">처리상태</th>
								<th scope="col">설정</th>
							</tr>
						</thead>
						<tbody>
						
							<tr>
								
								<td class="t_gray" colspan="4">제안과 문의내역이 없습니다.</td>
								
								
							</tr>
						
						
							<!--
							<tr>
								<td class="t_gray">2014.05.11</td>
								<td class="t_left"><a href="#">온라인 주문이 좋아졌네요</a></td>
								<td>답변완료</td>
								<td><a href="#popup" class="pop_open button white h25">삭제</a></td>
							</tr>
							-->
						</tbody>
					</table>

					<p class="list_paging">
					
						<img src="//cdn.mrpizza.co.kr/2014_resources/images/common/paging_prev.gif" alt="이전페이지">
						<span>
							<strong>1</strong>
						</span>
						<img src="//cdn.mrpizza.co.kr/2014_resources/images/common/paging_next.gif" alt="다음페이지">
					
							
						<!--
						<img src="//cdn.mrpizza.co.kr/2014_resources/images/common/paging_prev.gif" alt="이전페이지">
						<span>
							<strong>1</strong>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
						</span>
						<a href="#"><img src="//cdn.mrpizza.co.kr/2014_resources/images/common/paging_next.gif" alt="다음페이지"></a>
						-->
					</p>
					
				</div>
				</form>
			</section>
		
			<!-- //contents -->
			
			
		</div>
		<%@include file="../../common/side.jsp" %>
		<%@include file="../../common/footer.jsp" %>
</body>