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
function goreviewlist() {
	location.href="productReview";
}
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<div id="insertBoard_wrapper">
		<p class="insertBoard_Title">상품 후기</p>
		<form action="insertReview.do" enctype="multipart/form-data" method="post">
			<table>
				<tr>
					<td class="td1">제목</td>
					<td class="td1"><input type="text" class="inpt">
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="m_name" class="writerbox" readOnly>
						<input type="hidden"> 
					</td>
				</tr>

				<tr>
				
					<td colspan="2" class="boardContent"><textarea name="re_content" class="content_inpt" rows="10" cols="30"></textarea></td>
				</tr>
				<tr>
					<td style="padding-bottom: 8px; padding-top: 8px;">사진 첨부<br><font style="font-size:12px; color:#F78181">사진은 수정이 불가하니<br>신중히 올려주세요</font></td>
					<td><input type="file" name="uploadFile" style="padding-top:20px; font-size: 13px;"></td>
				</tr>
			</table>
			<a><button  type="button" style="cursor: pointer" class="submit_btn1" onclick="goreviewlist()">목록</a>
			<button type="submit" class="submit_btn2" style="cursor: pointer">작성</button>
			
		</form>

	</div>
</body>
</html>