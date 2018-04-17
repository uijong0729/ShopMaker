<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/Bpage/getBoardList_Inquiry1.css">
<script type="text/javascript">
function gowriteform() {
	location.href="Bqnawriteform";
}
</script>
</head>
<body>
<center>
		<br> <br> <br>
		<div id="productInquiryBoard_wrapper">
			<p class="pibTitle">상품 문의하기</p>
			<form action="getInqueryList.do" method="post">
				<div class="selectDiv">
					<select id="selectBox" name="searchCondition" size="1">
						<option value="TITLE"
							<c:if test="${'TITLE'== searchCondition}">selected</c:if>>제목</option>
						<option value="CONTENT"
							<c:if test="${'CONTENT'== searchCondition}">selected</c:if>>내용</option>
					</select> <input id="selectText" name="searchKeyword"
						value="${searchKeyword }" type="text"> <input
						id="selectBtn" type="submit" value="검색" style="cursor: pointer"
						onclick="check()">
				</div>

				<c:if test="${ ! empty authMember }">
					<a><p class="inquiryBtn" style="cursor: pointer" onclick="gowriteform()">문의하기</p></a>
				</c:if>
				<input type="hidden" value="${r_no }" name="r_no">

				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>

					<c:forEach items="${InqueryPage.content}" var="Inquery">

						<tr>
							<td>${Inquery.inqu_no}</td>

							<td><a href="getInquery.do?inqu_no=${Inquery.inqu_no}">${Inquery.inqu_title}</a></td>
							<td>${Inquery.m_name}</td>
							<td>${Inquery.reg_date}</td>
							<td>${Inquery.inqu_cnt}</td>
						</tr>
					</c:forEach>
					<c:if test="${InqueryPage.hasInqueries() }">
						<tr>
							<td colspan="5"><c:if test="${InqueryPage.startPage > 5 }">
									<a class="paging"
										href="getInqueryList.do?r_no=${r_no }&pNo=${InqueryPage.startPage -5 }">[이전]</a>
								</c:if> <c:forEach var="pNo" begin="${InqueryPage.startPage }" end="${InqueryPage.endPage }">
									<a class="paging"
										href="getInqueryList.do?r_no=${r_no }&pNo=${pNo }">[${pNo }]</a>
								</c:forEach> <c:if test="${InqueryPage.endPage < InqueryPage.totalPages }">
									<a class="paging"
										href="getInqueryList.do?r_no=${r_no }&pNo=${InqueryPage.startPage+5 }">[다음]</a>
								</c:if></td>
						</tr>
					</c:if>

				</table>
		</div>


		</form>
	</center>
</body>
</html>