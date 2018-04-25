<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/Bpage/bproductReviewread.css?ver=1">
<title>Insert title here</title>
<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/Bpage/getReview.css?ver=1">
<script type="text/javascript">

$(document).ready(function(){
	
	
	$('#inquiryBtn').on('click', function(){
		location.href="goProductReviewWrite?productcode="+'${productDetailList[0].productcode}';
	});
	
});


function reviewContent(code, image, content){
	var reviewImage = '<td colspan="4" style="height:auto;">';
		reviewImage += '<img style="height:200px; width:auto;" src=./resources/image/' + image + ' class="reviewclass reviewimage">';
		reviewImage += '</td>';
	var	reviewContent = '<td colspan="4">' + content + '</td>';
	var reviewBtn = '<c:if test="${Amember.membercode ==Review.membercode }">';
		reviewBtn += '<td  colspan="4">';
		reviewBtn += '<a href="goBproductdetail?productname=${productDetailList[0].productname}"><p class="listbtn" style="cursor: pointer">목록</p></a>';
		reviewBtn += '<a href="updateReview?reviewcode=${review.reviewcode}"><p class="listbtn"  style="cursor: pointer">수정</p></a>';
		reviewBtn += '<p class="listbtn" style="cursor: pointer" onclick="javascript:delReview(' + code + ')">삭제</p>';
		reviewBtn += '</c:if>';
		reviewBtn += '</td>';
	if ($('#reviewImage' + code).html() == "") {
		$('#reviewImage' + code).html(reviewImage);
		$('#reviewContent' + code).html(reviewContent);
		$('#reviewBtn' + code).html(reviewBtn);
		return;
	}
	if (!$('#reviewImage' + code).html() == "") {
		$('#reviewImage' + code).html("");
		$('#reviewContent' + code).html("");
		$('#reviewBtn' + code).html("");
		return;
	}
}

function delReview(code) {
	/* var productname = $('#productname').val();
	alert(productname);
	var url = 'delReview?reviewcode=' + code + '&productname=' + productname;
	*/
	var url = 'delReview?reviewcode=' + code;
	location.href=url;
}

/*  
<c:if test="${Amember.membercode ==Review.membercode }">
<a href="goBproductdetail?productname=${productDetailList[0].productname}"><p class="listbtn" style="cursor: pointer">목록</p></a>
<a href="updateReview?reviewcode=${review.reviewcode}"><p class="listbtn"  style="cursor: pointer">수정</p></a>
<a href="deleteReview?reviewcode=${review.reviewcode}"><p class="listbtn" style="cursor: pointer">삭제</p></a>
</c:if>
 */
 
</script>

</head>
<body>

		<div id="productInquiryBoard_wrapper">
			
			<p class="pibTitle">상품 후기</p>
			<form action="getReviewList.do" method="post">
					<input type="hidden" name="productname" value="${productname }">
					<!-- TODO: 상품 후기 [등록하기]는 로그인을 해야 이용할 수 있도록 c:if 로그인값 존재시 보이는 것으로 태그 처리하기. -->
					<a href="goProductReviewWrite?productcode=${productDetailList[0].productcode}"><p id="inquiryBtn" class="inquiryBtn" style="cursor: pointer">등록하기</p></a>
				<input type="hidden" name="r_no">
					<c:forEach var="review" items="${reviewtableList}" varStatus="v">
						<table id="reviewcontent${review.reviewcode}">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
							<tr>
								<td>${review.reviewcode }</td>
								<td style="cursor: pointer;" class="reviewtitle" user-select="none" onclick="javascript:reviewContent('${review.reviewcode}', '${review.reviewimage}', '${review.reviewcontent}')">${review.reviewtitle }</td>
								<td>작성자: Bcustomer.customername</td>
								<td>${review.reviewdate }</td>
							</tr>
							<tr id="reviewImage${review.reviewcode}" >
							
							</tr>
							<tr id="reviewContent${review.reviewcode}" ></tr>
							<tr id="reviewBtn${review.reviewcode}" ></tr>
						</table>
					</c:forEach>
<%-- 							
								<th>파일 이미지 미리보기 기능(파일 다운로드)	</th>
								<td>
									<c:if test="${review.reviewimage != null}"> <!-- 파일을 업로드 했다면! -->
					                  <img alt="preview" src="download?boardnum=${board.boardnum}">
					               </c:if>
					           	</td> 
--%>
					</form>
				</div>
		
	<input type="hidden" id="productname" value="${productname}">
	<div style="padding-bottom: 220px;"></div>
</body>
</html>