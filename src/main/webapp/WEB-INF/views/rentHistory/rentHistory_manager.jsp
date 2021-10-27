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
<title>rentHistoryMgr</title>

<link rel="stylesheet" href="resources/css/rentHistory.css">
<link rel="stylesheet" href="resources/css/basket_default.css">
<link rel='stylesheet' href="resources/css/rentHistory_m.css"/>
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <script>
		function setPeriod(obj, type){
			// Type Setting
			$("#orderListSearchForm input[name='period']").val(type);

			// 기간 검색 부분 Init
			$("#orderListSearchForm input[name='dt_fr_input']").val('');
			$("#orderListSearchForm input[name='dt_to_input']").val('');

			// 기간 부분 조건에 따라 Setting
			var now = new Date();

			var year= now.getFullYear();
			var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1);
			var day = now.getDate() > 9 ? '' + now.getDate() : '0' + now.getDate();

			var now_date = year + '.' + mon + '.' + day;
			var hidden_now_date = year + '-' + mon + '-' + day;

			if(type != "") {
				var start_date = setStartDate(type);
				var a_date = start_date.split("|");

				$("#orderListSearchForm input[name='dt_to_input']").val(now_date);
				$("#orderListSearchForm input[name='dt_fr_input']").val(a_date[0]);
			}
		}
		
		// 시작 기간 얻기
		function setStartDate(type) {
			var time_val = "";
			var now = new Date();
			if(type == "1week") {
				var time_val = now.getTime() - (7 * 24 * 60 * 60 * 1000);
			} else if(type == "1month") {
				var time_val = now.getTime() - (30 * 24 * 60 * 60 * 1000);
			} else if(type == "3month") {
				var time_val = now.getTime() - (91 * 24 * 60 * 60 * 1000);
			}

			if(time_val != "") {
				now.setTime(time_val);
			}

			var year= now.getFullYear();
			var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1);
			var day = now.getDate() > 9 ? '' + now.getDate() : '0' + now.getDate();

			return year + '.' + mon + '.' + day + "|" + year + '-' + mon + '-' + day;
		}
		
		function search(){
			var ff = document.orderListSearchForm;
			var $dt_fr_input = $("#orderListSearchForm input[name='dt_fr_input']");
			var $dt_to_input = $("#orderListSearchForm input[name='dt_to_input']");

			var period = $("#orderListSearchForm input[name='period']").val();

/* 			if(period == "input") { // 선택된 기간이 없고 입력했다.
				if($dt_fr_input.val() == "" || $dt_to_input.val() == ""){
					alert("검색 기간을 설정해 주세요");
					return false;
				}
			} */

			ff.submit();
		}
		
		function setState(){
			$("input[type=hidden][name=searchState]").val("state");
		}
			
        </script>
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

			<div class="wrapper_title">주문내역관리</div>
			 <div class="wrapper_title" style="font-size: 18px;display: inline-block;"><a href="rentHistory_manager">전체관리  ${totRowCnt } ></a></div>
			<div class="wrapper_title" style="font-size: 18px;display: inline-block;"><a href="rentHistoryCancel_mgr">취소관리 ></a></div>

						<div id="sod_v">
							<form name="orderListSearchForm" id="orderListSearchForm"  method="get" action="rentHistory_manager">
							<input type="hidden" name="period" value="input"/>

					<div class="form-inline">
						<select id="searchType" name="searchType">
							<option value="">검색조건</option>
							<option value="all">전체조건</option>
							<option value="hba_info">상품명</option>
							<option value="odr_num">주문번호</option> 
						</select>
					<input type="text" id="keyword" name="keyword" value="${searchKeyword }" placeholder="검색어를 입력하세요"/>
					<button id="searchBtn" class="n-btn btn-sm btn-accent">검색</button>
					</div>
					
						<div class="n-table-filter">
					<div class="n-radio-tab">
						<input type="radio" id="radioTabGuide0"  name="date" value="rt_date"  onClick="setPeriod(this,'1week');" >
						<label for="radioTabGuide0">1주일</label>

						<input type="radio" id="radioTabGuide1"  name="date" value="rt_date"  onClick="setPeriod(this,'1month');" >
						<label for="radioTabGuide1">1개월</label>

						<input type="radio" id="radioTabGuide2" name="date" value="rt_date"  onClick="setPeriod(this,'3month');" >
						<label for="radioTabGuide2">3개월</label>

						<input type="radio" id="radioTabGuide3" name="date" value="" onClick="setPeriod(this,'');" checked>
						<label for="radioTabGuide3">전체 시기</label>
					</div>
					

					<div class="n-datepicker sb">
						<input type="text" class="n-input" name="dt_fr_input" value="${dt_fr }" placeholder="-" id="st_date" readonly="readonly" >
						<label for="st_date"><img class="ui-datepicker-trigger" src="resources/img_b/ico_calendar.png" alt="날짜 선택" title="날짜 선택"></label>
					</div>
					<div class="n-datepicker">
						<input type="text" class="n-input" name="dt_to_input" value="${dt_to }" placeholder="-" id="ed_date" readonly="readonly">
						<label for="ed_date"><img class="ui-datepicker-trigger" src="resources/img_b/ico_calendar.png" alt="날짜 선택" title="날짜 선택"></label>
					</div>

					<input type="hidden" name="searchState" value=""/>
 					<div class="n-select">
						<select id="sel_ord_state" name="state" onclick="setState();">
							<option value="">전체상태</option>
							<option value="입금확인중">입금확인중</option>
							<option value="취소요청">취소요청</option>
							<option value="주문완료">주문완료</option>
							<option value="배송준비중">배송준비중</option>
							<option value="배송중">배송중</option>
							<option value="배송완료">배송완료</option>
						</select>
					</div>
						

				
					<button type="button" class="n-btn btn-sm btn-accent" onclick="search();">조회</button>


						
					</div>
					<!-- //filter -->
				</form>
					<div class="st_btn">
						<div class="n-radio-tab">
						<input type="radio" id="radioTabGuide4"  name="state_box" value="주문완료" checked="checked" >
						<label for="radioTabGuide4" class="st_wd">주문완료</label>

						<input type="radio" id="radioTabGuide5"  name="state_box" value="입금확인중"  >
						<label for="radioTabGuide5" class="st_wd">입금확인중</label>

						<input type="radio" id="radioTabGuide6" name="state_box" value="배송준비중" >
						<label for="radioTabGuide6" class="st_wd">배송준비중</label>
						
						<input type="radio" id="radioTabGuide7" name="state_box" value="배송중" >
						<label for="radioTabGuide7" class="st_wd">배송중</label>

						<input type="radio" id="radioTabGuide8" name="state_box" value="배송완료" >
						<label for="radioTabGuide8" class="st_wd">배송완료</label>
					</div>
					<button type="button" class="n-btn btn-sm btn-accent" id="cgState">주문상태변경</button>
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
								<th scope="col">주문번호 / 주문자</th>
								<th scope="col">상품정보</th>
								<th scope="col">주문일자</th>
								<th scope="col">주문금액</th>
								<th scope="col">주문처리상태</th>
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
			
		<c:choose>
		    <c:when test="${totRowCnt == 0 }"> 				
		        <tr><td colspan="8" class="empty_table">주문 내역이 없습니다.</td></tr>       
		    </c:when>
			<c:otherwise>				
						<tbody>

							<c:forEach items="${rentHistory_manager }" var="dto">
							
							<tr>
							    <td class="td_chk">
             						<input type="checkbox"  class="chBox" name="chBox" value="${dto.odr_num }">
            					</td>  
								<td class="td_numbig m_li">
								<ul>
									<li><a href="#">${dto.odr_num }</a></li>
									<li>${dto.odr_name }</li>
								</ul>
								</td>
    							<td>								
									<ul class="info">
										<li><a href="#"><img src="${dto.hba_img }" width="60" height="100"></a></li>
							            <li><a href="#"><span  style="font-size: 16px;">${dto.hba_info }</span></a><br/>
										옵션 : 사이즈  ${dto.hba_size } | 이용일 : ${dto.rt_rentdate }</li>										
									</ul>
								</td>

								<td class="m_li" style="text-align: center;">${dto.rt_date }</td>
								
								<td class="td_numbig m_li">
									<ul class="inline">
									<li><fmt:formatNumber pattern="###,###,###" value="${dto.hba_price * dto.bk_amount }" />원</li>
									<li> ${dto.bk_amount }개</li>
									</ul>
								</td>
								<td>
								<ul class="inline">
								<li><span class="status">${dto.odr_status }</span></li>
								<li style="margin-top: 5px"><a href="rentHistory_view?odr_num=${dto.odr_num }" class="status_01" id="delOrd">세부내역</a></li>
								</ul>
								</td>
							</tr>
						</c:forEach>
						</tbody>
