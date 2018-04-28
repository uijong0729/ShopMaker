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
				if (${Blogin != null}) {
					$('#header_small_navbar').html('');
					var temp = '<ul>';
					temp += '<li><a id="temp4" tabindex="0" href="#" class="header_member">로그아웃</a></li>';
					temp += '<li><a id="temp5" tabindex="0" href="#" class="header_member">관리메뉴</a></li>';
					temp += '<li><a id="temp3" href="#" class="header_member" tabindex="0">공지사항</a></li>';
					$('#header_small_navbar').html(temp);
				}
				
				$('#image_header').parent().attr('href', 'goMyShop?code=${Amember.membercode}&page=BpageMain');
				$('#temp1').attr('href','goMyShop?code=${Amember.membercode}&page=Bregist');
				$('#temp2').attr('href','goMyShop?code=${Amember.membercode}&page=Blogin');
				$('#temp3').attr('href','goMyShop?code=${Amember.membercode}&page=Bnoticelist');
				$('#temp4').attr('href','goLogout?code=${Amember.membercode}&page=Blogin');
				$('#temp5').attr('href','goBmain');
				$('#forLink0').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink0').text().trim());
				$('#forLink1').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink1').text().trim());
				$('#forLink2').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink2').text().trim());
				$('#forLink3').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink3').text().trim());
				$('#forLink4').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink4').text().trim());
				$('#forLink5').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink5').text().trim());
				$('#forLink6').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink6').text().trim());
				$('#forLink7').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink7').text().trim());
				$('#forLink8').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink8').text().trim());
				$('#forLink9').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink9').text().trim());
				$('#forLink10').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink10').text().trim());
				$('#forLink11').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink11').text().trim());
				$('#forLink12').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink12').text().trim());
				$('#forLink13').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink13').text().trim());
				$('#forLink14').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink14').text().trim());
				$('#forLink15').attr('href', 'goMyShop?code=${Amember.membercode}&page=Bmainlist&category=' + $('#forLink15').text().trim());
				
				
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
					    str +='<c:set var="count" value="0" />';
					    str +='<div id="product">';
					    str +='<c:forEach items="${nameset}" var="n" varStatus="vars">';
					    str +='<c:set var="done" value="false" />';
					    str +='<c:forEach items="${Bproducttable}" var="b" varStatus="varss">';
					    str +='<c:if test="${nameset[vars.index] == Bproducttable[varss.index].productname}">';
					    str +='<c:if test="${done == false}">';
					    str +='<c:if test="${count%4==0}">';
					    str +='<ul></c:if>';
					    str +='<a href="goMyShop?code=${Amember.membercode}&page=Bproductdetail&productname=${b.productname}&productcode=${b.productcode}">';
					    str +='<li><div id="outer">';
					    str +='<img src="./resources/image/${b.productimage }">';
					    str +='<dl><dd>상품명 : ${b.productname}</dd>';
					    str +='<dd>가격 : ${b.productprice}</dd></dl>';
					    str +='</div> ';
					    str +='<c:set var="count" value="${count+1}" />';
					    str +='</li></a>';
					    str +='<c:if test="${count%4==0}"></ul></c:if>';
					    str +='<c:set var="done" value="true" /></c:if>';
					    str +='</c:if>';
					    str +='</c:forEach>';
					    str +='</c:forEach>';
					    str +='</div>';
					    
					$('#forAppend').append(str);
					
				}
				if(${param.page == 'Blogin'}) {
					$('#text_login').removeAttr('onclick');
					$('#text_login').attr('onclick', 'location.href="goMyShop?code=${Amember.membercode}&page=Blogin"');
					$('#text_register').removeAttr('onclick');
					$('#text_register').attr('onclick','location.href="goMyShop?code=${Amember.membercode}&page=Bregist"'); 
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
		<div id="headerDiv">
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