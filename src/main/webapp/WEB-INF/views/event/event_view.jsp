<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>
<%
   List<Map<String, Object>>event=(List<Map<String,Object>>)request.getAttribute("event");
   String eTitle=event.get(0).get("ETITLE").toString();
   String eStart=event.get(0).get("ESTART").toString();
   String eDue=event.get(0).get("EDUE").toString();
   String eMImg=event.get(0).get("EMIMG").toString();
%>

      <!-- container -->
      <div id="container" class="full_cont">
         <!-- lnb -->
         
         <aside id="lnb">
            <h1>이벤트</h1>
            <ul>
               <li><a href="event_on" title="이벤트">이벤트</a></li>
               <li><a href="#" title="종료된 이벤트">종료된 이벤트</a></li>
               <!-- <li><a href="/event/poll_list" title="온라인 설문조사">온라인 설문조사</a></li>-->
            </ul>
         </aside>
         <!-- //lnb -->

         <!-- contents -->
         <input type="hidden" id="redFlag" name="redFlag" value="N">
         
         <section id="contents">
            <ul id="location">
               <li><a class="home" href="/app">HOME</a></li>
               <li><span>이벤트</span></li>
               <li><strong>이벤트</strong></li>
            </ul>

            <div class="cont_top">
               <h1>이벤트</h1>
            </div>
            
            <article class="list_view">
                  <h1 id="list_tit" class="tit"><%=eTitle %></h1>
               <div class="info">
                  <span class="date">기간 : <%=eStart %> ~ <%=eDue %></span>
               </div>
               <div class="view_cont evt_view">
                     <img src="<%=eMImg%>"/>
                     
               </div>               
            </article>
            <p class="t_center mt40">
               <a href="event_on" class="button w127">목록가기 <span class="gt">&gt;</span></a>
            </p>
         </section>
         <!-- //contents -->
      </div>
      <!-- //container -->
<%@include file="../common/side.jsp" %>
<%@include file="../common/footer.jsp" %>

</body>
</html>