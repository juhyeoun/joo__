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
		<li class="active"><a href="join" title="회원가입">회원가입</a></li>
		<li><a href="findId" title="아이디/비밀번호 찾기">아이디/비밀번호 찾기</a></li>
	</ul>
</aside>
			<!-- //lnb -->

			<!-- contents -->
			<section id="contents">
				<ul id="location">
					<li><a class="home" href="/app/">HOME</a></li>
					<li><span>회원공간</span></li>
					<li><strong>회원가입</strong></li>
				</ul>

				<div class="cont_top">
					<h1>회원가입</h1>
				</div>

				<h2 class="line_tit">1. 약관동의</h2>
				<div class="join_form">
					<p class="agree_all">
						<label>
							<input id="all_chk" name="all_chk" type="checkbox" class="checkbox" onclick="checkAll()">
							<strong class="lbl f14">모든 약관에 동의합니다.</strong>
						</label>
					</p>						
					<article class="txt_terms">
						<p class="mt10">
							<label>
								<input id="agree_chk1" name="agree_chk1" class="checkbox agree_chk" type="checkbox" onclick="changeFn()">
								<span class="lbl">서비스 이용약관 동의 (필수)</span>
							</label>
							<a href="#popRules" tabidx="1" class="button popRules h25 f_right">약관 전체보기</a>
						</p>
						<p class="mt10">
							<label>
								<input id="agree_chk2" name="agree_chk2" class="checkbox agree_chk" type="checkbox" onclick="changeFn()">
								<span class="lbl">개인정보 수집 및 이용안내 동의 (필수)</span>
							</label>
							<a href="#popRules" tabidx="2" class="button popRules h25 f_right">약관 전체보기</a>
						</p>
						<p class="mt10 hidden">
							<label class="f_left">
								<input id="agree_chk3" name="agree_chk3" class="checkbox agree_chk" type="checkbox" onclick="changeFn()">
								<span class="lbl">개인정보의 취급위탁 동의(필수)</span>
							</label>
							<a href="#popRules" tabidx="3" class="button popRules h25 f_right">약관 전체보기</a>
						</p>							
					</article>
				</div>
				
				<h2 class="line_tit mt50">2. 본인인증</h2>
				<div class="join_form">
					<div class="user_chk">
						<ul>
							<li>
								<a href="javascript:phoneCheck();" class="phone">
									<strong>휴대폰 인증</strong>
									<p>생년월일, 성명, 휴대폰 정보를 통한 <br>휴대폰 인증 서비스 입니다.</p>
									<span class="button grad btn_move h30 w100">인증하기<span class="gt">&gt;</span></span>
									<i></i>
								</a>
								<div style="display: none;">
									<ul class="txt_list">
										<li>미스터피자는 개정 정보통신망법 제23조에 따라 회원 가입시에는 주민등록번호를 수집하지 않습니다. </li>
										<li>휴대폰 인증은 가입하시는 분 명의의 휴대폰으로만 인증이 가능합니다. </li>
										<li>인증이 되지 않을 경우, 미스터피자 고객센터(080-001-1100)로 문의하시기 바랍니다. </li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!-- 휴대폰 인증완료 -->
				<!-- <p class="chk_success phone_chk hide">휴대폰 인증이 완료 되었습니다.</p> -->
				<!-- //휴대폰 인증완료 -->


				<h2 class="line_tit mt50">3. 정보입력 (필수입력사항)</h2>
				<form action="joinSuccessProc" method="POST" id="f">
				<div class="join_form">					
					<p><input type="text" id="name" name="name" class="inp1 inp_use" title="회원이름" placeholder="이름" ></p>
					<div class="mt10 tip_box">
							<p class="mt10">						
						<input type="text" class="inp2 inp_use" id="email_id" name="email_id" maxlength="25" title="이메일주소 앞주소 입력">
						<span class="ml6" id ="gol">@</span>
						<input type="text" class="inp2 ml6 inp_use" id="email_domain" name="email_domain" title="이메일주소 뒷자리 입력">
						<input type="hidden" id="email" name="email">
						<select class="ml6 sel2 inp_use" id="email_sample" name="email_sample" onchange="emailSelect()" title="이메일주소 뒷자리 선택">
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
						<input type="button" value="중복확인" id ="confirm" onclick="ajaxEmailCheck()">
					</p>
					</div>
					<p class="mt10 f12">
						<span id="msg"></span>
						<!--  
						<span class="t_blue" id="successID" style='visibility:hidden'>*사용 가능한 아이디입니다.</span>
						<span class="t_red" id="failedID" style='visibility:hidden'>*영문 숫자 조합으로 만들어주세요.</span>
						-->
					</p>

					<div class="mt20 tip_box">
						<input type="password" class="inp1 inp_use" id="pw" name="pw" maxlength="16" title="비밀번호 입력" placeholder="비밀번호 입력, 10-16자리 영문,숫자,특수문자 조합" onkeyup="pwd()">
						
					</div>
					<p class="mt10"><input type="password" class="inp1 inp_use" id="cust_pwd_chk" name="cust_pwd_chk" maxlength="16" title="비밀번호 재입력" placeholder="비밀번호 재입력" onkeyup="comfirmPwd()"></p>
					<p class="mt10 f12">
						<span id="resultPwd"></span>
						<!-- 
						<span class="t_red" id="failedPwd" style='visibility:hidden'>취약: 보안이 취약하여 사용할 수 없습니다.</span>
						<span class="t_blue" id="successPwd" style='visibility:hidden'>안전 : 사용가능하며 안전한 비밀번호 입니다.</span>
						<span class="t_red">불가:조합기에 적합하지 않습니다.</span>
						-->
					</p>

					<p class="mt20">
						<!-- select class="sel1 inp_use" id="mobile1" name="mobile1" title="연락처 앞자리 선택" >
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						<input type="text" class="inp2 ml6 inp_use" id="mobile2" name="mobile2" maxlength="4" onkeyup="chkNum(this);" title="연락처 앞자리 입력" > -->
						<input type="text" class="inp1 inp_use" id="mobile" name="mobile" maxlength="11" readonly="readonly" placeholder="핸드폰 번호">
					</p>

				
					
					<div class="mt30">
						<p>
							<!-- <input type="text" class="inp3" id="cust_hpost1" name="cust_hpost1" title="우편번호 앞자리 입력" readonly />
							<span class="ml6">-</span>
							<input type="text" class="inp3 ml6" id="cust_hpost2" name="cust_hpost2" title="우편번호 뒷자리 입력" readonly />-->
							<input type="text" class="inp4 inp_use" id="cust_haddr" name="cust_haddr" title="회원 기본주소" readonly="" >
							<a class="button ml6 pop_open zip_open" onclick="daumPost()">주소찾기<span class="gt">&gt;</span></a>
							<input type="button" onclick="test()" value="test">
							
						</p>
						<p class="mt10">
						<p>
							<input type="text" class="inp4 inp_use" id="cust_daddr" name="cust_daddr" title="회원 상세주소">
						</p>
						<p class="mt10">
						<p>
							<input type="text" class="inp4 inp_use" id="zipcode" name="zipcode" readonly="readonly" title="우편번호">
							<input type="hidden" id="addr" name="addr">
						</p>
						<p class="mt5 bullet_red">입력하신 주소는 기본 배송지로 설정됩니다.</p>
					</div>
					
				

				</div>
				</form>
				<p class="mt40 t_center">
					<a class="button red h45 w170" id="submitJoinCheck" onclick="joinMrpizza()">회원가입<span class="gt">&gt;</span></a>
					<a href="/project/" class="button h45 w170">취소<span class="gt">&gt;</span></a>
				</p>
				
				<!-- <p class="mt10"><a href="#popMarketing" class="button pop_open">마케팅 활용동의 안내 팝업(개발 완료후 해당 버튼 삭제)</a></p> -->
				
			</section>
			<!-- //contents -->
			</div>
			<!-- 우편번호검색(다음aip 변경후 소스) -->
				<%@include file="../../common/side.jsp" %>
			<%@include file="../../common/footer.jsp" %>



		
	
</body>