/**
 * 
 */

// ------------------------------------------------
// 약관동의 전체선택
// ------------------------------------------------


function checkAll(){
		if(document.getElementById("all_chk").checked==true){
			$('input:checkbox[name=agree_chk1]').prop('checked', true);
			$('input:checkbox[name=agree_chk2]').prop('checked', true);
			$('input:checkbox[name=agree_chk3]').prop('checked', true);
		}else{
			$('input:checkbox[name=agree_chk1]').prop('checked', false);
			$('input:checkbox[name=agree_chk2]').prop('checked', false);
			$('input:checkbox[name=agree_chk3]').prop('checked', false);
		}
		
	}

// ------------------------------------------------
// 약관동의 개별선택
// ------------------------------------------------
function changeFn(){
if($("#agree_chk1").prop("checked")){
      $("#agree_chk1").prop("checked",true);
      $("#all_chk").prop("checked",false);
  }
  if($("#agree_chk2").prop("checked")){
      $("#agree_chk2").prop("checked",true);
      $("#all_chk").prop("checked",false);
  }
  if($("#agree_chk3").prop("checked")){
      $("#agree_chk3").prop("checked",true);
      $("#all_chk").prop("checked",false);
  }
}

$(document).click(function(){
	if($("input:checkbox[name = all_chk]").is(":checked") == false){
		if($("input:checkbox[name = agree_chk1]").is(":checked") == true){
			if($("input:checkbox[name = agree_chk2]").is(":checked") == true){
				if($("input:checkbox[name = agree_chk3]").is(":checked") == true){
					$("#all_chk").prop("checked",true);
				}
			}
		}
	}
});

// ------------------------------------------------
// 휴대폰 인증
// ------------------------------------------------

function phoneCheck(){
	window.open("phoneCheck", "핸드폰 인증", "width=500, height=300");
}
function findIdphoneCheck(){
	window.open("findIdphoneCheck", "핸드폰 인증", "width=500, height=300");
}




// ------------------------------------------------
// 이메일 선택
// ------------------------------------------------
$("#email_sample").change(function(){
	console.log("오렴?")
	$("#email_sample option:selected").each(function(){
		if($(this.val() == '1')){
			$("#email_domain").val('');
			$("#email_domain").attr("readonly", false);
		}else{
			$("#email_domain").val($(this).text());
			$("#email_domain").attr("readonly", true);
			console.log("#email_domain");
		}
	})
});

function emailSelect(){
	email_1 = document.getElementById('email_sample').value;
	if($("#email_sample").val() == '1'){
		$("#email_domain").val('');
		$("#email_domain").attr("readonly", false);
	}else{
		$("#email_domain").val(email_1);
		$("#email_domain").attr("readonly", true);
	}
}

// ------------------------------------------------
// 이메일 중복확인
// ------------------------------------------------

function ajaxEmailCheck(){
	var email = document.getElementById('email_id').value + "@" + document.getElementById('email_domain').value;
	var email_id =  $("#email_id").val();
	var email_domain = $("#email_domain").val();
	var con = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	console.log(email);
	if(email_id == "" || email_domain == ""){
		$('#msg').text('빈칸을 모두 입력하세요')
		return;
	}
	if(email.match(con) == null){
		$('#msg').text('사용 불가능한 아이디입니다.')
		return;
	}
	var data = {
		"email" : email 
	}
	$.ajax({
		url : "emailCheck",
		type: "POST",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: 'json',
		success:function(result){
			$('#msg').text(result.msg)
		},
		errer:function(){
			$('#msg').text('error');
		}
	})
}

// ------------------------------------------------
// 비밀번호
// ------------------------------------------------
function pwd(){
	 var pw = $("#pw").val();
	 var con = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,16}$/;
	 
	 
	 // /[^A-Za-z0-9~!@\#$%<>^&*]/g
	 
	
		 if(!con.test(pw)){
			$('#resultPwd').text('0-16자의 영문,숫자, 특수문자를 포함하여 만들어주세요.')
			return false;
		 }
		 
			$('#resultPwd').text('안전 : 사용가능하며 안전한 비밀번호 입니다.')	
	
}

function comfirmPwd(){
	var pw = $("#pw").val();
	var conPw = $("#cust_pwd_chk").val(); 
	if(pw == "" || pw == null){
		$('#resultPwd').text('비밀번호란을 먼저 입력해주세요')
	}else if(conPw != pw){
		$('#resultPwd').text('비밀번호가 일치하지않습니다.')
	}else{
		$('#resultPwd').text('안전 : 사용가능하며 안전한 비밀번호 입니다.')
	}
}

// ------------------------------------------------
// 주소
// ------------------------------------------------
function daumPost(){
		new daum.Postcode({
			oncomplete:function(data){
				var addr = "";
				if(data.userSelectedType === "R"){//도로명 주소일 경우( R )
					addr = data.roadAddress;
				}else{//지번일 경우( J )
					addr = data.jibunAddress;
				}
				document.getElementById("zipcode").value = data.zonecode;
				document.getElementById("cust_haddr").value = addr;
				document.getElementById("cust_daddr").focus();
			}
		}).open();
	}

// ------------------------------------------------
// 회원가입 버튼
// ------------------------------------------------
function joinMrpizza(){
	// var allChk = $("#all_chk").val();
	var name =  $("#name").val();
	var email_id =  $("#email_id").val();
	var email_domain =  $("#email_domain").val();
	var email = document.getElementById('email_id').value + "@" + document.getElementById('email_domain').value;
	$('#email').val(email);
	var pw =  $("#pw").val();
	var conPw =  $("#cust_pwd_chk").val();
	var mobile = $("#mobile").val();
	var addr1 = $("#cust_haddr").val();
	var addr2 =  $("#cust_daddr").val();
	var addr = document.getElementById('cust_haddr').value + " " + document.getElementById('cust_daddr').value;
	$('#addr').val(addr);
	var msg = $("#msg").text();
	var msg2 =  "사용 가능한 이메일입니다.";
	var rPwd = $("#resultPwd").text();
	var pwMsg = "안전 : 사용가능하며 안전한 비밀번호 입니다.";
	
	if($("input:checkbox[name = all_chk]").is(":checked") == false){
		alert('약관동의를 확인하세요')
		return;
	}
	if(name == ""){
		alert('이름을 입력하세요')
		return;
	}
	if(email_id == ""){
		alert('이메일을 입력하세요')
		return;
	}
	if(email_domain == ""){
		alert('이메일을 입력하세요')
		return;
	}
	if(msg != msg2){
		console.log(msg)
		alert('중복확인을 하세요')
		return;
	}
	if(pw == ""){
		alert('비밀번호를 입력하세요')
		return;
	}
	if(conPw == ""){
		alert('비밀번호 확인을 입력하세요')
		return;
	}
	if(rPwd != pwMsg){
		alert('비밀번호를 입력하세요')
		return;
	}
	if(mobile == ""){
		alert('핸드폰인증을 하세요')
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
	
	document.getElementById('f').submit();
}


