<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>

<c:if test="${empty sessionScope.email }">
	<script>
		location.href = '/app/login'
	</script>
</c:if>
<script>
 	function searchCode() {
 		var omchttrdno = document.getElementById('omchttrdno').value;
 		console.log(omchttrdno);
 		if(omchttrdno == ""){
 			alert('주문코드를 입력해주세요');
 			return;
 		}
 		var data = {
 				"omchttrdno" : omchttrdno
 			}
 			
 			$.ajax({
 				url : "searchCode",
 				type: "POST",
 				data: JSON.stringify(data),
 				contentType: "application/json; charset=utf-8",
 				dataType: 'json',
 				success:function(result){
 					console.log(result);
 					$('#dataTable > tbody').empty();
 					if(result.length>=1){
 						result.forEach(function(item){
 							str='<tr>'
 							str += "<td>"+item.omchttrdno+"</td>";
 							str+="<td>"+item.oemail+"</td>";
 							str+="<td>"+item.oname+"</td>";
 							str+="<td>"+item.ocount+"</td>";
 							str+="<td>"+item.osize+"</td>";
 							str+="<td>"+item.oedge+"</td>";
 							/*  if(item.ocancleflag == 0){
 								str+="<td>"+'x'+"</td>";
 							}else{
 								str+="<td>"+'o'+"</td>";
 							}
 							if(item.ocancledate == null){
 								str+="<td>"+'x'+"</td>";
 							}else{
 								str+="<td>"+item.ocancledate+"</td>";
 							}
 							if(item.ocoupons == null){
 								str+="<td>"+'x'+"</td>";
 							}else{
 								str+="<td>"+item.ocoupons+"</td>";
 							} */
 							str+="<td>"+item.omethod+"</td>";
 							str+="<td>"+item.oprice+"</td>";
 							//str+="<td>"+item.ocreated+"</td>";
 							str+="<td>"+item.odonedate+"</td>";
 							str+="</tr>"
 							$('#dataTable').append(str);
 						})		
 					}
 				},
 				errer:function(){
 					alert('error');
 				}
 			})
	}
 	
 	function enterKey5(){
 		  if (window.event.keyCode == 13) {
 		    //로그인 버튼 클릭시 실행되는 메서드 호출
 		    //login();
 		    searchCode();
 		  }
 		};
 </script>

