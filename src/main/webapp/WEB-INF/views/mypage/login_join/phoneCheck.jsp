<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var randNum;
	function sendsms(){
		var mobile = $('#mobile').val();
		console.log(mobile);
		var reg = /^[0-9]*$/;
		if(!reg.test(mobile)){
			alert('인증받을 핸드폰 번호를 확인해 주세요.');
			return false;
		}
		if(mobile.length != 11){
			alert('인증받을 핸드폰 번호를 확인해 주세요.');
			return false;
		}
		//ajax
		//if success
		//인증 성공
		//end of if success
		
		var data = {
				"mobile" : mobile
		}
		$.ajax({
			url : "sendMessage",
			type : "POST",
			data : JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: 'json',
			success:function(result){
				if(result.flag == "0"){
					$('#msg').text('전송 성공!')
					console.log(result.randNum)
					randNum = result.randNum;
				}else{
					alert('전송 실패!!!!!!!');
				}
			},
			errer:function(){
				alert('통신 실패!!!!!!!');
			}
		})
	}
	function confirmsms(){
		var certNum = $('#certNum').val();
		if(certNum == ""){
			$('#msg').text('인증번호를 입력하세요')
			return;
		}
		if(certNum.length != 6){
			$('#msg').text('인증번호를 확인하세요')
			return;
		}
		if(certNum != randNum){
			$('#msg').text('인증번호를 확인하세요')
			return;
		}else{
			var mobile = $('#mobile').val();
			alert('인증 성공');
			if(mobile)
			window.opener.document.getElementById('mobile').value = mobile;
			window.close();
		}
		console.log(randNum);
	}
	
</script>
</head>
<body>
<div>
	<input type="text" id="mobile" maxlength="11" placeholder="핸드폰 번호">&nbsp;
	<input type="button" value="전송" onclick="sendsms()"><br>
	<input type="text" id="certNum" maxlength="6" placeholder="인증번호">&nbsp;
	<input type="button" value="확인" onclick="confirmsms()"><br>
	<p><span id="msg"></span></p>
</div>
</body>