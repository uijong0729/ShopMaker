<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/Bpage/insertBoard.css"> 
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function gonoticelist() {
	location.href="Bnoticelist";
}
</script>
</head>
<body>


	<br>
	<br>
	<br>
	<div id="insertBoard_wrapper">
		<p class="insertBoard_Title">공지사항 작성</p>
		<form action="insertNotice.do" enctype="multipart/form-data"
			method="post">
			<table>
				<tr>
					<td class="td1">제목</td>
					<td class="td1"><input type="text" name="notice_title" class="inpt">
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>관리자</td>
				</tr>

				<tr>
					<td colspan="2" class="boardContent"><textarea name="notice_content"
							class="content_inpt" rows="10" cols="30"></textarea></td>
				</tr>
			</table>
			<a><button type="button" class="submit_btn1" style="cursor: pointer" onclick="gonoticelist()">목록</a>
			<button style="cursor: pointer" type="submit" class="submit_btn2" >작성</button>
			
		</form>

	</div>
</body>
</html>