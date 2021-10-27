<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/basket_style.css" />
<link rel="stylesheet" href="resources/css/basket_default.css">
<link rel="stylesheet" href="resources/css/basket_m.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>



<title>basket</title>
</head>
<body>


<%@ include file="../common/header.jsp" %> 


<div class="account-in">
    <div class="container">
<!-- 장바구니 시작 { -->
<div class="wrapper_title" style="text-align: center;margin-bottom: 30px">장바구니</div>


	<c:choose>
    <c:when test="${map.count == 0 }">
	    <div class="tbl_head03 tbl_wrap">
      <table>
        <thead>
          <tr>
            <th scope="col">
              <label for="ct_all" class="sound_only">상품 전체</label>
              <input type="checkbox"  id="allCheck" class="chBox">
            </th>
            <th scope="col">상품명</th>
            <th scope="col">총수량</th>
            <th scope="col">판매가</th>
            <th scope="col">포인트</th>
            <th scope="col">배송비</th>
            <th scope="col">소계</th>
          </tr>
        </thead>
        <tbody>
        <tr><td colspan="8" class="empty_table">장바구니에 담긴 상품이 없습니다.</td></tr>       
         </tbody>
      </table>
	  <div class="btn_cart_del">
        <button type="button" onclick="return form_check('seldelete');">선택삭제</button>
        <button type="button" onclick="return form_check('alldelete');">비우기</button>
      </div>
    </div>
        <div id="sod_bsk_act">
      <a href="hb_list" class="btn01">쇼핑 계속하기</a>

                  </div>
	</c:when>
	<c:otherwise>	
		
<div id="sod_bsk" class="od_prd_list col-md-12">
  <form name="frmcartlist" id="sod_bsk_list" class="2017_renewal_itemform" method="post" action="hb_order">
	
    <div class="tbl_head03 tbl_wrap">
      <table>
        <thead>
          <tr>
            <th scope="col">
              <input type="checkbox" id="allCheck" class="chBox" value="">
            </th>
            <script>
			$("#allCheck").click(function(){
				var chk = $("#allCheck").prop("checked");
					if(chk) {
						$(".chBox").prop("checked", true);
							} else {
						$(".chBox").prop("checked", false);
				}
			});
			</script>
            <th scope="col">상품명</th>
            <th scope="col">총수량</th>
            <th scope="col">판매가</th>
            <th scope="col">적립금</th>
            <th scope="col">배송비</th>
            <th scope="col">소계</th>
          </tr>
        </thead>
        <c:forEach items="${basket }" var="dto">
          <input type="hidden" name="hba_Id" value="${dto.hba_Id }" />
		  <input type="hidden" name="hba_stock" value="${dto.hba_stock }" />
		  <input type="hidden" name="mem_id" value="${dto.mem_id }" />
        <tbody>
                  <tr>
            <td class="td_chk">
             <input type="checkbox"  class="chBox" name="chBox" value="${dto.bk_num }">
            </td>    
            <td class="td_prd">
              <div class="sod_img"><a href="#"><img src="${dto.hba_img } " alt="" name="hba_img" width="80" height="100"></a></div>
            
              <div class="sod_name">
                
                <a href="#" class="prd_name"><b>[한복대여]${dto.hba_info }</b></a>
                <div class="sod_opt">
                <ul>
					<li>옵션 : 사이즈   ${dto.hba_size } | 이용일 : ${dto.rt_rentdate}</li>
									
				</ul>
				<div class="opt-btns">
					<a href="amountUp?bk_num=${dto.bk_num }"><input type="button" value=" + " class="p_button"></a>
					<input type="text" name="bk_amount" id="amount" value="${dto.bk_amount }" size="3" onkeypress ="this.value=this.value.replace(0);">
					<a href="amountDown?bk_num=${dto.bk_num }&bk_amount=${dto.bk_amount}"><input type="button" value=" - " class="m_button" onclick="del"></a>
				</div> 
				</div>
			</div>
            </td>
            <td class="td_num">${dto.bk_amount }</td>
            <td class="td_numbig text_right"><fmt:formatNumber pattern="###,###,###" value="${dto.hba_price }" /></td>
            <td class="td_numbig text_right"><fmt:parseNumber var="point" value="${dto.hba_price * 0.01}" integerOnly="true" />${point }원</td>
            <td class="td_dvr">선불</td>
            <td class="td_numbig text_right"><span id="sell_price_0" class="total_prc">
            <fmt:formatNumber pattern="###,###,###" value="${dto.hba_price * dto.bk_amount}" /></span></td>
	      </tr>
	      <c:set var="sum" value="${sum + (dto.hba_price * dto.bk_amount)}" />
	          </c:forEach>
                </tbody>
      </table>
	  <div class="btn_cart_del">
        <button type="button" id="getCheckedAll">선택삭제</button>
        <button type="button" id="btnDelete">비우기</button>
      </div>
					<script>
						$(function(){						    
						    $("#btnDelete").click(function(){
						        if(confirm("장바구니를 비우시겠습니까?")){
						            location.href="deleteAll?mem_id=${sessionScope.logined_mem_id}";
						        }
						    });		
						    $("#getCheckedAll").click(function(){
						        if(confirm("선택한 상품을 삭제하시겠습니까?")){
						        		var checkArr =new Array();

						        		   $("input[class='chBox']:checked").each(function(){
						        		    checkArr.push(this.value);
						        		   });
						        		   
						        		   if (checkArr == "") {
							        			  alert("삭제할 상품을 선택해주세요");
							        			  return false;
							        			}
						        		   
						        		   location.href="deleteCart?checkArr=" +checkArr;
						        }
						    });
						});
					</script>
    </div>
    <!--class="tbl_head03 tbl_wrap"-->
        <div id="sod_bsk_tot">
      <ul>
        <li class="sod_bsk_dvr">
          <span>배송비</span>
          <strong>3,000</strong> 원
        </li>

        <li class="sod_bsk_pt">
          <span>적립금</span>
          <strong>${point }</strong> 점
        </li>

        <li class="sod_bsk_cnt">
          <span>총계 가격</span>
          <strong><fmt:formatNumber pattern="###,###,###" value="${sum + 3000}" /></strong> 원 
        </li>
      </ul>
    </div>
    <label for="">${oder_err_msg}</label>
 

    <div id="sod_bsk_act">
      <input name="logined_mem_id" type="hidden" value="${sessionScope.logined_mem_id}" />
      <a href="hb_list" class="btn01">쇼핑 계속하기</a>
      <button type="submit" class="btn_submit">주문하기</button>

                  </div>
  </form>


</div>



</c:otherwise>
				    </c:choose>
				    
</div>
</div>			
				
	
	<%@ include file="../common/footer.jsp" %> 	



</body>
</html>