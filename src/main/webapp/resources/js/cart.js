/**
 * 
 */

 
 function insertCart(){
   
   //var count=document.getElementById('수량인풋아이디').value;
   var productName=document.getElementById('productName').value;
   var edge= $('input:radio[name=edge]:checked').val();
   var count=document.getElementById('p_num').value;
   
   console.log('1');
   if($('input:radio[name=p_item_999]:checked').val()){
      var temp=$('input:radio[name=p_item_999]:checked').val().split('|||');
      console.log(temp);
      
      var size=temp[3];
      console.log(size);
      console.log('3');
   }
   var data={
      "productName" :productName,
      "edge"        :edge,
      "count"       :count,
      "size"        :size
   }
   $.ajax({
      url : "cart",
      type : "POST",
      data: JSON.stringify(data),
         contentType: "application/json; charset=utf-8",
         dataType: 'json',
         success:function(result){
         console.log(result.flag);
         location.href="/app/buket"
      },
      error:function(){
         console.log('로그인 안됨');
      }
   })
   
   
   /*alert(productName +" ,"+edge+" ,"+size +" , "+count);
   let data=JSON.stringify({
      "productName":productName,  //getParam('제품이름') 꺼내서 쓰면된다
      "count":count,
      "edge":edge,
      "size":size
   });
   var result=requestToServer('/app/cart/insert',data);
   alert(result.message);*/

}
 function requestToServer(url,data){ 
   $.ajax({
       type: 'POST',
       url: url,
       dataType : "json",
       data: data,
       contentType: "application/json; charset:UTF-8",
       async: false,
       xhrFields: {withCredentials: true},
       success: function(response) {
           result=response;
       },
   
   });
   console.log(result);
   console.log('통신직후');
   return result;
   
}
 




function chkOrderAmt() {  //주문금액에 라디오 버튼 클릭하면 뜨기
      var temp = '';
      var price = '';
      var qty = '';
      var orderAmt = '';
      
      if($('input:radio[name=p_item_999]:checked').val()) {
         temp = $('input:radio[name=p_item_999]:checked').val().split('|||');
         
         price = temp[1];
         qty = $('#p_num').val();
         
         orderAmt = parseInt(price) * parseInt(qty);
         
         $('#detailAmt').text(chkThousand(orderAmt));

      } else {
      alert('메뉴를 체크해주세요1.');
   }
}

//----------------------------------------------------
//금액 천단위 콤마 찍기
//----------------------------------------------------
function chkThousand(num) {
   num = String(num);
   num = num.replace(/,/g, '');   //콤마 제거
   var commaValue = '';
   
   for(var i=1; i<=num.length; i++) {
      if(i>1 && (i%3)==1)
         commaValue = num.charAt(num.length-i) + "," + commaValue;
      else
         commaValue = num.charAt(num.length-i) + commaValue;
   }
   return commaValue;
}


      //----------------------------------------------------
   //상세보기 Spinner PlusButton Action
   //----------------------------------------------------
function d_plus(){
   var temp = '';
      var price = '';
      var qty = '';
      var orderAmt = '';
      
      if($('input:radio[name=p_item_999]:checked').val()) {
         temp = $('input:radio[name=p_item_999]:checked').val().split('|||');
         
         price = temp[1];
         
         qty = +$('#p_num').val()+1;
         $('#p_num').val(qty);
         
         orderAmt = parseInt(price) * parseInt(qty);
         if(qty<=100){
            $('#detailAmt').text(chkThousand(orderAmt));
         }else{
         qty=$('#p_num').val(100);
         
      }

      } else {
         alert('메뉴를 체크해주세요.');
         $('#p_num').val($('#p_num').val()-1);
      }
   }
   //----------------------------------------------------
   //상세보기 Spinner MinusButton Action
   //----------------------------------------------------
   function d_minus(){
      var temp = '';
      var price = '';
      var qty = '';
      var orderAmt = '';
      console.log($('#p_num').val());
      if($('input:radio[name=p_item_999]:checked').val()) {
         temp = $('input:radio[name=p_item_999]:checked').val().split('|||');
         
         price = temp[1];
         qty = $('#p_num').val()-1;
         console.log(qty);
         $('#p_num').val(qty);
         orderAmt = parseInt(price) * (parseInt(qty));
         if(qty > 0){
            $('#detailAmt').text(chkThousand(orderAmt));
      }else{
         $('#detailAmt').text(0);
          $('#p_num').val(0);
      }
      } else {
         alert('메뉴를 체크해주세요.');
         if($('#p_num').val() > 1)
            $('#p_num').val($('#p_num').val()+1);
      }
   }


/*
   if($('.cartSpinner').size() > 0){
      $( '.cartSpinner' ).spinner({
         min: 0,
         max: 100,
         create: function( event, ui ) {
            //add custom classes and icons
            $(this)
            .next().addClass('cartPlus').html('<i class="icon icon-plus"></i>')
            .next().addClass('cartMinus').html('<i class="icon icon-minus"></i>');
         }
      });
   }
   
   //장바구니 수량 증가 버튼 Action
   $('.cartPlus').click(function(){
      
      var spinner = $( ".cartSpinner" ).spinner();
      spinner.spinner( "disable" );      //수량 증가시 이중클릭 못하도록 spinner disable
      
      if( eCouponProductChk(this) == 'false') {
         if(Number($(this).prev().val()) < 9) {
            $(this).prev().val(Number($(this).prev().val())-1);
         }
         alert('E쿠폰 할인 상품은 수량 증가를 할 수 없습니다.');
         return;
      }
      
      cartPlusCalc(this);
      
      //장바구니 제품 수량 조절하기 위한 데이터 추출
      var data = $(this).parents('#cart_spin').find('#cart_plus').val();
      
      //장바구니 제품 수량 조절
      setCartProductQuantity(data, this, 'plus', spinner);
      //alert($(this).prev().val());
   });
   
   //장바구니 수량 감소 버튼 Action
   $('.cartMinus').click(function(){
      
      var spinner = $( ".cartSpinner" ).spinner();
      spinner.spinner( "disable" );      //수량 증가시 이중클릭 못하도록 spinner disable
      
      if( eCouponProductChk(this) == 'false') {
         if(Number($(this).prev().prev().val()) >= 0) {
            $(this).prev().prev().val(Number($(this).prev().prev().val())+1);
         }
         alert('E쿠폰 할인 상품은 수량 감소를 할 수 없습니다.');
         return;
      }
      
      cartMinusCalc(this);
      
      //장바구니 제품 수량 조절하기 위한 데이터 추출
      var data = $(this).parents('#cart_spin').find('#cart_minus').val();
      
      //장바구니 제품 수량 조절
      setCartProductQuantity(data, this, 'minus', spinner);
      
      //alert($(this).prev().prev().val());
   });
}


function allCheckBox() {
   
   var frm = document.getElementById("myCartForm");
   
   if(frm.cart_item.length == undefined) {
      if(allcheck == false) {
         frm.cart_item.checked = true;
         allcheck = true;
      } else {
         frm.cart_item.checked = false;
         allcheck = false;
      }
   } else {
      for(var i=0; i<frm.cart_item.length; i++) {
         if(!allcheck) {
            frm.cart_item[i].checked = true;
         } else {
            frm.cart_item[i].checked = false;
         }
      }
      
      if(allcheck == false)
         allcheck = true;
      else
         allcheck = false;
   }
}*/


