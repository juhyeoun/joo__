<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/adminHeader.jsp" %>

 
<!DOCTYPE html>
<html>
<head>
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script> -->
<script>


function adminUpdateMember(mnum) {
	 var answer=confirm("수정하시겠습니까?");
	
     if(answer){
	 console.log(mnum);
	}
	var mnumEmail = '#memberEmail' + mnum; 
	var memberEmail = $(mnumEmail).val();
		
	var mnumMobile = "#memberMobile" + mnum;
	var memberMobile = $(mnumMobile).val();
	
	var mnumAddr = "#memberAddr" + mnum;
	var memberAddr = $(mnumAddr).val();
	
	console.log(memberEmail);
	console.log(memberMobile);
	console.log(memberAddr);
	
	if(memberEmail == "" || memberMobile == "" || memberAddr == ""){
		alert('빈칸이 존재할수 없습니다.');
		return;
	}
	
	var data = {
			"mnum"	 : mnum,
			"email"  : memberEmail,
			"mobile" : memberMobile,
			"addr"   : memberAddr
	}
	$.ajax({
		url : "adminUpdateMember",
		type: "POST",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: 'json',
		success:function(result){
			console.log(result);
			if(result == 1){
				alert('정보가 수정되었습니다');
				window.reload();
			}else{
				alert('에러 발생');	
			}
		},
		errer:function(){
			alert('error');
		}
	})
}
function adminDeleteMember() {
	/* confirm('비정상적인 사용 회원만 탈퇴시킬수있습니다. 정말탈퇴시키시겠습니까?'); */
	window.open("adminDelete", '회원삭제', 'width=500, height=200');
	
}

function searchName() {
	var name = document.getElementById('name').value;
	
	if(name == ""){
		alert('고객명을 입력해주세요');
		return;
	}
	var data = {
		"name" : name
	}
	
	$.ajax({
		url : "searchKeywordProc",
		type: "POST",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: 'json',
		success:function(result){
			console.log(result);
			$('#userTable > tbody').empty();
			if(result.length>=1){
				result.forEach(function(item){
					str='<tr>'
					str += "<td>"+item.mnum+"</td>";
					str+="<td>"+item.name+"</td>";
					str+="<td>"+item.email+"</td>";
					str+="<td>"+item.mobile+"</td>";
					str+="<td>"+item.addr+"</td>";
					str+="<td>"+item.regdate+"</td>";
					str+="<td>"+'사용 계정'+"</td>";
					str+="</tr>"
					$('#userTable').append(str);
				})		
			}
		},
		errer:function(){
			alert('error');
		}
	})
}

function enterKey4(){
	  if (window.event.keyCode == 13) {
	    //로그인 버튼 클릭시 실행되는 메서드 호출
	    //login();
	    searchName();
	  }
	};

function selChange() {
	var sel = document.getElementById('cntPerPage').value;
	location.href="memberManage?nowPage=${paging.nowPage}&cntPerPage=" + sel;
}



</script>
</head>
<body>
<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">회원 관리</h1>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
				<!-- 검색 시작 -->
				<div align="right">
					<form action="#" method="get"> <!-- form action 줄게 기달려	ㅘ -->
						<input type="text" name="name" id="name"
								placeholder="고객명" style="width:10%" onkeyup="enterKey4()" /> 
								
							<input	style="margin:0px 3px; padding:0px 3px"
								class="btn btn-warning" type="button" onclick="searchName()"
								 value="search"/>
					</form>
				</div>
				<!-- 검색 종료 -->
				<%-- <span>총 ${cnt }건</span> --%>
			</div>
			<div id="outter">
				<div>
					<select id="cntPerPage" name="sel" onchange="selChange()">
						<option value="5"
						 <c:if test="${paging.cntPerPage == 5 }">selected</c:if>>5줄 보기</option>
						<option value="10"
						 <c:if test="${paging.cntPerPage == 10 }">selected</c:if>>10줄 보기</option>
						<option value="15"
						 <c:if test="${paging.cntPerPage == 15 }">selected</c:if>>15줄 보기</option>
						<option value="20"
						 <c:if test="${paging.cntPerPage == 20 }">selected</c:if>>20줄 보기</option>
					</select>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="userTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>회원번호</th>
								<th>이름</th>
								<th>이메일</th>
								<th>핸드폰</th>
								<th>주소</th>
								<th>가입일</th>								
								<th>관리</th>
								<!-- <th>계정 상태 변경</th> -->
							</tr>
						</thead>
						<tbody>
						<c:forEach var="member" items="${list }" varStatus="num">
							<tr>
								<td><input type="hidden" id="mnum" value="${member.mnum }">${member.mnum }</td>
								<td>${member.name }</td>
								<td><input type="text" id="memberEmail${member.mnum}" value="${member.email }"></td>
								<td><input type="text" id="memberMobile${member.mnum}" value="${member.mobile }"></td>
								<td><input type="text" id="memberAddr${member.mnum}" value="${member.addr }" style="width: 350px;"></td>								
								<td>${member.regdate }</td>
								<td><input type="button" id="update" value="수정" onclick="adminUpdateMember(${member.mnum})" >
									<input type="button" id="delete" value="삭제" onclick="adminDeleteMember(this)">
								</td>
								
									<!-- <a href="javascript:void(0);"
										class="btn btn-danger btn-icon-split btn-sm" onclick="deleteRow(this)" >
											<span class="icon text-white-50"> <i class="fas fa-trash"></i>
										</span> <span class="text">정지</span>
									</a> -->
									<%-- </c:if>
									<c:if test="${user.status eq 1}">
									<a href="javascript:void(0);"
										class="btn btn-success btn-icon-split btn-sm" onclick="activateRow(this)" >
											<span class="icon text-white-50"> <i class="fas fa-info"></i>
										</span> <span class="text">활성화</span>
									</a>
									</c:if>
								</td> --%>
							</tr>
						</c:forEach>
						</tbody>

					</table>
				</div>
			</div>
		</div>
		<!-- pagination{s} -->
			<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="memberManage?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="memberManage?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="memberManage?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	</div>
	</div>
</body>
</html>