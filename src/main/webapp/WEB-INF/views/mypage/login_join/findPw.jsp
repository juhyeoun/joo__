<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../common/header.jsp" %>
<body style="">

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
					<li class="on"><a href="#">비밀번호찾기</a></li>
				</ul>

				<div class="find_wrap">
					<section class="find_box">
						<h1><img src="//cdn.mrpizza.co.kr/2014_resources/images/member/tit_findImg01.gif" alt="등록정보로 찾기 아이콘"> 등록정보로 찾기</h1>
						<div>
							<div class="find_top">
								<h2>비밀번호찾기</h2>
								<p>회원 가입 시 등록한 이름과 본인 확인 시 <br>입력한 항목 중 선택하여 조회하세요.</p>
							</div>

							<ul class="tabmenu noline bg_gray tabMotion">
								<!-- <li class=""><a href="#tabCon1">휴대폰 인증</a></li> -->
								<li class="on"><a href="#tabCon2">이메일 인증</a></li>
							</ul>

						
							<div id="tabCon2" class="tab_cont" style="display: block;">
								<form id="emailModeForm" name="emailModeForm">
								
								<p class="mt5 find_id_inp_line"><em>이름</em><input type="text" class="inp1" id="name" name="name" title="이름 입력" placeholder="이름을 입력해주세요."></p>
								<p class="mt5 find_id_inp_line">
									<em>이메일</em>
									<input type="text" class="inp2" id="emode_email_id" name="emode_email_id" title="이메일주소 앞자리 입력">
									<span>@</span>
									<input type="text" class="inp2" id="emode_email_domain" name="emode_email_domain" title="이메일주소 뒷자리 입력">
									<select class="sel" id="emode_email_sample" name="emode_email_sample" onchange="emailSelectEmode()" title="이메일주소 뒷자리 선택">
										<option value="1">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="paran.com">paran.com</option>
										<option value="chol.com">chol.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="empal.com">empal.com</option>
										<option value="freechal.com">freechal.com</option>
										<option value="hanafos.com">hanafos.com</option>
										<option value="hanmir.com">hanmir.com</option>
										<option value="hitel.net">hitel.net</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="korea.com">korea.com</option>
										<option value="lycos.co.kr">lycos.co.kr</option>
										<option value="netian.com">netian.com</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
										<option value="yahoo.com">yahoo.com</option>
									</select>
									<input type="button" value="인증번호 전송" onclick="sendAuth()"><br>
									
								</p>
								<label>인증번호</label><input type="text" class="inp2" id="authNum" name="authNum"> 
								<p><span id="msg"></span></p><br>
								<p class="btn">
									<a href="#" class="button red" onclick="sendConfirm()">비밀번호찾기 <span class="gt">&gt;</span></a>
								</p>
								</form>
							</div>
						</div>
					</section>

				
				</div>

			</section>
			<!-- //contents -->
		</div>
			<%@include file="../../common/side.jsp" %>
			<%@include file="../../common/footer.jsp" %>


</body>