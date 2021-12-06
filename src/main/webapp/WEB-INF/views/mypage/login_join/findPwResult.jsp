<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../../common/header.jsp" %>
<body style="">

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
					<li><a href="findId">아이디찾기</a></li>
					<li class="on"><a href="findPw">비밀번호찾기</a></li>
				</ul>

				<h2 class="cont_tit tit2 mt40">비밀번호 찾기 완료</h2>

				<div class="boxStyle3 mt10 t_center">
					<p class="top f14">이메일로 임시비밀번호가 발송 되었습니다.</p>
					<div>
						<p class="p20">
							<a href="login" class="button red w160 h40">로그인하기 <span class="gt">&gt;</span></a>
							<a href="/app/" class="button w160 h40">메인가기 <span class="gt">&gt;</span></a>
						</p>
					</div>
				</div>

				<div class="p10">
					<ul class="txt_list">
						<li>회원님의 이메일로 임시비밀번호가 발송되었습니다. </li>
						<li>이메일 외 방법으로 임시비밀번호를 발급받으시려면 아래 방법으로 인증을 받아주세요.</li>
						<li>임시 비밀번호를 발급 받으신 후 회원정보 &gt; 내 정보수정에서 꼭 비밀번호를 변경해주세요.</li>
						<li>임시 비밀번호 발급 후 기존 비밀번호로 접속 시 임시비밀번호는 사용이 불가능합니다.</li>
					</ul>
				</div>

			

				
				
			</section>
			<!-- //contents -->
		</div>
		<!-- //container -->
</body>