<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Order</title>

 <!-- jquery삽입 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- /* 카카오 우편번호 서비스 */ -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 아임 포트  결재api 사용 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" href="resources/css/basket_style.css" />
<link rel="stylesheet" href="resources/css/basket_default.css">
<link rel="stylesheet" href="resources/css/basket_m.css">
<script>

/* 카카오 우편번호 서비스 */
    function sample6_execDaumPostcode() {
    	 new daum.Postcode({
    	        oncomplete: function(data) {
    	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
    	            // http://postcode.map.daum.net/guide 에서 예제를 활용하여 커스텀

    				$('input[name=post_num]').val(data.zonecode);      // 우편번호(5자리)
    				$('input[name=addr1]').val(data.address);       // 기본주소
    				$('input[name=addr2]').val(data.buildingName);  // 건물명
    	        }
    	    }).open();
	} 
	
    <!-- 아임 포트  결재api 사용 -->
    function iamport(){
		//가맹점 식별코드
		IMP.init('imp57786311');
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '상품1' , //결제창에서 보여질 이름
		    amount : 100, //실제 결제되는 가격
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울 강남구 도곡동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		/*         msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num; */
		        
		        $("#hb_orderProc").submit();
		    	/* window.location.href = 'hb_delivery' */
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
    
</script>
<style>
.main{
	margin-top: 11em;
}

table{
	margin-bottom:5em;
	border-top: 2px solid #000;
}
input[type='text']{
	width: 50%;
    height: 35px;
    border: 1px solid #ddd;
    margin-left:10px;
    padding: 10px;
}

.pay .bor-n{
	border:none;
}

input[type='radio']{
	margin :0 5px 0 10px;
}

.delivery th,.pay th {
    width: 200px;
    font-size: 14px;
    font-weight: 400;
    border: 0;
    color: #333;
    padding: 20px 30px;
    vertical-align: middle;
    border-bottom: 1px solid #dfdfdf;
    background-color: #f8f8f8;
}

.od_prd_list .td_prd .sod_name {
    min-height: 80px;
    margin-bottom: 20px;
    }
    
.btn01 {
    padding: 0 7px;
    border: none;
    color: #fff;
    background: #733b90;
    height: 35px;
}

#sample6_postcode{
	width:10%;
}

#sample6_detailAddress, #sample6_address{
	margin-top: 5px;
}

.required_input{
	margin-left:2px;
	color: #a800ff;
}

.txt{
	padding: 5px 10px;
	display: block;
}

</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="main">
<div class="container">
<div class="wrapper_title" style="text-align: center;margin-bottom: 30px">주문/결제</div>
<div id="sod_bsk" class="od_prd_list col-md-12">
<form action="hb_orderProc" id="hb_orderProc"  method="post" >
<input type="hidden" name="mymem_id" value="${send_meminfo.mem_id  }"/>
		<div class="tbl_head03 tbl_wrap">
		<p><b>상품 주문내역</b></p>
      <table>
        <thead>
          <tr>
            <th scope="col">
              <input type="checkbox" id="allCheck" class="chBox" name="chBoxMom" onclick='selectedBasket(this.form)'>
            </th>
            <th scope="col">상품명</th>
            <th scope="col">총수량</th>
            <th scope="col">판매가</th>
            <th scope="col">적립금</th>
            <th scope="col">배송비</th>
            <th scope="col">소계</th>
          </tr>
        </thead>
		<script>
		
		/* 상품주문내역 체크박스 */
		$(document).ready(function() {
		    
		     $("#allCheck").click(function(){
		    	 	sum=parseInt(0);
		    	 
		            //만약 전체 선택 체크박스가 체크된상태일경우
		            if($("#allCheck").prop("checked")) {
		                $("input[type=checkbox]").prop("checked",true);
		             	 //input type이 체크박스인것은 모두 체크함	
               
		                $('input:checkbox[name="chBox"]:checked').each(function(){
		                	sum += parseInt($(this).val());
		                });
		              
		                
        				document.getElementById('planed_totalsum').value=parseInt(sum) + parseInt(document.getElementById('disAndExtrasum').value);		
						document.getElementById('finaltotal').value = parseInt(document.getElementById('planed_totalsum').value);
			
		                
		            } else {
		                $("input[type=checkbox]").prop("checked",false);
		                //input type이 체크박스인것은 모두 체크 해제함
		                
		                sum=parseInt(0);
		                
		                document.getElementById('planed_totalsum').value=parseInt(sum) + parseInt(document.getElementById('disAndExtrasum').value);		
						document.getElementById('finaltotal').value = parseInt(document.getElementById('planed_totalsum').value);
		                
		            }
		      });
		});
		</script>
