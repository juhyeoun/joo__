<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var randNum;
	function sendsms(){
		var name = $('#name').val();
		var mobile = $('#mobile').val();
		console.log(name);
		console.log(mobile);
		var reg = /^[0-9]*$/;
		if(name == ""){
			$('#msg').text('이름을 확인해 주세요.')
			return;
		}
		if(!reg.test(mobile)){
			$('#msg').text('인증받을 핸드폰 번호를 확인해 주세요.')
			return;
		}
		if(mobile.length != 11){
			$('#msg').text('인증받을 핸드폰 번호를 확인해 주세요.')
			return;
		}
		//ajax
		//if success
		//인증 성공
		//end of if success
		
		var data = {
				"name"   : name,
				"mobile" : mobile
		}
		$.ajax({
			url : "findIdsendMessage",
			type : "POST",
			data : JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: 'json',
			success:function(result){
				console.log(result)
				if(result.flag == "0"){
					$('#msg').text('전송 성공!')
					console.log(result.randNum)
					randNum = result.randNum;
					name = result.name;

				}else{
					$('#msg').text('전송 실패!')
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
			alert('인증 성공');
			var p = $('#mobile').val();
			opener.location.href="/app/findIdResult?phone="+p; // mnum으로 바꾸면 된ㅁ
			
			window.close();
		}
		console.log(randNum);
	}
	
</script>
</head>
<body>
<div>
	<input type="text" id="name" name="name" placeholder="이름"><br>
	<input type="text" id="mobile" name="mobile" maxlength="11" placeholder="핸드폰 번호">&nbsp;
	<input type="button" value="전송" onclick="sendsms()"><br>
	<input type="text" id="certNum" maxlength="6" placeholder="인증번호">&nbsp;
	<input type="button" value="확인" onclick="confirmsms()"><br>
	<p><span id="msg"></span></p>
</div>
</body>