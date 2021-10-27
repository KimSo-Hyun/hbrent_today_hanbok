<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/rentHistory.css">
<link rel="stylesheet" href="resources/css/basket_default.css">
<link rel='stylesheet' href="resources/css/rentHistory_m.css"/>
 <!-- datepicker -->
 		<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.account-in {
    padding-top: 11em;
}

</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<div class="account-in">
		<div class="container">

			<div class="wrapper_title">취소관리</div>
			
			 <div class="wrapper_title" style="font-size: 18px;display: inline-block;"><a href="rentHistory_manager">전체관리  ${totRowCnt } ></a></div>
			<div class="wrapper_title" style="font-size: 18px;display: inline-block;"><a href="rentHistoryCancel_mgr">취소관리 ></a></div>
						<div id="sod_v">

					<div class="st_btn">
						<div class="n-radio-tab">
						<input type="radio" id="radioTabGuide4"  name="state_box" value="취소승인" checked="checked" >
						<label for="radioTabGuide4" class="st_wd">취소승인</label>

						<input type="radio" id="radioTabGuide5"  name="state_box" value="취소처리중"  >
						<label for="radioTabGuide5" class="st_wd">취소처리중</label>

						<input type="radio" id="radioTabGuide6" name="state_box" value="취소거절" >
						<label for="radioTabGuide6" class="st_wd">취소거절</label>
						
						<input type="radio" id="radioTabGuide7" name="state_box" value="취소완료" >
						<label for="radioTabGuide7" class="st_wd">취소완료</label>

					</div>
					<button type="button" class="n-btn btn-sm btn-accent" id="cgState">취소상태변경</button>
					</div>
					
				</div>
					<script>					    
							   $("#cgState").click(function(){
							        if(confirm("상태를 변경하시겠습니까?")){
							        	
							        		var checkArr =new Array();

							        		   $("input[class='chBox']:checked").each(function(){
							        		    checkArr.push(this.value);
							        		   }); 
							        		   
							        		   var state_box = $('input[name="state_box"]:checked').val();
							        		   
							        		   
							        		   if (checkArr == "") { alert("변경할 주문번호를 선택해주세요"); return false;}
							        		   
							        		   location.href="cgState?checkArr="+checkArr+"&state_box="+state_box;
						        }
							   });
						    	
					</script>
				<div class="tbl_head03 tbl_wrap order_in">
					<table>
						<thead>
							<tr>
								<th scope="col">
					              <label for="ct_all" class="sound_only">상품 전체</label>
					              <input type="checkbox"  id="allCheck" class="chBox" value="">
					            </th>
								<th scope="col">취소번호</th>
								<th scope="col">주문번호</th>
								<th scope="col">아이디</th>
								<th scope="col">취소사유</th>
								<th scope="col">취소일자</th>
								<th scope="col">취소상태</th>
							</tr>
						</thead>
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
			
<%-- 		<c:choose>
		    <c:when test="${selectCancelCount == 0 }"> 				
		        <tr><td colspan="8" class="empty_table">취소 내역이 없습니다.</td></tr>       
		    </c:when>
			<c:otherwise>		 --%>		
						<tbody>

							<c:forEach items="${refund }" var="dto">
							
							<tr>
							    <td class="td_chk">
             						<input type="checkbox"  class="chBox" name="chBox" value="${dto.rt_num }">
            					</td> 
            					<td class="td_numbig">${dto.rf_num }</td>
								<td class="td_numbig m_li"> 
									${dto.rt_num }
								</td>
   <%--  							<td>								
									<ul class="info">
										<li><a href="#"><img src="${dto.hba_img }" width="80" height="120"></a></li>
							            <li><a href="#"><span  style="font-size: 16px;">${dto.hba_info }</span></a><br/>
										옵션 : 사이즈  ${dto.hba_size } | 이용일 : ${dto.rt_rentdate }</li>										
									</ul>
								</td> --%>

								<td class="m_li" style="text-align: center;">${dto.mem_id }</td>
								
								<td class="td_numbig m_li">
									${dto.rf_reason }
								</td>
								<td class="td_numbig">${dto.rf_date }</td>
								<td>
								<ul class="inline">
								<li><span class="status">${dto.odr_status }</span></li>
								
								</ul>
								</td>
							</tr>
						</c:forEach>
						</tbody>
<%-- </c:otherwise>
				    </c:choose> --%>
					</table>
				</div>

				    
			</div>
		</div>


</body>
</html>