<tbody>
	<C:forEach items="${send_basket }" var="dto">
		<input type="hidden" name="bk_num" value="${dto.bk_num }" />
		<input type="hidden" name="hba_id" value="${dto.hba_Id }" /> 
		<tr>			
			<td class="td_chk">
				<input type="checkbox"  class="chBox" name="chBox" id="chBox${dto.bk_num }" value="${dto.hba_price * dto.bk_amount}" onclick='selectedBasket(this.form)'>
			</td>	
			<td class="td_prd">
				 <div class="sod_img"><a href="#"><img src="${dto.hba_img }" alt="" width="80" height="100"/></a></div>
			<div class="sod_name">
				  <a href="#" class="prd_name"><b>[한복대여]${dto.hba_info }</b></a>
				  <div class="sod_opt">
                <ul>
				<li>옵션 : 사이즈 ${dto.hba_size } | 이용일 :  ${dto.rt_rentdate }</li>
				</ul>
				<input type="hidden" name="odr_rentdate" value="${dto.rt_rentdate }" />
			</div>
			</div>
			</td>
			<td class="td_num">${dto.bk_amount }</td>
			<td class="td_numbig text_right"><fmt:formatNumber pattern="###,###,###" value="${dto.hba_price }" /></td>
			<td class="td_numbig text_right">
				<fmt:parseNumber var="point" value="${dto.hba_price * 0.01}" integerOnly="true" />${point }원
			</td>
			<td class="td_dvr">선불</td>
			
			<td class="td_numbig text_right"><span id="sell_price_0" class="total_prc">
				<fmt:formatNumber pattern="###,###,###" value="${dto.hba_price * dto.bk_amount}" /></span>
				
			</td>
		</tr>
		<C:set var="sum" value="${sum + (dto.hba_price * dto.bk_amount)}" />
	</C:forEach>
		</tbody>
