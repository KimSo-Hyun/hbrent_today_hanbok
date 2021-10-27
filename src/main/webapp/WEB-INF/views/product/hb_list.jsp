<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Hanbok</title>
  <style>
  .img-box-a .img-a{
	filter: brightness(80%);
}
.btn01 {
    padding: 7px;
    border: none;
    color: #fff;
    background: #733b90;
    width:20%;
    margin-left:10px;
}
  </style>
</head>

<body>
<%@ include file="../common/header.jsp" %> 
 
  <main id="main">

    <!-- ======= Intro Single ======= -->
    <section class="intro-single">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h1 class="title-single">전체상품</h1>
              <span class="color-text-a"> - Total ${totRowCnt } Item</span>
              <C:set var="loginedid" value="${sessionScope.logined_mem_id }"/> 
		      <C:if test="${sessionScope.logined_mem_rank =='관리자'   }">
		      <a href="hba_add_view"><input type="button" value="상품추가 +" class="btn01"/></a>
			</C:if>
            </div>
          </div>
          <div class="col-md-12 col-lg-4">
            <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
              <ol class="breadcrumb">
                <li class="breadcrumb-item">
                  <a href="#">Home</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">
                  Hanbok
                </li>
              </ol>
            </nav>
          </div>
        </div>
      </div>

      
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
      <div class="container">
        <div class="row">
          <c:forEach items="${hba }" var="dto">
          <div class="col-md-4">
            <div class="card-box-a">
              <div class="img-box-a">
                  <a href="hb_detail?hba_num=${dto.hba_num }"><img src="${dto.hba_img }" class="img-a img-fluid"></a>
              </div>
              <div>
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="hb_detail?hba_num=${dto.hba_num }" style="font-size: 26px">${dto.hba_info }</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">대여가 ｜<fmt:formatNumber pattern="###,###,###" value="${dto.hba_price }" />원</span>
                    </div>
                    <a href="hb_detail?hba_num=${dto.hba_num }" class="link-a">상품 바로가기
                      <span class="ion-ios-arrow-forward"></span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
              </c:forEach>

        </div>
         <form id="form1" name="form1" action="hb_list" method="post" style="text-align: center; ">
         <c:if test="${searchVo.totPage>1 }">
        <div class="row">
          <div class="col-sm-12">
            <nav class="pagination-a">
              <ul class="pagination justify-content-end">
                <li class="page-item disabled">
                  <a class="page-link" href="hb_list?page=${searchVo.page-1 }">
                    <span class="ion-ios-arrow-back"></span>
                  </a>
                </li>
                <c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }" var="i">
				<c:choose>
				<c:when test="${i eq searchVo.page }">
                <li class="page-item active">
                  <a class="page-link">${i }</a>
                </li>
                </c:when>
                <c:otherwise>
                <li class="page-item ">
                  <a class="page-link" href="hb_list?page=${i }">${i }</a>
                </li>
                </c:otherwise>
		</c:choose>
	</c:forEach>

                <li class="page-item next">
                  <a class="page-link" href="hb_list?page=${searchVo.page+1 }">
                    <span class="ion-ios-arrow-forward"></span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        	</c:if>
       </form>	



	
	

      </div>
    </section><!-- End Property Grid Single-->

  </main><!-- End #main -->


<%@ include file="../common/footer.jsp" %> 
</body>

</html>