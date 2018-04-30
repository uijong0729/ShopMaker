<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/headerfooter.css">
<link rel="stylesheet" href="./resources/css/templatepay.css?ver=2">
<script src="./resources/js/jquery-3.2.1.min.js"></script>

<script>
/* 버려진 코드 : 버튼 클릭 시  배경 변경 관련 코드
$(document).ready(function(){
	
	$('.button span').on('click',changeColor());
	
})

function changeColor(){
	var color = $(this).attr('check');
	
	if(color=="checked"){
		$(this).attr('check',"");
		$(this).css('background',"#608bbc");
	}else if(color==""){
		$(this).attr('check',"checked");
		$(this).css('background',"#DB7093");
	}
	
}
*/

var template;
var payment;
var days;
var payConfirm;
var endday="";

function template1() {
	template = document.getElementById("template").innerHTML="template1";
	$('#template1').css("background", "#afafaf");
	$('#template2').css("background", "#00000000");
	$('#template3').css("background", "#00000000");
	$('#templateforValue').val($('#template').text());
	
	
}

function template2() {
	template = document.getElementById("template").innerHTML="template2";
	$('#template1').css("background", "#00000000");
	$('#template2').css("background", "#afafaf");
	$('#template3').css("background", "#00000000");
	$('#templateforValue').val($('#template').text());
}

function template3() {
	template = document.getElementById("template").innerHTML="template3";
	$('#template1').css("background", "#00000000");
	$('#template2').css("background", "#00000000");
	$('#template3').css("background", "#afafaf");
	$('#templateforValue').val($('#template').text());
}

function payment1(date) {
	
	payment = document.getElementById("payment").innerHTML="15,000";
	days = document.getElementById("days").innerHTML="30";
	$('#payment1').css("background", "#afafaf");
	$('#payment2').css("background", "#00000000");
	$('#payment3').css("background", "#00000000");
	$('#payment4').css("background", "#00000000");
	$('#paymentforValue').val($('#payment').text());
	$('#daysforValue').val($('#days').text());
	
	$.ajax({
		url: 'caldate',
		type: 'post',
		data:{date: date},
		dataType: 'text',
		success: function(value){
			endday=value;
			payConfirm = confirm("선택하신 결제 정보는 아래와 같습니다.\n템플릿: "+template+"\n기간: "+days+"\n결제금액: "+payment+"\n사용만료일: "+endday);
			if(payConfirm == true){
				document.getElementById('ApurchaseInfo').submit();
			}else{
				location.href="ApurchasePage"
			}
		}
			
	});
	
	
	/* document.getElementById("payment").innerHTML="변경 전 : "+date + "==> 변경 후 : ";
	$.ajax({
		url: 'caldate',
		type: 'post',
		data:{date: date},
		dataType: 'text',
		success: function(value){
	
		},
			document.getElementById("payment").innerHTML+=value;
	}); */
}

function payment2(date) {
	payment = document.getElementById("payment").innerHTML="30,000";
	days = document.getElementById("days").innerHTML="60";
	$('#payment1').css("background", "#00000000");
	$('#payment2').css("background", "#afafaf");
	$('#payment3').css("background", "#00000000");
	$('#payment4').css("background", "#00000000");
	$('#paymentforValue').val($('#payment').text());
	$('#daysforValue').val($('#days').text());
	
	
	$.ajax({
		url: 'caldate2',
		type: 'post',
		data:{date: date},
		dataType: 'text',
		success: function(value){
			endday=value;
			payConfirm = confirm("선택하신 결제 정보는 아래와 같습니다.\n템플릿: "+template+"\n기간: "+days+"\n결제금액: "+payment+"\n사용만료일: "+endday);
			if(payConfirm == true){
				document.getElementById('ApurchaseInfo').submit();
			}else{
				location.href="ApurchasePage"
			}
		}
			
	});
	
	/* document.getElementById("payment").innerHTML="변경 전 : "+date + "==> 변경 후 : ";
	$.ajax({
		url: 'caldate2',
		type: 'post',
		data:{date: date},
		dataType: 'text',
		success: function(value){
			document.getElementById("payment").innerHTML+=value;
		},
	
	}); */
}

function payment3(date) {
	payment = document.getElementById("payment").innerHTML="45,000";
	days = document.getElementById("days").innerHTML="90";
	$('#payment1').css("background", "#00000000");
	$('#payment2').css("background", "#00000000");
	$('#payment3').css("background", "#afafaf");
	$('#payment4').css("background", "#00000000");
	$('#paymentforValue').val($('#payment').text());
	$('#daysforValue').val($('#days').text());
	$.ajax({
		url: 'caldate3',
		type: 'post',
		data:{date: date},
		dataType: 'text',
		success: function(value){
			endday=value;
			payConfirm = confirm("선택하신 결제 정보는 아래와 같습니다.\n템플릿: "+template+"\n기간: "+days+"\n결제금액: "+payment+"\n사용만료일: "+endday);
			if(payConfirm == true){
				document.getElementById('ApurchaseInfo').submit();
			}else{
				location.href="ApurchasePage"
			}
		}
			
	});
	
	/* document.getElementById("payment").innerHTML="변경 전 : "+date + "==> 변경 후 : ";
	$.ajax({
		url: 'caldate3',
		type: 'post',
		data:{date: date},
		dataType: 'text',
		success: function(value){
			document.getElementById("payment").innerHTML+=value;
		},
	
	}); */
}

