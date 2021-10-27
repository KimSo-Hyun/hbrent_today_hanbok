<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join</title>

<!-- jquery삽입 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link href="resources/css/boot_style.css" rel="stylesheet">

<!-- hbrent /css Files -->
<link href="resources/css/mypage.css" rel="stylesheet">

</head>
<body>
<h3>join화면</h3>
<%@ include file="../common/header.jsp" %>
<main id="main" class="loginWrap container">
	<section class="intro-single">            
        <p>신규 회원가입</p>   
        
        <form action="mypage_join" method="post">
            <ol>
                <li>                
                     <label for="id">아이디</label>
                    <div class="row justify-content-between flex-sm-nowrap">
                        <input type="text" id="mem_id" name="mem_id" placeholder="아이디중복체크 확인요망">
                   		
                   		<script>
                   			function id_check(){
                   				$.ajax({
                   			    	type:"post",
                   			        url:"id_check",  
                   			        data:{"input_id" : $("#mem_id").val()},
                   			        success : function(result){
                   			        	if (result == 1) {
                   			        		alert("중복된 아이디입니다.");
										}
                   			        	else if(result == 0) {
                   			        		alert("사용가능한 아이디입니다.");
										}
                   			        },
                   			    });
                   			}        
                   		</script>
                                 		
                        <p class="radios ms-1 col-2">
                       		<input class="mem_id_check"  type="button" name="mem_id_check" value="&nbsp; 중복체크  &nbsp;" onclick="javascript:id_check()" />
                        </p>
                    </div>
                </li>
                <li>
                    <label for="pw">비밀번호</label>
                    <input type="password" name="mem_pass" id="pw" placeholder="대소문자, 숫자를 섞어서 16자 이내로 입력해주세요" >
                </li>
                <li>
                    <label for="pw2">비밀번호 확인</label>
                    <input type="password" id="pw2" placeholder="입력하신 비밀번호를 다시한번 입력해주세요">
                </li>
                <li>
                    <label for="name">이름</label>
                    <div class="row justify-content-between flex-sm-nowrap">
                        <input type="text" id="pw" name="mem_name" placeholder="이름을 입력해주세요">
                   
                        <p class="radios ms-1 col-2">
    	                        <input type="radio" name="mem_gender"  value="남" id="m" class="d-none" checked>
	                            <label for="m">남자</label>
                        </p>
                        <p class="radios ms-1 col-2">
                            <input type="radio" name="mem_gender" value="여" id="w" class="d-none">
                            <label for="w">여자</label>
                        </p>
                    </div>
                </li>
                <li>
                    <label for="phone">휴대폰번호</label>
                    <input type="text" id="phone" name="mem_cellphone" placeholder="(-)하이픈을 제외하고 입력해주세요">
                </li>
                <li>
                    <label for="email">이메일 입력</label>
                    <input type="text" id="email" name="mem_email" placeholder="이메일 형식에 맞게 입력해주세요" >
                </li>
                <li>
                    <label for="birth">생년월일</label>
                    <input type="text" id="birth" name="mem_birth" placeholder="yyyy-mm-dd" >
                </li>
                <li>
                    <label for="add">주소</label>
                    <input type="text" id="add" name="mem_address" placeholder="주소를 입력해주세요" >
                </li>
            </ol>
            
            <input type="submit" value="가입하기" class="done btn btn-b-n">
        </form>

    </section>
</main>

	<%@ include file="../common/footer.jsp" %>

</body>
</html>