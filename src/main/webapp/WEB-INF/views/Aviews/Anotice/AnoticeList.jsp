<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> list </title>
<style type="text/css">

		.borderIb{
		
		display: inline-block;
		margin: 4px;
		background: rgb(38, 48, 52);
 		border-radius: 0.25em;
  		border-collapse: collapse;
  		margin: 1em;		
		
		}
		
		th {
  		border-bottom: 1px solid #364043;
  		color: #fff;
  		font-size: 0.85em;
  		font-weight: 600;
  		padding: 0.5em 1em;
  		text-align: left;
  		text-align: center;		
		}
		
		td {
		color: #fff;
    	text-align: center;
		}
		
		.th10
		{
		width: 10%;
		}

		.th20
		{
		width: 20%;
		}

		.th30
		{
		width: 30%;
		}


		.th40
		{
		width: 40%;
		}
		
		tr:hover {
  		background: #014055;
		}
		
		tr {
  		transition: background 0.25s ease;
		}
		
		
</style>
<script type="text/javascript">
	function writeForm(){
		location.href = "AnoticeWriteForm";
	}
	
	function pagingFormSubmit(currentPage){
		var form = document.getElementById("pagingForm");
		var page = document.getElementById("page");
		page.value = currentPage;
		form.submit();
	}
	
	function goHome(){
		location.href = "../";
	}

</script> 
</head>
<body>

	<header>
		<%@ include file="../header.jsp" %>
	</header>

<h2 style="text-align: center;">[ ShopMaker 공지사항 ]</h2>

<div style="text-align: center;">
	<table class="borderIb">
		<tr>
			<th class="th10">번호</th>
			<th class="th30">제목</th>
			<th class="th10">조회수</th>
			<th class="th20">등록일</th>
		</tr>
	
	<c:forEach var="notice" items="${noticelist}">
		<tr>
			<td>${notice.noticecode}</td>
			<td><a href="AnoticeReadForm?noticecode=${notice.noticecode}">${notice.ntitle}</a></td>
			<td>${notice.nhitup}</td>
			<td>${notice.ndate}</td>
		</tr>	
	</c:forEach>
	</table>
	

	
	<div style="display: inline-block;  margin-left: 20%; margin-right: 20%; width: 50%;">
		<div style="text-align: center; display: block;">


			
			<c:forEach varStatus="s" begin="1" end="${countNoticeList }" step="10">
				<!-- 해당 페이지의 링크 -->
			<c:if test="${s.count != currentpage }">
					<a href="AnoticeList?page=${s.count}">${s.count}</a>
			</c:if>
			
			<!-- 해당페이지이면 링크 없애기 -->
			<c:if test="${s.count == currentpage }">
				<b>[${s.count }]</b>
			</c:if>	
			</c:forEach>
			
		</div>	
	</div>
	
	
</div>

<div style="text-align: center;">
	<div style="display: inline-block;">
	<c:if test="${Amember.id eq 'bigstar'}">
		<input type="button" value="공지사항 작성" onclick="writeForm()">
	</c:if>
	</div>
</div>
<br>


    <footer>
		<%@ include file="../footer.jsp" %>
	</footer>
	
</body>
</html>