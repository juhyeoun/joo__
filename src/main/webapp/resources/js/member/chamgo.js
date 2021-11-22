/**
 * 
 */
 
 var mailyn = "";
var smsyn = "";
var addryn = "";

$(function(){
	$('#cust_id').blur(function(){
		checkID($('#cust_id'));
	});
	
	$('#cust_pwd').blur(function(){
		checkPwd($('#cust_id').val(), $('#cust_pwd').val(), $('#cust_pwd_chk').val());
	});
	
	$('#cust_pwd_chk').blur(function(){
		checkPwd($('#cust_id').val(), $('#cust_pwd').val(), $('#cust_pwd_chk').val());
	});
	
	$('#mobile2').blur(function(){
		chkNum(this);
	});
	
	$('#mobile3').blur(function(){
		chkNum(this);
	});
	
	$('#email_id').blur(function(){
		chkEngNum(this);
	});
	
	//약관 전체 동의
	$("#all_chk").click(function(){
		if($("#all_chk").attr("checked"))
			$(".agree_chk").attr("checked","checked");
		else
			$(".agree_chk").removeAttr("checked");
	});
	
	//----------------------------------------------------
	// 마케팅 활용동의 전체 체크
	//----------------------------------------------------
	$('#mAllFocus').click(function(){
		$("#m_all_chk").focus();
		$('#m_all_chk').trigger('click');
	});
	
	//----------------------------------------------------
	// 회원가입 Button Action(마케팅 활용동의 체크)
	//----------------------------------------------------
	$('#submitJoinCheck').click(function(){
		if($("#key_ipin_ci").val() == "")
		{
			alert("본인인증을 먼저 진행해주세요.");
			return;
		}
		else if($('#id_check').val() == "N" || $('#cust_id').val() == "")
		{
			alert("아이디를 입력하여 중복검사를 완료해주세요.");
			$('#cust_id').focus();
			return;
		}
		else if($('#pwd_check').val() == 'N' || $('#cust_pwd').val() == "")
		{
			alert("비밀번호를 입력해주세요.");
			$('#cust_pwd').focus();
			return;
		}
		else if($('#cust_pwd').val() != $('#cust_pwd_chk').val())
		{
			alert("비밀번호와 비밀번호확인 값이 틀립니다.\n\n다시 비밀번호를 입력해주세요.");
			$('#cust_pwd').focus();
			return;
		}
		else if($('#cust_haddr').val() == "")
		{
			alert("주소를 입력해주세요");
			return;
		}
		else if($('#mobile1').val() == "" || $('#mobile2').val() == "" || $('#mobile3').val() == "")
		{
			alert("휴대폰번호를 입력해주세요");
			return;
		}
		else if($('#email_id').val() == "" || $('#email_domain').val() == "")
		{
			alert("이메일을 입력해주세요");
			return;
		}
		else if(!($('#agree_chk').attr("checked")))
		{
			alert("서비스 이용약관을 읽으신 후,\n\n동의 항목 부분을 체크해주세요.");
			$('#agree_chk').focus();
			return;
		}
		else if(!($('#agree_chk2').attr("checked")))
		{
			alert("개인정보 수집·이용을 읽으신 후,\n\n동의 항목 부분을 체크해주세요.");
			$('#agree_chk2').focus();
			return;
		}
		else if(!($('#agree_chk3').attr("checked")))
		{
			alert("개인정보 취급 업무 위탁을 읽으신 후,\n\n동의 항목 부분을 체크해주세요.");
			$('#agree_chk3').focus();
			return;
		}
		else if($('#event_email_check').attr("checked") && $('#event_sms_check').attr("checked") && $('#event_dm_check').attr("checked")) {
			$('#submitJoin').trigger('click');
		} else {
			var vCont = "#popMarketing";
			
			var mh =  $(vCont).outerHeight();
		    $('#contents').after('<span class=bgLayer></span>');
		    $('.bgLayer').fadeTo('fast', 0.6, function() {
		        $(vCont).css({'margin-top':-(mh/2)}).show(300, function() {
		            $(this).attr('tabIndex',0).focus();
		        });

		        $(vCont).find('.pop_close').click(function() {
		            $('.bgLayer').remove();               
					$(this).parents('.pop_layer').hide(300,function(){
						$(this).removeAttr('tabindex');
					});
					$(this).focus();
					return false;
		        });
		    });
		}
	});

	//----------------------------------------------------
	// 회원가입 Button Action
	//----------------------------------------------------
	$('#submitJoin').click(function(){
		
		var frm = null;
		frm = document.getElementById("frm");
		
		frm.cust_name.value = frm.name.value;
		
		var sex = frm.sex.value;
		if(sex == 'M')
			frm.cust_sex.value = '1';
		else
			frm.cust_sex.value = '2';
		
		var birth = frm.birth.value.substr(0,4) + '-' + frm.birth.value.substr(4,2) + '-' + frm.birth.value.substr(6,2);
		frm.cust_birth.value = birth;
		
		// 이벤트 수신여부 체크박스값 설정
		($("#event_sms_check").attr("checked")) ? smsyn = "Y" : smsyn = "N";
		($("#event_email_check").attr("checked")) ? mailyn = "Y" : mailyn = "N";
		($("#event_dm_check").attr("checked")) ? addryn = "Y" : addryn = "N";
		
		frm.smsyn.value = smsyn;
		frm.mailyn.value = mailyn;
		frm.addryn.value = addryn;
		
		frm.action = "https://" + location.hostname + "/login_join/joinProc";
		frm.method = "post";
		frm.target = "_self";
		frm.submit();
					
	});
});

