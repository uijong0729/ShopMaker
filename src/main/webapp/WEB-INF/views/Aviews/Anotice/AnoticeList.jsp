<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> list </title>
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
<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/main.css?ver=3"/> 
<link rel="stylesheet" type="text/css" href="/bigstar/resources/css/eui_board.css?ver=3"/> 
</head>
<body>

	<header>
		<%@ include file="../header.jsp" %>
	</header>
	
 <br><br><br>
<h2 style="text-align: center;">[ ShopMaker 공지사항 ]</h2>
<br>



<br>
<br>
<div style="text-align: center;">
	<table style="display: inline-block;">
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
	
	<br>
	
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
<br><br><br>

    <footer>
		<%@ include file="../footer.jsp" %>
	</footer>
	
</body>
</html>