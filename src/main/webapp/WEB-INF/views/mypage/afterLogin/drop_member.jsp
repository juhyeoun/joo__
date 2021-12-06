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
			<li><a href="orderList" title="내주문내역">내주문내역</a></li>
			<li><a href="#" title="내쿠폰">내쿠폰</a></li>
			<li><a href="myQnaList" title="내문의내역">내문의내역</a></li>
			<li><a href="myInfo_step1" title="정보수정">정보수정</a></li>
			<li><a href="/app/buket" title="장바구니">장바구니</a></li>
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

				<div class="drop_Txt">					
					<p>그 동안 미스터피자 서비스를 이용하여 주셔서 대단히 감사합니다.</p>
					<p>더욱더 개선하여 좋은 서비스와 품질로 보답하겠습니다.</p>
				</div>

				<p class="warning">고객님의 개인정보 보호를 위해 비밀번호를 다시 한번 입력해 주시기 바랍니다.</p>
				
				<ul class="drop_pw">
					<li>
						<span>아이디</span>
						<strong class="f14">${user.email }</strong>
					</li>
					<li>
						<span>비밀번호</span>
						<input type="password" id="pw" class="inp1 pass_inp" placeholder="비밀번호를 입력해주세요." title="비밀번호 입력" onkeyup="enterKey3()">
						<a href="javascript:check_delete()" class="button red w115">확인 <span class="gt">&gt;</span></a>
					</li>
					<li class="t_red" id="result" style="display: none">* 비밀번호를 다시 확인해 주세요.</li>
				</ul>
				
				<p class="cont_tit tit3">회원탈퇴안내</p>
				<ul class="txt_list mt10">
					<li class="t_red">회원탈퇴 시 고객님의 정보는 일정기간 회원 주문내역 조회를 위해 보관되며 일정기간 이후는 폐기 됩니다.</li>
					<li>회원탈퇴 시 고객님께서 보유하셨던 쿠폰 및 주문 내역은 삭제되며, 환급 또한 불가능합니다.</li>
					<li>한 번 탈퇴한 아이디는 다시 사용할 수 없습니다.</li>
				</ul>
				
				<form id="pass_chk_form"></form>
				
			</section>
			<!-- //contents -->			
		</div>
			<%@include file="../../common/side.jsp" %>
		<%@include file="../../common/footer.jsp" %>
		<!-- //container -->
</body>