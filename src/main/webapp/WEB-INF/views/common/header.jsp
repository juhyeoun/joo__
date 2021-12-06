<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String email=(String)session.getAttribute("email");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="<c:url value="/resources/csslib.css" />" rel="stylesheet">
<script src="<c:url value="/resources/jslib.js?ver=123" />"></script>
<script src="<c:url value="/resources/js/member/join.js?ver=223" />"></script>
<script src="<c:url value="/resources/js/member/login.js?ver=81223" />"></script>
<script src="<c:url value="/resources/js/member/find.js?ver=11" />"></script>
<script src="<c:url value="/resources/js/cart.js" />"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
<header class="header">
	<div class="inner_renew">
		<div class="gnb_wrap">
			<h1><a href="/app/">로고</a></h1>
			<nav class="gnb">
				<ul>
					<li class="order_gnb">
							<a href="/app/buket" onclick="javascript:cartOpen();"><i><img src="//cdn.mrpizza.co.kr/2014_resources/images/common/ico_gnb_01.png" alt="바로주문"></i><span><strong>바로주문</strong></span></a>
					</li>
					<li>
                  <a href="/app/premium?scope=stitle&stitle=프리미엄 피자"><i><img src="//cdn.mrpizza.co.kr/2014_resources/images/common/ico_gnb_02.png" alt="메뉴"></i>메뉴</a>
                  <ul>
                  <!-- 
                     <li><a href="/menu/premium">피자</a></li>
                     <li><a href="/menu/pizzasand">1인용피자</a></li>
                     <li><a href="/menu/doublethin">특가세트</a></li>
                     <li><a href="/menu/appetizer">샐러드&amp;사이드</a></li>
                   -->
                  
                     <li><a href="/app/premium?scope=stitle&stitle=프리미엄 피자">피자</a></li>
                           <li><a href="/app/pizzasand?scope=stitle&stitle=피자샌드">1인용피자</a></li>
                           <li><a href="/app/doublethin?scope=stitle&stitle=더블씬세트">특가세트</a></li>
                          <li><a href="/app/appetizer?scope=stitle&stitle=샐러드/사이드">샐러드/사이드</a></li>
                  </ul>
               </li>
					<li>
						<a href="#"><i><img src="//cdn.mrpizza.co.kr/2014_resources/images/common/ico_gnb_03.png" alt="매장"></i>매장</a>
						<ul>
							<li><a href="/store/store_search">매장찾기</a></li>
							<li><a href="/store/storeBuffet_search">뷔페매장</a></li>
							<li><a href="/store/store_menu">매장전용메뉴</a></li>
						</ul>
					</li>
					<li>
                  <a href="event_on"><i><img src="//cdn.mrpizza.co.kr/2014_resources/images/common/ico_gnb_04.png" alt="이벤트"></i>이벤트</a>
                  <ul>
                     <li><a href="event_on">이벤트</a></li>
                     <li><a href="#" title="종료된 이벤트">종료된 이벤트</a></li>
                  </ul>
               </li>
					<li>
						<!-- 비로그인상태 -->
						<!-- <a href="/login_join/login"><i><img src="//cdn.mrpizza.co.kr/2014_resources/images/common/ico_gnb_05.png" alt="마이미피"></i>마이미피</a> -->
						<!-- 로그인상태 -->
						<!-- <a href="/mypage/myMipi"><i><img src="//cdn.mrpizza.co.kr/2014_resources/images/common/ico_gnb_05.png" alt="마이미피"></i>마이미피</a> -->
						
							 
							<c:choose>
								<c:when test="${sessionScope.email == null }">
					 			<a href="login"><i><img src="//cdn.mrpizza.co.kr/2014_resources/images/common/ico_gnb_05.png" alt="마이미피"></i>마이미피</a>
								</c:when>		
								<c:otherwise>
									<a href=myMipi><i><img src="//cdn.mrpizza.co.kr/2014_resources/images/common/ico_gnb_05.png" alt="마이미피"></i>마이미피</a>
								</c:otherwise>
							</c:choose>
							
							
								<ul>
									<li><a href="login">마이  미피</a></li>
									<li><a href="/mypage/orderList">내주문내역</a></li>
									<li><a href="/mypage/myCoupon">내쿠폰</a></li>
									<li><a href="/mypage/myQnaList">내문의내역</a></li>
									<li><a href="/mypage/myInfo_step1">정보수정</a></li>
									<li><a href="/menu/allpizza">장바구니</a></li>
									<li><a href="/mypage/drop_step1">회원탈퇴</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
				<div class="hd_btn_area">
			</div>
		</div>
</header>
</body>
</html>