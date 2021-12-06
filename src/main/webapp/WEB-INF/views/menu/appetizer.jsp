<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="../common/header.jsp" %>
<%
	List<Map<String,Object>>products=(List<Map<String,Object>>)request.getAttribute("products");
	String stitle=products.get(0).get("STITLE").toString();
	int detail=Integer.parseInt(request.getAttribute("detail").toString());
%>
<%=detail %>
		<div class="menu_category_loca_wrap">
			<div>
				<ul id="location">
						<li><a class="home" href="/app">HOME</a></li>
						<li><span id="location_title">샐러드/사이드</span></li>
						<li><strong><%=stitle %></strong></li>
				</ul>
				<ul class="menu_category">
					<li><a href="/app/premium?scope=stitle&stitle=프리미엄 피자">피자</a></li>
					<li><a href="/app/pizzasand?scope=stitle&stitle=피자샌드">1인용피자</a></li>
					<li><a href="/app/doublethin?scope=stitle&stitle=더블씬세트">특가세트</a></li>
					<li><a href="/app/appetizer?scope=stitle&stitle=샐러드/사이드">샐러드/사이드</a></li>
				</ul>
			</div>
		</div>
		
		<!-- container -->
		<div id="container">
			<!-- lnb -->
			
<aside id="menu_lnb">
	<h1 id="lnb_title">샐러드/사이드</h1>
	<ul>
			<%
					if(detail==1){
						%>
						<li class=" active"><a href="/app/appetizer?scope=stitle&stitle=샐러드/사이드">샐러드/사이드</a></li>
					<%}else{
						%>
						<li><a href="/app/appetizer?scope=stitle&stitle=샐러드/사이드">샐러드/사이드</a></li>
					<%}
			%>
			<%
					if(detail==2){
						%>
							<li class=" active"><a href="/app/appetizer?scope=stitle&stitle=파스타/라이스">파스타/라이스</a></li>
					<%}else{
						%>
						<li><a href="/app/appetizer?scope=stitle&stitle=파스타/라이스">파스타/라이스</a></li>
					<%}
			%>
			<%
					if(detail==3){
						%>
							<li class=" active"><a href="/app/appetizer?scope=stitle&stitle=음료">음료</a></li>
					<%}else{
						%>
						<li><a href="/app/appetizer?scope=stitle&stitle=음료">음료</a></li>
					<%}
			%>
			<%
					if(detail==4){
						%>
							<li class=" active"><a href="/app/appetizer?scope=ltitle&ltitle=샐러드/사이드">모두보기</a></li>
					<%}else{
						%>
						<li><a href="/app/appetizer?scope=ltitle&ltitle=샐러드/사이드">모두보기</a></li>
					<%}
			%>
	</ul>
</aside>
			<!-- //lnb -->
			<!-- contents -->
			<section id="contents">
				

				<form id="menuForm" name="menuForm">
				<div class="cont_top menu_top ">
					<% if(detail==1){
					%>
					<h1>샐러드/사이드</h1>
					<p>미스터피자헛 샐러드바를 집에서 간편하게 즐기는 샐러드와 부담 없이 즐기는 사이드 메뉴</p>
					<% }else if(detail==2){
					%>
					<h1>파스타/라이스</h1>
					<p>엄선된 재료와 미스터피자헛만의 특별함으로 최상의 맛을 제공하는 파스타/라이스</p>
					<% }else if(detail==3){
					%>
					<h1>음료</h1>
					<p>기분까지 상쾌해지는 시원한 탄산 음료</p>
					<% }else if(detail==4){
					%>
					<h1>모두보기</h1>
					<p>가볍게 입맛을 돋궈주어 부담없이 즐기는 사이드/음료</p>
					<% } %>
				</div>

				<ul class="menu_list" id="menu_List">
				<%
				 for(Map<String,Object>product:products){
					 %>
					 	<li style="height: 190px; width: 230px;">
						<i class="r_line"></i>
						<a href="productView?Mname=<%=product.get("MNAME") %>">
							<!-- <span class="ic_new">NEW</span> -->
							<img src="<%=product.get("IMG") %>" alt="임시이미지"/>
							<strong style="font-size: 15px; font-weight: bold;"><%=product.get("MNAME") %> </strong>								
						</a>
<!--					<div class="menu_opt">							
						<div class="menu_sel">
								<p><a href="#">옵션선택</a></p>
								<ul>
									<li><a href="#">칠리있음</a></li>
									<li><a href="#">칠리없음</a></li>
								</ul>
							</div>
							<div class="menu_sel">
								<p><a href="#">엣지선택</a></p>
								<ul>
									<li><a href="#">엣지1</a></li>
									<li><a href="#">엣지2</a></li>
									<li><a href="#">엣지3</a></li>
								</ul>
							</div>
							<p class="menu_btn">
								<a href="#" class="btn_view">미리보기</a>
								<a href="#" class="btn_cart cart_open">장바구니담기</a>
								<a href="#popup" class="btn_order pop_open">바로주문</a>
							</p>
							<div class="menu_txt">
								홍두깨번 최고의 반쪽은? <br />
								에그타!<br />
								미스터피자의 다양한 엣지를 즐겨보세요.
							</div>
						</div>
-->
					</li>
				<% 
					}
				%>	
				</ul>
				</form>
				<div class="clear"></div>
			</section>
			</div>
			<!-- //contents -->
			
<%@include file="../common/side.jsp" %>
<%@include file="../common/footer.jsp" %>

</body>
</html>
