/**
 * 
 */
 $("#emode_email_sample").change(function(){
	console.log("오렴?")
	$("#emode_email_sample option:selected").each(function(){
		if($(this.val() == '1')){
			$("#emode_email_domain").val('');
			$("#emode_email_domain").attr("readonly", false);
		}else{
			$("#emode_email_domain").val($(this).text());
			$("#emode_email_domain").attr("readonly", true);
			console.log("#emode_email_domain");
		}
	})
});

function emailSelectEmode(){
	email_1 = document.getElementById('emode_email_sample').value;
	if($("#emode_email_sample").val() == '1'){
		$("#emode_email_domain").val('');
		$("#emode_email_domain").attr("readonly", false);
	}else{
		$("#emode_email_domain").val(email_1);
		$("#emode_email_domain").attr("readonly", true);
	}
}

function sendAuth(){
	var name = document.getElementById('name').value;
	var email = document.getElementById('emode_email_id').value + "@" + document.getElementById('emode_email_domain').value;
	var data = {
		"name" : name,
		"email": email
	}	
	$.ajax({
		url  : "sendAuth",
		type : "POST",
		data :  JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
		dataType : 'Json',
		success:function(result){
			console.log(result);
			$('#msg').text(result.msg);
		},
		error:function(){
			$('#msg').text("확인하세요");	
		}
	})
}

function sendConfirm(){
	authNum = $('#authNum').val();
	var info = {
		"authNum" : authNum 
	}
	$.ajax({
		url : "sendConfirm", 
		type: "POST",
		data: JSON.stringify(info),
		contentType: "application/json; charset=utf-8",
		dataType: "Json",
		success:function(result){
			$('#msg').text(result.msg);
			if(result.msg == "이메일전송완료"){
				location.href="/app/findPwResult"				
			}else{
				$('#msg').text(result.msg);
			}
			
		},
		error:function(){
			alert('error');
			$('#msg').text("error");
		}
	})
}

/*function pwFind(){
	var name = $("#emode_cust_name").val();
	var email = document.getElementById('emode_email_id').value + "@" + document.getElementById('emode_email_domain').value;
	var emode_email_id =  $("#emode_email_id").val();
	var emode_email_domain = $("#emode_email_domain").val();
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
		"name"	: name,
		"email" : email 
	}
	$.ajax({
		url : "findPwProc",
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
}*/

