<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html oncontextmenu="return false">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="/bigstar/resources/js/jquery-3.2.1.js"></script>
		<script src="/bigstar/resources/js/jscolor.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				page();
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
				var divY = obj.top;
				divY = Math.round(divY);
				
				ev.dataTransfer.setData("text", ev.target.id);
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
				
				var obj = $("#Bcenter");
				var divX = obj.offset().left;
				divX *= 1;
				var divWidth = obj.width();
				divWidth *= 1;
				
				
				var divY = obj.offset().top;
				divY *= 1;
				var divHeight = obj.height();
				divHeight *= 1;
				
				var btn = $("#" + document.getElementById("latestComponent").value);
				var btnX = btn.width();
				btnX *= 1;
				var btnY = btn.height();
				btnY *= 1;
				
              	var finalX = posX - diffX - 2;
              	var finalY = posY - diffY - 3;
				
				
				$("#" + document.getElementById("latestComponent").value).css("left", finalX);
				$("#" + document.getElementById("latestComponent").value).css("top", finalY);
				console.log(ev.clientX + "." + ev.clientY);
				console.log(finalX + "." + finalY);
			}
			
			function newBtn() {
				var count = document.getElementById('btnCount').value;
				count *= 1;
				if ( $("#button" + count).parent().attr('id') == $('#Bcenter').attr('id') ) {
					document.getElementById('btnCount').value = count + 1;
					return;
				} else {
					count = document.getElementById('btnCount').value;
					var str = '<button id="button' + count + '" class="button" class="draggable" draggable="true" ondragstart="drag(this, event)" style="left: 300px; top: 300px; border=1px solid black;" user-select="none" tabindex="0">버튼' + count + '</button>';
					document.getElementById('Bcenter').innerHTML = document.getElementById('Bcenter').innerHTML + str;
				}
			}
			
			function newText() {
				var count = document.getElementById('textCount').value;
				count *= 1;
				if ( $("#text" + count).parent().attr('id') == $('#Bcenter').attr('id') ) {
					document.getElementById('textCount').value = count + 1;
					return;
				} else {
					count = document.getElementById('textCount').value;
					var str = '<div id="text' + count + '" class="text" class="draggable" rows="3" cols="28" draggable="true" style="left: 300px; top: 300px; border= 1px solid black" ondragstart="drag(this, event)" tabindex="0" contenteditable="true">텍스트' + count + '</div>';
					document.getElementById('Bcenter').innerHTML = document.getElementById('Bcenter').innerHTML + str;
				}
			}
			
			function newImage() {
				var count = document.getElementById('imageCount').value;
				count *= 1;
				if ( $("#image" + count).parent().attr('id') == $('#Bcenter').attr('id') ) {
					document.getElementById('imageCount').value = count + 1;
					return;
				} else {
					count = document.getElementById('imageCount').value;
					var str = '<img id="image' + count + '" src="resources/img/preview.png" class="image" class="draggable" draggable="true" ondragstart="drag(this, event)" style="left: 300px; top: 300px; " tabindex="0"></img>';
					document.getElementById('Bcenter').innerHTML = document.getElementById('Bcenter').innerHTML + str;
				}
			}
			
			function showmap(popup, id) {
				var parent = $("#" + id).attr("id");
				document.getElementById("btnName").value = parent;
				
				var fontsize = $("#fontsize").val();
				var color = "#" + $("#foo").val();
				var btnText = $("#btnText").val();
				var btnName = $("#btnName").val();
				var btnBorder = $("#btnBorder").val();
				var btnBorderColor = $("#btnBorderColor").val();
				var btnTextColor = $("#btnTextColor").val();
				
				var reg = /[^0-9]/g;				
				$("#fontsize").val($("#" + parent).css("font-size").replace(reg,''));
				var temp_foo = $("#" + parent).css("background");
				
				var temp_foo_split;
				for (var i = 0; i < temp_foo.length; i++) {
					if (temp_foo.charAt(i) == ')') {
						temp_foo_split = temp_foo.substring(4,i);
					}
				}
				var foo_split = temp_foo_split.split(',');
				var temp1 = (foo_split[0] * 1).toString(16);
				if (temp1 < 10) {
					temp1 = "0" + temp1;
				}
				var temp2 = (foo_split[1] * 1).toString(16);
				if (temp2 < 10) {
					temp2 = "0" + temp2;
				}
				var temp3 = (foo_split[2] * 1).toString(16);
				if (temp3 < 10) {
					temp3 = "0" + temp3;
				}
				temp_foo = temp1 + temp2 + temp3;
				$("#foo").val(temp_foo);
				$("#btnText").val($("#" + parent).text());
				
				var temp_border = $("#" + parent).css("border");
				var temp_border_split_1, temp_border_split_2;
				for (var i = 0; i < temp_border.length; i++) {
					if (temp_border.charAt(i) == '(') {
						temp_border_split_1 = temp_border.substring(i,temp_border.length - 1);
					}
				}
				
				for (var i = 0; i < temp_border.length; i++) {
					if (temp_border.charAt(i) == ')') {
						temp_border_split_2 = temp_border_split_1.substring(1,i);
					}
				}
				
				var border_split = temp_border_split_2.split(',');
				var temp4 = (border_split[0] * 1).toString(16);
				if (temp4 < 10) {
					temp4 = "0" + temp4;
				}
				var temp5 = (border_split[1] * 1).toString(16);
				if (temp5 < 10) {
					temp5 = "0" + temp5;
				}
				var temp6 = (border_split[2] * 1).toString(16);
				if (temp6 < 10) {
					temp6 = "0" + temp6;
				}
				temp_border = temp4 + temp5 + temp6;
				$("#btnBorderColor").val(temp_border);
				
				temp_border = $("#" + parent).css("border");
				for (var i = 0; i < temp_border.length; i++) {
					if (temp_border.charAt(i) == 'p') {
						temp_border_split_1 = temp_border.substring(0, i);
					}
				}
				$("#btnBorder").val(temp_border_split_1);
				
				var temp_textColor = $("#" + parent).css("color");
				var temp_color = temp_textColor.substring(4, (temp_textColor.length - 1));
				var color_split = temp_color.split(',');
				var temp7 = (color_split[0] * 1).toString(16);
				if (temp7 < 10) {
					temp7 = "0" + temp7;
				}
				var temp8 = (color_split[1] * 1).toString(16);
				if (temp8 < 10) {
					temp8 = "0" + temp8;
				}
				var temp9 = (color_split[2] * 1).toString(16);
				if (temp9 < 10) {
					temp9 = "0" + temp9;
				}
				temp_color = temp7 + temp8 + temp9;
				$("#btnTextColor").val(temp_color);
				
				
				$("#url").val($("#" + parent).attr("onclick"));
				
				if($('#popup').css('visibility') == "hidden") {
					$('#popup_text').css('visibility', "hidden");
					$('#popup_image').css('visibility', "hidden");
					$('#popup').css('visibility', "visible");
					$('#mask').css('visibility', 'visible');
					return false;
				}
			}
			
			function showmap_text(popup, id) {
				var parent = $("#" + id).attr("id");
				document.getElementById("textName").value = parent;

				$("#text_text").val($("#" + parent).html());
				var reg = /[^0-9]/g;				
				$("#text_fontsize").val($("#" + parent).css("font-size").replace(reg,''));
				
				
				var temp_foo = $("#" + parent).css("background");
				
				var temp_foo_split;
				for (var i = 0; i < temp_foo.length; i++) {
					if (temp_foo.charAt(i) == ')') {
						temp_foo_split = temp_foo.substring(4,i);
					}
				}
				var foo_split = temp_foo_split.split(',');
				var temp1 = (foo_split[0] * 1).toString(16);
				if (temp1 < 10) {
					temp1 = "0" + temp1;
				}
				var temp2 = (foo_split[1] * 1).toString(16);
				if (temp2 < 10) {
					temp2 = "0" + temp2;
				}
				var temp3 = (foo_split[2] * 1).toString(16);
				if (temp3 < 10) {
					temp3 = "0" + temp3;
				}
				temp_foo = temp1 + temp2 + temp3;
				$("#text_bgColor").val(temp_foo);
				
				
				var temp_border = $("#" + parent).css("border");
				var temp_border_split_1, temp_border_split_2;
				for (var i = 0; i < temp_border.length; i++) {
					if (temp_border.charAt(i) == '(') {
						temp_border_split_1 = temp_border.substring(i,temp_border.length - 1);
					}
				}
				
				for (var i = 0; i < temp_border.length; i++) {
					if (temp_border.charAt(i) == ')') {
						temp_border_split_2 = temp_border_split_1.substring(1,i);
					}
				}
				
				var border_split = temp_border_split_2.split(',');
				var temp4 = (border_split[0] * 1).toString(16);
				var temp5 = (border_split[1] * 1).toString(16);
				var temp6 = (border_split[2] * 1).toString(16);
				if (temp4 < 10) {
					temp4 = "0" + temp4;
				}
				if (temp5 < 10) {
					temp5 = "0" + temp5;
				}
				if (temp6 < 10) {
					temp6 = "0" + temp6;
				}
				temp_border = temp4 + temp5 + temp6;
				$("#text_bdColor").val(temp_border);
				
				
				
				var temp_textColor = $("#" + parent).css("color");
				var temp_color = temp_textColor.substring(4, (temp_textColor.length - 1));
				var color_split = temp_color.split(',');
				var temp7 = (color_split[0] * 1).toString(16);
				if (temp7 < 10) {
					temp7 = "0" + temp7;
				}
				var temp8 = (color_split[1] * 1).toString(16);
				if (temp8 < 10) {
					temp8 = "0" + temp8;
				}
				var temp9 = (color_split[2] * 1).toString(16);
				if (temp9 < 10) {
					temp9 = "0" + temp9;
				}
				temp_color = temp7 + temp8 + temp9;
				$("#text_textColor").val(temp_color);
				
				
				if($('#popup_text').css('visibility') == "hidden") {
					$('#popup').css('visibility', "hidden");
					$('#popup_image').css('visibility', "hidden");
					$('#popup_text').css('visibility', "visible");
					$('#mask').css('visibility', 'visible');
					return false;
				}
			}
			
			function showmap_image(popup, id) {
				var parent = $("#" + id).attr("id");
				document.getElementById("imageName").value = parent;
				var reg = /[^0-9]/g;
				$("#image_width").val($("#" + parent).css("width").replace(reg, ''));
				$("#image_height").val($("#" + parent).css("height").replace(reg, ''));
				$("#image_url").val($("#" + parent).css("url"));
				
				
				if($('#popup_image').css('visibility') == "hidden") {
					$('#popup').css('visibility', "hidden");
					$('#popup_text').css('visibility', "hidden");
					$('#popup_image').css('visibility', "visible");
					$('#mask').css('visibility', 'visible');
					return false;
				}
			}
			
			function closemap(popup) {
				$('#mask').css('visibility', "hidden");
				$('#popup').css('visibility', "hidden");
				return false;
			}
			
			function closemap_text(popup) {
				$('#mask').css('visibility', "hidden");
				$('#popup_text').css('visibility', "hidden");
				return false;
			}
			function closemap_image(popup) {
				$('#mask').css('visibility', "hidden");
				$('#popup_image').css('visibility', "hidden");
				return false;
			}
			
			function editBtn(btn) {
				var fontsize = $("#fontsize").val();
				var color = "#" + $("#foo").val();
				var btnText = $("#btnText").val();
				var btnName = $("#btnName").val();
				var btnBorder = $("#btnBorder").val();
				var btnBorderColor = $("#btnBorderColor").val();
				var btnTextColor = $("#btnTextColor").val();
				var btnUrl = $("#btnUrl").val();
				
				
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
				
				$("#" + btnName).css("background", color);
				$("#" + btnName).css("color", "#" + btnTextColor);
				if (btnText != '' && fontsize != null) {
					$("#" + btnName).text(btnText);
				}
				if (btnBorder != '' && btnBorder != null) {
					$("#" + btnName).css("border", btnBorder + "px solid #" + btnBorderColor);
				}
				
				if (btnUrl != '' && btnUrl != null) {
					$("#" + btnName).attr("onclick", ("location.href='" + btnUrl + "'"));
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
				var text = $("#text_text").val();
				
				if (text != '' && text != null) {
					$("#" + textName).html(text);
				}
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
			
			function Bmm() {
				var str = '<ul>';
				str += '<li onclick="javascript:Bregist()" style="cursor: pointer;">회원가입 양식</li>';
				str += '<li onclick="javascript:Blogin()"  style="cursor: pointer;">로그인 양식</li>';
				str += '<li onclick="javascript:Bmypage()" style="cursor: pointer;">마이페이지 양식</li>';
				str += '<li onclick="javascript:Bmmback()" style="cursor: pointer;">뒤로가기</li>';
				str += '</ul>';
				$('#page_tool').html(str);
			}
			function Bregist() {
				$('#Bcenter').load('Bregist');
			}
			function Blogin() {
				$('#Bcenter').load('Blogin');
			}
			function Bmypage() {
				$('#Bcenter').load('Bmypage');
			}
			function Bmmback() {
				var str = '<ul>';
				str += '<li style="cursor: pointer;" onclick="javascript:Bmm()">회원관리</li>';
				str += '<li style="cursor: pointer;" onclick="javascript:Bsm()">사이트 관리</li>';
				str += '<li>매장관리</li>';
				str += '<li>배송 및 세금</li>';
				str += '<li>주문관리 및 결제관리</li>';
				str += '<li style="cursor: pointer;" onclick="javascript:Bpm()">페이지관리</li>';
				str += '</ul>';
				$('#page_tool').html(str);
			}
			
			function Bsm() {
				var str = '<ul>';
				str += '<li onclick="javascript:Bmainlist()" style="cursor: pointer;">상품리스트 관리</li>';
				str += '<li onclick="javascript:goBproductdetail()" style="cursor: pointer;">상품상페이지 관리</li>';
				str += '<li onclick="javascript:Bmmback()" style="cursor: pointer;">뒤로가기</li>';
				str +='</ul>';
				$('#page_tool').html(str);
			}
			
			function Bpm() {
				var str = '<ul>';
				str += '<li onclick="javascript:Bheader()" style="cursor: pointer;">Header관리</li>';
				str += '<li onclick="javascript:Bfooter()" style="cursor: pointer;">Footer관리</li>';
				str += '<li onclick="javascript:Bmmback()" style="cursor: pointer;">뒤로가기</li>';
				str +='</ul>';
				$('#page_tool').html(str);
			}
			
			function Bheader(){
				$('#Bcenter').load('BpageHeader');
			}
			
			function Bfooter(){
				$('#Bcenter').load('BpageFooter');
			}
			
			
			function Bmainlist() {
				$('#Bcenter').load('Bmainlist?rows=4');
			}
			
			function goBproductdetail() {
				$('#Bcenter').load('goBproductdetail');
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
				transition: 0.5s;
				transition-timing-function: linear;
			}
			#sidebar:HOVER {
				width: 150px;
				left: 0px;
				background: white;
				border: 1px solid black;
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
			.button {
				width: 200px; 
				height: 60px; 
				background: gray; 
				border-radius: 7px; 
				text-align: center; 
				position: absolute;
				border: 1px solid black;
				float: none;
				resize: both;
				overflow: hidden;
			}
			.text {
				position: absolute;
				width: 200px;
				height: 60px;
				background: #ffffff;
				border: 1px  solid black;
				border-radius: 7px;
				resize: both;
				overflow: hidden;
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
				left:35%;
				top:30%;
				visibility:hidden;
				width: 30%;
				height: 40%;
				background: #ffffff;
				border-radius: 10px;
				text-align: center;
				z-index: 1000;
			}
			#popup_text {
				position:absolute;
				left:35%;
				top:30%;
				visibility:hidden;
				width: 30%;
				height: 45%;
				background: #ffffff;
				border-radius: 10px;
				text-align: center;
				z-index: 1000;
			}
			#popup_image {
				position:absolute;
				left:35%;
				top:30%;
				visibility:hidden;
				width: 30%;
				height: 40%;
				background: #ffffff;
				border-radius: 10px;
				text-align: center;
				z-index: 1000;
			}
			
			.editBtn {
				width: 90px;
				height: auto;
				background: #ffffff;
				border: 1px solid #000000;
				border-radius: 7px;
			}
			
			.editText {
				width: 90px;
				height: auto;
				background: #ffffff;
				border: 1px solid #000000;
				border-radius: 7px;
			}
			
			.editImage {
				width: 90px;
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
			.Bcenter {
				text-align: center;
				width: 100%;
				height: 100%;
			}
			#mask {
            position:absolute;
            left:0;
            top:0;
            width: 100%;
            height: 100%;
            z-index:999;
            background-color:#000000;
			visibility: hidden;
			transition: 0.3s;
			opacity: 0.7;
		</style>
		<title>Shop Maker</title>
	
	</head>
	
	<body>
		
		<!-- 헤더 -->
		<header>
			<%@ include file="../Bheader.jsp" %>
		</header>

		
	
		
		
		
		<!-- 중앙 화면 -->
		<div id="Bcenter" class="Bcenter" ondrop="drop(event)" ondragover="allowDrop(event)">
			
		</div>
	
	<br><br><br><br><br>
		<div id="sidebar">
			<div id="component" onclick="javascript:component()">컴포넌트</div>
			<div id="page" onclick="javascript:page()">페이지</div>
			<div id="component_tool">
				<ul>
					<li style="cursor: pointer;" onclick="javascript:newBtn()">버튼 추가</li>
					<li style="cursor: pointer;" onclick="javascript:newText()">텍스트 추가</li>
					<li style="cursor: pointer;" onclick="javascript:newImage()">이미지 추가</li>
				
				</ul>
				<input type="hidden" id="diffX">
				<input type="hidden" id="diffY">
				<input type="hidden" id="latestComponent">
				<input type="hidden" id="btnCount">
				<input type="hidden" id="textCount">
				<input type="hidden" id="imageCount">
				<input type="hidden" id="delItem">
			</div>
				
			<div id="page_tool">
				<ul>
					<li style="cursor: pointer;" onclick="javascript:Bmm()">회원관리</li>
					<li style="cursor: pointer;" onclick="javascript:Bsm()">사이트 관리</li>
					<li>매장관리</li>
					<li>배송 및 세금</li>
					<li>주문관리 및 결제관리</li>
					<li style="cursor: pointer"; onclick="javascript:Bpm();">페이지관리</li>
				</ul>
			</div>
			<input type="hidden" id="selected">
		</div>
		
		
		
		
		
		
		
		
		
		
		
		<div id="mask"></div>
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
			텍스트  &nbsp;&emsp;&emsp;: <input type="text" id="text_text"><br><br>
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