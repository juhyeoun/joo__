/**
 * 
 */
// ------------------------------------------------
// 쿠키
// ------------------------------------------------
 /* 쿠키 설정 */
setCookie = function setCookie(cookieName, value, exdays) {
  var exdate = new Date();
  exdate.setDate(exdate.getDate() + exdays);
  var cookieValue = escape(value) + (exdays == null ? "" : "; expires=" + exdate.toGMTString());
  document.cookie = cookieName + "=" + cookieValue;
};

/* 쿠키 얻기 */
getCookie = function getCookie(cookieName) {
  cookieName = cookieName + '=';
  var cookieData = document.cookie;
  var start = cookieData.indexOf(cookieName);
  var cookieValue = '';

  if (start != -1) {
    start += cookieName.length;
    var end = cookieData.indexOf(';', start);
    if (end == -1) end = cookieData.length;
    cookieValue = cookieData.substring(start, end);
  }

  return unescape(cookieValue);
};

/* 쿠키 삭제 */
deleteCookie = function deleteCookie(cookieName) {
  var expireDate = new Date();
  expireDate.setDate(expireDate.getDate() - 1);
  document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
};


//document ready
$(function () {
    var userId = getCookie("Cookie_user_id");
    $('#email').val(userId);

    if ($('#email').val() != "") {
       $('#idcheck').attr("checked", true);
    }
});
 
// ------------------------------------------------
// 로그인
// ------------------------------------------------

function loginMember(){
	 var email = $('#email').val();
	 var pw = $('#pw').val();
	 var idcheck = $('#idcheck').is(":checked");
	 console.log(email);
	 console.log(pw);
	 
	 if(idcheck){
		setCookie("Cookie_user_id", email, 30);
	}else{
		deleteCookie("Cookie_user_id");
	}
	 
	if(email == ""){
		$('#userLoginResult').show();
		return;
	}
	if(pw == ""){
		$('#userLoginResult').show();
		return;
	}
	
	var data = {
		"email" : email,
		"pw"	: pw
	}
	
	console.log(data);
	
	$.ajax({
		url : "loginMember",
		type: "POST",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: 'json',
		success:function(result){
			console.log(result)
			
			if(result.rescode == "fail"){
				$('#userLoginResult').show();
			}else{
				location.href="/app"				
			}
		},
		error:function(){
			alert('error')
		}
	})
	
}	

function enterKey(){
  if (window.event.keyCode == 13) {
    //로그인 버튼 클릭시 실행되는 메서드 호출
    //login();
    loginMember();
  }
};
function enterKey2(){
  if (window.event.keyCode == 13) {
    //로그인 버튼 클릭시 실행되는 메서드 호출
    //login();
    check();
  }
};
function enterKey3(){
  if (window.event.keyCode == 13) {
    //로그인 버튼 클릭시 실행되는 메서드 호출
    //login();
    check_delete();
  }
};




function check(){
	 var pw = $('#pw').val();
	 
	if(pw == ""){
		$('#result').show();
		return;
	}
	var data = {
		"pw"	: pw
	}
	console.log(data);
	
	$.ajax({
		url : "check",
		type: "POST",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: 'json',
		success:function(result){
			console.log(result)
			
			if(result.rescode == "fail"){
				$('#result').show();
			}else{
				location.href="/app/myInfo_step2" // 11/17 경로고칠부분				
			}
		},
		error:function(){
			alert('error')
		}
	})
	
}	

function check_delete(){
	 var pw = $('#pw').val();
	 
	if(pw == ""){
		$('#result').show();
		return;
	}
	var data = {
		"pw"	: pw
	}
	console.log(data);
	
	$.ajax({
		url : "check_delete",
		type: "POST",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: 'json',
		success:function(result){
			console.log(result)
			
			if(result.rescode == "fail"){
				$('#result').show();
			}else{
				location.href="/app/drop_member2" // 11/17 경로고칠부분				
			}
		},
		error:function(){
			alert('error')
		}
	})
	
}	

function open123(){
	$('.hide').show();
	
	document.getElementById('sujeoung').style.display = 'none';
}


function chkOldPw(){
	var pw = $('#pw').val();
	
	if(pw == ""){
		$('#msg').text('빈칸이 존재합니다.');
		return;
	}
	var data = {
		"pw" : pw
	}
	$.ajax({
		url : "check",
		type: "POST",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: 'json',
		success:function(result){
			if(result.rescode == "fail"){
				$('#msg').text('비밀번호가 잘못되었습니다.');
			}else{
				$('#msg').text('good.');
			}
		},
		errer:function(){
			$('#msg').text('error');
		}
	})
}

function changePw(){
	var pw = $('#pw').val();
	var newPw = $('#newPw').val();
	var newPwChk = $('#newPwChk').val();
	var con = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,16}$/;
	 
	if(pw == "" || newPw == "" || newPwChk == ""){
		$('#msg').text('빈칸이 존재합니다.');
	}else if(pw == newPw){
		$('#msg').text('사용하던 비밀번호와 동일합니다.');
	}else if(newPw != newPwChk){
		$('#msg').text('비밀번호가 틀렸습니다.');
	}else if(!con.test(newPw) && !con.test(newPwChk)){
		$('#msg').text('0-16자의 영문,숫자, 특수문자를 포함하여 만들어주세요.');	
	}else{
		$('#msg').text('안전 : 사용가능하며 안전한 비밀번호 입니다.');	
	} 
}	

function updatePost(){
		new daum.Postcode({
			oncomplete:function(data){
				var addr = "";
				if(data.userSelectedType === "R"){//도로명 주소일 경우( R )
					addr = data.roadAddress;
				}else{//지번일 경우( J )
					addr = data.jibunAddress;
				}
				document.getElementById("cust_haddr").value = addr;
				document.getElementById("cust_daddr").focus();
			}
		}).open();
	}
	


function updateInfo(){
	var newPw = $('#newPw').val();
	$('#npw').val(newPw);
	var addr1 = $("#cust_haddr").val();
	var addr2 =  $("#cust_daddr").val();
	var addr = document.getElementById('cust_haddr').value + " " + document.getElementById('cust_daddr').value;
	$('#addr').val(addr);
	var msg = $("#msg").text();
	var pwMsg = "안전 : 사용가능하며 안전한 비밀번호 입니다.";
	
	if(newPw == ""){
		alert('비밀번호를 입력하세요')
		return;
	}
	
	if(addr1 == ""){
		alert('주소를 입력하세요')
		return;
	}
	
	if(addr2 == ""){
		alert('주소를 입력하세요')
		return;
	}
	
	if(msg != pwMsg){
		alert('비밀번호를 입력하세요')
		return;
	}
	document.getElementById('f').submit();
}
	
	


