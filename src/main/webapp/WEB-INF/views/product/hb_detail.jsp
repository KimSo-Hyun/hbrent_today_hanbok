<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/hb_detail_style.css" />



  <script type="text/javascript">

//날짜 형식 체크 및 변경
	function checkDateFormat(obj) {
		$("#form input[name='period']").val("input");

		var input_value = $(obj).val();
		if(input_value != "") {
			var only_nos = input_value.replace(/[^0-9]/g, '');

			if (only_nos.length == 8) {
				var year = only_nos.substr(0, 4);
				var month = only_nos.substr(4, 2);
				var day = only_nos.substr(6, 2);
				var chg_value = year + "." + month + "." + day;
				var hidden_chg_value = year + "-" + month + "-" + day;

				if (month > 12 || day > 31) {
					alert("날짜 형식을 잘못 입력하셨습니다.");
					chg_value = "";
				}

				$(obj).val(chg_value);

				if($(obj).attr("name") == "date") {
					$("#form input[name='rt_rentdate']").val(hidden_chg_value);
				}
			}else {
				alert("날짜 형식을 잘못 입력하셨습니다.");
				$(obj).val("");
			}
		}
	}
	

  // 수량변경
  var hba_price;
  var amount;


  // init 초기값지정
  function init () {
    hba_price = document.form.hba_price.value;
    amount = document.form.bk_amount.value;
    document.form.sum.value = hba_price+"원";
    change();
  }

  // add
  function add () {
    hm = document.form.bk_amount;
    sum = document.form.sum;
 	hm.value ++ ;

    sum.value = (parseInt(hm.value) * hba_price)+"원";
    }

   // del
  function del () {
    hm = document.form.bk_amount;
    sum = document.form.sum;

    if (hm.value > 1) {
      hm.value -- ;
      sum.value = (parseInt(hm.value) * hba_price)+"원";
    }
    }

    function change () {
    hm = document.form.bk_amount;
    sum = document.form.sum;

    if (hm.value < 0) {
      hm.value = 0;
    }
    sum.value = (parseInt(hm.value) * hba_price)+"원";
    }
    
    	
    $(document).ready(function(){      //성별 따른 사이즈 
        var r=$("#form input[name='gender']").val(); //r에 W 가져옴
         if(r=='M'){
        	 $('#size').find('[value=66]').hide();
             $('#size').find('[value=77]').hide();
             $('#size').find('[value=88]').hide();
         }else if(r=='W'){
             $('#size').find('[value=90]').hide();
             $('#size').find('[value=95]').hide();
             $('#size').find('[value=100]').hide();
             
         }
  			
     });
             
         $(function(){						    
  		    $("#hbdelete").click(function(){
  		            location.href="hba_delete?hba_num=${hba_detail.hba_num }";

  		    });		 
         });

  </script>
</head>


<body onload="init();">
<%@ include file="../common/header.jsp" %>
<div class="content">
	<div class="left">
		<img src="${hba_detail.hba_img }" style="width:60%; min-width: 300px;"/>
	</div>

	<div class="right">
	
	<form name="form" method="post" action="addBasket" class="form" id="form">
		<input type="hidden" name="rt_rentdate" value="">
		<input type="hidden" name="period" value="">		 
        <input type="hidden" name="gender" value="${hba_detail.hba_gender }"/>
        <input type="hidden" name="hba_Id" value="${hba_detail.hba_id }"/>
		<input type="hidden" name="hba_info" value="${hba_detail.hba_info }"/>
		<input type="hidden" name="hba_price" value="${hba_detail.hba_price }"/>
		<input type="hidden" name="hba_img" value="${hba_detail.hba_img }"/>
		<input type="hidden" name="hba_stock" value="${hba_detail.hba_stock }"/>
		<input name="logined_mem_id" type="hidden" value="${sessionScope.logined_mem_id}" />
		
		<table border="0" style="width:80%">
		<thead>
			    <tr>              
					<td colspan="2" id="productname">[한복대여] ${hba_detail.hba_info }</td>					
				</tr>
				<tr>
					<td colspan="2" class="font-size-14 color-grey">24시간 대여 상품</td>
				</tr>	
		</thead>
		<tbody class="grid-item-p">					
               	<tr>
                 	<td class="fst">대여금액</td>
                 	<td class="fst"><fmt:formatNumber pattern="###,###,###" value="${hba_detail.hba_price }" />원</td>
                </tr>
                <tr>
                    <td>적립금 </td>
                    <td><fmt:parseNumber var="point" value="${hba_detail.hba_price * 0.01}" integerOnly="true" />${point }원</td>
                </tr>               
                <tr>
                    <td>대여일</td>                             
                    <td><input type="text" id="from" class="from" name="date" onblur="checkDateFormat(this);" value="" placeholder="ex) 2021.08.23" required autocomplete="off"></td>
                </tr>
                <tr>
                    <td>사이즈</td>
                    <td>
                    	<select id="size" name="hba_size" required>
                           <option value="">사이즈를 선택해주세요(필수)</option>
                           <option value="90" >90</option>
                           <option value="95" >95</option>
                           <option value="100">100</option>
                           <option value="66" >66</option>
                           <option value="77" >77</option>
                           <option value="88" >88</option>
                        </select> 
					</td>
                </tr>
                  <tr>
                 	<td class="last">수량</td>
					<td class="last">
						<input type="button" value=" - " class="p_button" onclick="del();">
	                  	<input type="text" name="bk_amount" id="amount_box" value="1" onchange="change();" readonly/>
	                  	<input type="button" value=" + " class="m_button" onclick="add();">
                  	</td>
                </tr>

             </tbody>
             <tfoot class="grid-item-p2">
                <tr>
                 	<td >총 금액 : </td>
                  	<td><input type="text" name="sum" size="13" class="inp_b" style="border: none" readonly></td>
                </tr>
             </tfoot>
		</table>
		                   
                            <button type="submit" class="btn02">장바구니</button>
							<button class="btn01">구매하기</button>

							<C:set var="loginedid" value="${sessionScope.logined_mem_id }"/>
							<c:if test="${sessionScope.logined_mem_rank =='관리자'}">
							<button type="button" id="hbdelete" style="width: 250px; height: 50px;">삭제</button>
							</c:if>
							</form>
							
                        </div>
                       
</div>
 
<%@ include file="../common/footer.jsp" %> 
        

</body>
</html>




