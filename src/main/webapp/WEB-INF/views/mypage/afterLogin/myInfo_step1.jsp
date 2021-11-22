<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../common/header.jsp" %>
 <c:if test="${empty sessionScope.email }">
	<script>
		location.href = '/app/login'
	</script>
</c:if>
<body style="">
		<!-- container -->
		<div id="container">
			<!-- lnb -->
						
			
	<aside id="lnb">
		<h1>마이페이지</h1>
		<ul>
			<li><a href="myMipi" title="마이페이지">${user.name }님의 미피</a></li>
			<li><a href="/mypage/orderList" title="내주문내역">내주문내역</a></li>
			<li><a href="/mypage/myCoupon" title="내쿠폰">내쿠폰</a></li>
			<li><a href="/mypage/myQnaList" title="내문의내역">내문의내역</a></li>
			<li class="active"><a href="myInfo_step1" title="정보수정">정보수정</a></li>
			<li><a href="/order/myCart" title="장바구니">장바구니</a></li>
			<li><a href="drop_member" title="회원탈퇴">회원탈퇴</a></li>
		</ul>
	</aside>
			<!-- //lnb -->

			<!-- contents -->
			<input type="hidden" id="session_id" name="session_id" value="${user.email }">
			
			<form id="pass_chk_form">
			</form>
			
			<section id="contents">
				<ul id="location">
					<li><a class="home" href="/index">HOME</a></li>
					<li><span>마이페이지</span></li>
					<li><strong>정보수정</strong></li>
				</ul>

				<div class="cont_top">
					<h1>정보수정</h1>
				</div>

				<div class="drop_Txt">					
					<p>고객님의 개인정보를 소중하게 보호하려고 노력하고 있습니다.</p>
					<p>회원님의 동의 없이 입력하신 회원정보는 제공하지 않습니다.</p>
				</div>

				
				<p class="warning">고객님의 개인정보 보호를 위해 비밀번호를 다시 한번 입력해 주시기 바랍니다.</p>
				<ul class="drop_pw">
					<li>
						<span>아이디</span>
						<strong class="f14">${user.email }</strong>
					</li>
					<li>
						<span>비밀번호</span>
						<input type="password" id="pw" class="inp1 pass_inp" placeholder="비밀번호를 입력해주세요." title="비밀번호 입력" onkeyup="enterKey2()">
						<a href="javascript:check()" class="button red w115">확인 <span class="gt">&gt;</span></a>
					</li>
					<li class="t_red" id="result" style="display: none">* 비밀번호를 다시 확인해 주세요.</li>
				</ul>
			</section>
			<!-- //contents -->			
		</div>
		
	<%@include file="../../common/side.jsp" %>
			<%@include file="../../common/footer.jsp" %>
		<!-- //container -->

	</body>