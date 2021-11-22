<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- container -->

<c:if test="${cookie.containsKey('Cookie_user_id')}">
	<c:set value="checked" var="checked" />
</c:if>

<div id="container">
<!-- lnb -->
<aside id="lnb">
	<h1>회원공간</h1>
	<ul>
		<li class="active"><a href="login" title="로그인">로그인</a></li>
		<li><a href="join" title="회원가입">회원가입</a></li>
		<li><a href="findId" title="아이디/비밀번호 찾기">아이디/비밀번호 찾기</a></li>
	</ul>
</aside>
<!-- //lnb -->

			<!-- contents -->
			<section id="contents">
				<ul id="location">
					<li><a class="home" href="/app/">HOME</a></li>
					<li><span>회원공간</span></li>
					<li><strong>로그인</strong></li>
				</ul>

				<div class="cont_top">
					<h1>회원로그인</h1>
				</div>

				<ul class="tabmenu tabMotion">
					<li class="on"><a href="#tab01">회원로그인</a></li>
				</ul>
				
				<form id="loginForm" name="loginForm">
				<input type="hidden" id="reurl" name="reurl" value="">
				<div id="tab01" class="tab_cont" style="display: block;">
					<div class="login_wrap">
						<h2 class="tit">LOGIN</h2>
						<div class="login_box">
							<ul id="login_ul">
								<li>
									<input type="text" id="email" name="email" placeholder="이메일" title="이메일 입력" maxlength="30">
									<input type="hidden" id="user_id" name="user_id" maxlength="16">
								</li>
								<li>
									<input type="password" id="pw" name="pw" placeholder="비밀번호" title="비밀번호 입력" maxlength="16" onkeyup="enterKey()">
									<input type="hidden" id="user_pwd" name="user_pwd" maxlength="16">
								</li>
								<li class="btn">
									<a  onclick="loginMember()" class="button red h80">로그인 <span class="gt">&gt;</span></a>
									<!-- <input type="button" onclick="loginMember()" class="button red h80">로그인 <span class="gt">&gt;</span> -->
								</li>
								<li class="chk">
									<label>
										<input id="idcheck" name="idcheck" type="checkbox" class="checkbox" title="아이디저장" ${checked }>
										<span class="lbl">아이디저장</span>
									</label>
								</li>
							</ul>
						</div>
						<p class="t_red" id="userLoginResult" style="display: none">*아이디 또는 비밀번호를 다시 확인해 주세요.</p>
						<p class="mt40">
							<a href="findId" class="button grad btn_move w120 f12">아이디/비밀번호찾기</a>
							<a href="join" class="button grad btn_move w90 f12">회원가입하기</a>
							
							<!-- 네이버아이디로로그인 버튼 노출 영역 -->
						  	<span id="naver_id_login"><a href="https://nid.naver.com/oauth2.0/authorize?response_type=token&amp;client_id=HrPgLEnk0VGTGSOYakKo&amp;redirect_uri=https%3A%2F%2Fwww.mrpizza.co.kr%2Flogin_join%2FNaverResult&amp;state=a6996a92-9fbe-4ddd-b8be-e70a7e94444d" onclick="window.open(this.href, 'naverloginpop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550'); return false" id="naver_id_login_anchor" class="naver_btn"><img src="http://static.nid.naver.com/oauth/big_g.PNG" border="0" title="네이버 아이디로 로그인" width="152.625px" height="33px"></a> </span>
							<!-- //네이버아이디로로그인 버튼 노출 영역 -->
							<c:set var="redirectUri" value="http://localhost:8085/app/kakaoLogin" />
							<c:set var="restKey" value="c0b47f93e344126c581f8f273799a792" />
							<!-- 카카오 로그인 -->
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=${restKey }&redirect_uri=${redirectUri }&response_type=code"> 
					<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="152.625px" height="33"/>
				 </a>
						</p>
						<h3 class="cont_tit tit3 mt40">회원혜택안내 <span class="txt">(마이페이지 내 내쿠폰에서 확인하세요)</span></h3>					
					</div>
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
							<div>회원정보 기준 생일 시 <br><strong class="t_red">프리미엄 피자 20% 할인쿠폰</strong></div>
						</li>
					</ul>
				</div>
			</form>
		</section>
			<!-- //contents -->
		</div>
		<!-- //container -->
	<%@include file="../../common/side.jsp" %>
	<%@include file="../../common/footer.jsp" %>
</body>