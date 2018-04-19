<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/Bpage/bproductReviewread.css">
<title>Insert title here</title>
<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/Bpage/getReview.css">
<script type="text/javascript">

$(document).ready(function(){
	
});


function reviewContent(code, image, content){
	var reviewImage = '<td class="reviewclass" colspan="4" style="height:auto;">';
		reviewImage += '<img style="width: 50%;" src="' + image + '" class="reviewclass reviewimage">';
		reviewImage += '</td>';
	var	reviewContent = '<td class="reviewclass" colspan="4">' + content + '</td>';
	if ($('#reviewImage' + code).html() == "") {
		$('#reviewImage' + code).html(reviewImage);
		$('#reviewContent' + code).html(reviewContent);
		return;
	}
	if (!$('#reviewImage' + code).html() == "") {
		$('#reviewImage' + code).html("");
		$('#reviewContent' + code).html("");
		return;
	}
}

</script>

</head>
<body>

		<br>
		<div id="productInquiryBoard_wrapper">
			<p class="pibTitle">상품 후기</p>
			<form action="getReviewList.do" method="post">
					<a href="productReviewWrite"><p class="inquiryBtn" style="cursor: pointer">등록하기</p></a>
				<input type="hidden" name="r_no">
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</table>
					<c:forEach var="review" items="${reviewtableList}" varStatus="v">
						<table id="reviewcontent${review.reviewcode}">
							<tr></tr>
							<tr>
								<td>${review.reviewcode }</td>
								<td style="cursor: pointer;" class="reviewtitle" user-select="none" onclick="javascript:reviewContent('${review.reviewcode}', '${review.reviewimage}', '${review.reviewcontent}')">${review.reviewtitle }</td>
								<td>작성자: Bcustomer.customername</td>
								<td>${review.reviewdate }</td>
							</tr>
							<tr id="reviewImage${review.reviewcode}" class="reviewclass"></tr>
							<tr id="reviewContent${review.reviewcode}" class="reviewclass"></tr>
						</table>
						<a href="getReviewList?r_no=${review.reviewcode}"><p class="listbtn" style="cursor: pointer">목록</p></a>
						<c:if test="${Amember.membercode ==Review.membercode }">
						<a href="updateReview?reviewcode=${review.reviewcode}"><p class="listbtn"  style="cursor: pointer">수정</p></a>
						<a href="deleteReview?reviewcode=${review.reviewcode}"><p class="listbtn" style="cursor: pointer">삭제</p></a>
						</c:if>
					</c:forEach>
				</div>
		</form>
	
</body>
</html>