<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="./resources/css/Bpage/Bpagemain.css">
<title>Insert title here</title>
<style type="text/css">
.div {
	position: absolute;
	text-align: center;
}
</style>
<script src='<c:url value="resources/js/jquery-3.2.1.js" />'></script>
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
  	});
         
      /*    function check() {
            var rows = document.getElementById('rows').value;
            $('#Bcenter').load("Bmainlist?rows=" + rows);
         } */
         
         
           
      </script>
</head>
<body>
	<c:set var="count" value="0" />
	<div id="forAppend">
		<c:forEach items="${nameset}" var="n" varStatus="vars">
			<c:set var="done" value="false" />
			<c:forEach items="${Bproducttable}" var="b" varStatus="varss">
				<c:if
					test="${nameset[vars.index] == Bproducttable[varss.index].productname}">
					<c:if test="${done == false}">

						<c:if test="${count%4==0}">
							<ul>
						</c:if>
						<a
							href="goMyShop?code=${Amember.membercode}&page=Bproductdetail&productname=${b.productname}&productcode=${b.productcode}">
							<li>
								<div id="outer" style>
									<img src="./resources/image/${b.productimage }"
										style="width: 200px; height: 200px;">
									<dl>
										<dd>${b.productname}</dd>
										<dd>
											<fmt:formatNumber value="${b.productprice}" type="currency"></fmt:formatNumber>
										</dd>

									</dl>
								</div> <c:set var="count" value="${count+1}" />

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
</body>
</html>