function payment4(date) {
	payment = document.getElementById("payment").innerHTML="60,000";
	days = document.getElementById("days").innerHTML="180";
	$('#payment1').css("background", "#00000000");
	$('#payment2').css("background", "#00000000");
	$('#payment3').css("background", "#00000000");
	$('#payment4').css("background", "#afafaf");
	$('#paymentforValue').val($('#payment').text());
	$('#daysforValue').val($('#days').text());
	$.ajax({
		url: 'caldate4',
		type: 'post',
		data:{date: date},
		dataType: 'text',
		success: function(value){
			endday=value;
			payConfirm = confirm("선택하신 결제 정보는 아래와 같습니다.\n템플릿: "+template+"\n기간: "+days+"\n결제금액: "+payment+"\n사용만료일: "+endday);
			if(payConfirm == true){
				document.getElementById('ApurchaseInfo').submit();
			}else{
				location.href="ApurchasePage"
			}
		}
			
	});
	
	/* document.getElementById("payment").innerHTML="변경 전 : "+date + "==> 변경 후 : ";
	$.ajax({
		url: 'caldate4',
		type: 'post',
		data:{date: date},
		dataType: 'text',
		success: function(value){
			document.getElementById("payment").innerHTML+=value;
		},
	
	}); */
}

</script>
<title>빅스타 서비스 구매 페이지</title>
</head>
<body>

<header class="w3-top" style="margin-bottom: 100px;">
	<%@ include file="../../Aheader.jsp" %>
</header>
<br><br><br><br>

<div style="text-align: center; margin-bottom: 40px;">
	<h2 style="font-family: tmon;"><span style="color: #77a7f4;"><b style="font-family: tmon;">Bigstar</b></span> WEB EC 서비스</h2>
		<h6 style="color: gray;">빅스타는 여러분의 온라인 창업을 지원합니다.</h6>
	</div>
	<hr>

<div class="services">
<section class="pricecol">
<div class="icon">
<i class="icon-magic"></i>
<img src="./resources/image/sofa1.png">
</div>

<h3><Span>가구</span></h3>
<p>
<a class="button" id="template1" href="javascript:template1()"><span>Pick</span></a>
</p>
</section>

<section class="pricecol">
<div class="icon">
<i class="icon-leaf"></i>
<img src="./resources/image/shirt11.png">
</div>
<h3><Span>옷</span></h3>
<p>
<a class="button" id="template2" href="javascript:template2()"><span>Pick</span></a>
</p>
</section>

<section class="pricecol">
<div class="icon">
<i class="icon-link"></i>
<img src="./resources/image/tomato1.png">
</div>
<h3><Span>음식</span></h3>
<p>
<a class="button" id="template3" href="javascript:template3()"><span>Pick</span></a>
</p>
</section>
</div>


<br><br>

<div class="services">
<section class="pricecol1">
<h3><Span>30days</span></h3>
<ul>
<li>15,000</li>
</ul>
<p>
<a class="button" check="" id="payment1" onclick="payment1('${Amember.paymentexpirationdate}')"><span>Start now</span></a>
<%-- payment1('${Amember.paymentexpirationdate}') --%>
</p>
</section>

<section class="pricecol1">
<h3><Span>60days</span></h3>
<ul>
<li>30,000</li>
</ul>
<p>
<a class="button" check="" id="payment2" onclick="payment2('${Amember.paymentexpirationdate}')"><span>Start now</span></a>
<%-- payment2('${Amember.paymentexpirationdate}') --%>
</p>
</section>

<section class="pricecol1">
<h3><Span>90days</span></h3>
<ul>
<li>45,000</li>
</ul>
<p>
<a class="button" check="" id="payment3" onclick="payment3('${Amember.paymentexpirationdate}')"><span>Start now</span></a>
<%-- payment3('${Amember.paymentexpirationdate}') --%>
</p>
</section>

<section class="pricecol1">
<h3><Span>180days</span></h3>
<ul>
<li>60,000</li>
</ul>
<p>
<a class="button" check="" id="payment4" onclick="payment4('${Amember.paymentexpirationdate}')"><span>Start now</span></a>
<%-- payment4('${Amember.paymentexpirationdate}') --%>
</p>
</section>
</div>

<br><br><br><br>

<div style="visibility: hidden;">
Type: <p id="template"></p>
<br>
Payment: <p id="payment"></p>
<br>
Days: <p id="days"></p>
<br>
</div>

<br>
	<form action="ApurchaseIndex" method="post" id="ApurchaseInfo">  <!-- id="tem1" -->
		<input type="hidden" name="templateforValue" id="templateforValue">
		<input type="hidden" name="paymentforValue" id="paymentforValue">
		<input type="hidden" name="daysforValue" id="daysforValue">
	</form>
</body>
</html>