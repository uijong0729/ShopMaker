<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/Bpage/Bfooter.css?ver=3"/>
		<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/Bpage/Bheader.css"/>
		<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/Bpage/Bpagemain.css"/>
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script type="text/javascript">
			$(document).ready(function() {
				if (${param.page == 'Bproductdetail'}) {
					alert('${productDetailList[0].productimage}');
			          $('#productcode').val('${productDetailList[0].productcode}');
			          $('#customercode').val('${sessionScope.Blogin.customercode}');
			          $('.showingImg').attr("src", '${productDetailList[0].productimage}');
			          $('.showingImg').css('width', '400px');
			          $('.showingImg').css('height', 'auto');
			          $('#img_1').attr("src", '${productDetailList[0].productimage}');
			          $('#img_2').attr("src", '${productDetailList[1].productimage}');
			          $('#Bproductname').text('${productDetailList[0].productname}');
			          $('#Bproductprice').text('${productDetailList[0].productprice}');
			          $('#product_iframe').attr("href", 'getInqueryList.do?r_no=${ProductOne.r_no }');
			          var str = '<c:forEach var="product" items="${productDetailList }" varStatus="loopStat">';
			          str += '<option value="${product.productcode}">${product.productcolor}, ${product.productsize}</option>';
			          str += '</c:forEach>';
			          $('#color_selecter').append(str);
			          $('#Bproductreview').load('ProductReview');
				}
		});
			
		</script>
	</head>
	<body>
		<div>
			${headerContent}
		</div>
		<div>
			${body}
		</div>
		<div class="forVerticalAlign">
			${footer}
		</div>
	</body>
</html>