//----------------------------------------------------
// ID 중복가입 확인
//----------------------------------------------------
function joinOverLapChk(){
	
	var params = {
			cust_name : $("#name").val(),
			cust_birth : $("#birth").val(),
			key_ipin_ci : $("#key_ipin_ci").val()
		};
	
	$.ajax({
		type: "POST",
		url: "/login_join/joinOverLapChk.json",
		data: params,
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json",
		success: function(data){
			
			var user_count = data.user_count;
			
			if(user_count == 0)
			{
				if($("#mobile_check").val() == "Y")
					$(".phone_chk").removeClass("hide");
				
				if($("#ipin_check").val() == "Y")
					$(".ipin_chk").removeClass("hide");	
				
				$(".inp_use").attr("disabled",false);
			}
			else{
				alert("이미 가입된 회원입니다.\n아이디/비밀번호 찾기를 이용해주세요.");
				
				// ID/PW 찾기 페이지 이동
				location.href = "/login_join/findID";
			}
		},
		error: function(request, error) 
		{
			window.alert("요청 실패");
			alert(request.statusText);
			alert(request.responseText);
		}
	});
}

//----------------------------------------------------
// Step 1. ID 유효성 검증
//----------------------------------------------------
function checkID(id)
{
	var TRIM_PATTERN = /\s*/g;
	var NUM_PATTERN = /[0-9]/g;
	var ABC_PATTERN = /[a-z]/gi;
	
	if( id.val().replace(TRIM_PATTERN, "") == "" ) {
		$("#resultID").css("visibility", "visible")
	  		  		  .removeClass('t_blue')
	  		  		  .addClass('t_red')
	  		  		  .text("")
	  		  		  .append('*아이디를 올바로 입력하세요.');
		$("#id_check").val("N");
		id.val("");
		id.focus();
	} else if( id.val() != id.val().replace(TRIM_PATTERN, "") ) {
		$("#resultID").css("visibility", "visible")
  		  			  .removeClass('t_blue')
  		  			  .addClass('t_red')
  		  			  .text("")
  		  			  .append('*아이디에 띄어쓰기를 사용할 수 없습니다.');
		$("#id_check").val("N");
		id.val("");
		id.focus();
	} else if( !(  ( id.val() != id.val().replace(NUM_PATTERN, "") ) && ( id.val() != id.val().replace(ABC_PATTERN, "") )  ) ) {
		$("#resultID").css("visibility", "visible")
		  			  .removeClass('t_blue')
		  			  .addClass('t_red')
		  			  .text("")
		  			  .append('*아이디는 영어와 숫자 조합으로 입력하세요');
		$("#id_check").val("N");
		id.focus();
	} else if( id.val().length < 4 ) {
		$("#resultID").css("visibility", "visible")
					  .removeClass('t_blue')
					  .addClass('t_red')
					  .text("")
					  .append('*아이디를 4자 이상 입력하세요');
		$("#id_check").val("N");
		id.focus();
	} else {
		idNickCheck();
	}
}

