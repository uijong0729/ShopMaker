<%@page import="org.apache.taglibs.standard.tag.common.xml.IfTag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html oncontextmenu="return false">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/bigstar/resources/css/sidebar.css?ver=0" />
<script src="/bigstar/resources/js/jquery-3.2.1.js"></script>
<script src="/bigstar/resources/js/jscolor.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var windowHeight = $(window).height();

		//탭 css변화
		$(".tabs").click(function() {
			$(".active").removeClass("active");
			$(this).addClass("active");
		});

		page();
		if ($('#btnCount').val() == '' || $('#btnCount').val() == null) {

		}
		document.getElementById('btnCount').value = 0;
		document.getElementById('textCount').value = 0;
		document.getElementById('imageCount').value = 0;
		//				document.getElementById('spinnerCount').value = 0;
		//				document.getElementById('optionCounter').value = 1;

		$('.forDeleteBtn').css("visibility", "visible");
		$('.forDisableDrag').addAttr("ondragstart", "drag(this, event)");
		$('.forDisableDrag').addAttr("draggable", "true");
		$('.text').addAttr("contenteditable", "true");
		$('.divSelectForDrag').css("background", "#ffffff");
		$('.imageForDrag').css("visibility", "visible");
		$('#pagename').val('BpageMain');
	});

	$(document).mousedown(
		function(e) {
			if (e.which == 3) {
				if ($(this.activeElement).attr("id").startsWith("button")) {
					showmap(popup, $(this.activeElement).attr("id"));
					$("#delItem").val($(this.activeElement).attr("id"));
				} else if ($(this.activeElement).attr("id").startsWith(
						"text")) {
					showmap_text(popup, $(this.activeElement).attr("id"));
					$("#delItem").val($(this.activeElement).attr("id"));
				} else if ($(this.activeElement).attr("id").startsWith(
						"image")) {
					showmap_image(popup, $(this.activeElement).attr("id"));
					$("#delItem").val($(this.activeElement).attr("id"));
				}/* else if ($(this.activeElement).attr("id").startsWith("select")) {
					showmap_select(popup, $(this.activeElement).attr("id"));
					$("#delItem").val($(this.activeElement).parent().attr("id"));
				}else if ($(this.activeElement).attr("id").startsWith("spinner")) {
					showmap_spinner(popup, $(this.activeElement).attr("id"));
					$("#delItem").val($(this.activeElement).attr("id"));
				} */else if ($(this.activeElement).attr("id") == "slide" || $(this.activeElement).attr("id").startsWith("img")) {
					showmap_slide(popup, $(this.activeElement).attr("id"));
				}

				else {
					return false;
				}
			}
		});

	$(function() {
		$('html').keydown(function(e) {
			var obj = $("#" + $(document.activeElement).attr("id"));
			var divVer = obj.offset().top;
			var divHor = obj.offset().left;
			var key = e.which;
			switch (key) {
				case 38:
					direction = "up";
					var divUp = divVer - 1;
					$("#" + $(document.activeElement).attr("id")).offset({
						top : divUp
					});
					break;
				case 37:
					direction = 'left';
					var divLeft = divHor - 1;
					$("#" + $(document.activeElement).attr("id")).offset({
						left : divLeft
					});
					break;
				case 39:
					direction = 'right';
					var divRight = divHor + 1;
					$("#" + $(document.activeElement).attr("id")).offset({
						left : divRight
					});
					break;
				case 40:
					direction = 'down';
					var divDown = divVer + 1;
					$("#" + $(document.activeElement).attr("id")).offset({
						top : divDown
					});
					break;
				default:
					direction = 'none';
					break;
			}
		});
	});
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
		
	}
			
	function newBtn() {
		var count = document.getElementById('btnCount').value;
		count *= 1;
		if ( $("#button" + count).parent().attr('id') == $('#Bcenter').attr('id') ) {
			document.getElementById('btnCount').value = count + 1;
			return;
		} else {
			count = document.getElementById('btnCount').value;
			count *= 1;
			if ($('#pagename').val() == 'Bheader' || $('#pagename').val() == 'Bfooter') {
				var str = '<button id="button' + count + $('#pagename').val() + '" class="button forDisableDrag customButton" draggable="true" ondragstart="drag(this, event)" tabindex="0" user-select="none" >버튼' + count + '</button>';
			} else {
				var str = '<button id="button' + count + 'Bmiddle" class="button forDisableDrag customButton" draggable="true" ondragstart="drag(this, event)" tabindex="0" user-select="none" >버튼' + count + '</button>';
			}
			
			document.getElementById('Bcenter').innerHTML = document.getElementById('Bcenter').innerHTML + str;
			document.getElementById('btnCount').value = count + 1;
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
			count *= 1;
			if ($('#pagename').val() == 'Bheader' || $('#pagename').val() == Bfooter) {
				var str = '<div id="text' + count + $('#pagename').val() + '" class="text forDisableDrag customText" rows="2" cols="20" draggable="true" ondragstart="drag(this, event)" style="left: 200px; top:200px; position: absolute; width: 200px; height: 60px; background: rgbs(f,f,f,1); resize: both; overflow: hidden;" tabindex="0" contenteditable="true">텍스트' + count + '</div>';
			} else {
				var str = '<div id="text' + count + 'Bmiddle" class="text forDisableDrag customText" rows="2" cols="20" draggable="true" ondragstart="drag(this, event)" style="left: 200px; top:200px; position: absolute; width: 200px; height: 60px; background: rgbs(f,f,f,1); resize: both; overflow: hidden;" tabindex="0" contenteditable="true">텍스트' + count + '</div>';
			}
			document.getElementById('Bcenter').innerHTML = document.getElementById('Bcenter').innerHTML + str;
			document.getElementById('textCount').value = count + 1;
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
			count *= 1;
			if ($('#pagename').val() == 'Bheader' || $('#pagename').val() == 'Bfooter') {
				var str = '<img id="image' + count + $('#pagename').val() + '" src="resources/img/preview.png" class="image forDisableDrag customImage" draggable="true" ondragstart="drag(this, event)" style="left:200px; top:200px; width: 60px; height: 60px; position: absolute; resize: both; overflow: hidden;" tabindex="0"></img>';
			} else {
				var str = '<img id="image' + count + 'Bmiddle" src="resources/img/preview.png" class="image forDisableDrag customImage" draggable="true" ondragstart="drag(this, event)" style="left:200px; top:200px; width: 60px; height: 60px; position: absolute; resize: both; overflow: hidden;" tabindex="0"></img>';
			}
			
			document.getElementById('Bcenter').innerHTML = document.getElementById('Bcenter').innerHTML + str;
			document.getElementById('imageCount').value = count + 1;
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
		var temp_color = temp_textColor.substring(4,
				(temp_textColor.length - 1));
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

		if ($('#popup').css('visibility') == "hidden") {
			$('#popup_text').css('visibility', "hidden");
			$('#popup_image').css('visibility', "hidden");
			//					$('#popup_select').css('visibility', "hidden");
			//					$('#popup_spinner').css('visibility', "hidden");
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
		$("#text_fontsize").val(
				$("#" + parent).css("font-size").replace(reg, ''));

		var temp_foo = $("#" + parent).css("background");

		var temp_foo_split;
		for (var i = 0; i < temp_foo.length; i++) {
			if (temp_foo.charAt(i) == ')') {
				temp_foo_split = temp_foo.substring(4, i);
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
				temp_border_split_1 = temp_border.substring(i,
						temp_border.length - 1);
			}
		}

		for (var i = 0; i < temp_border.length; i++) {
			if (temp_border.charAt(i) == ')') {
				temp_border_split_2 = temp_border_split_1.substring(1, i);
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
		var temp_color = temp_textColor.substring(4,
				(temp_textColor.length - 1));
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

		if ($('#popup_text').css('visibility') == "hidden") {
			$('#popup').css('visibility', "hidden");
			$('#popup_image').css('visibility', "hidden");
			//					$('#popup_select').css('visibility', "hidden");
			//					$('#popup_spinner').css('visibility', "hidden");
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

		if ($('#popup_image').css('visibility') == "hidden") {
			$('#popup').css('visibility', "hidden");
			$('#popup_text').css('visibility', "hidden");
			//					$('#popup_select').css('visibility', "hidden");
			//					$('#popup_spinner').css('visibility', "hidden");
			$('#popup_image').css('visibility', "visible");
			$('#mask').css('visibility', 'visible');
			return false;
		}
	}

	/* function showmap_select(popup, id) {
		var parent = $("#" + id).attr("id");
		document.getElementById("selectName").value = parent;
		var reg = /[^0-9]/g;
		$("#select_width").val($("#" + parent).css("width").replace(reg, ''));
		$("#select_height").val($("#" + parent).css("height").replace(reg, ''));
		$("#select_fontsize").val($("#" + parent).css("font-size").replace(reg,''));
		
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
		$("#select_textColor").val(temp_color);
		
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
		$("#select_bgColor").val(temp_foo);
		
		
		
		if($('#popup_image').css('visibility') == "hidden") {
			$('#popup').css('visibility', "hidden");
			$('#popup_text').css('visibility', "hidden");
			$('#popup_image').css('visibility', "hidden");
			$('#popup_spinner').css('visibility', "hidden");
			$('#popup_select').css('visibility', "visible");
			$('#mask').css('visibility', 'visible');
			return false;
		}
	} */

	/* function showmap_spinner(popup, id) {
		var parent = $("#" + id).attr("id");
		document.getElementById("spinnerName").value = parent;
		var reg = /[^0-9]/g;
		$("#spinner_width").val($("#" + parent).css("width").replace(reg, ''));
		$("#spinner_height").val($("#" + parent).css("height").replace(reg, ''));
		$("#spinner_fontsize").val($("#" + parent).css("font-size").replace(reg,''));
		
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
		$("#spinner_textColor").val(temp_color);
		
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
		$("#spinner_bgColor").val(temp_foo);
		
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
		$("#spinner_bdColor").val(temp_border);
		
		
		
		if($('#popup_image').css('visibility') == "hidden") {
			$('#popup').css('visibility', "hidden");
			$('#popup_text').css('visibility', "hidden");
			$('#popup_image').css('visibility', "hidden");
			$('#popup_select').css('visibility', "hidden");
			$('#popup_spinner').css('visibility', "visible");
			$('#mask').css('visibility', 'visible');
			return false;
		}
	} */

	function showmap_slide(popup, id) {
		$('#popup_slide').css('visibility', "visible");
		$('#mask').css('visibility', 'visible');
		return false;
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
	/* function closemap_select(popup) {
		$('#mask').css('visibility', "hidden");
		$('#popup_select').css('visibility', "hidden");
		return false;
	}
	function closemap_spinner(popup) {
		$('#mask').css('visibility', "hidden");
		$('#popup_spinner').css('visibility', "hidden");
		return false;
	} */
	function closemap_slide() {
		$('#popup_slide').css('visibility', 'hidden');
		$('#mask').css('visibility', 'hidden');
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
		if (!regNumber.test(fontsize)) {
			alert('글자크기는 숫자만 입력할 수 있습니다');
			return false;
		}
		if (!regNumber.test(btnBorder)) {
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
			$("#" + btnName).css("border",
					btnBorder + "px solid #" + btnBorderColor);
		}

		if (btnUrl != '' && btnUrl != null) {
			if (btnUrl.startsWith("http") || btnUrl.startsWith("www")) {
				$("#" + btnName).attr("onclick",
						"location.href='" + btnUrl + "'");
			} else {
				$("#" + btnName).attr("onclick", "movePage('" + btnUrl + "')");
			}

		}

		if (fontsize != '' && fontsize != null) {
			$("#" + btnName).css("font-size", fontsize + "px");
		}

		closemap();
	}

	function movePage(url) {

		$('#Bcenter').load(url);
	}

	function editText(btn) {
		var fontsize = $("#text_fontsize").val();

		var regNumber = /^[0-9]*$/;
		if (!regNumber.test(fontsize)) {
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
		if (!regNumber.test(width)) {
			alert('이미지 가로길이는 숫자만 입력할 수 있습니다');
			return false;
		}
		var regNumber = /^[0-9]*$/;
		if (!regNumber.test(height)) {
			alert('이미지 세로길이는 숫자만 입력할 수 있습니다');
			return false;
		}
		var regNumber = /^[0-9]*$/;
		if (!regNumber.test(width)) {
			alert('이미지 투명도는 0~9 사이의 숫자만 입력할 수 있습니다');
			return false;
		}

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

	/* function editSelect(btn) {
		var width = $("#select_width").val();
		var height = $("#select_height").val();
		var fontsize = $("#select_fontsize").val();
		var textColor = "#" + $("#select_textColor").val();
		var bgColor = "#" + $("#select_bgColor").val();
		
		var regNumber = /^[0-9]*$/;
		if(!regNumber.test(width)) {
		    alert('가로길이는 숫자만 입력할 수 있습니다');
		    return false;
		}
		var regNumber = /^[0-9]*$/;
		if(!regNumber.test(height)) {
		    alert('세로길이는 숫자만 입력할 수 있습니다');
		    return false;
		}
		var regNumber = /^[0-9]*$/;
		if(!regNumber.test(fontsize)) {
		    alert('글자크기는 숫자만 입력할 수 있습니다');
		    return false;
		}
		
		var selectName = $("#selectName").val();
		
		if (width != '' && width != null) {
			$("#" + selectName).css("width", width + "px");
		}
		if (height != '' && height != null) {
			$("#" + selectName).css("height", height + "px");
		}
		var reg = /[^0-9]/g;
		var handlerName = 'dragHandle' + selectName.replace(reg,'');
		width = width.replace(reg,'');
		height = height.replace(reg, '');
		width *= 1;
		height *= 1;
		width += height;
		$('#' + handlerName).css("margin-left", (width - height) + "px");
		$('#' + handlerName).css("width", height + "px");
		$('#' + handlerName).css("height", height + "px");
		
		if (fontsize != '' && fontsize != null) {
			$("#" + selectName).css("font-size", fontsize + "px");
		}
		if (textColor != '' && textColor != null) {
			$("#" + selectName).css("color", textColor);
		}
		if (bgColor != '' && bgColor != null) {
			$("#" + selectName).css("background", bgColor);
		}
		
		closemap_select();
	}
	
	function editSpinner(btn) {
		var width = $("#spinner_width").val();
		var height = $("#spinner_height").val();
		var fontsize = $("#spinner_fontsize").val();
		var textColor = "#" + $("#spinner_textColor").val();
		var bdColor = "#" + $("#spinner_bdColor").val();
		var bgColor = "#" + $("#spinner_bgColor").val();
		
		var regNumber = /^[0-9]*$/;
		if(!regNumber.test(width)) {
		    alert('가로길이는 숫자만 입력할 수 있습니다');
		    return false;
		}
		var regNumber = /^[0-9]*$/;
		if(!regNumber.test(height)) {
		    alert('세로길이는 숫자만 입력할 수 있습니다');
		    return false;
		}
		var regNumber = /^[0-9]*$/;
		if(!regNumber.test(fontsize)) {
		    alert('글자크기는 숫자만 입력할 수 있습니다');
		    return false;
		}
		
		var spinnerName = $("#spinnerName").val();
		
		if (width != '' && width != null) {
			$("#" + spinnerName).css("width", width + "px");
		}
		if (height != '' && height != null) {
			$("#" + spinnerName).css("height", height + "px");
		}
		var reg = /[^0-9]/g;
		
		if (fontsize != '' && fontsize != null) {
			$("#" + spinnerName).css("font-size", fontsize + "px");
		}
		if (textColor != '' && textColor != null) {
			$("#" + spinnerName).css("color", textColor);
		}
		if (bgColor != '' && bgColor != null) {
			$("#" + spinnerName).css("background", bgColor);
		}
		if (bdColor != '' && bdColor != null) {
			$("#" + spinnerName).css("border", "1px solid " + bdColor);
		}
		
		var width = $('#' + spinnerName).css("width");
		width = width.replace(reg, '');
		width *= 1;
		var height = $('#' + spinnerName).css("height");
		height = height.replace(reg, '');
		height *= 0.5;
		var num = $('#' + spinnerName).attr("id").substring(7, $('#' + spinnerName).attr("id").length); 
		$('#number' + num).css("height", (height * 0.8) + "px");
		$('#number' + num).css("margin-top", (height * 0.6) + "px");
		$('#numberUp' + num).css("margin-left", (width - height));
		$('#numberUp' + num).css("width", height);
		$('#numberUp' + num).css("height", height);
		$('#numberDown' + num).css("margin-left", (width - height));
		$('#numberDown' + num).css("margin-top", height);
		$('#numberDown' + num).css("width", height);
		$('#numberDown' + num).css("height", height);
		
		closemap_spinner();
	} */

	function addOption() {
		var option = $('#optionCounter').val();
		if ($('#select_option' + option).length) {
		} else {
			for (var i = 0; i < 10; i++) {
				if ($('#select_option' + i).length) {
					continue;
				} else {
					$('#optionCounter').val(i);
				}
			}
		}
		var str = '선택 옵션  &emsp;: ';
		str += '<input type="text" id="select_option' + option + '">';
		str += '<button onclick="javascript:addOption()">추가</button>';
		str += '<button id="delOption' + option
				+ '" onclick="javascript:delOption(this)">삭제</button><br>';
		option *= 1;
		$('#optionCounter').val(option + 1);
		$(divForOption).html($(divForOption).html() + str);
	}

	function deleteComp(comp) {
		var del = $("#delItem").val();
		$("#" + del).remove();

		closemap();
		closemap_text();
		closemap_image();
		//				closemap_select();
		//				closemap_spinner();

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

	function changeBg() {
		$('#changeBg').css("visibility", "visible");
		$('#mask').css('visibility', 'visible');
		$('.changeA').css("visibility", "hidden");
		$('.changeB').css("visibility", "hidden");
		$('#default').click();
	}

	function changeBgColor() {
		$('.changeA').css("visibility", "visible");
		$('.changeB').css("visibility", "hidden");
	}
	function changeBgImage() {
		$('.changeA').css("visibility", "hidden");
		$('.changeB').css("visibility", "visible");
	}
	function changeSubmit() {
		var bgcolor = '#' + $('#backgroundColor').val();
		$('#Bcenter').css("background", bgcolor);
		$('#changeBg').css("visibility", "hidden");
		$('#mask').css('visibility', 'hidden');
		$('.changeA').css("visibility", "hidden");
		$('.changeB').css("visibility", "hidden");
	}
	function changeImageSubmit() {
		var uri = 'url("' + $('#bgUrl').val() + '")';
		var width = $(document).width();
		var height = $(document).height();
		$('#Bcenter').css("background-image", uri);
		$('#Bcenter').css("background-repeat", "no-repeat");
		$('#Bcenter').css("background-size", width + "px " + height + "px");
		$('#Bcenter').css("background-attachment", "fixed");
		$('#changeBg').css("visibility", "hidden");
		$('#mask').css('visibility', 'hidden');
		$('.changeA').css("visibility", "hidden");
		$('.changeB').css("visibility", "hidden");
	}
	function changeCancle() {
		$('#changeBg').css("visibility", "hidden");
		$('#mask').css('visibility', 'hidden');
		$('.changeA').css("visibility", "hidden");
		$('.changeB').css("visibility", "hidden");
	}

	function changeSlide() {
		if ($('#slide_first').val() != '' || $('#slide_first').val() != null) {
			$('#img1').attr('src', $('#slide_first').val());
		}
		if ($('#slide_second').val() != '' || $('#slide_second').val() != null) {
			$('#img2').attr('src', $('#slide_second').val());
		}
		if ($('#slide_third').val() != '' || $('#slide_third').val() != null) {
			$('#img3').attr('src', $('#slide_third').val());
		}
		if ($('#slide_fourth').val() != '' || $('#slide_fourth').val() != null) {
			$('#img4').attr('src', $('#slide_fourth').val());
		}
		$('#mask').css('visibility', 'hidden');
		$('#popup_slide').css('visibility', 'hidden');
	}

	function Bmm() {
		var str = '<ul>';
		str += '<li class="side" onclick="javascript:Bregist()" style="cursor: pointer; user-select: none;">회원가입</li>';
		str += '<li class="side" onclick="javascript:Blogin()"  style="cursor: pointer; user-select: none;">로그인</li>';
		str += '<li class="side" onclick="javascript:Bmypage()" style="cursor: pointer; user-select: none;">마이페이지</li>';
		str += '<li class="side" onclick="javascript:BmemberListPage()" style="cursor: pointer; user-select: none;">회원 리스트</li>';
		str += '<li class="side back" onclick="javascript:Bmmback()" style="cursor: pointer; user-select: none;">뒤로가기</li>';
		str += '</ul>';

		$('#page_tool').html(str);
	}
	function Bregist() {
		$('#pagename').val('Bregist');
		$('#Bcenter').load('Bregist');
		$('#Bcenter').css("background", "");
	}
	function Blogin() {
		$('#pagename').val('Blogin');
		$('#Bcenter').load('Blogin');
		$('#Bcenter').css("background", "");
	}
	function Bmypage() {
		$('#pagename').val('Bmypage');
		$('#Bcenter').load('Bmypage');
		$('#Bcenter').css("background", "");
	}
	function BmemberListPage() {
		$('#pagename').val('BmemberListPage');
		$('#Bcenter').load('BmemberListPage?membercode=${Amember.membercode}');
		$('#Bcenter').css("background", "");
	}
	function Bmmback() {
		var str = '<ul>';
		str += '<li class="side" style="cursor: pointer; user-select: none;" onclick="javascript:Bmm()">회원관리</li>';
		str += '<li class="side" style="cursor: pointer; user-select: none;" onclick="javasdcript:Bsm()">사이트 관리</li>';
		str += '<li class="side" style="curosr: pointer; user-select: none;" onclick="javascript:Bsa()">경영통계</li>';
		str += '<li class="side">배송 및 세금</li>';
		str += '<li class="side">주문관리</li>';
		str += '<li class="side">결제관리</li>';
		str += '<li class="side" style="cursor: pointer;" onclick="javascript:Bpm()">페이지관리</li>';
		str += '</ul>';
		$('#page_tool').html(str);
	}
	function Bsm() {
		var str = '<ul>';
		str += '<li class="side" onclick="javascript:Bnoticelist()" style="cursor: pointer; user-select: none;">공지사항</li>';
		str += '<li class="side" onclick="javascript:Bmainlist()" style="cursor: pointer; user-select: none;">상품리스트</li>';
		str += '<li class="side" onclick="javascript:goBproductdetail()" style="cursor: pointer; user-select: none;">상품상세</li>';
		str += '<li class="side" onclick="javascript:goBproductinsert()" style="cursor: pointer; user-select: none;">상품추가삭제</li>';
		str += '<li class="side back" onclick="javascript:Bmmback()" style="cursor: pointer; user-select: none;">뒤로가기</li>';
		str += '</ul>';
		$('#page_tool').html(str);
	}

	function Bpm() {
		var str = '<ul>';
		str += '<li class="side" onclick="javascript:Bheader()" style="cursor: pointer; user-select: none;">Header관리</li>';
		str += '<li class="side" onclick="javascript:Bfooter()" style="cursor: pointer; user-select: none;">Footer관리</li>';
		str += '<li class="side" onclick="javascript:Bmain()" style="cursor: pointer; user-select: none;">Bmain</li>';
		str += '<li class="side back" onclick="javascript:Bmmback()" style="cursor: pointer; user-select: none;">뒤로가기</li>';
		str += '</ul>';
		$('#page_tool').html(str);
	}

	//통계 및 분석 링크
	function Bsa() {
		var str = '<ul>';
		str += '<li class="side" onclick="javascript:Bsale()" style="cursor: pointer; user-select: none;">매출관리</li>';
		str += '<li class="side" onclick="javascript:Bcustomer()" style="cursor: pointer; user-select: none;">고객관리</li>';
		str += '<li class="side back" onclick="javascript:Bmmback()" style="cursor: pointer; user-select: none;">뒤로가기</li>';
		str += '</ul>';
		$('#page_tool').html(str);
	}

	//매출관리 링크
	function Bsale() {
		$('#pagename').val('BsaleChart');
		$('#pagename').val('BsaleChart');
		$('#Bcenter').load('BsaleChart');
	}

	//고객관리 링크
	function Bcustomer() {

		$('#pagename').val('BcustomerChart');
		$('#Bcenter').load('BcustomerChart');

	}

	function Bheader() {
		$('#pagename').val('Bheader');
		$('#Bcenter').load('Bheader');
	}

	function Bfooter() {
		$('#pagename').val('Bfooter');
		$('#Bcenter').load('Bfooter');
	}

	function Bnoticelist() {
		$('#pagename').val('Bnoticelist');
		$('#Bcenter').load('Bnoticelist');
	}

	function Bmain() {
		$('#pagename').val('BpageMain');
		$('#Bcenter').load('BpageMain');
	}

	function Bmainlist() {
		$('#pagename').val('Bmainlist');
		$('#Bcenter').load('Bmainlist?rows=4');
	}

	function goBproductdetail() {
		$('#pagename').val('Bproductdetail');
		$('#Bcenter').load('goBproductdetail?productname=fake&productcode=0');
	}
	function goBproductinsert() {
		$('#pagename').val('Bproductinsert');
		$('#Bcenter').load('goBproductinsert');
	}
	function Bsavepage() {
		alert("저장");

		$('.forDeleteBtn').css("visibility", "hidden");
		$('.forDeleteDiv').css("visibility", "hidden");

		$('#Bcenter').find('[tabindex=0]').removeAttr("tabindex");
		$('.forDisableDrag').removeAttr("ondragstart");
		$('.forDisableDrag').removeAttr("draggable");
		$('.text').removeAttr("contenteditable");
		$('.divSelectForDrag').css("background", "#00000000");
		$('.imageForDrag').css("visibility", "hidden");
		$('.button').css("resize", "none");
		$('.text').css("resize", "none");
		$('.image').css("resize", "none");

		$('#savepage').val($('#BcenterOuter').html());
		$('#savepagefrm').submit();
	}

	function Bloadpage() {
		alert("네트워크 환경이 좋지 않습니다.");
		location.href = "loadpage?pageinfo=" + $
		{
			Amember.membercode
		}
		+$('#pagename').val();

	}
</script>
<style type="text/css">
body {
	width: 100%;
	height: 100%;
}

.textalign {
	text-align: center;
}

/* #popup_select {
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
			#popup_spinner {
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
			} */
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
}

#mask {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	z-index: 999;
	background-color: #000000;
	visibility: hidden;
	opacity: 0.7;
}

</style>
<title>Shop Maker</title>

</head>

<body>

	<!-- 헤더 -->
	<header style="margin-bottom: 150px;">
		<%@ include file="../../Bheader.jsp"%>
	</header>




	<!-- 중앙 화면 -->
	<div id="BcenterOuter">
		<div id="Bcenter" class="Bcenter" ondrop="drop(event)"
			ondragover="allowDrop(event)"
			style="width: 100%; margin-top: 100px; overflow-y: auto;">
			<c:if test="${result != ''}">
					${result}
				</c:if>
			<c:if test="${result == null}">
				<%@ include file="./BpageMain.jsp"%>
			</c:if>
		</div>
	</div>

	<!-- 로그인 안하면 컴포넌트가 안뜹니다  -->
	<c:if test="${Amember != null }">

		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="sidebarsonomono" id="sidebar"
			style="margin-top: 30px; border-radius: 10px;">
			<div class="tabs" id="component" onclick="javascript:component()">뷰</div>
			<div class="tabs active" id="page" onclick="javascript:page()">모델</div>
			<div class="toolbody" style="border-radius: 2px;" id="component_tool">
				<ul>
					<li class="side" style="cursor: pointer; user-select: none;"
						onclick="javascript:newBtn()">버튼 추가</li>
					<li class="side" style="cursor: pointer; user-select: none;"
						onclick="javascript:newText()">텍스트 추가</li>
					<li class="side" style="cursor: pointer; user-select: none;"
						onclick="javascript:newImage()">이미지 추가</li>

					<!-- <li class="side" style="cursor: pointer; user-select: none;" onclick="javascript:newSelect()">셀렉트</li>
					<li class="side" style="cursor: pointer; user-select: none;" onclick="javascript:newSpinner()">스피너 추가</li> -->

					<li class="side" style="cursor: pointer; user-select: none;"
						onclick="javascript:changeBg()">배경설정</li>
				</ul>
				<input type="hidden" id="diffX"> <input type="hidden"
					id="diffY"> <input type="hidden" id="latestComponent">
				<input type="hidden" id="btnCount"> <input type="hidden"
					id="textCount"> <input type="hidden" id="imageCount">
				<!-- <input type="hidden" id="selectCount">
				<input type="hidden" id="spinnerCount"> -->
				<input type="hidden" id="delItem">
			</div>

			<div class="toolbody" id="page_tool">
				<ul>
					<li class="side" style="cursor: pointer; user-select: none;"
						onclick="javascript:Bmm()">회원관리</li>
					<li class="side" style="cursor: pointer; user-select: none;"
						onclick="javascript:Bsm()">사이트 관리</li>
					<li class="side" style="curosr: pointer; user-select: none;"
						onclick="javascript:Bsa()">경영통계</li>
					<li class="side" style="cursor: pointer; user-select: none;">배송
						및 세금</li>
					<li class="side" style="cursor: pointer; user-select: none;">주문관리</li>
					<li class="side" style="cursor: pointer; user-select: none;"
						onclick="javascript:Bpm()">페이지관리</li>
				</ul>
			</div>
			<input type="hidden" id="selected">
		</div>

	</c:if>








	<div id="mask"></div>

	<div id="popup" class="popup Bheight"
		style="height: 432px;">
		<h5 class="mp editHeader" style="font: bold;">버튼 편집</h5>
		<table class="mp" style="margin-left: 70px">
			<tr>
				<th class="mp th-euj2">버튼 텍스트</th>
				<td class="mp"><input type="text" id="btnText"></td>
			</tr>
			<tr>
				<th class="mp th th-euj2">버튼 색상</th>
				<td class="mp"><input id="foo" class="jscolor jscolor-active"
					autocomplete="off"
					style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"></td>
			</tr>
			<tr>
				<th class="mp th th-euj2">테두리 두께</th>
				<td class="mp"><input type="text" id="btnBorder"></td>
			</tr>
			<tr>
				<th class="mp th th-euj2">테두리 색상</th>
				<td class="mp"><input id="btnBorderColor"
					class="jscolor jscolor-active" autocomplete="off"
					style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"></td>
			</tr>
			<tr>
				<th class="mp th th-euj2">글자 크기</th>
				<td class="mp"><input type="text" id="fontsize"></td>
			</tr>
			<tr>
				<th class="mp th th-euj2">글자 색상</th>
				<td class="mp"><input id="btnTextColor"
					class="jscolor jscolor-active" autocomplete="off"
					style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"></td>
			</tr>
			<tr>
				<th class="mp th-euj2">URL</th>
				<!-- 	<td class="mp"><input type="text" id="btnUrl"></td> -->
				<td class="mp"><select id="btnUrl">
						<option id="selecturl" value="">선택</option>
						<option value="goMyShop?code=37&page=BpageMain">메인 페이지</option>
						<option value="goMyShop?code=37&page=Bregist">회원가입 페이지</option>
						<option value="goMyShop?code=37&page=Blogin">로그인 페이지</option>
						<option value="mypage">마이 페이지</option>
						<option value="notice">공지사항 페이지</option>
						<option value="productdetail">상품상세 페이지</option>
						<option value="order">주문 페이지</option>
						<option value="cart">장바구니 페이지</option>
						<option value="insreview">후기등록 페이지</option>

				</select></td>
			</tr>
		</table>

		<button class="editBtn" onclick="editBtn(this)">수정완료</button>
		<button class="editBtn" id="delBtn" onclick="deleteComp()">삭제</button>
		<button class="editBtn" onclick="closemap(popup)">닫기</button>

		<input type="hidden" id="btnName"> <input type="hidden"
			id="editBtnName">
	</div>

	<div id="popup_text" class="popup Theight">
		<h5 class="mp editHeader" style="font: bold;">텍스트 편집</h5>
		<table class="mp" class="popup" style="margin-left: 70px">
			<tr>
				<th class="mp th-euj2">텍스트</th>
				<td class="mp"><input type="text" id="text_text"></td>
			</tr>
			<tr>
				<th class="mp th-euj2">글자 크기</th>
				<td class="mp"><input type="text" id="text_fontsize"></td>
			</tr>
			<tr>
				<th class="mp th-euj2">글자 색상</th>
				<td class="mp"><input id="text_textColor"
					class="jscolor jscolor-active" autocomplete="off"
					style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"></td>
			</tr>
			<tr>
				<th class="mp th-euj2">배경 색상</th>
				<td class="mp"><input id="text_bgColor"
					class="jscolor jscolor-active" autocomplete="off"
					style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"></td>
			</tr>
			<tr>
				<th class="mp th-euj2">테두리 색상</th>
				<td class="mp"><input id="text_bdColor"
					class="jscolor jscolor-active" autocomplete="off"
					style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"></td>
			</tr>
		</table>

		<button class="editBtn" onclick="editText(this)">수정완료</button>
		<button class="editBtn" id="delText" onclick="deleteComp()">삭제</button>
		<button class="editBtn" onclick="closemap_text(popup)">닫기</button>

		<input type="hidden" id="textName"> <input type="hidden"
			id="editTextName">
	</div>


	<div class="popup Iheight" id="popup_image" style="padding-left: 75px">
		<h5 class="mp editHeader" style="margin-right: 60px;">이미지 편집</h5>
		<table>
			<tr>
				<th class="mp th-euj2">가로 크기</th>
				<td class="mp"><input type="text" id="image_width"></td>
			</tr>
			<tr>
				<th class="mp th-euj2">세로 크기</th>
				<td class="mp"><input type="text" id="image_height"></td>
			</tr>
			<tr>
				<th class="mp th-euj2">투명도</th>
				<td class="mp"><input type="text" id="image_opacity"></td>
			</tr>
			<tr>
				<th class="mp th-euj2">이미지 주소</th>
				<td class="mp"><input type="text" id="image_url"></td>
			</tr>
		</table>
		<button class="editBtn" onclick="editImage(this)">수정완료</button>
		<button class="editBtn" id="delImage" onclick="deleteComp()">삭제</button>
		<button class="editBtn" onclick="closemap_image(popup)"
			style="margin-right: 90px;">닫기</button>

		<input type="hidden" id="imageName">
	</div>



	<!-- <div id="popup_select">
			<br>
			가로 크기 &emsp;: <input type="text" id="select_width"><br>
			세로 크기 &emsp;: <input type="text" id="select_height"><br>
			글자 크기 &emsp;: <input type="text" id="select_fontsize"><br>
			글자 색상 &emsp;: <input id="select_textColor" class="jscolor jscolor-active" autocomplete="off" style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br>
			배경 색상 &emsp;: <input id="select_bgColor" class="jscolor jscolor-active" autocomplete="off" style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br>
			<div id="divForOption">
				선택 옵션  &emsp;: <input type="text" id="select_option0"><button onclick="javascript:addOption()">추가</button><button id="delOption0" onclick="javascript:delOption(this)">삭제</button><br>
			</div>
			<button class="editSelect" onclick="editSelect(this)">수정완료</button>&emsp;<button class="editSelect" id="delSelect" onclick="deleteComp()">삭제</button>&emsp;<button class="editSelect" onclick="closemap_select(popup)">닫기</button>
			<input type="hidden" id="selectName">
			<input type="hidden" id="optionCounter">
		</div>
		
		
		<div id="popup_spinner">
			<br>
			가로 크기 &emsp;: <input type="text" id="spinner_width"><br>
			세로 크기 &emsp;: <input type="text" id="spinner_height"><br>
			글자 크기 &emsp;: <input type="text" id="spinner_fontsize"><br>
			글자 색상 &emsp;: <input id="spinner_textColor" class="jscolor jscolor-active" autocomplete="off" style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br>
			배경 색상 &emsp;: <input id="spinner_bgColor" class="jscolor jscolor-active" autocomplete="off" style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br>
			테두리 색상 : <input id="spinner_bdColor" class="jscolor jscolor-active" autocomplete="off" style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br>
			<button class="editSpinner" onclick="editSpinner(this)">수정완료</button>&emsp;<button class="editSpinner" id="delSpinner" onclick="deleteComp()">삭제</button>&emsp;<button class="editSpinner" onclick="closemap_spinner(popup)">닫기</button>
			<input type="hidden" id="spinnerName">
		</div> -->


	<div id="changeBg" class="popup BGheight">
		<div>
			<h5 class="editHeader">배경설정</h5>
		</div>

		<button id="default" onclick="javascript:changeBgColor()" class="tabs">색상</button>
		<button onclick="javascript:changeBgImage()" class="tabs">이미지</button>
		<hr>
		<div id="bgColorDiv" class="changeA"
			style="position: absolute; margin-top: 5px; width: 100%; height: 100%;">
			색상 : <input id="backgroundColor"
				class="jscolor jscolor-active changeA" autocomplete="off"
				style="background-image: none; background-color: rgb(204, 68, 153); color: rgb(255, 255, 255);"><br>
			<br>
			<button onclick="javascript:changeSubmit()" class="changeA editBtn">변경</button>
			<button class="changeA editBtn" onclick="javascript:changeCancle()">취소</button>
		</div>
		<div id="bgImageDiv" class="changeB"
			style="position: absolute; margin-top: 5px; width: 100%; height: 100%;">
			주소 : <input type="text" id="bgUrl" class="changeB"><br>
			<br>

			<button onclick="javascript:changeImageSubmit()"
				class="changeB editBtn">변경</button>
			<button class="changeB editBtn" onclick="javascript:changeCancle()">취소</button>
		</div>
		<div id="bgDiv"></div>
	</div>

	<div id="popup_slide" class="popup Slheight"
		style="padding-left: 55px;">
		<h5 class="editHeader" style="margin-right: 45px;">슬라이드 이미지 삽입</h5>
		<table style="margin-left: 20px;">
			<tr>
				<th class="mp th-euj2">1번 이미지</th>
				<td class="mp"><input type="text" id="slide_first"></td>
			</tr>
			<tr>
				<th class="mp th-euj2">2번 이미지</th>
				<td class="mp"><input type="text" id="slide_second"></td>
			</tr>
			<tr>
				<th class="mp th-euj2">3번 이미지</th>
				<td class="mp"><input type="text" id="slide_third"></td>
			</tr>
			<tr>
				<th class="mp th-euj2">4번 이미지</th>
				<td class="mp"><input type="text" id="slide_fourth"></td>
			</tr>
		</table>
		<hr>
		<button onclick="javascript:changeSlide()" class="editBtn">변경</button>
		<button class="editBtn" onclick="javascript:closemap_slide()"
			style="margin-right: 70px;">취소</button>
	</div>

	<form id="savepagefrm" action="savepage" method="post">
		<input type="hidden" id="savepage" name="savepage"> <input
			type="hidden" id="pagename" name="pagename">
	</form>
	<form id="loadpagefrm" action="loadpage" method="post">
		<input type="hidden" id="lpagename" name="lpagename">
	</form>
</body>
</html>