</c:otherwise>
				    </c:choose>
					</table>
				</div>
				<form id="form1" name="form1" action="rentHistory_manager" method="post">
	<div class="paging">
	<c:if test="${searchVo.totPage>1 }">
		<a href="rentHistory_manager?page=1"><img src="resources/img_b/btn_page_first.gif" alt="첫 페이지"></a>
		<a href="rentHistory_manager?page=${searchVo.page-1 }"><img src="resources/img_b/btn_page_prev.gif" alt="이전 페이지"></a>
	<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }" var="i">
		<c:choose>
			<c:when test="${i eq searchVo.page }">
				<span class="pg_btn f_btn">${i }</span>
			</c:when>
			<c:otherwise>
				<span class="pg_btn"><a href="rentHistory_manager?page=${i }">${i }</a></span>
			</c:otherwise>
		</c:choose>
	</c:forEach>
		<a href="rentHistory?page=${searchVo.page+1 }"><img src="resources/img_b/btn_page_next.gif" alt="다음 페이지"></a>
		<a href="rentHistory?page=${searchVo.totPage }"><img src="resources/img_b/btn_page_last.gif" alt="마지막 페이지"></a>
	</c:if>
	</div>
</form>
				    
			</div>
		</div>
		
		<%@ include file="../common/footer.jsp" %> 
		
		<!-- datepicker -->
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        
        <script>
        $(function() {
          var dates = $( "#st_date, #ed_date " ).datepicker({
          prevText: '이전 달',
          nextText: '다음 달',
          monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
          monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
          dayNames: ['일','월','화','수','목','금','토'],
          dayNamesShort: ['일','월','화','수','목','금','토'],
          dayNamesMin: ['일','월','화','수','목','금','토'],
          dateFormat: 'yy.mm.dd',
          showMonthAfterYear: true,
          yearSuffix: '년',
  
        });
        });
        </script>

</body>
</html>