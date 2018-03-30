<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>Home</title>
		<style type="text/css">
			.header {
				margin-left: 10%;
				margin-right: 10%;
				position: absolute;
				width: 80%;
				height: 10%;
				background: #000000;
			}
			.left {
				margin-left: 10%;
				margin-top: 6%;
				position: absolute;
				width: 24%;
				height: 70%;
				background: aqua;
			}
			.right {
				margin-left: 35%;
				margin-top: 6%;
				position: absolute;
				width: 55%;
				height: 70%;
				background: red;
			}
			.footer {
				margin-left: 10%;
				margin-right: 10%;
				margin-top: 44%;
				position: absolute;
				width: 80%;
				height: 10%;
				background: fuchsia;
			}
			.button {
				width: 200px; 
				height: 60px; 
				background: gray; 
				border-radius: 7px; 
				text-align: center; 
				position: fixed;
				resize: both;
				overflow: auto;
			}
			.textalign {
				text-align: center;
				
			}
			#popup {
				position:absolute;
				left:40%;
				top:35%;
				visibility:hidden;
				width: 20%;
				height: 32%;
				background: #ffffff;
				border-radius: 10px;
				text-align: center;
				
			}
			.editBtn {
				width: 70px;
				height: auto;
				background: #ffffff;
				border: #ffffff;
				border-radius: 7px;
			}
		</style>
		<script src='<c:url value="resources/js/jquery-3.2.1.js" />'></script>
		<script src='<c:url value="resources/js/jscolor.js" />'></script>
 		
		<script type="text/javascript">
			$(document).ready(function () {
				document.getElementById('btnCount').value = 0;
			});
			

			$(function(){
			    $('html').keydown(function(e){
			    	var obj = $("#" + $(document.activeElement).attr("id"));
					var divVer = obj.offset().top;
	                var divHor = obj.offset().left;
			        var key = e.which;
			        switch(key){
			            case 38:
			                direction = "up";
			                var divUp = divVer - 1;
			                $("#" + $(document.activeElement).attr("id")).offset({top : divUp});
			                break;
			            case 37:
			                direction = 'left';
			                var divLeft = divHor - 1;
							$("#" + $(document.activeElement).attr("id")).offset({left : divLeft});
			                break;
			            case 39:
			                direction = 'right';
			                var divRight = divHor + 1;
							$("#" + $(document.activeElement).attr("id")).offset({left : divRight});
			                break;
			            case 40:
			                direction = 'down';
			                var divDown = divVer + 1;
							$("#" + $(document.activeElement).attr("id")).offset({top : divDown});
			                break;
			            default:
			                direction = 'none';
			                break;
			        }
			        
			    });
			    
			    
			});
			
			
			function allowDrop(ev) {
				ev.preventDefault();
			}
			function drag(divid, ev) {
				var obj = $("#" + divid.id).offset();
				var divX = obj.left;
				divX = Math.round(divX);
				var divY = obj.top;
				divY = Math.round(divY);
				
				ev.dataTransfer.setData("text", ev.target.id);
				ev.dataTransfer.dropEffect = "copy";
				var posX = ev.clientX;
              	var posY = ev.clientY;
              	document.getElementById('diffX').value = posX - divX;
				document.getElementById('diffY').value = posY - divY;
				document.getElementById('latestComponent').value = divid.id;
				
				
			}
			function drop(ev) {
				ev.preventDefault();
				var data = ev.dataTransfer.getData("text");
				var posX = ev.clientX;
				posX *= 1;
              	var posY = ev.clientY;
				posY *= 1;
				var diffX = document.getElementById('diffX').value;
				diffX *= 1;
				var diffY = document.getElementById('diffY').value;
				diffY *= 1;
				
				var obj = $("#right");
				var divX = obj.offset().left;
				divX = Math.round(divX);
				var divWidth = obj.width();
				divWidth = Math.round(divWidth);
				
				
				var divY = obj.offset().top;
				divY = Math.round(divY);
				var divHeight = obj.height();
				divHeight = Math.round(divHeight);
				
				var btn = $("#" + document.getElementById("latestComponent").value);
				var btnX = btn.width();
				btnX = Math.round(btnX);
				var btnY = btn.height();
				btnY = Math.round(btnY);
				
				
              	var finalX = posX - diffX - divX;
              	var finalY = posY - diffY - divY;
              	
              	
              	
              	
				ev.target.appendChild(document.getElementById(data));
				
				
				
				if (finalX < 0) {
					finalX = 0;
				}
				if (finalY < 0) {
					finalY = 0;
				}
				if (finalX + btnX > divWidth) {
					finalX = divWidth - btnX;
				}
				if (finalY + btnY > divHeight) {
					finalY = divHeight - btnY;
				}
				
				
				$("#" + document.getElementById("latestComponent").value).css("margin-left", finalX);
				$("#" + document.getElementById("latestComponent").value).css("margin-top", finalY);
				
				
				
				
				
				newBtn();
			}
			function newBtn() {
				var count = document.getElementById('btnCount').value;
				count *= 1;
				if ( $("#button" + count).parent().attr('id') == $('#left').attr('id') ) {
					return;
				} else {
					
					document.getElementById('btnCount').value = count + 1;
					count = document.getElementById('btnCount').value;
					var str = '<div id="button' + count + '" class="button" draggable="true" ondragstart="drag(this, event)" user-select="none" tabindex="0"><div id="textInBtn' + count + '">버튼' + count + '</div><button id="editBtn' + count + '" class="editBtn" onclick="showmap(popup, this.id)">수정</button></div>';
					document.getElementById('left').innerHTML = str;
				}
			}
			
			function test() {
				var btn = $("#" + $("#" + $(document.activeElement).attr("id")));
				var btnX = btn.width();
				btnX = Math.round(btnX);
				var btnY = btn.height();
				btnY = Math.round(btnY);
				
				document.getElementById("x").value = btnX;
				document.getElementById("y").value = btnY;
			}
			
			
			function showmap(popup, id) {
				var parent = $("#" + id).parent().attr("id");
				document.getElementById("btnName").value = parent;
				if($('#popup').css('visibility') == "hidden") {
					$('#popup').css('visibility', "visible");
					return false;
				}
				if($('#popup').css('visibility') == "visible") {
					$('#popup').css('visibility', "hidden");
					return false;
				}
			}
			function closemap(popup) {
				$('#popup').css('visibility', "hidden");
				return false;
			}
			
			function editBtn(btn) {
				var fontsize = $("#fontsize").val();
				
				var regNumber = /^[0-9]*$/;
				if(!regNumber.test(fontsize)) {
				    alert('글자크기는 숫자만 입력할 수 있습니다');
				    return false;
				}
				
				fontsize *= 1;
				
				var color = "#" + $("#foo").val();
				var btnText = $("#btnText").val();
				var btnName = $("#btnName").val();
				$("#" + btnName).css("background", color);
				console.log($("#" + btnName).children("div").attr("id"));
				$("#" + btnName).children("div").text(btnText);
				
				if (fontsize != '' && fontsize != null) {
					$("#" + btnName).children("div").css("font-size", fontsize + "px");
				}
				
				closemap();
			}
			
			
			
		</script>
	</head>
	<body>
		
		<div class="tempLink" style="text-align: center;">
		<!-- 임시 링크입니다 지우셔도 OK -->
		<p>Bigstar (Home.jsp)</p>
		<a href="loginPage">로그인 페이지 연결</a>
		<a href="AqnaPage">QnA페이지 연결</a>
		<a href="ApurchasePage">구매페이지 연결 </a>
		<a href="">공지사항페이지 연결 </a>
		</div>
		
		<div id="left" class="left">
			<div id="button0" class="button" draggable="true" ondragstart="drag(this, event)" user-select="none" tabindex="0">
				<div id="textInBtn0">
					버튼0
				</div>
				<button id="editBtn0" class="editBtn" onclick="showmap(popup, this.id)">수정</button>
			</div>
		</div>
		<div id="right" class="right" ondrop="drop(event)" ondragover="allowDrop(event)">
			<input type="hidden" id="diffX">
			<input type="hidden" id="diffY">
			<input type="hidden" id="latestComponent">
			<input type="hidden" id="btnCount">
		</div>
		<div class="footer">
			<a href="test">test</a>
			<input type="button" value="test" onclick="test()">
			<input type="text" id="x"><input type="text" id="y">
		</div>
		
		
		
		<div id="popup">
		<br>
			버튼 텍스트 : <input type="text" id="btnText"><br><br>
			버튼 색상 &emsp;: <input id="foo" class="jscolor jscolor-active" value="cc4499" autocomplete="off" style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br><br>
			글자 크기 &emsp;: <input type="text" id="fontsize"><br><br>
			URL 　　　 : <input type="text" id="btnUrl"><br><br>
			<button class="editBtn" onclick="editBtn(this)">수정완료</button>&emsp;<button class="editBtn" onclick="closemap(popup)">닫기</button>
			<input type="hidden" id="btnName">
			<input type="hidden" id="editBtnName">
		</div>
		
		
		
	</body>
</html>
