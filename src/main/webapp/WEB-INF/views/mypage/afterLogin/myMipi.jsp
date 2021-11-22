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
			<li class="active"><a href="myMipi" title="마이페이지">${user.name }님의 미피</a></li>
			<li><a href="/mypage/orderList" title="내주문내역">내주문내역</a></li>
			<li><a href="/mypage/myCoupon" title="내쿠폰">내쿠폰</a></li>
			<li><a href="/mypage/myQnaList" title="내문의내역">내문의내역</a></li>
			<li><a href="myInfo_step1" title="정보수정">정보수정</a></li>
			<li><a href="/order/myCart" title="장바구니">장바구니</a></li>
			<li><a href="drop_member" title="회원탈퇴">회원탈퇴</a></li>
		</ul>
	</aside>
			<!-- //lnb -->

			<!-- contents -->
			<section id="contents">
				<form id="myMipiForm" name="myMipiForm">
				<input type="hidden" id="mode" name="mode" value="">
				<input type="hidden" id="seq" name="seq" value="">
				<input type="hidden" id="call_order_id" name="call_order_id" value="">
				<ul id="location">
					<li><a class="home" href="/index">HOME</a></li>
					<li><span>마이페이지</span></li>
					<li><strong>${user.name }님의 미피</strong></li>
				</ul>

				<div class="cont_top">
					<h1>${user.name }님의 미피</h1>
				</div>

				<ul class="myinfo_box t_center">
					<li>
						<p>즐겨찾는 매장 <span class="t_red"></span></p>
						<span>총주문</span> <a href="/mypage/orderList"><strong><!-- 주문하시는분~ --></strong></a><span>건</span>
					</li>
					<li>
						<p>내쿠폰</p>
						<span>Total</span> <a href="/mypage/myCoupon"><strong><!-- 주문하시는분~ --></strong></a><span>장</span>
					</li>
					<li>
						<p>주문 내역</p>
						<span>총 주문금액</span> <a href="/mypage/orderList"><strong>
						
							
							
								<!-- 주문하시는분~ -->
							
						
						</strong></a><span>원</span>
					</li>
				</ul>

				<div class="mybox_wrap">
					<div class="boxStyle3 f_left">
						<p class="top"><strong class="cont_tit tit3">기본정보</strong></p>
						<div>
							<ul class="txt_list2">
								<li>${user.addr }</li>
								<li>${user.mobile }</li>
							</ul>
							<p class="more"><a href="/mypage/myInfo_step1" class="button h25 white"><span class="blind">기본정보</span>더보기<span class="gt">&gt;</span></a></p>
						</div>
					</div>

					<div class="boxStyle3 f_right">
						<p class="top"><strong class="cont_tit tit3">내 문의내역</strong></p>
						<div>
							<ul class="txt_list2">
								<!--
								<li><a href="#">피자는 언제오죠?</a> <span class="t_red"></span></li>
								<li><a href="#">피자는 언제오죠?</a></li>
								<li><a href="#">피자는 언제오죠?피자는 언제오죠?피자는 언제오죠?피자는 언제오죠?</a></li>
								-->
								
								<li>내 문의내역 정보가 없습니다.</li>
								
								
							</ul>
							<p class="more"><a href="/mypage/myQnaList" class="button h25 white"><span class="blind">내 문의내역</span>더보기<span class="gt">&gt;</span></a></p>
						</div>
					</div>
				</div>

				
				<h2 class="cont_tit tit2">최근주문내역</h2>
				<div class="table_more">
					<table class="tbl_style">
						<caption>최근주문내역 - 주문일자, 주문채널, 주문번호, 결제금액, 할인금액, 최종결제금액, 주문매장, 상태, 설정 등 확인</caption>
						<colgroup>						
							<col style="width:100px">						
							<col style="width:80px">
							<col style="width:85px">
							<col style="width:85px">
							<col style="width:85px">
							<col style="width:100px">
							<col style="width:130px">
							<col style="width:80px">
							<col style="width:80px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">주문일자</th>
								<th scope="col">주문채널</th>
								<th scope="col">주문번호</th>
								<th scope="col">결제금액</th>
								<th scope="col">할인금액</th>
								<th scope="col">최종결제금액</th>
								<th scope="col">주문매장</th>
								<th scope="col">상태</th>
								<th scope="col">재주문</th>
							</tr>
						</thead>
						<tbody>
							<!--
							<tr>
								<td class="t_gray">2014.05.11</td>
								<td class="t_gray">온라인</td>
								<td class="t_gray"><a href="#">78785656</a></td>
								<td><strong>35,300</strong></td>
								<td><strong>8,400</strong></td>
								<td><strong>28,800</strong></td>
								<td class="t_gray">
									<p>가양점</p>
									<p>02-2525-2525</p>
								</td>
								<td><p class="t_blue">주문접수</p></td>
								<td>
									<a href="#popup" class="pop_open"><img src="//cdn.mrpizza.co.kr/2014_resources/images/mypage/btn_order.gif" alt="바로주문"></a>
									<a href="#popup2" class="pop_open"><img src="//cdn.mrpizza.co.kr/2014_resources/images/mypage/btn_del.gif" alt="삭제"></a>
								</td>
							</tr>
							-->
							
								<tr><td colspan="9">최근 주문내역 정보가 없습니다.</td></tr>
							
							
						</tbody>
					</table>
					<p class="more"><a href="/mypage/orderList" class="button h25 white"><span class="blind">최근주문내역</span>더보기<span class="gt">&gt;</span></a></p>
				</div>

				<!--
				<h2 class="cont_tit tit2 mt50">장바구니 <span class="t_red normal f12">* 품절된 상품이 장바구니에 있습니다. 제품 삭제 후 진행해주세요.</span></h2>
				<div class="table_more">
					<table class="tbl_style">
						<caption>장바구니 - 상품명, 수량, 상품가격, 상태 등 확인</caption>
						<colgroup>				
							<col />
							<col style="width:100px" />
							<col style="width:100px" />
							<col style="width:100px" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품명</th>
								<th scope="col">수량</th>
								<th scope="col">상품가격</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="#">홍두깨번 R외 3건</a></td>
								<td class="t_gray">1</td>
								<td><strong>35,300</strong></td>
								<td><span class="t_blue">주문가능</span></td>
							</tr>
							<tr>
								<td><a href="#">홍두깨번 R외 3건</a></td>
								<td class="t_gray">1</td>
								<td><strong>35,300</strong></td>
								<td><span class="t_blue">주문가능</span></td>
							</tr>
							<tr>
								<td><a href="#">홍두깨번 R외 3건</a></td>
								<td class="t_gray">1</td>
								<td><strong>35,300</strong></td>
								<td><span class="t_blue">주문가능</span></td>
							</tr>
							<tr>
								<td><a href="#">홍두깨번 R외 3건</a></td>
								<td class="t_gray">1</td>
								<td><strong>35,300</strong></td>
								<td><span class="t_red">주문완료</span></td>
							</tr>
							<tr>
								<td><a href="#">홍두깨번 R외 3건</a></td>
								<td class="t_gray">1</td>
								<td><strong>35,300</strong></td>
								<td><span class="t_red">주문취소</span></td>
							</tr>
						</tbody>
					</table>
					<p class="more"><a href="/order/myCart" class="button h25 white"><span class="blind">장바구니</span>더보기<span class="gt">&gt;</span></a></p>
				</div>
				-->
				</form>
			</section>
			<!-- //contents -->
		</div>
		<%@include file="../../common/side.jsp" %>
		<%@include file="../../common/footer.jsp" %>
		</body>