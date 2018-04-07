<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/bigstar/resources/css/headerfooter.css?ver=5">
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js">
		</script>
<script>
$(document).ready(function(){
	$('#Bsave').on('click', goSave);
});

function goSave(){
	var getTag = document.getElementById("Bcenter").innerHTML;
	//alert(getTag);
	var preview = window.open('preview', 'newwin', 'width=1024px, height=440px');
	
}
</script>

<style type="text/css">
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

</style>


</head>
<body>

<header style="margin-bottom: 100px;">

  <div class="w3-bar w3-white w3-wide w3-padding w3-card w3-top">
    <a href="/bigstar" class="w3-bar-item"><img alt="logo" src="/bigstar/resources/img/logo.jpg"></a>
    <!--추가 페이지 업로드시 바뀔 부분-->
    <div class="w3-right w3-hide-small">
      <a id="Bsave" href="#" class="w3-bar-item w3-button">미리보기</a>

      <c:if test="${Amember == null }"><a href="loginPage" class="w3-bar-item w3-button">로그인하기</a></c:if>
	
	  <c:if test="${Amember != null }">
		<a class="w3-bar-item w3-button" href="Logout">로그아웃</a>
	  </c:if>
      
    </div>

			
			
			
			<br>
  	</div>
  
  
</header>


		

</body>
</html>