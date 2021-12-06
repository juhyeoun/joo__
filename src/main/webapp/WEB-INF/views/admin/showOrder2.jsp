<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ include file="../common/adminHeader.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
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
 							 if(item.ocancleflag == 0){
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
 							}
 							str+="<td>"+item.omethod+"</td>";
 							str+="<td>"+item.oprice+"</td>";
 							str+="<td>"+item.ocreated+"</td>";
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
</head>
<body id="page-top">

	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">주문 조회</h1>
		<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-warning">Order List Board</h6>
				<!-- 검색 시작 -->
				<div align="right">
					<form action="#" method="get">
						<input type="text" name="omchttrdno" id="omchttrdno" placeholder="주문 코드" style="width:10%" onkeyup="enterKey5()"/> 
						<input style="margin:0px 3px; padding:0px 3px" class="btn btn-warning" type="button" onclick="searchCode()" value="search" />
					</form>
				</div>
				<!-- 검색 종료 -->
				<%-- <span>총 ${cnt }건</span> --%>
			</div>
				<div class="card-body">
				<div class="fixed-table-container">
					<div class="fixed-table-body">
						<table class="table table-bordered" id="dataTable" style="width:auto;">
							<thead>
								<tr align="center" style="font-size: 12px">
									<th>주문 코드</th>
									<th>이메일</th>
									<th>메뉴 이름</th>
									<th>수량</th>
									<th>사이즈</th>
									<th>엣지</th>
									<th>환불</th>
									<th>환불날짜</th>
									<th>사용쿠폰</th>
									<th>결제 수단</th>
									<th>총 금액</th>
									<th>주문 시간</th>
									<th>결제 시간</th>
								</tr>
							</thead>
							<tbody>
							<c:set var="cancelTrue" value="o"></c:set>
							<c:set var="cancelFalse" value="x"></c:set>
								<c:forEach items="${orderList}" var="list">
									<tr style="font-size: 12px">
										<td>${list.omchttrdno }</td>
										<td>${list.oemail }</td>
										<td>${list.oname }</td>
										<td>${list.ocount }</td>
										<td>${list.osize }</td>
										<td>${list.oedge }</td>
										<c:choose>
											<c:when test="${list.ocancleflag eq 0}">
												<td>${cancelFalse }</td>
											</c:when>
											<c:otherwise>
												<td>${cancelTrue }</td>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${list.ocancledate eq null}">
												<td>${cancelFalse }</td>
											</c:when>
											<c:otherwise>
												<td>${list.ocancledate }</td>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${list.ocoupons eq null}">
												<td>${cancelFalse }</td>
											</c:when>
											<c:otherwise>
												<td>${list.ocoupons }</td>
											</c:otherwise>
										</c:choose>
										<td>${list.omethod }</td>		
										<td>${list.oprice }</td>		
										<td>${list.ocreated }</td>
										<td>${list.odonedate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<!-- pagination -->
				<div align="center">
					<ul class="pagination">
						<c:if test="${pagination.prev}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_prev('${pagination.page}','${pagination.range}','${pagination.rangeSize}','${pagination.searchKeyword }')">Prev</a></li>
						</c:if>
						<c:forEach begin="${pagination.startPage}"
							end="${pagination.endPage}" var="idx">
							<li
								class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
								class="page-link" href="#"
								onClick="fn_pagination('${idx}','${pagination.range}','${pagination.rangeSize}','${pagination.searchKeyword }')">
									${idx} </a></li>
						</c:forEach>
						<c:if test="${pagination.next}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_next('${pagination.page}','${pagination.range}', '${pagination.rangeSize}','${pagination.searchKeyword }')">Next</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->
</body>
</html>