<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>
<%
   List<Map<String, Object>>eventList=(List<Map<String,Object>>)request.getAttribute("eventList");
%>
<!-- container -->
      <div id="container">
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
         <section id="contents">
         <form id="eventFrm">
         
         <input type="hidden" id="cPage" name="cPage" value="1">
         <input type="hidden" id="seq" name="seq" value="0">
         
            <ul id="location">
               <li><a class="home" href="/app">HOME</a></li>
               <li><span>이벤트</span></li>
               <li><strong>이벤트</strong></li>
            </ul>

            <div class="cont_top">
               <h1>이벤트</h1>
            </div>
            
            <ul class="event_list new_event_list" id="ImgList">
               <%
                  for(Map<String,Object>event:eventList){
               %>
                     <li>
                        <a href="event_view?eTitle=<%=event.get("ETITLE")%>" class="img"><img src="<%=event.get("ESIMG") %>"/></a>
                        <div>
                           <p class="tit"><%=event.get("ETITLE")%></p>
                           <p class="date">진행기간 : <%=event.get("ESTART") %> ~ <%=event.get("EDUE") %></p>
                           <p class="ic">
                              <!-- <img src="//cdn.mrpizza.co.kr/2014_resources/images/event/ic_mobileOn.gif" alt="모바일" /> -->
                              <!-- <img src="//cdn.mrpizza.co.kr/2014_resources/images/event/ic_packageOn.gif" alt="방문포장" /> -->
                           </p>
                        </div>
                     </li>
               <%
                  }
               %>
            </ul>

<!--             <p class="list_paging">
               <img src="//cdn.mrpizza.co.kr/2014_resources/images/common/paging_prev.gif" alt="이전페이지" />
               <c:set var = "page" value = "${(param.p==null)? 1: param.p}"/>
               <c:set var ="startNum" value = "${page-(page-1)%6}"/>
               <span>
                  <c:forEach var = "i" begin= "0" end = "0">
                     <a href="?p=${startNum+i}&t=&q=" >${startNum+i}</a>
                  </c:forEach>
               </span>      
               <img src="//cdn.mrpizza.co.kr/2014_resources/images/common/paging_next.gif" alt="다음페이지" />
            </p>
 -->
            </form>
         </section>
         <!-- //contents -->
      </div>
      <!-- //container -->
<%@include file="../common/side.jsp" %>
<%@include file="../common/footer.jsp" %>

</body>
</html>