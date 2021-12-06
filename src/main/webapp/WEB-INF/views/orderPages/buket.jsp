<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<% 
List<Map<String, Object>>maps=(List<Map<String, Object>>)request.getAttribute("maps");
int totalPrice=(int)request.getAttribute("totalPrice");
%>

<html>
<head>
   <title>Home</title>
</head>
<body style="">
<!-- WIDERPLANET  SCRIPT START 2017.7.13 -->
<div id="wp_tg_cts" style="display:none;"><script id="wp_tag_script_1636101767469" src="https://astg.widerplanet.com/delivery/wpc.php?v=1&amp;ver=4.0&amp;r=1&amp;md=bs&amp;ga=1go6pcf-1mgh2k6-3-1&amp;ty=Cart&amp;ti=20768&amp;hcuid=e8fbc609ce282e7a4c04e8c7446c56b07414abba&amp;device=web&amp;charset=UTF-8&amp;tc=1636101767469&amp;ref=https%3A%2F%2Fwww.mrpizza.co.kr%2Forder%2FdeliveryOrder&amp;loc=https%3A%2F%2Fwww.mrpizza.co.kr%2Forder%2FmyCart"></script><script id="wp_log_script_1636101767971" src="https://pixel.mathtag.com/sync/js?exsync=https%3A%2F%2Fastg.widerplanet.com%2Fdelivery%2Fwpp.php%3Fmmuuid%3D%5BMM_UUID%5D"></script></div>

   <!-- skipNavi -->
   <div id="skipNavi">
      <a href="#contents">본문 바로가기</a>
      <a href="#gnb">주메뉴 바로가기</a>
      <a href="#footer">사이트정보 바로가기</a>
   </div>
   <!-- //skipNavi -->

   
   
      <!-- container -->
      <div id="container" class="full_cont">
         <!-- lnb -->
         <aside id="lnb">
            <h1>장바구니</h1>
         </aside>
         <!-- //lnb -->

         <!-- contents -->
         <section id="contents">
            <ul id="location">
               <li><a class="home" href="/index">HOME</a></li>
               <li><strong>장바구니</strong></li>
            </ul>

            <div class="order_top">
               <div class="tit">                  
                  <h1>장바구니</h1>
                  <p>
                     
                   <!--   주문유형 : <span class="t_blue">배달주문</span> -->
                     
                     
                     
                  </p>
               </div>
               <ul><!-- on클래스로 제어 -->
                  <li class="bg1 on"><p>장바구니</p></li>
                  <li class="bg2"><p>결제하기</p></li>
                  <li class="bg3"><p>주문완료</p></li>
               </ul>
            </div>
            
            <form id="myCartForm" name="myCartForm">
            <div class="order_wrap">
               <!-- myCartList -->
   
<div id="myCartList">

