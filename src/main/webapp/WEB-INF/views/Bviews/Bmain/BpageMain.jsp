<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/Bpage/Bpagemain.css?=ver1">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			var height = $(document).height();
			$('#footer_footer').css("top",height + "px");
		});

	</script>
<title>Insert title here</title>
</head>
<body>
<%-- 	<header>
		<%@ include file="Bheader.jsp" %>
	</header> --%>

		<div id=slide_container>
			<div id="slide" class="slides" tabindex="0">
				<img id="img1" src="./resources/img/slide1.jpg"/>
			</div>
			<div class="slides">
				<img id="img2" src="./resources/img/slide2.jpg"/>
			</div>
			<div class="slides">
				<img id="img3" src="./resources/img/slide3.jpg"/>
			</div>
			<div class="slides">
				<img id="img4" src="./resources/img/slide4.jpg"/>
			</div>
		</div>

		<br>

		<div id="dot_group" style="text-align: center">
			<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
			<span class="dot"></span>
		</div>
		<br>

			<div id="product">
				<ul>
					<li>
						<div id="outer">
							<img src="./resources/img/cd.jpg">
							<dl>
								<dd>ProductName</dd>
								<dd>10000원</dd>
							</dl>
						</div>
					</li>
					<li>
						<div id="outer">
							<img src="./resources/img/cd1.jpg">
							<dl>
								<dd>ProductName</dd>
								<dd>10000원</dd>
							</dl>
						</div>
					</li>
					<li>
						<div id="outer">
							<img src="./resources/img/cd2.jpg">
							<dl>
								<dd>ProductName</dd>
								<dd>10000원</dd>
							</dl>
						</div>
					</li>
					<li>
						<div id="outer">
							<img src="./resources/img/cd3.jpg">
							<dl>
								<dd>ProductName</dd>
								<dd>10000원</dd>
							</dl>
						</div>
					</li>
				</ul>
			</div>

			<div id="product">
				<ul>
					<li>
						<div id="outer">
							<img src="./resources/img/cd.jpg">
							<dl>
								<dd>ProductName</dd>
								<dd>10000원</dd>
							</dl>
						</div>
					</li>
					<li>
						<div id="outer">
							<img src="./resources/img/cd1.jpg">
							<dl>
								<dd>ProductName</dd>
								<dd>10000원</dd>
							</dl>
						</div>
					</li>
					<li>
						<div id="outer">
							<img src="./resources/img/cd2.jpg">
							<dl>
								<dd>ProductName</dd>
								<dd>10000원</dd>
							</dl>
						</div>
					</li>
					<li>
						<div id="outer">
							<img src="./resources/img/cd3.jpg">
							<dl>
								<dd>ProductName</dd>
								<dd>10000원</dd>
							</dl>
						</div>
					</li>
				</ul>
			</div>

			<div id="product">
				<ul>
					<li>
						<div id="outer">
							<img src="./resources/img/cd.jpg">
							<dl>
								<dd>ProductName</dd>
								<dd>10000원</dd>
							</dl>
						</div>
					</li>
					<li>
						<div id="outer">
							<img src="./resources/img/cd1.jpg">
							<dl>
								<dd>ProductName</dd>
								<dd>10000원</dd>
							</dl>
						</div>
					</li>
					<li>
						<div id="outer">
							<img src="./resources/img/cd2.jpg">
							<dl>
								<dd>ProductName</dd>
								<dd>10000원</dd>
							</dl>
						</div>
					</li>
					<li>
						<div id="outer">
							<img src="./resources/img/cd3.jpg">
							<dl>
								<dd>ProductName</dd>
								<dd>10000원</dd>
							</dl>
						</div>
					</li>
				</ul>
			</div>

		<br>
		
	<!--footer-->
	<%-- <footer>
		<%@ include file="Bfooter.jsp" %>
	</footer> --%>
		
		
	<script type="text/javascript" src="./resources/js/slideshow.js"></script>
</body>
</html>