//----------------------------------------------------
// Step 2. 중복 ID Check
//----------------------------------------------------
function idNickCheck()
{
	$.ajax({
		type: "POST",
		url: "/login_join/checkID",
		data: { "cust_id": $("#cust_id").val()},
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json",
		success: function(data) 
		{
			/*
			 *  data 결과 = data.length(결과수)
			 *  0 < data.length 	아이디 및 패스워드가 일치하지 않음
			 *  1 = data.length 	아이디 및 패스워드 일치
			 *  
			 */
			if(data.length == 0)
			{		
				$("#resultID").css("visibility", "visible")
	   			   			  .removeClass('t_red')
	   			   			  .addClass('t_blue')
	   			   			  .text("")
	   			   			  .append('*사용 가능한 아이디입니다.');
				$("#id_check").val("Y");
			} 
			else
			{	
				$("#resultID").css("visibility", "visible")
		   			  		  .removeClass('t_blue')
		   			  		  .addClass('t_red')
		   			  		  .text("")
		   			  		  .append('*사용 불가능한 아이디입니다.');
				$("#id_check").val("N");
			}
		},
		error: function(request, error) 
		{
			window.alert("요청 실패");
			alert(request.statusText);
			alert(request.responseText);
		}
	}); // ajax
}

//----------------------------------------------------
// 비밀번호 유효성 검증
//----------------------------------------------------
function checkPwd(id, pwd, chkPwd)
{
	var pattern1 = /[0-9]/;
	var pattern2 = /[a-zA-Z]/;
	//var pattern3 = /[~!@\#$%<>^&*]/;

	if(!pattern1.test(pwd) || !pattern2.test(pwd) || pwd.length < 10 || pwd.length > 16)
	{
		$("#resultPwd").css("visibility", "visible")
		   			   .removeClass('t_blue')
		   			   .addClass('t_red')
		   			   .text("")
		   			   .append('취약: 비밀번호는 영문, 숫자 조합으로 10~16자리를 사용해야합니다.');
		$("#pwd_check").val("N");
		return;
	}
	
	if(/(\w)\1\1/.test(pwd))
	{
		$("#resultPwd").css("visibility", "visible")
		   			   .removeClass('t_blue')
		   			   .addClass('t_red')
		   			   .text("")
		   			   .append('취약: 같은 문자를 3번 이상 사용하실 수 없습니다.');
		$("#pwd_check").val("N");
		return;
	}
	
	if(pwd.search(id) > -1)
	{
		$("#resultPwd").css("visibility", "visible")
		   			   .removeClass('t_blue')
		   			   .addClass('t_red')
		   			   .text("")
		   			   .append('취약: ID가 포함된 비밀번호는 사용할 수 없습니다.');
		$("#pwd_check").val("N");
		return;
	}
	
	if(!(pwd == chkPwd))
	{
		$("#resultPwd").css("visibility", "visible")
		   			   .removeClass('t_blue')
		   			   .addClass('t_red')
		   			   .text("")
		   			   .append('취약: 패스워드가 서로 같지 않습니다.');
		$("#pwd_check").val("N");
		return;
	}
	
	$("#resultPwd").css("visibility", "visible")
				   .removeClass('t_red')
				   .addClass('t_blue')
				   .text("")
				   .append('안전 : 사용가능하며 안전한 비밀번호 입니다.');
	$("#pwd_check").val("Y");
}

//----------------------------------------------------
// Email Domain 직접입력 / 선택
//----------------------------------------------------
function emailSelect()
{
	$("#email_domain").val($("#email_sample option:selected").val());
    if($("#email_sample option:selected").val() == "")
    {

        $("#email_domain").removeAttr("readOnly");
        $("#email_domain").focus();
    }
    else
    {
        $("#email_domain").attr("readOnly","true");
    }
}

