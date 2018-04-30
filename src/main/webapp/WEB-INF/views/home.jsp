
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Main</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="./resources/css/component.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/common.css"><!-- reset code -->
<script type="text/javascript" src="jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/demo.css" />
<script src="./resources/js/modernizr.custom.js"></script>
</head>
<body>
	<!-- 헤더 -->
		<header>
			<%@ include file="Aheader.jsp" %>
		</header>

<article style="margin-top: 90px;">
	<div class="container">
		<div class="slideshow" id="slideshow">
			<ol class="slides">
				<li class="current">
					<div class="description">
						<h2 class="h2" style="font-family: tmon;">Tilted Content Slideshow</h2>
						<p>This slider, as seen on the landing page of the <a href="http://www.thefwa.com/">FWA</a>, plays with 3D perspective and performs some interesting animations on the right-hand side images.</p>
					</div>
					<div class="tiltview col">
						<a href="http://grovemade.com/"><img src="./resources/img/7_withyoon.jpg"/></a>
						<a href="https://tsovet.com/"><img src="./resources/img/8_aboki.jpg"/></a>
					</div>
				</li>
				<li>
					<div class="description">
						<h2 class="h2" style="font-family: tmon">Tilted Items</h2>
						<p>The perspective view is achieved by adding a perspective value to the slide list item and tilting a division that contains the two screenshots.</p>
					</div>
					<div class="tiltview col">
						<a href="http://minimalmonkey.com/"><img src="./resources/img/9_ikea.jpg"/></a>
						<a href="http://www.herschelsupply.com/"><img src="./resources/img/9_home.jpg"/></a>
					</div>
				</li>
				<li>
					<div class="description">
						<h2 class="h2" style="font-family: tmon">Responsiveness</h2>
						<p style="font-family: nanum">For smaller screens, the items on the right hand side will become less opaque and serve as decoration only. The focus will be on the description which will occupy all the width.</p>
					</div>
					<div class="tiltview col">
						<a href="http://pexcil.com/"><img src="./resources/img/14_food.jpg"/></a>
						<a href="http://foodsense.is/"><img src="./resources/img/4_screen.jpg"/></a>
					</div>
				</li>
			</ol>
		</div>
		<!-- /slideshow -->
	</div><!-- /container -->
	</article>



<script type="text/javascript">
	function template1(){
		<!--로그인 안 되어있으면 로그인 페이지 -->
		<!--구매하지 않았으면 구매페이지-->
		location.href="template1";
	}
</script>

<script src="./resources/js/classie.js"></script>
<script src="./resources/js/tiltSlider.js"></script>
<script>
	new TiltSlider( document.getElementById( 'slideshow' ) );
</script>




</body>
</html>
