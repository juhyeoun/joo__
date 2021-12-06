<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%
	List<Map<String,Object>>products=(List<Map<String,Object>>)request.getAttribute("products");
%>
		<div class="menu_category_loca_wrap">
			<div>
				<ul id="location">
						<li><a class="home" href="/app">HOME</a></li>
						<li><span id="location_title">1인용피자</span></li>
						<li><strong>피자샌드</strong></li>
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
	<h1 id="lnb_title">1인용피자</h1>
	<ul>
					<li class=" active">
					<a href="/app/pizzasand?scope=stitle&stitle=피자샌드">피자샌드
					</a></li>
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
					<h1>피자샌드</h1>
					<p>미스터피자헛의 BEST 제품을 한손에 담았다!</p>
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
</html>