</table>

		<script>
			var sum=0;
			function selectedBasket(selected)  {
				
					sum =0;
					var count = selected.chBox.length;
					for (var i = 0; i < count; i++) {
						if (selected.chBox[i].checked == true ) {
							sum += parseInt(selected.chBox[i].value);
						}
					}

					document.getElementById('planed_totalsum').value=parseInt(sum) + parseInt(document.getElementById('disAndExtrasum').value);		
					
					document.getElementById('finaltotal').value = parseInt(document.getElementById('planed_totalsum').value);
			}
		</script>

		<p><b>배송정보</b></p>
		<table class="delivery">
		<tr>
			<th colspan="2">배송지선택</th>
			
			<script>
				/* 배송지 정보 선택 혹은 초기화 */
				function setAddr(){
				    if($('input:radio[id=new_addr]').is(':checked')){
				           $( "#oder_name" ).val("");
				           $( "#sample6_postcode" ).val("");
				           $( "#sample6_address" ).val("");
				           $( "#sample6_detailAddress" ).val("");
				           $( "#oder_cell" ).val("");
				           $( "#oder_email" ).val("");
				   
				    }else if($('input:radio[id=my_addr]').is(':checked')){
				    	   $( "#oder_name" ).val("${send_meminfo.mem_name }");
				           $( "#sample6_address" ).val("${send_meminfo.mem_address }");
				           $( "#oder_cell" ).val("${send_meminfo.mem_cellphone }");
				           $( "#oder_email" ).val("${send_meminfo.mem_email }");
				    }
				}

			</script>
			<td colspan="6">
				<input type="radio" name="oder_addr" id="my_addr" onchange="setAddr()" value="" checked/>회원정보와 동일
				<input type="radio" name="oder_addr" id="new_addr" onchange="setAddr()" value="" />새로운 배송지
			</td>
		</tr>
		<tr>
			<th colspan="2">받으시는분<span class="required_input">*</span></th>
			<td colspan="6">
				<input type="hidden" name="mem_id" value="${send_meminfo.mem_name }" />
				<input type="text" id="oder_name" name="oder_name" placeholder="이름" value="${send_meminfo.mem_name }" required />
			</td>
		</tr>
		<tr>
			<th colspan="2">주소<span class="required_input">*</span></th>
			<td colspan="6">
				<input type="text" name="post_num" id="sample6_postcode" placeholder="우편번호" required>
				<input type="button"  onclick="sample6_execDaumPostcode()" value="우편번호" class="btn01"><br />
				<input type="text" name="addr1" id="sample6_address" placeholder="주소"  required>
				<input type="text" name="addr2" id="sample6_detailAddress" placeholder="상세주소" required>
			</td>
		</tr>
		<tr>
			<th colspan="2">휴대전화 <span class="required_input">*</span></th>
			<td colspan="6">
				<input type="text" id="oder_cell" name="oder_cell"  placeholder="010-xxxx-xxxx" value="${send_meminfo.mem_cellphone }" required/>
			</td>
		</tr>
		<tr>
			<th colspan="2">이메일<span class="required_input">*</span></th>
			<td colspan="6">
				<input type="text" id="oder_email" name="oder_email" placeholder="sample@naver.com" value="${send_meminfo.mem_email }" required/>
			</td>
		</tr>
		<tr>
			<th>배송 메세지</th>
			<td colspan="7" class="oder_msg">
				<input type="text" name="oder_request" value="" placeholder="판매자에게 전하고 싶으신 추가요청사항이 있으시면 기재해 주세요"/>
			</td>
		</tr>
		</table>
		
		<p><b>결제예정금액</b></p>
		<table class="pay">
		<tr>
		<th>주문금액</th>	
			<td colspan="3" class="tt_border" >
				<input type="text" id="planed_totalsum" class="bor-n" readonly value="0" />				
			</td>
				
			<script>
				$(document).ready(function(){				
				
					document.getElementById('disAndExtrasum').value=
						  parseInt(document.getElementById('delerverFee').value) - parseInt(document.getElementById('oder_point').value);
				});
			
			</script>
		
		</tr>
			
			<!-- 총결제예정금액 & 최종결제금액 계산 -->
			<script>
				
			function usePoint()  {
				 
				var available_point =${send_meminfo.mem_point  };
				
				document.getElementById('disAndExtrasum').value =parseInt(0);
				 document.getElementById("usedPoint").value  =parseInt(0);
				 
				  const point = document.getElementById('oder_point').value;
				  				  
				  if(parseInt(point) > parseInt(available_point)){
					  alert("이용가능한 포인트를 초과")
					  document.getElementById('oder_point').value=parseInt(0);
				  }
				  
				  
				  
				  document.getElementById("usedPoint").value = point;
				  
				  document.getElementById('disAndExtrasum').value=
					  parseInt(document.getElementById('delerverFee').value) - parseInt(document.getElementById('oder_point').value);
				 	
				
				 /*  document.getElementById('planed_totalsum').value =parseInt(0); */	
				  document.getElementById('planed_totalsum').value =
				  	 parseInt(document.getElementById('disAndExtrasum').value) + parseInt(sum);
/* 				  	 parseInt(document.getElementById('disAndExtrasum').value)+parseInt(document.getElementById('planed_totalsum').value); */
				
				 document.getElementById('finaltotal').value = parseInt(document.getElementById('planed_totalsum').value);
				  
			}
			
			</script>
		
		<tr>
			<th>할인금액</th>
			<td colspan="6" > 
				<input type="text" id="usedPoint" value="0" class="bor-n" readonly />
			</td>
		</tr>
		<tr>
			<th>배송비</th>
			<td colspan="6" >
				<input type="text" id="delerverFee" value="3000" class="bor-n" readonly/>
			</td>
		</tr>
		
		 <!-- attribute 를 이용하여 숫자만 입력 numberOnly-->
		 <script type="text/javascript">
			 $(document).ready(function(){
			 
			   $("input:text[numberOnly]").on("keyup", function() {
			      $(this).val($(this).val().replace(/[^0-9]/g,""));
			   });
			   
			 });
		 </script>

		<tr>
		<th>적립금</th>
			<td colspan="2" class="oder_point">
				<input type="hidden" id="disAndExtrasum" class="bor-n" readonly />
				<input type="text" id="oder_point"  name="oder_point" value="0" onkeyup='usePoint()' placeholder="" numberOnly /> <br />
				
				 <span class="txt">(총 사용가능 적립금 : ${send_meminfo.mem_point  }P)</span>
				 
			</td>
		</tr>

		<tr>
			<th rowspan="3">결제수단</th>
			<td colspan="4"><input type="radio" checked="checked">카카오페이(KAKAOPAY)</td>		
		</tr>
		<tr>
			<td colspan="6">
			<span class="txt">
				-휴대폰에 설치된 카카오톡 앱에서 비밀번호 입력만으로 빠르고 안전하게 결제가 가능한 서비스 입니다. <br />
				-안드로이드의 경우 구글 플레이, 아이폰의 경우 앱 스토어에서 카카오톡 앱을 설치 한 후,<br />
				-최초 1회 카드 및 계좌 정보를 등록하셔야 사용 가능합니다.<br />
				-인터넷 익스플로러의 경우 8 이상에서만 결제 가능합니다.<br />
				-카카오머니로 결제 시, 현금영수증 발급은 ㈜카카오페이에서 발급가능합니다.<br />
			</span>
			</td>
		</tr>
		<tr>

					<td colspan="2" rowspan="2"> 
				<span class="txt">카카오페이 최종결제 금액 <br /></span>
				<input type="text" id="finaltotal" name="finaltotal" value="0" readonly/>
				<input type="button" value="카카오결제" onclick="javascript:iamport()" class="btn01"/>				
		 		<input type="submit" value="간편결제" class="btn01"/> 
			</td>
		</tr>
	</table>
</div>
</form>
</div>
</div>
</div>
	<%@ include file="../common/footer.jsp" %> 	

</body>


</html>