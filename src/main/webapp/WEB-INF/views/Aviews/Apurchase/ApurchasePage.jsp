<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빅스타 서비스 구매 페이지</title>
</head>
<body>

	<header>
		<%@ include file="../header.jsp"%>
	</header>
	
	

	<h2 style="text-align: center;">빅스타 서비스 구매 페이지</h2>
	
	<br>
	
	<div style="text-align: center;">
		
		<h3>템플릿을 선택하세요</h3>
		<br>
		<label><input type="radio" name="template" value="1">템플릿1</label>
		<label><input type="radio" name="template" value="2">템플릿2</label>
		<label><input type="radio" name="template" value="3">템플릿3</label>
		
		<br><br>
		
		<h3>구매기간(금액)을 선택하세요</h3>
		<br>
		<label><input type="radio" name="days" value="30">30일 (15,000원)</label>
		<label><input type="radio" name="days" value="60">60일 (30,000원)</label>
		<label><input type="radio" name="days" value="90">90일 (45,000원)</label>
		<label><input type="radio" name="days" value="180">180일 (90,000원)</label>
		<label><input type="radio" name="days" value="365">365일 (180,000원)</label>
		
		<br><br>
		
		<h3> ***님의 빅스타 서비스 만료 예정일</h3>
		<mark><strong> 만료 예정일 : 2018.06.23 (예시) </strong></mark>
		<br>
		<sub>*DB에서 ***님의 서비스 만료 예정일 select 후 표시</sub>
		<br>
		<sub>*if 최종결제일이 Null이면 : 현재 sysdate (update) DB 넣기. </sub>
		<br>
		<sub>*if 최종결제일이 Not Null이면 : 만료 예정일 + 추가 결제일(ex +60일) => 해당 변경 사항 Amember Table에 update </sub>
		<br>
		<br>
		<button>구매하기</button>
		<br>
		<sub>*카카오페이 결제 API 기능 구현 필요</sub>
		
	</div>

	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>

</body>
</html>