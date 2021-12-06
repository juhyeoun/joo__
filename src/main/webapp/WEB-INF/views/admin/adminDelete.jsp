<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function confirmPw() {
		var name = document.getElementById('name').value;
		var pw = document.getElementById('pw').value;
		if(name == "" || pw == ""){
			alert('빈칸이있습니다');
			return;
		}
		if(confirm('정말 탈퇴시키겠습니까??')){
			document.getElementById('f').submit();	
		}
	}
	$(function () {
		if(`${msg}` != null){
			window.opener.location.reload();
		}
	});
</script>
</head>
<body>
  <div>
  <form id="f" action="adminMemberDelete" method="POST">
  		<input type="text" id="name" name="name" placeholder="회원이름"><br>
  		<input type="hidden" id="email" name="email" value="admin@care.com">
		<input type="password" id="pw" name="pw" placeholder="관리자 비밀번호"><br>
		<input type=button onclick="confirmPw()" value="삭제">
		<span>${msg }</span>
  </form>
  </div>
</body>
</html>