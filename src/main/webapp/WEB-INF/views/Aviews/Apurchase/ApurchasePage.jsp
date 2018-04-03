<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/headerfooter.css">
<link rel="stylesheet" href="./resources/css/templatepay.css?ver=1">
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script>
function template1() {
	document.getElementById("template1").innerHTML="template1";
}
function template2() {
	document.getElementById("template1").innerHTML="template2";
}
function template3() {
	document.getElementById("template1").innerHTML="template3";
}

function payment1() {
	document.getElementById("payment").innerHTML="15,000";
}
function payment2() {
	document.getElementById("payment").innerHTML="30,000";
}
function payment3() {
	document.getElementById("payment").innerHTML="45,000";
}
function payment4() {
	document.getElementById("payment").innerHTML="60,000";
}

</script>
<title>빅스타 서비스 구매 페이지</title>
</head>
<body>

<header class="w3-top">

  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="/main1" class="w3-bar-item w3-button"><b>Shop</b> Maker</a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="#" class="w3-bar-item w3-button">Projects</a>
      <a href="#" class="w3-bar-item w3-button">About</a>
      <a href="#" class="w3-bar-item w3-button">Contact</a>
    </div>
  </div>
</header>
<br><br><br><br>
<div class="services">
<section class="pricecol">
<div class="icon">
<i class="icon-magic"></i>
<img src="./resources/image/shirt2.png">
</div>
<h3><Span>Template1</span></h3>
<p>
<a class="button" onclick="template1()"><span>Pick</span></a>
</p>
</section>

<section class="pricecol">
<div class="icon">
<i class="icon-leaf"></i>
<img src="./resources/image/shoes.png">
</div>
<h3><Span>Template2</span></h3>
<p>
<a class="button" onclick="template2()"><span>Pick</span></a>
</p>
</section>

<section class="pricecol">
<div class="icon">
<i class="icon-link"></i>
<img src="./resources/image/hat.png">
</div>
<h3><Span>Template3</span></h3>
<p>
<a class="button" onclick="template3()"><span>Pick</span></a>
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
<a class="button" onclick="payment1()"><span>Start now</span></a>
</p>
</section>

<section class="pricecol1">
<h3><Span>60days</span></h3>
<ul>
<li>30,000</li>
</ul>
<p>
<a class="button" onclick="payment2()"><span>Start now</span></a>
</p>
</section>

<section class="pricecol1">
<h3><Span>90days</span></h3>
<ul>
<li>45,000</li>
</ul>
<p>
<a class="button" onclick="payment3()"><span>Start now</span></a>
</p>
</section>

<section class="pricecol1">
<h3><Span>180days</span></h3>
<ul>
<li>60,000</li>
</ul>
<p>
<a class="button" onclick="payment4()"><span>Start now</span></a>
</p>
</section>
</div>

<br><br><br><br>

<div>Type: <p id="template1"></p></div>

<div>Payment: <p id="payment"></p></div>

<br><br><br>

<footer class="w3-center w3-black w3-padding-16">
  <p>Footer</p>
</footer>

</body>
</html>