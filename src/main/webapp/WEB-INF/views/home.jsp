
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html oncontextmenu="return false">
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
				overflow: auto;
			}
			.footer {
				margin-left: 10%;
				margin-right: 10%;
				margin-top: 45%;
				margin-bottom: 3%;
				position: absolute;
				width: 80%;
				height: auto;
				background: fuchsia;
			}
			.button {
				width: 200px; 
				height: 60px; 
				background: gray; 
				border-radius: 7px; 
				text-align: center; 
				position: absolute;
				float: none;
				resize: both;
				overflow: auto;
			}
			.image {
				width: 60px; 
				height: 60px; 
				position: absolute;
				resize: both;
				overflow: hidden;
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
				z-index: 1000;
			}
			#popup_text {
				position:absolute;
				left:40%;
				top:35%;
				visibility:hidden;
				width: 20%;
				height: 32%;
				background: #ffffff;
				border-radius: 10px;
				text-align: center;
				z-index: 1000;
			}
			#popup_image {
				position:absolute;
				left:40%;
				top:35%;
				visibility:hidden;
				width: 20%;
				height: 32%;
				background: #ffffff;
				border-radius: 10px;
				text-align: center;
				z-index: 1000;
			}
			
			.editText {
				width: 70px;
				height: auto;
				background: #ffffff;
				border: 1px solid #000000;
				border-radius: 7px;
			}
			.editBtn {
				width: 70px;
				height: auto;
				background: #ffffff;
				border: 1px solid #000000;
				border-radius: 7px;
			}
			.editImage {
				width: 70px;
				height: auto;
				background: #ffffff;
				border: 1px solid #000000;
				border-radius: 7px;
			}
			.editTextBtn {
				width: 70px;
				height: auto;
				background: #ffffff;
				border: 1px solid #000000;
				border-radius: 7px;
				margin-left: 60%;
				margin-top: 5%;
				position: absolute;
			}
			.text {
				position: absolute;
				width: 200px;
				height: 60px;
				background: #ffffff;
				border-radius: 7px;
				resize: both;
				overflow: auto;
			}
			
		</style>
		<script src='<c:url value="resources/js/jquery-3.2.1.js" />'></script>
		<script src='<c:url value="resources/js/jscolor.js" />'></script>
		<script src='<c:url value="resources/js/jquery.form.min.js" />'>
		// target elements with the "draggable" class
		interact('.draggable')
		  .draggable({
		    // enable inertial throwing
		    inertia: true,
		    // keep the element within the area of it's parent
		    restrict: {
		      restriction: "parent",
		      endOnly: true,
		      elementRect: { top: 0, left: 0, bottom: 1, right: 1 }
		    },
		    // enable autoScroll
		    autoScroll: true,

		    // call this function on every dragmove event
		    onmove: dragMoveListener,
		    // call this function on every dragend event
		    onend: function (event) {
		      var textEl = event.target.querySelector('p');

		      textEl && (textEl.textContent =
		        'moved a distance of '
		        + (Math.sqrt(Math.pow(event.pageX - event.x0, 2) +
		                     Math.pow(event.pageY - event.y0, 2) | 0))
		            .toFixed(2) + 'px');
		    }
		  });

		  function dragMoveListener (event) {
		    var target = event.target,
		        // keep the dragged position in the data-x/data-y attributes
		        x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx,
		        y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;

		    // translate the element
		    target.style.webkitTransform =
		    target.style.transform =
		      'translate(' + x + 'px, ' + y + 'px)';

		    // update the posiion attributes
		    target.setAttribute('data-x', x);
		    target.setAttribute('data-y', y);
		  }

		  // this is used later in the resizing and gesture demos
		  window.dragMoveListener = dragMoveListener;
		</script>
 		
		<script type="text/javascript">
			$(document).ready(function () {
				document.getElementById('btnCount').value = 0;
				document.getElementById('textCount').value = 0;
				document.getElementById('imageCount').value = 0;
			});
			$(document).mousedown(function(e) {
				if (e.which == 3) {

					
					if ($(this.activeElement).attr("id").startsWith("button")) {
						showmap(popup, $(this.activeElement).attr("id"));
					}
					if($(this.activeElement).attr("id").startsWith("text")) {
						showmap_text(popup, $(this.activeElement).attr("id"));
					}
					if ($(this.activeElement).attr("id").startsWith("image")) {
						showmap_image(popup, $(this.activeElement).attr("id"));
					}
					$("#delItem").val($(this.activeElement).attr("id"));
				}
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
			function drag(compId, ev) {
				var obj = $("#" + compId.id).offset();
				var divX = obj.left;
				divX = Math.round(divX);
				console.log(divX);
				var divY = obj.top;
				divY = Math.round(divY);
				
				ev.dataTransfer.setData("text", ev.target.id);
				ev.dataTransfer.dropEffect = "move";
				var posX = ev.clientX;
              	var posY = ev.clientY;
              	document.getElementById('diffX').value = posX - divX;
				document.getElementById('diffY').value = posY - divY;
				document.getElementById('latestComponent').value = compId.id;
				
				
				
				
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
			}
			
			function newBtn() {
				var count = document.getElementById('btnCount').value;
				count *= 1;
				if ( $("#button" + count).parent().attr('id') == $('#right').attr('id') ) {
					document.getElementById('btnCount').value = count + 1;
					return;
				} else {
					count = document.getElementById('btnCount').value;
					var str = '<button id="button' + count + '" class="button" class="draggable" draggable="true" ondragstart="drag(this, event)" user-select="none" tabindex="0">버튼' + count + '</button>';
					document.getElementById('right').innerHTML = document.getElementById('right').innerHTML + str;
				}
			}
			
			function newText() {
				var count = document.getElementById('textCount').value;
				count *= 1;
				if ( $("#text" + count).parent().attr('id') == $('#right').attr('id') ) {
					document.getElementById('textCount').value = count + 1;
					return;
				} else {
					count = document.getElementById('textCount').value;
					var str = '<div id="text' + count + '" class="text" class="draggable" rows="3" cols="28" draggable="true" ondragstart="drag(this, event)" tabindex="0" contenteditable="true">텍스트' + count + '</div>';
					document.getElementById('right').innerHTML = document.getElementById('right').innerHTML + str;
				}
			}
			
			function newImage() {
				var count = document.getElementById('imageCount').value;
				count *= 1;
				if ( $("#image" + count).parent().attr('id') == $('#right').attr('id') ) {
					document.getElementById('imageCount').value = count + 1;
					return;
				} else {
					count = document.getElementById('imageCount').value;
					var str = '<img id="image' + count + '" src="resources/img/preview.png" class="image" class="draggable" draggable="true" ondragstart="drag(this, event)" tabindex="0"></img>';
					document.getElementById('right').innerHTML = document.getElementById('right').innerHTML + str;
				}
			}
			
			function showmap(popup, id) {
				var parent = $("#" + id).attr("id");
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
			
			function showmap_text(popup, id) {
				var parent = $("#" + id).attr("id");
				document.getElementById("textName").value = parent;
				if($('#popup_text').css('visibility') == "hidden") {
					$('#popup_text').css('visibility', "visible");
					return false;
				}
				if($('#popup_text').css('visibility') == "visible") {
					$('#popup_text').css('visibility', "hidden");
					return false;
				}
			}
			
			function showmap_image(popup, id) {
				var parent = $("#" + id).attr("id");
				document.getElementById("imageName").value = parent;
				if($('#popup_image').css('visibility') == "hidden") {
					$('#popup_image').css('visibility', "visible");
					return false;
				}
				if($('#popup_image').css('visibility') == "visible") {
					$('#popup_image').css('visibility', "hidden");
					return false;
				}
			}
			
			function closemap(popup) {
				$('#popup').css('visibility', "hidden");
				return false;
			}
			
			function closemap_text(popup) {
				$('#popup_text').css('visibility', "hidden");
				return false;
			}
			function closemap_image(popup) {
				$('#popup_image').css('visibility', "hidden");
				return false;
			}
			
			function editBtn(btn) {
				var fontsize = $("#fontsize").val();
				
				var regNumber = /^[0-9]*$/;
				if(!regNumber.test(fontsize)) {
				    alert('글자크기는 숫자만 입력할 수 있습니다');
				    return false;
				}
				if(!regNumber.test(btnBorder)) {
				    alert('테두리 두께는 숫자만 입력할 수 있습니다');
				    return false;
				}
				
				fontsize *= 1;
				
				var color = "#" + $("#foo").val();
				var btnText = $("#btnText").val();
				var btnName = $("#btnName").val();
				var btnBorder = $("#btnBorder").val();
				var btnBorderColor = $("#btnBorderColor").val();
				var btnTextColor = $("#btnTextColor").val();
				
				$("#" + btnName).css("background", color);
				$("#" + btnName).css("color", "#" + btnTextColor);
				if (btnText != '' && fontsize != null) {
					$("#" + btnName).text(btnText);
				}
				if (btnBorder != '' && btnBorder != null) {
					$("#" + btnName).css("border", btnBorder + "px solid #" + btnBorderColor);
				}
				
				if (fontsize != '' && fontsize != null) {
					$("#" + btnName).css("font-size", fontsize + "px");
				}
				
				closemap();
			}
			
			function editText(btn) {
				var fontsize = $("#text_fontsize").val();
				
				var regNumber = /^[0-9]*$/;
				if(!regNumber.test(fontsize)) {
				    alert('글자크기는 숫자만 입력할 수 있습니다');
				    return false;
				}
				
				fontsize *= 1;
				
				var textName = $("#textName").val();
				var textColor = "#" + $("#text_textColor").val();
				var bgColor = "#" + $("#text_bgColor").val();
				var bdColor = "#" + $("#text_bdColor").val();
				$("#" + textName).css("color", textColor);
				$("#" + textName).css("background", bgColor);
				$("#" + textName).css("border", "1px solid " + bdColor);
				
				if (fontsize != '' && fontsize != null) {
					$("#" + textName).css("font-size", fontsize + "px");
				}
				
				closemap_text();
			}
			
			function editImage(btn) {
				var width = $("#image_width").val();
				var height = $("#image_height").val();
				var url = $("#image_url").val();
				var opacity = $("#image_opacity").val();
				
				var regNumber = /^[0-9]*$/;
				if(!regNumber.test(width)) {
				    alert('이미지 가로길이는 숫자만 입력할 수 있습니다');
				    return false;
				}
				var regNumber = /^[0-9]*$/;
				if(!regNumber.test(height)) {
				    alert('이미지 세로길이는 숫자만 입력할 수 있습니다');
				    return false;
				}
				var regNumber = /^[0-9]*$/;
				if(!regNumber.test(width)) {
				    alert('이미지 투명도는 0~9 사이의 숫자만 입력할 수 있습니다');
				    return false;
				}
				
				fontsize *= 1;
				
				var imageName = $("#imageName").val();
				
				if (width != '' && width != null) {
					$("#" + imageName).css("width", width + "px");
				}
				if (height != '' && height != null) {
					$("#" + imageName).css("height", height + "px");
				}
				if (opacity != '' && opacity != null) {
					$("#" + imageName).css("opacity", "0." + opacity)
				}
				if (url != '' && url != null) {
					$("#" + imageName).attr("src", url);
				}
				
				closemap_image();
			}
			function deleteComp(comp) {
				var del = $("#delItem").val();
				$("#" + del).remove();
				
				closemap();
				closemap_text();
				closemap_image();
				
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
		<a href="AnoticeList">공지사항 게시판 연결 </a>
		</div>
		
		<div id="left" class="left">
			<a href="javascript:newBtn()">버튼 추가</a><br><br>
			<a href="javascript:newText()">텍스트 추가</a><br><br>
			<a href="javascript:newImage()">이미지 추가</a>
		</div>
		<div id="right" class="right" ondrop="drop(event)" ondragover="allowDrop(event)">
			<%-- <jsp:include page="Aviews/Anotice/AnoticeList.jsp">
        		<jsp:param name="serverTime" value="${serverTime}"></jsp:param>
        	</jsp:include> --%>
			<input type="hidden" id="diffX">
			<input type="hidden" id="diffY">
			<input type="hidden" id="latestComponent">
			<input type="hidden" id="btnCount">
			<input type="hidden" id="textCount">
			<input type="hidden" id="imageCount">
			<input type="hidden" id="delItem">
		</div>
		
		
		<%-- <div class="footer">
			<jsp:include page="Aviews/footer.jsp">
        		<jsp:param name="serverTime" value="${serverTime}"></jsp:param>
        	</jsp:include>
		</div> --%>
		
		
		
		<div id="popup">
			<br>
			버튼 텍스트 : <input type="text" id="btnText"><br>
			버튼 색상 &emsp;: <input id="foo" class="jscolor jscolor-active" autocomplete="off" style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br>
			테두리 두께 : <input type="text" id="btnBorder"><br>
			테두리 색상 : <input id="btnBorderColor" class="jscolor jscolor-active" autocomplete="off" style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br>
			글자 크기 &emsp;: <input type="text" id="fontsize"><br>
			글자 색상 &emsp;: <input id="btnTextColor" class="jscolor jscolor-active" autocomplete="off" style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br>
			URL 　　　 : <input type="text" id="btnUrl"><br><br>
			<button class="editBtn" onclick="editBtn(this)">수정완료</button>&emsp;<button class="editBtn" id="delBtn" onclick="deleteComp()">삭제</button>&emsp;<button class="editBtn" onclick="closemap(popup)">닫기</button>
			<input type="hidden" id="btnName">
			<input type="hidden" id="editBtnName">
		</div>
		<div id="popup_text">
			<br>
			글자 크기 &emsp;: <input type="text" id="text_fontsize"><br><br>
			글자 색상 &emsp;: <input id="text_textColor" class="jscolor jscolor-active" autocomplete="off" style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br><br>
			배경 색상 &emsp;: <input id="text_bgColor" class="jscolor jscolor-active" autocomplete="off" style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br><br>
			테두리 색상 : <input id="text_bdColor" class="jscolor jscolor-active" autocomplete="off" style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br><br>
			<button class="editText" onclick="editText(this)">수정완료</button>&emsp;<button class="editText" id="delText" onclick="deleteComp()">삭제</button>&emsp;<button class="editText" onclick="closemap_text(popup)">닫기</button>
			<input type="hidden" id="textName">
			<input type="hidden" id="editTextName">
		</div>
		<div id="popup_image">
			<br>
			가로 크기 &emsp;: <input type="text" id="image_width"><br><br>
			세로 크기 &emsp;: <input type="text" id="image_height"><br><br>
			투명도 &nbsp;&emsp;&emsp;: <input type="text" id="image_opacity"><br><br>
			이미지 주소 : <input type="text" id="image_url"><br><br>
			<button class="editImage" onclick="editImage(this)">수정완료</button>&emsp;<button class="editImage" id="delImage" onclick="deleteComp()">삭제</button>&emsp;<button class="editImage" onclick="closemap_image(popup)">닫기</button>
			<input type="hidden" id="imageName">
		</div>
		


 
    
    
    
    
  </body>

</html>
 