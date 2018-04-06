<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="/bigstar/resources/js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				page();
			});
			function component() {
				$('#selected').val('component');
				$('#component').css('border-bottom-color', 'white');
				$('#component').css('border-right-color', 'black');
				$('#page').css('border-bottom-color', 'black');
				$('#component_tool').css('visibility', 'visible');
				$('#page_tool').css('visibility', 'hidden');
			}
			function page() {
				$('#selected').val('page');
				$('#component').css('border-bottom-color', 'black');
				$('#component').css('border-right-color', 'black');
				$('#page').css('border-bottom-color', 'white');
				$('#page').css('border-left-color', 'black');
				$('#page_tool').css('visibility', 'visible');
				$('#component_tool').css('visibility', 'hidden');
			}
		</script>
		<style type="text/css">
			#sidebar {
				width: 150px;
				height: 600px;
				left: -149px;
				top: 12%;
				border: 1px solid black;
				position: fixed;
				background: white;
			}
			#sidebar:HOVER {
				width: 150px;
				left: 0px;
				background: white;
				border: 1px solid black;
				animation-duration: 0.1s;
  				animation-name: slidein;
			}
			@keyframes slidein {
				from {
					margin-left: -149px;
					width: 150px;
				}
			
				to {
					margin-left: 0px;
					width: 150px;
				}
			}
			#component {
				width: 75px;
				height: 30px;
				padding-top: 5px;
				border: 1px solid #000000;
				background: white;
				position: fixed;
				text-align: center;
				user-select: none;
			}
			#page { 
				width: 75px;
				height: 30px;
				padding-top: 5px;
				margin-left: 74px;
				border: 1px solid #000000;
				position: fixed;
				text-align: center;
				background: white;
				user-select: none;
			}
			#component_tool {
				width: 150px;
				margin-top: 30px;
				height: 570px;
				/* background: blue; */
				position: fixed;
			}
			#page_tool {
				width: 150px;
				margin-top: 30px;
				height: 570px;
				/* background: red; */
				position: fixed;
			}
		</style>
		<title>Shop Maker</title>
	
	</head>
	
	<body>
		
		<!-- 헤더 -->
		<header>
			
		<%@ include file="../../Aviews/header.jsp" %>

		</header>

		<!-- 편집메뉴 -->
		<aside style="display: inline;">
			<%@ include file="../Bsidebar.jsp" %>
		</aside>
		
	
		
		
		
		<!-- 중앙 화면 -->
		<div id="Bcenter" style="text-align: center; overflow: auto;">
			
		</div>
	
	<br><br><br><br><br>
		<div id="sidebar">
			<div id="component" onclick="javascript:component()">컴포넌트</div>
			<div id="page" onclick="javascript:page()">페이지</div>
			<div id="component_tool">컴포넌트</div>
			<div id="page_tool">페이지</div>
			<input type="hidden" id="selected">
		</div>
	</body>




</html>