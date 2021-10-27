<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/rentHistory.css">
<link rel="stylesheet" href="resources/css/basket_default.css">
<link rel='stylesheet' href="resources/css/rentHistory_m.css"/>
<link href="http://bigstore.zak.kr/theme/bigstore/css/bootstrap.css" rel='stylesheet' type='text/css' />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <style>	
	#menubar_include{
	position:absolute;
	z-index:100;
	}
	#mainmenu{
	margin : 100px;
	}
	.account-in{
	margin-top : 230px;
	}
	
</style>

<!-- 메뉴바 삽입 -->
<script>
	$(document).ready( function() {
		$("#menubar_include").load("menubar"); 
	});
</script>

</head>
<body>
<!-- 메뉴바 삽입 -->
<div id="menubar_include" ></div>
<!-- 메뉴바 삽입 완료-->
	<div class="account-in">
		<div class="container">

			<div class="wrapper_title"><a href="rentHistory">주문내역 상세조회</a></div>

				<div class="tbl_head03 tbl_wrap order_in">
					<table>
						<thead>
							<tr>
								<th scope="col">상품정보</th>
								<th scope="col">주문일자</th>
								<th scope="col">주문번호</th>
								<th scope="col">주문금액</th>
								<th scope="col">주문처리상태</th>
							</tr>
						</thead>
						
						<tbody>							
							<tr>
						
    								<td>								
								 <ul class="info">
									<li><a href="#"><img src="${rentHistory_view.hba_img }" width="80" height="120"></a></li>
						            <li><a href="#"><span  style="font-size: 16px;">${rentHistory_view.hba_info }</span></a><br/>
									옵션 : 사이즈  ${rentHistory_view.hba_size } | 이용일 : ${rentHistory_view.rt_rentdate }</li>										
								</ul> 
								</td>

								<td class="m_li" style="text-align: center;">${rentHistory_view.rt_date }</td>
								<td class="td_numbig m_li"><a href="#">${rentHistory_view.odr_num }</a></td>
								<td class="td_numbig m_li">
								<ul class="inline">
								<li><fmt:formatNumber pattern="###,###,###" value="${rentHistory_view.hba_price * rentHistory_view.bk_amount }" />원</li>
								<li> ${rentHistory_view.bk_amount }개</li>
								</ul>
								</td>
								<td>
								<c:choose>
	 							<c:when test="${rentHistory_view.odr_status == '취소요청'}">
	 							<ul class="inline">
								<li><span class="status">${rentHistory_view.odr_status }</span></li>
								</ul>
	 							</c:when>
	 							<c:when test="${rentHistory_view.odr_status == '배송완료' }">
	 							<ul class="inline">
								<li><span class="status">${rentHistory_view.odr_status }</span></li>
								<li style="margin-top: 5px"><a href="#" class="status_01" id="">구매확정<img src="resources/img_b/btn_page_next.gif" alt="구매확정"></a></li>
								</ul>
	 							</c:when>
	 							<c:when test="${rentHistory_view.odr_status == '구매확정' }">
	 							<ul class="inline">
								<li><span class="status">${rentHistory_view.odr_status }</span></li>
								<li style="margin-top: 5px"><a href="#" class="status_01" id="">리뷰쓰기<img src="resources/img_b/btn_page_next.gif" alt="리뷰쓰기"></a></li>
								</ul>
	 							</c:when>

	 							<c:otherwise>
								<ul class="inline">
								<li><span class="status">${rentHistory_view.odr_status }</span></li>
								<li style="margin-top: 5px"><a href="rentCancel?odr_num=${rentHistory_view.odr_num }" class="status_01" id="delOrd">취소요청<img src="resources/img_b/btn_page_next.gif" alt="취소요청"></a></li>
								</ul>
	 							</c:otherwise>
	 							</c:choose>
								</td>
							</tr>

						</tbody>

					</table>
				<div class="n-section-wrap wrap-detail">

						<h4>주문자/배송 정보</h2>

					<table class="n-table table-row">
						<colgroup>
							<col style="width:190px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">이름</th>
							<td>${rentHistory_view.odr_name }</td>
						</tr>
						<tr>
							<th scope="row">연락처</th>
							<td>${rentHistory_view.odr_cell }</td>
						</tr>
						<tr>
							<th scope="row">배송지 주소</th>
							<td>(${rentHistory_view.odr_postnum }) &nbsp; ${rentHistory_view.odr_addr }</td>
						</tr>
						<tr>
							<th scope="row">배송 메시지</th>
							<td>${rentHistory_view.odr_request }</td>
						</tr>
						</tbody>
					</table>

			

						<h4>결제 정보</h2>


					<table class="n-table table-row">
						<colgroup>
							<col style="width:190px">
							<col style="width:*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">상품합계</th>
							<td class="txt-info"><fmt:formatNumber pattern="###,###,###" value="${rentHistory_view.hba_price * rentHistory_view.bk_amount }" />원</td>
						</tr>
						<tr>
							<th scope="row">배송비</th>
							<td class="txt-info">3000원</td>
						</tr>
						<tr>
							<th scope="row">적립금 사용</th>
							<td class="txt-info">- ${rentHistory_view.odr_usedpoint }원</td>
						</tr>
						<tr>
							<th scope="row"><strong>최종결제금액</strong></th>
							<td class="txt-info"><strong>${rentHistory_view.odr_finalpay }</strong></td>
						</tr>
						</tbody>
					</table>

				<!-- //할인 정보 -->
			</div>
				</div>
		
				    
			</div>
		</div>


</body>
</html>