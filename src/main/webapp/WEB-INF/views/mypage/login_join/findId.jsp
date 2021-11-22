<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../common/header.jsp" %>
<body style="">
	
		<!-- //header -->

		<!-- container -->
		<div id="container">
			<!-- lnb -->
			

<aside id="lnb">
	<h1>회원공간</h1>
	<ul>
		<li><a href="login" title="로그인">로그인</a></li>
		<li><a href="join" title="회원가입">회원가입</a></li>
		<li class="active"><a href="findId" title="아이디/비밀번호 찾기">아이디/비밀번호 찾기</a></li>
	</ul>
</aside>
			<!-- //lnb -->

			<!-- contents -->
			<section id="contents">
				<ul id="location">
					<li><a class="home" href="/app/">HOME</a></li>
					<li><span>회원공간</span></li>
					<li><strong>아이디/비밀번호 찾기</strong></li>
				</ul>

				<div class="cont_top">
					<h1>아이디/비밀번호 찾기</h1>
				</div>

				<ul class="tabmenu mt10">
					<li class="on"><a href="#">아이디찾기</a></li>
					<li><a href="findPw">비밀번호찾기</a></li>
				</ul>
				
				<div class="find_wrap">
					<section class="find_box">
						<h1><img src="//cdn.mrpizza.co.kr/2014_resources/images/member/tit_findImg01.gif" alt=""> 등록정보로 찾기</h1>
						<div>
							<div class="find_top">
								<h2>아이디 찾기</h2>
								<p>회원 가입 시 등록한 내용과 본인 확인 시 <br>입력한 항목 중 선택하여 조회하세요.</p>
							</div>

							<ul class="tabmenu noline bg_gray tabMotion">
								<li class="on"><a href="#tabCon1">휴대폰 인증</a></li>
								<!-- <li class=""><a href="#tabCon2">이메일 인증</a></li> -->
							</ul>

							<div id="tabCon1" class="tab_cont" style="display: block;">
							
								<!-- 휴대폰 인증 리턴값 -->
								<form id="frm" name="frm">
									<input type="hidden" id="mobile_check" name="mobile_check" value="">
									<input type="hidden" id="ipin_check" name="ipin_check" value="">
									<input type="hidden" id="key_ipin_di" name="key_ipin_di" value="">
									<input type="hidden" id="key_ipin_ci" name="key_ipin_ci" value="">
									<input type="hidden" id="name" name="name" value="">
									<input type="hidden" id="sex" name="sex" value="">
									<input type="hidden" id="birth" name="birth" value="">
									<input type="hidden" id="cellNo" name="cellNo" value="">	
								</form>
								<!-- //휴대폰 인증 리턴값 -->	
								
								<ul class="txt_list2">
									<li>통신사의 사정으로 휴대폰 인증을 위한 메세지를 받지 못 하는 경우도 있습니다.</li>
									<li>인증번호 전송 비용은 본 사이트에서 부담합니다.</li>
								</ul>
								<p class="btn">
									<a href="javascript:findIdphoneCheck();" class="button red">아이디찾기 <span class="gt">&gt;</span></a>
								</p>
							</div>
							
						
						</div>
					</section>

					<!-- <section class="find_box">
						<h1><img src="//cdn.mrpizza.co.kr/2014_resources/images/member/tit_findImg02.gif" alt=""> 아이핀(I-PIN)으로 찾기</h1>
						<div>
							<div class="find_top">
								<h2>아이핀으로 찾기</h2>
								<p>아이핀으로 회원가입을 하신 경우는, <br>아래의 아이핀 인증 버튼을 클릭하여 아이디를 <br>찾을 수 있습니다.</p>
							</div>

							
							<p class="btn">
								<a href="javascript:PCCIpin();" class="button red">아이핀인증 <span class="gt">&gt;</span></a>
							</p>
						</div>
					</section>	 -->
				</div>
				
			</section>
			<!-- //contents -->
		</div>
		<!-- //container -->
				<%@include file="../../common/side.jsp" %>
			<%@include file="../../common/footer.jsp" %>
</body>