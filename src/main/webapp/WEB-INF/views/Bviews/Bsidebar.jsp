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
	$('#BsiteManagement').on('click', Bsm);
	$('#BpageManagement').on('click', Bpm);
});

function Bmm(){
	if(onOff != 1)
	{
		$('#subMenu').html('<ul><li id="Bregist" style="cursor: pointer;">회원가입 양식</li><li id="Blogin" style="cursor: pointer;">로그인 양식</li><li id="Bmypage" style="cursor: pointer;">마이페이지 양식</li><li id="Bcart" style="cursor: pointer;">장바구니 양식</li></ul>');
		onOff = 1;
			$('#Bregist').on('click', function(){
				$('#Bcenter').load('Bregist');
			});
			$('#Blogin').on('click', function(){
				$('#Bcenter').load('Blogin');
			});
			$('#Bmypage').on('click', function(){
				$('#Bcenter').load('Bmypage');
			}); 
			$('#Bcart').on('click', function(){
				$('#Bcenter').load('Bcart');
			}); 
	}
	else
	{
		$('#subMenu').html('');
		onOff = 0;
	}
}
function Bsm(){
	if(onOff != 2)
	{
		$('#subMenu').html('<ul><li id="Bmainlist" style="cursor: pointer;">상품리스트 관리</li><li id="goBproductdetail" style="cursor: pointer;">상품상페이지 관리</li></ul>');
		onOff = 2;
		$('#Bmainlist').on('click', function() {
			$('#Bcenter').load('Bmainlist?rows=4');
		});
		$('#goBproductdetail').on('click', function() {
			$('#Bcenter').load('goBproductdetail');
		});
	}
	else
	{
		$('#subMenu').html('');
		onOff = 0;
	}
}

function Bpm(){
	if(onOff != 3)
	{
		$('#subMenu').html('<ul><li id="BpageHeader" style="cursor: pointer;">Header편집</li><li id="BpageFooter" style="cursor: pointer;">Footer편집</li></ul>');
		onOff = 3;
		$('#BpageHeader').on('click', function() {
			$('#Bcenter').load('BpageHeader');
		});
		$('#BpageFooter').on('click', function() {
			$('#Bcenter').load('BpageFooter');
		});
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
				<li style="cursor: pointer;" id="BsiteManagement">사이트 관리</li>
				<li>매장관리</li>
				<li>배송 및 세금</li>
				<li>주문관리 및 결제관리</li>
				<li style="cursor: pointer;" id="BpageManagement">페이지 관리</li>
			</ul>

		</aside>
		
				
			<div style="display: inline-block;" >
				<div id="subMenu" ></div>
			</div>	
	 </div>

</body>
</html>