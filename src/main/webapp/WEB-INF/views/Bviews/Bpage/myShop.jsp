<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html id="html">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/Bpage/Bfooter.css?ver=7"/>
		<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/Bpage/Bheader.css"/>
		<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/Bpage/Bpagemain.css"/>
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script type="text/javascript">
			$(document).ready(function() {
				
				
				$('#image_header').parent().attr('href', 'goMyShop?code=${Amember.membercode}&page=BpageMain');
				$('#temp1').attr('href','goMyShop?code=${Amember.membercode}&page=Bregist');
				$('#temp2').attr('href','goMyShop?code=${Amember.membercode}&page=Blogin');
				$('#temp3').attr('href','goMyShop?code=${Amember.membercode}&page=Bnoticelist');
				$('#forLink0').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink0').text());
				$('#forLink1').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink1').text());
				$('#forLink2').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink2').text());
				$('#forLink3').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink3').text());
				$('#forLink4').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink4').text());
				$('#forLink5').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink5').text());
				$('#forLink6').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink6').text());
				$('#forLink7').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink7').text());
				$('#forLink8').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink8').text());
				$('#forLink9').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink9').text());
				$('#forLink10').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink10').text());
				$('#forLink11').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink11').text());
				$('#forLink12').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink12').text());
				$('#forLink13').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink13').text());
				$('#forLink14').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink14').text());
				$('#forLink15').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink15').text());
				
				
				if (${param.page == 'Bproductdetail'}) {
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
				if(${param.page == 'Bmainlist'}) {
					$('#forAppend').html('');
					var str = '';
						str += '<c:forEach items="${nameset}" var="n" varStatus="vars">';
				        str += '<c:set var="done" value="false" />';
				        str += '<c:forEach items="${Bproducttable}" var="b" varStatus="varss">';
				        str += '<c:if test="${nameset[vars.index] == Bproducttable[varss.index].productname}">';
		             	str += '<c:if test="${done == false}">';
					    str += '<a href="goBproductdetail?productname=${b.productname}&productcode=${b.productcode }">';
					    str += '<div id="div${vars.index + 1}" class="div">';
					    str += '<img src="${b.productimage }" style="width: 200px; height: 200px;"><br>';
				        str += '상품명 : ${b.productname}<br>가격 : ${b.productprice}';
					    str += '</div></a>';
					    str += '<c:set var="done" value="true"/>';
					    str += '</c:if>';
					    str += '</c:if>';
					    str += '</c:forEach>';
					    str += '</c:forEach>';
					$('#forAppend').append(str);
				}
				if(${param.page == 'Blogin'}) {
					$('#text_login').attr('onclick', 'location.href="goMyShop?code=${Amember.membercode}&page=Blogin"');
				}
				if(${param.page == 'Bregist'}) {
					$('#text_main').attr('onclick', 'location.href="goMyShop?code=${Amember.membercode}&page=BpageMain"');
					$('#membercode').val(${Amember.membercode});
				}
		});
			
		</script>
		<style type="text/css">
		</style>
	</head>
	<body id="body">
		<div>
			${headerContent}
		</div>
		<div style="height: auto; text-align: center">
			${body}
		</div>
		<div class="forVerticalAlign">
			${footer}
		</div>
	</body>
</html>