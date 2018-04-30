<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/bigstar/resources/css/headerfooter.css?ver=5">

<title>Insert title here</title>

<script type="text/javascript">
function myShop(code) {
	location.href="goMyShop?code=" + code + "&page=BpageMain";
}
</script>
<style type="text/css">
*{

font-family: nanum;

}

.button{

cursor: pointer;
text-align: center;
margin: 3px;

}

.borderI{

display: inline-block;
border: 1px dotted black;
width: 100%;
margin: 4px;

}
.dotted-euj{
}

			
			.saveload-euj{
				border: 1px solid black;
				border-radius: 10px;
				color: black;
				margin: 2px;
			}
			
			.bt-euj{
				background-color: #eaffff;
				border-radius: 4px;
				border: 2px solid gray;
				box-shadow: 1px 3px 2px black;
				margin-top: 4px;
				display: inline-block;
				margin: 2px;
				
			}
			.abt{
			margin-top: 14px;
			}
</style>


</head>
<body>

<header>

<div style="height: 80px;" class="w3-bar w3-white w3-wide w3-padding w3-card w3-top">
	<a href="/bigstar" class="w3-bar-item"><h1 style="font-family: tmon; color:#77a7f4; margin-left: 60px; text-shadow: -4px 0 black, 0 1px black, 1px 0 black, 0 -1px black;">Shop Maker</h1></a>
		<!--추가 페이지 업로드시 바뀔 부분-->
	<div class="w3-right w3-hide-small dotted-euj">
					<a href="AqnaPage" class="abt w3-bar-item w3-button bt2-euj">문의하기</a>
					<a href="AnoticeList" class="abt w3-bar-item w3-button bt2-euj">공지사항</a>
					<a href="ApurchasePage" class="abt w3-bar-item w3-button bt2-euj">상품결제</a>
					<c:if test="${Amember == null }">
						<a href="loginPage" class="abt w3-bar-item w3-button bt2-euj">로그인하기</a>
					</c:if>
					<c:if test="${Amember != null }">
						<a class="abt w3-bar-item w3-button bt2-euj" href="Amypage">마이페이지</a>
						<a class="abt w3-bar-item w3-button bt2-euj" href="javascript:myShop(${Amember.membercode})">내 쇼핑몰</a>
						<a class="abt w3-bar-item w3-button bt2-euj" href="Logout">로그아웃</a>

					</c:if>
				</div>
</div>

  
</header>


		

</body>
</html>