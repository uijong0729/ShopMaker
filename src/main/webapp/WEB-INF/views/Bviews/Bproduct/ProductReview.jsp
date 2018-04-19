<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/Bpage/bproductReviewread.css">
<title>Insert title here</title>
<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

/* $(document).ready(function(){
	$(".reviewtitle").on(click, function(){
		alert("test");
	});
	
}); */


function reviewContent(reviewcode, reviewcontent){
	/* alert(reviewcode);
	alert(reviewcontent); */
	var reviewcontent_str = reviewcontent;
	var reviewcode = reviewcode;
	alert(reviewcode);
	
	var reviewContent_str = '<table>';
	reviewContent_str = '<tr>';
	reviewContent_str += '<td>';
	reviewContent_str += '</td>';
	reviewContent_str += '<td>';
	reviewContent_str += reviewcontent_str;
	reviewContent_str += '</td>';
	reviewContent_str += '<td>';
	reviewContent_str += '</td>';
	reviewContent_str += '<td>';
	reviewContent_str += '</td>';
	reviewContent_str += '</tr>';
	reviewContent_str += '</table>';
	
	$('#reviewcontent'+reviewcode).append(reviewContent_str);
	
}

</script>

</head>
<body>
<center>
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
					<c:forEach var="review" items="${reviewtableList}">
						<table id="reviewcontent${review.reviewcode}">
							<tr></tr>
							<tr>
								<td>${review.reviewcode }</td>
								<td><span style="cursor: pointer;" class="reviewtitle"
									onclick="javascript:reviewContent('${review.reviewcode}','${review.reviewcontent}')">${review.reviewtitle }</span></td>
								<td>작성자: Bcustomer.customername</td>
								<td>${review.reviewdate }</td>
							</tr>
						</table>
					</c:forEach>
				</div>
		</form>
	</center>
</body>
</html>