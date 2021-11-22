<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<%@include file="../../common/header.jsp" %>
		<!-- container -->
		<div id="container" class="full_cont">
			<!-- lnb -->
			<aside id="lnb">
				<h1>회원공간</h1>
				<ul>
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">아이디/비밀번호 찾기</a></li>
				</ul>
			</aside>
			<!-- //lnb -->

			<!-- contents -->
			<section id="contents">
				<ul id="location">
					<li><a class="home" href="/app/">HOME</a></li>
					<li><span>회원공간</span></li>
					<li><strong>회원가입완료</strong></li>
				</ul>

				<div class="visual_top">
					<div class="join_top">
						<h1>미스터피자 회원가입을 환영합니다.</h1>
						<p><strong class="t_blue">${name }</strong> 미스터피자 회원가입이 완료되었습니다. <br>가입된 아이디로 로그인하신 후 미스터피자 서비스를 이용해 주세요.</p>
					</div>
				</div>

				<ul class="txt_list f16 ml80">
					<li>고객님의 회원아이디는 <strong class="t_blue">${id }</strong> 입니다.</li>
					<li>계정정보 분실 시 메뉴 <a href="/login_join/findID">내 아이디/비밀번호 찾기</a>로 정보를 찾을 수 있습니다.</li>
				</ul>

				<p class="mt50 t_center">
					<a href="login" class="button h45 red w180">로그인하기 <span class="gt">&gt;</span></a>
					<a href="/app/" class="button h45 w180">메인가기 <span class="gt">&gt;</span></a>
				</p>
				
				<h3 class="cont_tit tit3 mt70">회원혜택안내 <span class="txt">(마이페이지 내 내쿠폰에서 확인하세요)</span></h3>
				
				<ul class="login_list">
					<li>
						<p><img src="//cdn.mrpizza.co.kr/2014_resources/images/member/img_login01.gif" alt="회원가입"></p>
						<h4>회원가입</h4>
						<div>신규회원가입 시 <br><strong class="t_red">프리미엄 피자 20% 할인쿠폰</strong></div>
					</li>
					<li>
						<p><img src="//cdn.mrpizza.co.kr/2014_resources/images/member/img_login02.gif" alt="정보수정"></p>
						<h4>정보수정</h4>
						<div>회원 정보 업데이트 시 <br><strong class="t_red">프리미엄 피자 20% 할인쿠폰</strong></div>
					</li>
					<li>
						<p><img src="//cdn.mrpizza.co.kr/2014_resources/images/member/img_login03.gif" alt="생일쿠폰"></p>
						<h4>생일쿠폰</h4>
						<div>회원정보 기준 생일 시 <br><strong class="t_red">피자 20% 할인쿠폰</strong></div>
					</li>
				</ul>
							
			</section>
			<!-- //contents -->
		</div>
		<!-- //container -->

	
		



	<%@include file="../../common/side.jsp" %>
			<%@include file="../../common/footer.jsp" %>

</body>