<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="./resources/js/jquery-3.2.1.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>마이페이지</title>
		<style type="text/css">
			.img-euj{
				border: 1px solid black;
				width: 300px;
				height: 500px;
				cursor: pointer;
			}
			
			.img-euj:hover{
				box-shadow: 0px 0px 20px -5px rgba(0, 0, 0, 0.8);
				opacity: 0.1;
			}
			
			.imgdiv-euj{
				display: inline-block;
			}
			
		</style>
		
		<script type="text/javascript">
		
		$(document).ready(function(){
			var membercode = $('#membercode').val();
			//alert(membercode);
			
			//쇼핑몰 생성시 이동링크
			$('#newShop').on('click', function(){
				location.href = "goBmain";
			});
			
			$('#manageShop').on('click', function(){
				location.href = "goBmain";
			});
			
			$('#removeShop').on('click', function(){
				loaction.href = "deleteShop?membercode="+ membercode;
			});
			
		});
		
		</script>
		
	</head>
	<body>
		<header style="margin-bottom: 150px;">
			<%@ include file="../../Aheader.jsp" %>
		</header>
		
		<div style="width: 100%; height: 100%; text-align: center;">
			
			<div style="text-align: center; font: 20pt bold;">${Amember.id}님 환영합니다</div>
			
			<hr style="border: 1px solid gray;">
			
			<div id="newShop" class="imgdiv-euj"><h5 style="font-size: 18pt;">쇼핑몰 생성</h5><img class="img-euj" alt="쇼핑몰 생성" src="./resources/img/Page/AlterPage.png"></div>
			<div id="manageShop" class="imgdiv-euj"><h5 style="font-size: 18pt;">쇼핑몰 관리</h5><img class="img-euj" alt="쇼핑몰 생성" src="./resources/img/Page/CreatePage.png"></div>
			<div id="removeShop" class="imgdiv-euj"><h5 style="font-size: 18pt;">쇼핑몰 삭제</h5><img class="img-euj" alt="쇼핑몰 생성" src="./resources/img/Page/DeletePage.png"></div>
		</div>
		
		<input id="membercode" type="hidden" value="${Amember.membercode}">
		
	<footer>
		<%@ include file="../footer.jsp" %>
	</footer>
	
<%-- 				<button onclick="location.href='goBmain'">쇼핑몰 생성</button> 
			<button onclick="location.href='goBmain'">쇼핑몰 관리</button> 
			<button onclick="location.href='deleteShop?membercode=${Amember.membercode}'">쇼핑몰 삭제</button> --%>
	</body>
</html>