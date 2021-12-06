<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Optional"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<%
   List<Map<String,Object>>product=(List<Map<String,Object>>)request.getAttribute("product");
   List<String>edges=(List<String>)Optional.ofNullable(request.getAttribute("edges")).orElseGet(()->new ArrayList<String>());
   List<String>mSizes=(List<String>)Optional.ofNullable(request.getAttribute("mSizes")).orElseGet(()->new ArrayList<String>());
   String stitle=product.get(0).get("STITLE").toString();
   String pname=product.get(0).get("MNAME").toString();
   String img=product.get(0).get("IMG").toString();
   String price=product.get(0).get("PRICE").toString();
   //String size=Optional.ofNullable(product.get(0).get("MSIZE").toString()).orElseGet(()->null);
   String intro=product.get(0).get("INTRO").toString();


%>

<!-- container -->
<div id="container" class="full_cont">

   <!-- contents -->
   <form id="detailForm" name="detailForm">
      <input type="hidden" id="product_key" name="product_key"
         value="0107011010" /> <input type="hidden" id="product_gubun"
         name="product_gubun" value="MP01" /> <input type="hidden"
         id="dough_id" name="dough_id" value="" /> <input type="hidden"
         id="option_id" name="option_id" value="" />
      <section id="contents" class="noPad">
         <ul id="location">
            <li><a class="home" href="/app/">HOME</a></li>
            <li><span>메뉴</span></li>
            <li><span><%=stitle %></span></li>
            <li><strong><%=pname %></strong></li>
         </ul>

         <div class="cont_top product_top">
            <h1 class="pizza_menu"><%=pname %></h1>
            <a href="javascript:window.history.back()" class="btn_prevPage">목록가기</a>
            <!-- <a href="#" class="btn_nextPage">다음메뉴</a> -->
         </div>
         <section class="product_wrap">
            <div class="product_img">
               <ul>
                  <!-- <li><img src="//cdn.mrpizza.co.kr/2014_resources/images/@img3.jpg" alt="제품이미지" /></li> -->
                  <li><img
                     src="<%=img %>"
                     alt="제품이미지" /></li>

               </ul>
            </div>
   
            
            <div class="product_opt">
               <ul>
               
                     <% 
                        if(edges.size()>0){
                     %>
                           <li><strong>엣지</strong>
                        <div>
                     <%      for(String s:edges){ %>
                              <div class="edge">
                                 <input type="radio" name="edge" value="<%=s%>"> <%=s %>
                              </div>
                     <% } %>
                        
                        </div></li>
                     <%}%>
                        
               

                  <li><strong><label for="p_num">수량</label></strong>
                     <div>
                     
                        <span
                           class="ui-spinner ui-widget ui-widget-content ui-corner-all"
                           style="height: 35px;">
                           <input class="detail_spinner ui-spinner-input" id="p_num" name="p_num" type="text" value="1" title="수량입력" style="width: 46px; text-align: center;" 
                           aria-valuemin="1" aria-valuemax="5" aria-valuenow="1"
                           autocomplete="off" role="spinbutton" readonly="readonly">
                           <a
                           class="ui-spinner-button ui-spinner-up ui-corner-tr ui-button ui-widget ui-state-default ui-button-text-only"
                           tabindex="-1" role="button" aria-disabled="false" onclick="javascript:d_plus()" >
                           <i class="icon icon-plus" id="d_plus"></i></a>
                           <a class="ui-spinner-button ui-spinner-down ui-corner-br ui-button ui-widget ui-state-default ui-button-text-only"
                           tabindex="-1" role="button" aria-disabled="false" onclick="javascript:d_minus()" ><i
                              class="icon icon-minus" id="d_minus"></i></a></span>
                     </div></li>
                     
                     
                     

                     
                  <li class="product_rdo"><strong><label for="p_size">가격</label></strong>
                     <div>
                     <%
                        if(mSizes.size()>1){
                        //   for(String size:mSizes){
                           List<Map<String,Object>>rProduct=(List<Map<String,Object>>)request.getAttribute("rProduct");
                           List<Map<String,Object>>lProduct=(List<Map<String,Object>>)request.getAttribute("lProduct");
                           String rPrice = rProduct.get(0).get("PRICE").toString();
                           String lPrice = lProduct.get(0).get("PRICE").toString(); 
                           String rSize=rProduct.get(0).get("MSIZE").toString();
                           String lSize=lProduct.get(0).get("MSIZE").toString();
                           
                     
                     %>
                         <%-- <label> <input name="p_item_999" id="p_item_999"
                           type="radio" class="radio" onclick="javascript:chkOrderAmt();"
                           value="0107011010|||<%=price%>|||p_num" /> <span class="lbl t_org" id="size"><%=mSizes.get(0) %><span
                              class="blind">사이즈</span> <%=price %>원</span>
                        </label>
                        <label> <input name="p_item_999" id="p_item_999" 
                           type="radio" class="radio" onclick="javascript:chkOrderAmt();"
                           value="0107011010|||<%=price%>|||p_num" /> <span class="lbl t_red" id="size"><%=mSizes.get(1) %>
                           <span class="blind">사이즈</span>  <%=price %>원</span>
                                                      </label> --%>
                                                      
                        <label> <input name="p_item_999" id="p_item_999"
                           type="radio" class="radio" onclick="javascript:chkOrderAmt();"
                           value="0107011010|||<%=rPrice%>|||p_num|||<%=rSize %>" /> 
                           
                           <span class="lbl t_org"><%=rSize %><span
                              class="blind">사이즈</span> <%=rPrice %>원</span>
                        </label>
                        <label> <input name="p_item_999" id="p_item_999"
                           type="radio" class="radio" onclick="javascript:chkOrderAmt();"
                           value="0107011010|||<%=lPrice%>|||p_num|||<%=lSize %>"/> <span class="lbl t_red"><%=lSize %><span
                              class="blind">사이즈</span> <%=lPrice %>원</span>
                        </label>
                     <%
                     //      }
                     %>
                           <li><strong>조각정보</strong>
                           <div class="hidden">
                                    <p class="size_txt">
                                       <img src="//cdn.mrpizza.co.kr/2014_resources/images/product/sizeR.gif" alt="R 사이즈">
                                       <strong>레귤러<br>(2-3인용)</strong>
                                    </p>
                                    
                                    <p class="size_txt">
                                       <img src="//cdn.mrpizza.co.kr/2014_resources/images/product/sizeL.gif" alt="L 사이즈">
                                       <strong>라지<br>(3-4인용)</strong>
                                    </p>
                                    
                                 </div>
                        </li>
                     <%      
                     }else{
                     %>
                        <label> <input name="p_item_999" id="p_item_999"
                           type="radio" class="radio" onclick="javascript:chkOrderAmt();"
                           value="0107011010|||<%=price%>|||p_num" /> <span class="lbl t_org"><span
                              class="blind"></span> <%=price %>원</span>
                        </label></div>
                        
                        </li>
                     <%   
                     }
                     %>
                     
               </ul>
               <div class="price">
                  <p>
                     <span>주문금액</span>
                      <strong id="detailAmt">0</strong>
                  </p>
                  <div>
                     <a href="#" onclick="insertCart()"
                        class="button h45">장바구니<span class="gt">&gt;</span></a> 
                        <a href="#"
                        onclick="insertCart()"
                        class="button h45 red">바로주문<span class="gt">&gt;</span></a>
               <input type="hidden" id="productName" name="<%=pname %>" value="<%=pname %>" /> 
            
               
                  
                  
                  </div>
               </div>
            </div>
            <div class="clear"></div>
         </section>



         <!-- <div class="product_banner">
               <a href="#"><img src="//cdn.mrpizza.co.kr/2014_resources/images/@banner1.jpg" alt="임시배너"></a>
            </div> -->

         <section class="product_cont">
            <h1 class="line_tit2">
               <span>메뉴소개</span>
            </h1>
            <div class="product_summary">
               <%=intro %>
            </div>
         </section>


         <!-- 300% 원칙 -->
         <section class="product_cont">
            <h1 class="line_tit2">
               <span>미스터피자헛 절대불변의 3가지 원칙</span>
            </h1>
            <div class="threelive">
               <h2>
                  <img src="resources/image/mrpizzahut3.gif" alt="미스터피자헛 절대불변의 3가지 원칙">
               </h2>
               <ul>
                  <li><img
                     src="//cdn.mrpizza.co.kr/2014_resources/images/product/img_live01.jpg"
                     alt="수타도우 이미지">
                     <p>
                        <strong>100% 수타도우</strong> <span>냉동도우가 아닌 <span
                           class="t_org">효모가 살아있는 생도우만 사용.</span><br /> 손으로 직접 치고 공중회전으로
                           사이즈를 늘입니다.
                        </span>
                     </p></li>
                  <li><img
                     src="//cdn.mrpizza.co.kr/2014_resources/images/product/img_live02.jpg"
                     alt="수제토핑 이미지">
                     <p>
                        <strong>100% 수제토핑</strong> <span>하나하나 정성껏 <span
                           class="t_org">손으로만 토핑을 완성</span>하는 수제피자 입니다.
                        </span>
                     </p></li>
                  <li><img
                     src="//cdn.mrpizza.co.kr/2014_resources/images/product/img_live03.jpg"
                     alt="석쇠구이 이미지">
                     <p>
                        <strong>100% 석쇠구이</strong> <span>기름을 바르지 않고 <span
                           class="t_org">그릴에 제대로 구워 </span><br /> 담백한 풍미는 높이고 칼로리는 줄였습니다.
                        </span>
                     </p></li> 
               </ul>
            </div>
         </section>
         <a href="javascript:window.history.back()" class="button w180 h45 mt30">목록가기</a>
      </section>
   </form>
   <!-- //contents -->
</div>
<%@include file="../common/side.jsp" %>
<%@include file="../common/footer.jsp"%>
</body>
</html>