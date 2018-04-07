<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="/bigstar/resources/js/jquery-3.2.1.min.js">
</script>
<script>
$(document).ready(init());
function init(){
	document.getElementById('blankCart').style.display = "none";
	document.getElementById('clickCart').disabled = true;
	$('#clickBlank').on('click', function(){
		document.getElementById('blankCart').style.display = "none";
		document.getElementById('clickCart').disabled = true;
		
		document.getElementById('cart').style.display = "flex";
		document.getElementById('clickBlank').disabled = false;
	});
	$('#clickCart').on('click', function(){
		document.getElementById('blankCart').style.display = "flex";
		document.getElementById('clickCart').disabled = false;
		
		document.getElementById('cart').style.display = "none";
		document.getElementById('clickBlank').disabled = true;
	});
}




</script>

<style type="text/css">
.tabs
{
	cursor: pointer;
	display: inline-block;
	background-color: aqua;
	border: 1px solid black;
	margin: 5px;
}

</style>

</head>
<body>


<div style="text-align: center;">
	<div style="display: inline-block;">
		<h2>장바구니화면 편집</h2>
     
		      <ul style="list-style: none;">
		        <li id="clickBlank" class="tabs"><a>빈 장바구니</a></li>
		        <li id="clickCart" class="tabs"><a>장바구니</a></li>
		      </ul>
		      
		      <div style="text-align: center; border: 1px solid black;">
		        <div id="blankCart" style="display: inline-block; text-align: center">   
		        	<div>
		        	
		        		<h3>장바구니가 비어있습니다.</h3>
		        	
		        	</div>
		        </div>
		        
		        <div id="cart" style="display: inline-block;">   
					
					<div style="display: inline-block; text-align: center">
						
						<h2>장바구니 리스트</h2>
						<table border="1" style="border-collapse: collapse;">
							<tr>
								<th>ㅁ</th>
								<th>상품 이미지</th>
								<th width="30%">상품</th>
								<th>수량</th>
								<th>가격</th>
								<th>배송정보</th>
							</tr>
							
							<tr>
								<td><input type="checkbox"></td>
								<td><img alt="그림" src="/bigstar/resources/img/logo.jpg"></td>
								<td>빅쓰타</td>
								<td>3</td>
								<td>4,500</td>
								<td>배송중</td>
							</tr>
						
						</table>
						
						<div>총 결제 예정 금액 : <b>4,500</b></div>
						
						<div style="text-align: center">
							<div>
								<a class="tabs">전체 주문</a>
								<a class="tabs">선택 주문</a>
							</div>
						</div>
						
					</div>
					
		        </div>
		        
		      </div>
		      
		</div>
				
		
	</div>		
</div>	


</body>
</html>