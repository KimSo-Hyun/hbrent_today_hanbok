<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>login</title>
<style>
#container .sub_title_wrap {
    padding-top: 250px;
    min-width: 1240px;
}
#container .sub_title_wrap .sub_title {
    font-weight: 100;
}

#container .sub_title {
    font-family: "ProximaNova-Thin","yg740";
    font-size: 44px;
    color: #333;
    text-align: center;
    text-transform: uppercase;
}

#loginbox{
	border-top: 2px solid #000000;
    margin: 40px 	auto;
    width: 30%;
}

.css-2ckt4f {
    border: 1px solid #d4d4d4;
    border-radius: 2px;
    display: block;
    width: 100%;
    height: 48px;
    padding: 0 14px;
    font-size: 14px;
    font-weight: 500;
    color: #1a1a1a;
    outline: none;
}
.login_btn{
	min-width: 40px;
    min-height: 25px;
    width: 100%;
    height: 56px;
    margin: 20px 0 0;
    background: #000000;
    border:none;
    color: #ffffff;
    font-size: 16px;
    line-height: 56px;
    font-weight: 600;
}    
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<section id="container">
 <form action="loginproc" method="post">
 <div class="sub_title_wrap">
            <h2 class="sub_title">
                Login
            </h2>
        </div>
<table id="loginbox">
	<tr>
		<td class="idinputbox">
			<input type="text" name="mem_id" class="css-2ckt4f" placeholder="아이디" style="margin-top: 20px"/>
		</td>		
	<tr>
		<td class="pwinputbox">
			<input type="password" name="mem_pass" class="css-2ckt4f" placeholder="비밀번호" style="margin: 5px 0 10px 0 "/>
		</td>
	</tr>
	<tr>
		<td class="logmsg">${logmsg }</td>
	</tr>	
	<tr>
		<td clsas="loginsubminbtn">
			<input id="loginsubminbtn" type="submit" value="로그인" class="login_btn"/>
		</td>
	</tr>
</table>
</form>
</section>
<%@ include file="../common/footer.jsp" %> 

</body>
</html>