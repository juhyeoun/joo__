<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../common/header.jsp" %>
     <c:if test="${empty sessionScope.email }">
	<script>
		location.href = '/app/login'
	</script>
</c:if>

<body style="">

		<div id="container">
			<!-- lnb -->
						
			
	<aside id="lnb">
		<h1>마이페이지</h1>
		<ul>
			<li><a href="myMipi" title="마이페이지">${user.name }님의 미피</a></li>
			<li><a href="/mypage/orderList" title="내주문내역">내주문내역</a></li>
			<li><a href="/mypage/myCoupon" title="내쿠폰">내쿠폰</a></li>
			<li><a href="/mypage/myQnaList" title="내문의내역">내문의내역</a></li>
			<li><a href="myInfo_step1" title="정보수정">정보수정</a></li>
			<li><a href="/order/myCart" title="장바구니">장바구니</a></li>
			<li class="active"><a href="drop_member" title="회원탈퇴">회원탈퇴</a></li>
		</ul>
	</aside>
			<!-- //lnb -->

			<!-- contents -->
			<section id="contents">
				<ul id="location">
					<li><a class="home" href="/app/">HOME</a></li>
					<li><span>마이페이지</span></li>
					<li><strong>회원탈퇴</strong></li>
				</ul>

				<div class="cont_top">
					<h1>회원탈퇴</h1>
				</div>
				
				<form id="dropForm" action="deleteProc">
				
				 
				
				<h2 class="cont_tit tit2 mb10">정말 탈퇴하시겠습니까?</h2>

			


				<ul class="txt_list mt20">
					<!-- <li>회원탈퇴 요청 후 처리 기간이 일주일 정도 소요됩니다. 이 기간 중 이메일이 발송될 수 있으니 양해 부탁드립니다.</li> -->
					<li>회원탈퇴를 하시면 보유하고 계신 할인쿠폰은 자동 소멸되어 재가입하실 경우에도 복원되지 않습니다.</li>
					<li>회원탈퇴 후 동일한 아이디로 재가입이 불가능 합니다.</li>
				</ul>

				<p class="t_center mt30">
					<input type="submit" class="button w180 h45 red" value="회원탈퇴">
				</p>
			</form>
				
			</section>
			<!-- //contents -->

		
		</div>
		<%@include file="../../common/side.jsp" %>
		<%@include file="../../common/footer.jsp" %>
		<!-- //container -->
</body>