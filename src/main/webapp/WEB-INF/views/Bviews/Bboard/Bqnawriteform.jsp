<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/Bpage/insertBoard.css?ver=1">
<script type="text/javascript">
function goqnalist() {
	location.href="Bqnalist";
}
</script>
</head>
<body>

	<br>
	<br>
	<br>
	<div id="insertBoard_wrapper">
		<p class="insertBoard_Title">상품 문의</p>
		<form action="insertInquery.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="date" name="fileName_date">
			<table>
				<tr>
					<td class="td1">제목</td>
					<td class="td1"><input type="text" name="inqu_title" class="inpt">
					</td>
				</tr>
 				<tr>
					<td>작성자</td>
					<td>
						<input type="text" name="m_name" class="writerbox" value="${authMember.m_name }" readOnly>
						<input type="hidden" name="m_no" value="${authMember.m_no }"> 
						<input type="hidden" name="m_id" value="${authMember.m_id }">
						<input type="hidden" name="r_no" value="${r_no}" id ="r_no">
					</td>
				</tr>

				<tr>
					<td colspan="2" class="boardContent"><textarea name="inqu_content"
							class="content_inpt" rows="10" cols="30"></textarea></td>
				</tr>
				
				
				
			</table>
			<a><button type="button" class="submit_btn1" style="cursor: pointer" onclick="goqnalist()">목록</a>
			<button type="submit" class="submit_btn2" style="cursor: pointer">작성</button>
			
		</form>

	</div>
</body>
</html>