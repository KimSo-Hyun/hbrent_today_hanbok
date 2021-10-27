<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>상품추가</title>
</head>
<script> 
$(document).ready(function(){
	$("#addBtn").click(function(){
			
    	var hba_info = $("#hba_info").val();
    	var hba_price = $("#hba_price").val();
    	var hba_stock = $("#hba_stock").val();
    	var hba_img = $("#hba_img").val();
		   	
    		 if(hba_info == "") {
    	         alert("상품명을 입력해주세요");
    	         
  	         } else if(hba_price == "") {
    	         alert("상품 가격을 입력해주세요");
    	        
    	     } else if ($("#hba_genderm").is(":checked")=="" && $("#hba_genderw").is(":checked")==""){
    			 alert("성별을 선택해주세요");
    			 
    		 } else if($("#hba_sizes").is(":checked")=="" && $("#hba_sizem").is(":checked")=="" && $("#hba_sizel").is(":checked")==""){
     	 		 alert("사이즈를 선택해주세요");
     	 		
     	     } else if(hba_stock == "") {
     	         alert("상품 수량을 입력해주세요");
     	        
     	     } else if(hba_img == "") {
     	         alert("상품 사진을 첨부해주세요");
     	       
    	     } else {
    	    	 $("#pf").submit();	 
    	    	 
    	     } 
    		 return false
	}); 
	
}); 


function checkOnlyOne2(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("hba_gender");
	  
	   checkboxes.forEach((cb) => {
		    cb.checked = false;
		  }) 
	  
	  element.checked = true;
	}

	function checkOnlyOne(element) {
		  
		  const checkboxes 
		      = document.getElementsByName("hba_size");
		  
		   checkboxes.forEach((cb) => {
			    cb.checked = false;
			  }) 
		  
		  element.checked = true;
		}
	
	
	$(document).ready(function(){
	       $("#hba_genderm").on("click",function(){
	           if($("#tbl tr td input").eq(3).val='M'){
	            $("#tbl tr td input").eq(4).val(90);
	            $("#tbl tr td input").eq(5).val(95);
	            $("#tbl tr td input").eq(6).val(100);
	           }
	           
	        });
	    });

	    $(document).ready(function(){
	       $("#hba_genderw").on("click",function(){
	           if($("#tbl tr td input").eq(4).val='W'){
	               $("#tbl tr td input").eq(4).val(66);
	               $("#tbl tr td input").eq(5).val(77);
	               $("#tbl tr td input").eq(6).val(88);
	               
	           }
	         });
	    });
	
</script>
<style>
#tbl{
	border:1px solid #ddd;
}
td{
	padding: 3%;
	border:1px solid #ddd;
}
input[type=text],input[type=checkbox]{
	border:1px solid #ddd;
}
.txt {
	background: #f3f3f3;
}
.btn01 {
    padding: 7px;
    border: none;
    color: #fff;
    background: #733b90;
    width:20%
}
.btn02 {
    padding: 7px;
    border: none;
    color: #fff;
    background: #333;
    width:20%
}
.wrapper_title {
    margin: 15px;
    font-size: 1.667em;
    font-weight: 400;
    letter-spacing: 0;
    color: #333;
}
</style>

<body>
<%@ include file="../common/header.jsp" %> 
<div id="main" style="margin:10% 0;">
<div class="wrapper_title" style="text-align: center;margin-bottom: 30px">상품 등록</div>
	<form id="pf" name="pf" action="hba_add" method="post" enctype="multipart/form-data" style="height: 500px;">
		<table id="tbl" style="height: 500px; width: 50%; margin: auto;">	   
		        <tr>
		            <td class="txt">상품명</td>
		            <td><input type="text" name="hba_info" id="hba_info"></td>
		        </tr>
		        <tr>
		            <td class="txt">대여가</td>
		            <td><input type="text" name="hba_price" id="hba_price" > 원</td>
		        </tr>
		         <tr>
		            <td class="txt">성별</td>
		            <td><input type="checkbox" id="hba_genderm" name="hba_gender" value="M" onclick="checkOnlyOne2(this)"> 남 &nbsp;
		                <input type="checkbox" id="hba_genderw" name="hba_gender" value="W" onclick="checkOnlyOne2(this)"> 여 </td>
		        </tr>
		        <tr>
		            <td class="txt">사이즈</td>
		            <td><input type="checkbox" id="hba_sizes" name="hba_size" value="" onclick="checkOnlyOne(this)"> S&nbsp;&nbsp;
		                <input type="checkbox" id="hba_sizem" name="hba_size" value="" onclick="checkOnlyOne(this)"> M&nbsp;&nbsp;
		                <input type="checkbox" id="hba_sizel" name="hba_size" value="" onclick="checkOnlyOne(this)"> L </td>
		        </tr>
		        <tr>
		            <td class="txt">수량</td>
		            <td><input type="text" name="hba_stock" id="hba_stock"> 개</td>
		        </tr>
		
		        <tr>
		            <td class="txt">상품이미지</td>
		            <td><input type="file" name="hba_img" id="hba_img"></td>
		        </tr>
		        <tr>
		            <td colspan="2" align="center">
		            	 <input type="button" value="등록" name="addBtn" id="addBtn" class="btn01" >
		                 <a href="hb_list"><input type="button" value="목록" class="btn02"/></a>
		            </td>
		        </tr>
		        
		</table>
	</form>
</div>
<%@ include file="../common/footer.jsp" %> 
</body> 


</html>