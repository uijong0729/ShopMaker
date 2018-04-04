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
var onOff = 0;

$(document).ready(function(){
	$('#BmemberManagement').on('click', Bmm);
});

function Bmm(){
	if(onOff == 0)
	{
		$('#subMenu').html('<ul><li style="cursor: pointer;">회원가입 양식</li><li style="cursor: pointer;">로그인 양식</li><li style="cursor: pointer;">마이페이지 양식</li></ul>');
		onOff = 1;
	}
	else
	{
		$('#subMenu').html('');
		onOff = 0;
	}
}

</script>

</head>
<body>

	<!-- 왼쪽 사이드 바 -->
	<div style="width: 40%; fixed; left: 0">
		<aside style="display: inline-block; border: 1px solid black; ">
			<div><h1>편집메뉴</h1></div>
			<ul>
				<li style="cursor: pointer;" id="BmemberManagement">회원관리</li>
				<li>사이트 관리</li>
				<li>매장관리</li>
				<li>배송 및 세금</li>
				<li>주문관리 및 결제관리</li>
			</ul>

		</aside>
				
			<div style="display: inline-block;" >
				<div id="subMenu" ></div>
			</div>	
	 </div>

</body>
</html>