<body style="">

		<!-- container -->
		<div id="container">
			<!-- lnb -->
						
			
	<aside id="lnb">
		<h1>마이페이지</h1>
		<c:choose>
			<c:when test="${user.email.equals('admin@care.com') }">
				<ul>	
					<li class="active"><a href="myMipi" title="마이페이지">${user.name }님의 미피</a></li>
					<!-- <li><a href="admin/home" title="내주문내역">관리자 페이지</a></li> -->
					<li><a href="javascript:void(window.open('admin/home', '관리자페이지'))">관리자 페이지</a></li>
				</ul>
			</c:when>
			<c:otherwise>
			<ul>
				<li class="active"><a href="myMipi" title="마이페이지">${user.name }님의 미피</a></li>
				<li><a href="/app/orderList" title="내주문내역">내주문내역</a></li>
				<li><a href="/mypage/myCoupon" title="내쿠폰">내쿠폰</a></li>
				<li><a href="/mypage/myQnaList" title="내문의내역">내문의내역</a></li>
				<li><a href="myInfo_step1" title="정보수정">정보수정</a></li>
				<li><a href="/app/buket" title="장바구니">장바구니</a></li>
				<li><a href="drop_member" title="회원탈퇴">회원탈퇴</a></li>
			</ul>
			</c:otherwise>
		</c:choose>
		
		<%-- <ul>
			<li class="active"><a href="myMipi" title="마이페이지">${user.name }님의 미피</a></li>
			<li><a href="/mypage/orderList" title="내주문내역">내주문내역</a></li>
			<li><a href="/mypage/myCoupon" title="내쿠폰">내쿠폰</a></li>
			<li><a href="/mypage/myQnaList" title="내문의내역">내문의내역</a></li>
			<li><a href="myInfo_step1" title="정보수정">정보수정</a></li>
			<li><a href="/order/myCart" title="장바구니">장바구니</a></li>
			<li><a href="drop_member" title="회원탈퇴">회원탈퇴</a></li>
		</ul> --%>
	</aside>

			<!-- contents -->
			<section id="contents">
				<form id="myOrderListForm" name="myOrderListForm">
				<input type="hidden" id="mode" name="mode" value="01">
				<input type="hidden" id="cPage" name="cPage" value="1">
				<input type="hidden" id="call_order_id" name="call_order_id" value="">
				
				<ul id="location">
					<li><a class="home" href="/index">HOME</a></li>
					<li><span>마이페이지</span></li>
					<li><strong>내주문내역</strong></li>
				</ul>

				<div class="cont_top">
					<h1>내주문내역</h1>
				</div>

				
				<div class="list_search">
					<!-- <ul class="tabmenu2 l_search">
						<li class="on">
							<a href="javascript:GoSwfUrl('MN100101');">
								<span>배달주문내역</span>
							
						</li>
						
						
					</ul> -->
					<!-- <div class="r_search">
						<select class="date_sel" id="month_period" name="month_period" title="검색기간 선택">
							
							<option value="01" selected="selected">1개월</option>
							<option value="02">3개월</option>
							<option value="03">6개월</option>
							
						</select>
						<span class="datepicker_wrap"><input class="datepicker" type="text" /></span> -
						<span class="datepicker_wrap"><input class="datepicker" type="text" /></span>
						<a href="javascript:searchOrderList();" class="button h25 white">검색<span class="gt">&gt;</span></a>
					</div> -->
				</div>
				<div id="tabCon1">
					<table class="tbl_style" id="dataTable">
						<caption>배달주문내역 - 주문일자, 주문채널, 주문번호, 결제금액, 할인금액, 최종결제금액, 주문매장, 상태, 설정 등 확인</caption>
						<colgroup>						
							<col style="width:100px">						
							<col style="width:80px">
							<col style="width:80px">
							<col style="width:85px">
							<col style="width:85px">
							<col style="width:100px">
							<col style="width:130px">
							<col style="width:80px">
							<col style="width:80px">
						</colgroup>
						<thead>
							<tr align="center">
								<th scope="col">주문코드</th>
								<th scope="col">이메일</th>
								<th scope="col">메뉴이름</th>
								<th scope="col">수량</th>
								<th scope="col">사이즈</th>
								<th scope="col">엣지</th>
								<th scope="col">결제수단</th>
								<th scope="col">총 금액</th>
								<th scope="col">결제시간</th>
							</tr>
						</thead>
						<tbody>
						
								<c:forEach items="${orderList}" var="list">
								<c:if test="${list.oemail eq sessionScope.email }">
									<tr style="font-size: 12px">
										<td>${list.omchttrdno }</td>
										<td>${list.oemail }</td>
										<td>${list.oname }</td>
										<td>${list.ocount }</td>
										<td>${list.osize }</td>
										<td>${list.oedge }</td>
										<td>${list.omethod }</td>		
										<td>${list.oprice }</td>		
										<td>${list.odonedate }</td>
									</tr>
								  
								  </c:if>
								</c:forEach>
							</tbody>
						<!-- <tbody>
							
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
							
						
							<tr>
								<td class="t_gray" colspan="9">주문내역이 없습니다.</td>
							</tr>
						
						
						</tbody> -->
					</table>

					<p class="list_paging">
					
						<img src="//cdn.mrpizza.co.kr/2014_resources/images/common/paging_prev.gif" alt="이전페이지">
						<span>
							<strong>1</strong>
						</span>
						<img src="//cdn.mrpizza.co.kr/2014_resources/images/common/paging_next.gif" alt="다음페이지">
					
					
					
					</p>
				</div>

				
				<!--
				<div class="guide_box mt20">
					<ul>
						<li class="bg1">
							<strong>주문접수</strong>
							<p>고객님이 주문하신 메뉴가 접수되었습니다.</p>
						</li>
						<li class="bg2">
							<strong>만드는 중</strong>
							<p>고객님의 메뉴를 요리 중 입니다.</p>
						</li>
						<li class="bg3">
							<strong>배달중</strong>
							<p>고객님의 피자가 배달되고 있습니다.</p>
						</li>
						<li class="bg4">
							<strong>포장완료</strong>
							<p>피자가 포장되었습니다.</p>
						</li>
						<li class="bg5">
							<strong>배달 / 전달 완료</strong>
							<p>배달 및 전달이 완료되었습니다.</p>
						</li>
						<li class="bg6">
							<strong>주문오류</strong>
							<p>주문이 비정상적으로 종료되었습니다.</p>
						</li>
					</ul>
				</div>
				-->
				</form>
			</section>
			<!-- //contents -->

		</div>
		<!-- //container -->

	


<%@include file="../common/footer.jsp" %>
<%@include file="../common/side.jsp" %>
</body>
</html>