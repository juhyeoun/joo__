<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../common/header.jsp" %>
    <c:if test="${empty sessionScope.email }">
	<script>
		location.href = '/app/login'
	</script>
</c:if>
<script>
	function claim() {
		var qtitle = document.getElementById('qtitle').value;
		var qname = document.getElementById('qname').value;
		var qstore = document.getElementById('qstore').value;
		var qcontent = document.getElementById('qcontent').value;
		console.log(qtitle);
		console.log(qname);
		console.log(qstore);
		console.log(qcontent);
		
		if(qtitle == ""){
			alert('모두 입력하셔야합니다');
			return;
		}
		if(qname == ""){
			alert('모두 입력하셔야합니다');
			return;
		}
		if(qstore == ""){
			alert('모두 입력하셔야합니다');
			return;
		}
		if(qcontent == ""){
			alert('모두 입력하셔야합니다');
			return;
		}
		
		
		
		alert(qname + qstore + qcontent + qtitle);
		document.getElementById('f').submit();
	}
</script>
<body style="">
<div id="container">
<aside id="lnb">
		<h1>마이페이지</h1>
		<ul>
			<li><a href="myMipi" title="마이페이지">${user.name }님의 미피</a></li>
			<li><a href="orderList" title="내주문내역">내주문내역</a></li>
			<li><a href="#" title="내쿠폰">내쿠폰</a></li>
			<li class="active"><a href="myQnaList" title="내문의내역">내문의내역</a></li>
			<li><a href="myInfo_step1" title="정보수정">정보수정</a></li>
			<li><a href="/app/buket" title="장바구니">장바구니</a></li>
			<li><a href="drop_member" title="회원탈퇴">회원탈퇴</a></li>
		</ul>
	</aside>
			<!-- //lnb -->

			<!-- contents -->

			<section id="contents">
			
				<ul id="location">
					<li><a class="home" href="/app/">HOME</a></li>
					
					<li><strong>칭찬과 불만</strong></li>
				</ul>

				<div class="cont_top">
					<h1>칭찬과 불만</h1>
				</div>

				<div class="drop_Txt">					
					<p>직원 서비스, 청결과 위생, 음식맛과 품질, 인터넷 주문, 콜센터 주문,  <br>매장에서 겪은 불만사항이나 칭찬할만한 일에 관하여 글을 남겨주시면 <br>개선 된 서비스를 제공하기 위해 노력하겠습니다.</p>
				</div>

				
				
				
				<form action="qnaProc" method="POST" id="f">
				<table class="tbl_style myInfo_form">
					<caption>칭찬과 불만 등록하기</caption>
					<colgroup>
						<col style="width:155px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="listTit">제목</label></th>
							<td class="t_left">
								<input type="text" id="qtitle" class="inp1" placeholder="제목을 입력해주세요" title="제목 입력">
								<span class="t_red f12 hide">* 제목을 입력해주세요.</span>
							</td>
						</tr>
						
						
						<tr>
							<th scope="row">이름</th>
							<td class="t_left"><p class="line35">${user.name }</p></td>
							<input type="hidden" id="qname" name="qname" value="${user.name }" >
						</tr>
						
						
						
						<input type="hidden" id="cust_mobile" name="cust_mobile" value="010-7536-1119">
						
						
						<tr>
							<th scope="row"><label for="inpStore">매장정보</label></th>
							<td class="t_left">
								<input type="text" id="qstore" name="qstore" class="inp1" title="매장정보 입력" placeholder="매장위치  ex)목동점">
							</td>
						</tr>
						
						<tr>
							<th scope="row"><label for="txtArea">내용</label></th>
							<td class="t_left">
								<textarea id="qcontent" placeholder="내용을 입력해주세요." title="내용입력" style="height:288px;"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				
				</form>
				<p class="mt40 t_center">
					<a href="#" onclick="claim()" class="button red h45 w170">등록하기 <span class="gt">&gt;</span></a>
					<a href="myQnaList" class="button h45 w170">취소 <span class="gt">&gt;</span></a>
				</p>
			</section>
			</div>
			<%@include file="../../common/side.jsp" %>
		<%@include file="../../common/footer.jsp" %>
</body>