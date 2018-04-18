<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="./resources/js/jquery-3.2.1.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>마이페이지</title>
	</head>
	<body>
		<header>
		<%@ include file="../header.jsp" %>
	</header>
		<div style="width: 100%; height: 100%; text-align: center;">
			${Amember.id}님 환영합니다<br>
			<button onclick="location.href='goBmain'">쇼핑몰 생성</button> <button onclick="location.href='goBmain'">쇼핑몰 관리</button> <button>쇼핑몰 삭제</button>
		</div>
		
		
	<footer>
		<%@ include file="../footer.jsp" %>
	</footer>
	</body>
</html>