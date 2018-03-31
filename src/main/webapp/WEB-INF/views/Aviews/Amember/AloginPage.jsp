<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BigStar Login</title>

<script src="/bigstar/resources/js/jquery-3.2.1.min.js">
</script>
<script>

$(document).ready(function(){
	
	 
	//alert('jq체크');
	$('#Alogin').on('click', function(){
		//alert('로그인');
		 var inputId = document.getElementById('inputId').value; 
	  var inputPassword = document.getElementById('inputPassword').value; 
	    
	   if(inputId.length >= 1) 
	   { 
	      if(inputPassword.length >= 1) 
	      { 
	    	 document.getElementById('AgoLogin').submit();
	      } 
	      else 
	      { 
	         alert('비밀번호를 입력하세요');          
	      } 
	   } 
	   else 
	   { 
	      alert('아이디를 입력하세요');    
	   } 

	});
	
	$('#Asignup').on('click', function(){
		//회원가입
		location.href = "AsignupPage";
	});
	
});


</script>

<style type="text/css">

.button{

cursor: pointer;
text-align: center;
margin: 3px;

}

.borderIb{

display: inline-block;
border: 1px dotted black;
margin: 4px;

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

	<header>
		<%@ include file="../header.jsp" %>
	</header>
	
		<article class="borderI" style="margin: 8px;">
		
			<div style="margin-left: 29%;">
			  <div class="borderIb">
			    <form id="AgoLogin" action="AgoLogin" method="post" id="AsubmitLoginForm">       
			      	  <h2 class="form-signin-heading">LOGIN</h2>
				      
				    	<table>
					    	<tr>
					    		<th>아이디</th>
					      		<td colspan="3"><input type="text" id="inputId" name="id" placeholder="아이디를 입력하세요" required="required" autofocus="autofocus" /></td>
					      	</tr>
					      	<tr>
					      		<th>비밀번호</th>
					      		<td colspan="3"><input type="password" id="inputPassword" name="pw" placeholder="비밀번호를 입력하세요" required="required"/></td>    
						 	</tr>
					 	</table>
			      	<div class="button borderI" id="Alogin">로그인</div>  
			     </form>
	  			</div>
	  			
	  			<div class="borderIb">
	  					<h2>회원가입</h2>
	  					<h6>아이디가 없으세요?</h6>
	  					<div class="button borderI" id="Asignup">회원가입 버튼</div>
	  					<div class="button borderI" id="Agoogle">구글 아이디로 로그인 버튼</div>
	  			</div>
			</div>
		</article>
		
	<footer>
		<%@ include file="../footer.jsp" %>
	</footer>


</body>
</html>