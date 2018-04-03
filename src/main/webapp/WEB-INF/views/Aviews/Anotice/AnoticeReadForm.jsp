<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> readForm </title>
<script type="text/javascript">

	function deleteBoard(boardnum){
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href="deleteAnotice?noticecoe="+noticecode;
		}
	}
	

</script>

</head>
<body>
	<header>
		<%@ include file="../header.jsp" %>
	</header>
<br><br><br>
<h2>[공지사항 ]</h2>
<br>
	<table>
		<tr>
			<th>작성일</th>
			<td>${notice.ndate}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${notice.nhitup}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${notice.ntitle}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${notice.ncontent}</td>
		</tr>
	</table>


	<br>
	<br>
<br><br><br>
	<footer>
		<%@ include file="../footer.jsp" %>
	</footer>
</body>
</html>