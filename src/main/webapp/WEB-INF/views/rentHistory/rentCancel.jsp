<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>취소요청</title>
<link rel="stylesheet" href="resources/css/rentHistory.css">
<link rel="stylesheet" href="resources/css/basket_default.css">
<link rel='stylesheet' href="resources/css/rentHistory_m.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<style>
.account-in {
    padding-top: 11em;
}

</style>
<body>
<%@ include file="../common/header.jsp" %>
	<div class="account-in">
		<div class="container">
		<div class="wrapper_title" style="text-align: center;margin-bottom: 30px">주문 취소요청</div>

				<div class="tbl_head03 tbl_wrap order_in">
				<form name="form1" action="rentCancel" method="post">
					<table>
						<thead>
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">상품정보</th>
								<th scope="col">주문일자</th>
								<th scope="col">금액(수량)</th>
							</tr>
						</thead>							
						<tbody>
							<tr>
								<td class="td_numbig m_li" style="width:150px">${rentCancel.odr_num }</td>
								<td>								
								<ul class="info">
									<li><a href="#"><img src="${rentCancel.hba_img }" width="80" height="120"></a></li>
						            <li><a href="#"><span  style="font-size: 16px;">${rentCancel.hba_info }</span></a><br/>
									옵션 : 사이즈  ${rentCancel.hba_size } | 이용일 : ${rentCancel.rt_rentdate }</li>										
								</ul>
								</td>
								<td class="m_li" style="text-align: center; width:100px">${rentCancel.rt_date }</td>
								<td class="td_numbig m_li">
								<ul class="inline">
								<li><fmt:formatNumber pattern="###,###,###" value="${rentCancel.hba_price }" />원</li>
								<li> ${rentCancel.bk_amount }개</li>
								</ul>
								</td>
							</tr>
							<tr>
								<td><strong>사유선택<span style="color:#d50c0c"> *</span></strong></td>
								<td colspan="3">
									<select name="rf_reason" style="margin-left:20px">
									<option value="select">취소사유를 선택해주세요</option>
										<option value="구매의사취소" >구매의사취소</option>
										<option value="사이즈" >색상 및 사이즈 변경</option>
										<option value="다른 상품 잘못 주문">다른 상품 잘못 주문</option>
										<option value="서비스 불만족">서비스 불만족</option>
										<option value="상품정보 상이">상품정보 상이</option>
										<option value="기타">기타</option>
									</select>
								</td>

							</tr>

							
						</tbody>
					</table>
					</form>
				</div>
				<div id="sod_bsk_act" style="margin-top:50px">
				<button type="button" class="btn_submit" id="cancel">취소요청하기</button>
				<a href="rentHistory" class="btn01">이전 페이지</a>
				</div>
				<script>
						$(function(){						    
						    $("#cancel").click(function(){
						        if(confirm("주문을 취소하시겠습니까?")){
						        	
						        	var rf_reason = $('select[name=rf_reason]').val();
						        	if (rf_reason == "select") {
						        			  alert("취소사유를 선택해주세요");
						        			  return false;
						        			}
						            location.href="cancel?odr_num=${rentCancel.odr_num}&mem_id=${sessionScope.logined_mem_id}&rf_reason="+rf_reason;
						        }
						    });								
						});
					</script>
				</div>
				</div>
		<%@ include file="../common/footer.jsp" %> 		
</body>
</html>