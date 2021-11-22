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
	<aside id="lnb">
		<h1>마이페이지</h1>
		<ul>
			<li><a href="myMipi" title="마이페이지">박주현님의 미피</a></li>
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
			<section id="contents">
				<ul id="location">
					<li><a class="home" href="/app/">HOME</a></li>
					<li><span>마이페이지</span></li>
					<li><strong>정보수정</strong></li>
				</ul>

				<div class="cont_top">
					<h1>정보수정</h1>
				</div>	
				
				
				
				
					
				
				
				
				
				
				
				
				
				<h2 class="cont_tit tit2">1. 개인정보 <span class="normal f12 t_red">*필수 입력정보</span></h2>
					<form action="updateProc" method="POST" id="f">
				<table class="tbl_style mt10 myInfo_form">
			
					<caption>개인 정보 수정</caption>
					<colgroup>
						<col style="width:155px">
						<col>
					</colgroup>
					<tbody>
					
						<tr>
							<th scope="row">회원 이메일</th>
							<td class="t_left">${user.email }(가입일 : <span id="c_date">${user.regdate }</span>) <!-- <a href="#" class="fb underline ml16" target="_blank" title="새창열림">페이스북 ID 연동</a> --></td>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td class="t_left">${user.name }
							
							
							
								<!-- <span class="t_red auth_chk">(본인인증완료)</span>
								<a href="javascript:PCCPhone();" class="button h25 cust_auth" style="display:none;">휴대폰인증</a>
								<a href="javascript:PCCIpin();" class="button h25 cust_auth" style="display:none;">아이핀인증</a>
							 -->
							
							</td>
						</tr>
						<!-- <tr>
							<th scope="row">생년월일</th>
								
									
								    
								        <td class="t_left">1995-07-13</td>
								    
															
						</tr> -->
						
							
						    
								<tr>
									<th scope="row"><!--<i class="t_red normal"> * </i>--> 비밀번호</th>
									<td class="t_left">
										<a href="javascript:open123()" class="button w100 red btn_pw" id="sujeoung">수정하기 <span class="gt">&gt;</span></a>
										<!-- <span class="ml16 t_red">* 비밀번호가 변경되었습니다.</span> -->
										<p class="hide"><input type="password" id="pw" class="inp1 old_pass pass_inp" placeholder="기존 비밀번호 입력" title="기존 비밀번호 입력" maxlength="16">
										<a href="javascript:chkOldPw()" class="button ml6 red passChkBtn">확인 <span class="gt">&gt;</span></a>
										<span id="msg1"></span>
										</p>
									</td>
								</tr>
						    
												
	
						<tr id="re_pw" class="hide">
							<th scope="row"><!--<i class="t_red normal"> * </i>--> 새로운 비밀번호</th>
							<td class="t_left">
								<p><input type="password" id="newPw" class="inp1 new_pass pass_inp" placeholder="새로운 비밀번호 입력" title="새로운 비밀번호 입력" maxlength="16"></p>
								<input type="hidden" id="npw" name="pw">
								<p class="mt5">
									<input type="password" id="newPwChk" class="inp1 new_pass2 pass_inp" placeholder="새로운 비밀번호 재입력" title="새로운 비밀번호 재입력" maxlength="16"> 
									<a href="javascript:changePw()" class="button ml6 red passChkBtn">확인 <span class="gt">&gt;</span></a>
								</p>
								<span id="msg"><!-- 0-16자의 영문,숫자, 특수문자를 포함하여 만들어주세요. --></span>
								
								<!-- <p class="mt5 t_red pass_old hide">이전 비밀번호와 같습니다.</p>
								<p class="mt5 t_red pass_diff hide">입력하신 비밀번호 정보가 다릅니다.</p> -->
							</td>
						</tr>
						<tr>
							<th scope="row"><i class="t_red normal">*</i> 주소</th>
							<td class="t_left">
								<!--<p>
									 <input type="text" class="inp2" title="우편번호 앞자리" readonly /> - 
									<input type="text" class="inp2" title="우편번호 뒷자리" readonly /> 
									<a href="#zipcode" class="button ml6 pop_open">주소찾기<span class="gt">&gt;</span></a>
								</p>
								<p class="mt5">
									<input type="text" class="inp1" title="기본주소" readonly />
									<input type="text" class="inp3" title="상세주소 입력" />
								</p>-->
								
								<input type="hidden" id="cust_hpost1" class="inp2" title="우편번호 앞자리" value="" readonly=""> 
								<input type="hidden" id="cust_hpost2" class="inp2" title="우편번호 뒷자리" value="" readonly="">
	
								
								
									
									<input type="hidden" id="seq" name="seq" value="23715437">
									<p>
									
									
										<input type="text" class="inp4" id="cust_haddr" name="cust_haddr" title="회원 기본주소" readonly="" >
										<a href="javascript:updatePost()" class="button ml6 pop_open zip_open">주소찾기<span class="gt">&gt;</span></a>
									
									
									
									</p>
									<p class="mt10">
										<input type="text" class="inp4" id="cust_daddr" name="cust_daddr" title="회원 상세주소">
										<input type="hidden" id="addr" name="addr">
									</p>
									
								
								<p class="mt5 t_red addr_chk hide">주소를 입력해 주세요.</p>
								
								<ul class="txt_list mt15">
									<li>입력하신 주소를 기본 배송지로 선택됩니다.</li>
									<li>이벤트 당첨 시 사은품/우편물을 수령할 수 있도록 번지까지 정확하게 기입하여 주십시오.</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th scope="row">연락처</th>
							<td class="t_left">${user.mobile } <!-- <a href="#" class="fb underline ml16" target="_blank" title="새창열림">페이스북 ID 연동</a> --></td>
						</tr>
						
					</tbody>
				</table>
				</form>

				
				<p class="t_center mt30">
					<a href="javascript:updateInfo();" class="button w180 h45 red custInfoBtn">수정하기 <span class="gt">&gt;</span></a>
					<a href="#" class="button w180 h45">취소 <span class="gt">&gt;</span></a>
				</p>
				
									
			</section>
			<!-- //contents -->
			</div>
<%@include file="../../common/side.jsp" %>
			<%@include file="../../common/footer.jsp" %>
			<!-- 우편번호검색(다음aip 변경후 소스) -->		
</body>