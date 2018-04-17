<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/Bpage/bproductReviewread.css">
<title>Insert title here</title>
</head>
<body>
<center>
		<br> <br> <br>
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

						<tr>
							<td>임시</td>
							<td><a>임시</a></td>
							<td>임시</td>
							<td>임시</td>
						</tr>

				</table>
		</div>

		</form>
	</center>
</body>
</html>