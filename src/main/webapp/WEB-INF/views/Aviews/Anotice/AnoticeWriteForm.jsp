<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[공지사항 작성]</title>
</head>
<body>

	<header>
		<%@ include file="../header.jsp"%>
	</header>
	
	<br>
	<br>
	
	<h2>[공지사항 작성]</h2>
	<br>
	<form action="writeAnotice" method="post" onsubmit="javascript:check()">
		<%-- <input type="hidden" name="id" value="${sessionScope.Amember.id}"> --%>
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="ntitle" id="ntitle" size="99"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="40" cols="100" name="ncontent" id="ncontent"></textarea></td>
			</tr>
			<tr>
				<!-- TODO: 팝업공지 여부 선택기능 구현 필요 / DB에 npopu -->
				<td>팝업여부  :</td>
				<td><input type="radio" name="npopup" value="1">O&emsp;&emsp;<input type="radio" name="npopup" value="0">X</td>
			</tr>
		</table>
		<input type="submit" value="저장하기">
	</form>
	<br>
	<br>

	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>

</body>
</html>