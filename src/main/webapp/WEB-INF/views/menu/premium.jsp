<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@include file="../common/header.jsp" %>
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
						<li><span id="location_title">피자</span></li>
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
			<h1 id="lnb_title">피자</h1>
			
			<ul>
			<%
					if(detail==1){
						%>
						<li class=" active"><a href="/app/premium?scope=stitle&stitle=프리미엄 피자">프리미엄 피자</a></li>
					<%}else{
						%>
						<li><a href="/app/premium?scope=stitle&stitle=프리미엄 피자">프리미엄 피자</a></li>
					<%}
			%>
			<%
					if(detail==2){
						%>
							<li class=" active"><a href="/app/premium?scope=stitle&stitle=씬 크러스트 피자">씬 크러스트 피자</a></li>
					<%}else{
						%>
						<li><a href="/app/premium?scope=stitle&stitle=씬 크러스트 피자">씬 크러스트 피자</a></li>
					<%}
			%>
			<%
					if(detail==3){
						%>
							<li class=" active"><a href="/app/premium?scope=stitle&stitle=클래식 피자">클래식 피자</a></li>
					<%}else{
						%>
						<li><a href="/app/premium?scope=stitle&stitle=클래식 피자">클래식 피자</a></li>
					<%}
			%>
			<%
					if(detail==4){
						%>
							<li class=" active"><a href="/app/premium?scope=ltitle&ltitle=피자">모두보기</a></li>
					<%}else{
						%>
						<li><a href="/app/premium?scope=ltitle&ltitle=피자">모두보기</a></li>
					<%}
			%>
					
			</ul>
		</aside>

			<!-- //lnb -->
			<!-- contents -->
			<section id="contents">
				

				<form id="menuForm" name="menuForm">
				<input type="hidden" id="product_case" name="product_case" value="" />
				<input type="hidden" id="product_key" name="product_key" value="" />
				<input type="hidden" id="product_gubun" name="product_gubun" value="" />
				<input type="hidden" id="dough_id" name="dough_id" value="" />
				<input type="hidden" id="option_id" name="option_id" value="" />
				<input type="hidden" id="pasta_option_id" name="pasta_option_id" value="" />
				<div class="cont_top menu_top ">
					<% if(detail==1){
					%>
						<h1>프리미엄 피자</h1>
						<p>천연발효종을 넣은 생도우에 프리미엄 토핑을 얹어 특별하게 즐기는 피자</p>
					<% }else if(detail==2){
					%>
					<h1>씬 크러스트 피자</h1>
					<p>도우는 슬림하게 토핑은 풍성하게 가격은 라이트하게 충실한 맛과 합리적인 가격의 씬 피자</p>
					<% }else if(detail==3){
					%>
					<h1>클래식 피자</h1>
					<p>천연발효종을 넣은 생도우와 베스트 토핑을 합리적인 가격에 즐기는 피자</p>
					<% }else if(detail==4){
					%>
					<h1>모두보기</h1>
					<p>천연발효종을 넣은 생도우와 생치즈, 유기농 토마토소스로 만든 최고의 피자</p>
					<% } %>
				</div>
					 <ul class="menu_list" id="menuList">
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
						
<!--					
						<p class="menu_size">
							<label>
								<span class="lbl t_org">R<span class="blind">사이즈</span><span class="blind">원</span></span>
							</label>
							<label>
								<span class="lbl t_red">L<span class="blind">사이즈</span><span class="blind">원</span></span>
							</label>
						</p>
						
						<p class="menu_rdo">
							<label>
								<input name="m_rdo" type="radio" class="radio" />
								<span class="lbl t_org">R<span class="blind">사이즈</span> 얼마?<span class="blind">원</span></span>
							</label>
							<label>
								<input name="m_rdo" type="radio" class="radio" />
								<span class="lbl t_red">L<span class="blind">사이즈</span> 얼마?<span class="blind">원</span></span>
							</label>
						</p>
						<div class="menu_opt">							
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
				<% 	 }
				
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