<div id="myCartList">
   <section class="l_order">
      <h2 class="cont_tit tit2">담은제품</h2>
      <table class="tbl_style order_tbl mt10">
         <caption>장바구니 담은 제품 리스트 - 제품, 수량, 가격등 확인</caption>
         <colgroup>
            <col style="width:40px">
            <col style="width:175px">
            <col>
            <col style="width:155px">
            <col style="width:180px">
         </colgroup>
         <thead>
            <tr>
               <th scope="col">
                  <label>
                     <input name="checkbox" id="all_check" class="checkbox"  type="checkbox" onclick="bucketcheckAll()" checked>
                     <span class="lbl"><span class="blind">모두선택</span></span>
                  </label>
               </th>
               <th scope="col" colspan="2">제품</th>
               <th scope="col">수량</th>
               <th scope="col">가격</th>
            </tr>
         </thead>
         

                  <%
                     for(Map<String,Object>map:maps){
                     %>   
                        <tbody id="<%=map.get("CNUM")%>body">
                        <tr id="cart_spin">                  
                     <td rowspan="2">
                        <label>
                           <input type="checkbox" onclick="bucketcheck(<%=map.get("CNUM")%>)" id="cart_item" name="cart_item" class="checkbox" value="<%=map.get("CNUM")%>" checked>
                           <span class="lbl"><span class="blind">선택</span></span>
                        </label>
                     </td>
                     <td>
                        <img src="<%=map.get("img") %>" class="img" alt="임시이미지">
                     </td>
                     <td class="t_left">
                        <p><strong class="f16"><%=map.get("CMENU") %></strong></p>
                        
                        <%
                        if(map.get("CSIZE")!=null){
                           %>
                           <p>사이즈 :<%=map.get("CSIZE") %></p>
                        <%}
                        if(map.get("CEDGE")!=null){
                           %>
                           <p>엣지 :<%=map.get("CEDGE") %></p>
                        <%}
                        
                        %>
                           

                           
                        
                        
                     </td>
                     <td>
                        <input type="hidden" id="cart_plus" name="cart_plus" value="01|||07|||02|||1010|||P|||1">
                        <input type="hidden" id="cart_minus" name="cart_minus" value="01|||07|||02|||1010|||M|||1">
                        <input type="hidden" id="product_price" name="product_price" value="27900">
                        <input type="hidden" id="alarm_flag" name="alarm_flag" value="">
                        
                           
                           
                        <input type="hidden" id="<%=map.get("CNUM") %>originPrice"  value="<%=map.get("price") %>">      
                           
                        
                        <span class="ui-spinner ui-widget ui-widget-content ui-corner-all" style="height: 35px;">
                           <input class="cartSpinner ui-spinner-input" type="text" value="<%=map.get("CCOUNT") %>" id="<%=map.get("CNUM") %>count" title="수량입력" style="width:46px;text-align:center;" readonly="" aria-valuemin="0" aria-valuemax="25" aria-valuenow="1" autocomplete="off" role="spinbutton">
                              <a href="#" onclick="test(<%=map.get("CNUM")%>,1)" class="ui-spinner-button ui-spinner-up ui-corner-tr ui-button ui-widget ui-state-default ui-button-text-only cartPlus" tabindex="-1" role="button" aria-disabled="false">
                                 <i class="icon icon-plus"></i>
                              </a>
                              <a href="#" onclick="test(<%=map.get("CNUM")%>,-1)" class="ui-spinner-button ui-spinner-down ui-corner-br ui-button ui-widget ui-state-default ui-button-text-only cartMinus" tabindex="-1" role="button" aria-disabled="false">
                                 <i class="icon icon-minus"></i>
                              </a>
                        </span>
                     </td>
                     <td><p class="t_price"><strong  class="<%=map.get("CNUM")%>price"><%=map.get("price") %></strong>원</p></td>
                  </tr>
                     </tbody>
               <%    }
                  %>

      </table>
      
      
      <p class="mt10">
         <a href="#"  onclick="buttoncheckAll()" class="button h30 w115 white">제품전체선택</a>
         <a href="/app/premium?scope=stitle&stitle=프리미엄 피자" class="button h30 w115 white">계속 주문하기</a>
         <a href="#" onclick="deletechoice()" class="button h30 w115 delProduct_pop_open">선택제품삭제 <span class="ic_x"></span></a>
      </p>

      <ul class="txt_list mt40">
         <!-- <li>장바구니 저장기간은 5일입니다. 5일이 초과된 제품은 자동으로 삭제됩니다.</li> -->
         <li>장바구니 제품 중 할인 행사 종료된 경우 해당 가격으로 주문이 불가합니다.</li>
         <li>핫소스 및 갈릭소스는 1개씩 기본 제공되며,<strong class="t_red">국내산 오이피클</strong>은 R 1개 / L 2개씩 기본 제공됩니다</li>
         <li>그 외 추가 수량은 사이드 메뉴란에서 유상 주문 가능합니다.</li>
         <!--  <li>오븐치킨 주문시 양념치킨소스 1개, 국내산 오이피클 1개 제공됩니다.</li> -->
         <li>샐러드메뉴 (홈샐러드/케이준샐러드) 제외한 결제금액 16,000원 이상 배달 가능합니다.</li>
         <!-- <li>사이드만 주문시 샐러드메뉴 (홈샐러드/케이준샐러드/리코타샐러드) 제외한 결제금액 14,000원 이상 배달 가능합니다.</li> -->
         <li class="bold"><strong class="t_red">일부 매장에서는 배달비를 부과</strong>하고 있으며, <strong class="t_red">배달 주문 시 일정 금액의 배달비가 추가될 수 있음</strong>을 안내드립니다. <br>(배달비는 거리별로 상이하며, 주로 먼 거리의 배달건에 추가되고, 사전결제가 아닌 현장결제로 진행됩니다.)</li>
      </ul>
      
      <input type="hidden" id="notSaleProductCount" name="notSaleProductCount" value="0">
   </section>
   
   
   
   <section class="r_order">
      <div class="pay_box" style="top: 30px;">
         <h1>주문계산</h1>
         <div class="store">
            <p><strong>압구정점</strong></p>
            
         </div>
         <ul class="p_list">
            <%for(Map<String,Object>map:maps){
               
               
               %>
            
            <li>
               <span class="<%=map.get("CMENU") %>name"><%=map.get("CMENU") %></span>
               <span class="<%=map.get("CSIZE") %>t_org"><%=map.get("CSIZE") %></span>   
               <span class="<%=map.get("CNUM")%>num"><%=map.get("CCOUNT") %></span>
               <strong class="<%=map.get("CNUM")%>price"><%=map.get("price") %></strong>
               
               
            </li>
            <%}%>
            
         </ul>
         <input type="hidden" id="totalPrice" value="<%=totalPrice %>"> 
         
         <ul class="dc_pay">
            <li>주문금액 <strong class="totalPrice" id="totalPrice1"><%=totalPrice %></strong></li>
            <li>쿠폰할인 <strong>-0원</strong></li>
            <!--<li class="t_org">온라인제품권 <strong>원</strong></li>-->
         </ul>
         <div class="price">
            <b>결제예정금액</b>
            <strong><span class="totalPrice" id="totalPrice2"><%=totalPrice %></span>원</strong>
         </div>
         <p class="t_center">
            <a href="/app/pay"  class="button h40 red">할인선택 <span class="gt">&gt;</span></a>
         </p>
      </div>
   </section>
