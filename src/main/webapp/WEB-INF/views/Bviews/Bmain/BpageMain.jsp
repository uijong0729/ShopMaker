<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="./resources/css/Bpage/Bpagemain.css?ver=3">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		for (var i = 1; i <= ${Bproducttable.size()}; i++) {
            var x = (i - 1) % 4;
            var y = (i - 1) / 4;
            y = Math.floor(y);
            $('#div' + i).css("width", "300px");
            $('#div' + i).css("height", "450px");
           /*  $('#div' + i).css("margin-left", ((x * 25) - 1) + "%");
            $('#div' + i).css("margin-top", (y * 315) + "px"); */
         }
		var height = $(document).height();
		$('#footer_footer').css("top", height + "px");
	});
	
</script>
<title>Insert title here</title>
</head>
<body>
	<header> <%@ include file="Bheader.jsp"%>
	</header>

	<div id=slide_container>
		<div id="slide" class="slides" tabindex="0">
			<img id="img1" src="./resources/img/slide1.jpg" />
		</div>
		<div class="slides">
			<img id="img2" src="./resources/img/slide2.jpg" />
		</div>
		<div class="slides">
			<img id="img3" src="./resources/img/slide3.jpg" />
		</div>
		<div class="slides">
			<img id="img4" src="./resources/img/slide4.jpg" />
		</div>
	</div>

	<br>

	<div id="dot_group" style="text-align: center">
		<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
		<span class="dot"></span>
	</div>
	<br>
	
<c:set var="count" value="0" />
	<div id="product">
		<c:forEach items="${nameset}" var="n" varStatus="vars">
			<c:set var="done" value="false" />
			<c:forEach items="${Bproducttable}" var="b" varStatus="varss">
				<c:if test="${nameset[vars.index] == Bproducttable[varss.index].productname}">
					<c:if test="${done == false}">
					
					<c:if test="${count%4==0}">
					<ul>
					</c:if>
						<a href="goBproductdetail?productname=${b.productname}&productcode=${b.productcode }">
							<li>
								<div id="outer">
									<img src="${b.productimage }">
									<dl>
										<dd>상품명 : ${b.productname}</dd>
										<dd>가격 : ${b.productprice}</dd>
									</dl>
								</div>
								<c:set var="count" value="${count+1}" />
								
						</li>
						</a>
						<c:if test="${count%4==0}">
					</ul>
					</c:if>
						<c:set var="done" value="true" />
					</c:if>
				</c:if>
			</c:forEach>
		</c:forEach>
	</div>
	<br>

	<!--footer-->
	<footer> <%@ include file="Bfooter.jsp"%>
	</footer>


	<script type="text/javascript" src="./resources/js/slideshow.js"></script>
</body>
</html>