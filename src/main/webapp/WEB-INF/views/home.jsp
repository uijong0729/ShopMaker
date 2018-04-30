
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
						<h2 class="h2" style="font-family: tmon;">고급스러운 홈페이지</h2>
						<p>전문적인 디자이너가 제작한 다양한 템플릿으로</p> <br><p>내 홈페이지를 만들어보세요.</p>
					</div>
					<div class="tiltview col">
						<a href="http://grovemade.com/"><img src="./resources/img/7_withyoon.jpg"/></a>
						<a href="https://tsovet.com/"><img src="./resources/img/8_aboki.jpg"/></a>
					</div>
				</li>
				<li>
					<div class="description">
						<h2 class="h2" style="font-family: tmon">전문적인 온라인 몰</h2>
						<p>내 비즈니스의 제품 또는 서비스를 판매할</p> <br><p>전문적인 온라인 쇼핑몰을 제작 및 관리하세요.</p>
					</div>
					<div class="tiltview col">
						<a href="http://minimalmonkey.com/"><img src="./resources/img/9_ikea.jpg"/></a>
						<a href="http://www.herschelsupply.com/"><img src="./resources/img/9_home.jpg"/></a>
					</div>
				</li>
				<li>
					<div class="description">
						<h2 class="h2" style="font-family: tmon">쉽고 확실한 홈페이지</h2>
						<p style="font-family: nanum">코딩 걱정없이 쉽고 간편한 사용자 친화적인</p><br><p>드래그-앤-드롭 방식의 에디터로</p> <br><p>내 홈페이지를 완성하세요.</p>
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

<!-- Footer -->
<footer>
	<%@ include file="./Aviews/footer.jsp" %>
</footer>

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