</div></div>
               <!-- //myCartList-->
               <div class="clear"></div>
            </div>
            </form>
            
         </section>
         <!-- //contents -->

         <!-- pop_layer -->         
         <article id="popup" class="pop_wrap pop_layer hide">
            <h1>삭제</h1>
            <div class="pop_cont">
               <p class="t_center bold">제품을 삭제하시겠습니까?</p>
               <p class="t_center mt20" id="myCart_confirm">
                  <a href="#" class="button btn_move w100 h30 white">확인<span class="gt">&gt;</span></a>
                  <a href="#" class="button btn_move w100 h30 white pop_close">취소<span class="gt">&gt;</span></a>
               </p>
            </div>
            <a href="#" class="btn_close pop_close">닫기</a>
         </article>
         
         <article id="notSalePopup" class="pop_wrap pop_layer hide">
            <h1>미 판매 제품 삭제</h1>
            <div class="pop_cont">
               <p class="t_center bold">미 판매 제품을 삭제하시겠습니까?</p>
               <p class="t_center mt20" id="notSale_confirm">
                  <a href="#" class="button btn_move w100 h30 white">확인<span class="gt">&gt;</span></a>
                  <a href="#" class="button btn_move w100 h30 white pop_close">취소<span class="gt">&gt;</span></a>
               </p>
            </div>
            <a href="#" class="btn_close pop_close">닫기</a>
         </article>
         <!-- //pop_layer -->
      </div>
      <!-- //container -->
   

<%@include file="../common/footer.jsp" %>





<div id="adn_panel_wrap" class="closing_bg" style="display: none;"></div><iframe src="https://pixel.mathtag.com/sync/iframe?mt_uuid=ea4d6182-abee-4000-b4bc-63aa3a6dff8b&amp;no_iframe=1&amp;exsync=https%3A%2F%2Fastg.widerplanet.com%2Fdelivery%2Fwpp.php%3Fmmuuid%3D%5BMM_UUID%5D&amp;source=mathtag" id="mm_sync_back_ground" title="MediaMath Advertising" style="visibility: hidden; display: none;"></iframe></body>
</body>
</html>