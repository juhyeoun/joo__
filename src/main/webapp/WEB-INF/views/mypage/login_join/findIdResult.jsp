<%@page import="com.mrpizzahut.app.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../common/header.jsp" %>
    <%
    MemberDTO dto=(MemberDTO)request.getAttribute("dto");
    
    %>
    
    
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
					<li class="on"><a href="#">아이디찾기</a></li>
					<li><a href="findPw">비밀번호찾기</a></li>
				</ul>

				<h2 class="cont_tit tit2 mt40">아이디 찾기 완료</h2>

				<div class="boxStyle3 mt10 t_center">
					<p class="top f14"><img src="//cdn.mrpizza.co.kr/2014_resources/images/member/img_find.png" alt="아이디찾기 완료 아이콘"> ${dto.name }회원님의 아이디는 <strong class="t_blue"><%=dto.getEmail() %> </strong> 입니다. (회원 가입일 <%=dto.getRegdate() %> )</p>
					<div>
						<p class="p20">
							<a href="login" class="button red w160 h40">로그인하기 <span class="gt">&gt;</span></a>
							<a href="findPw" class="button w160 h40">비밀번호찾기 <span class="gt">&gt;</span></a>
						</p>
					</div>
				</div>
				
			</section>
			<!-- //contents -->
		</div>
		<%@include file="../../common/side.jsp" %>
		<%@include file="../../common/footer.jsp" %>
		
		<!-- //container -->
</body>