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
</head>
<body>

	<header>
		<%@ include file="../header.jsp" %>
	</header>
	
 <br><br><br>
<h2>[ 공지사항 게시판 ]</h2>
<br>
<input type="button" value="메인페이지" onclick="goHome()">
<%-- <c:if test="${sessionScope.loginId != null && sessionScope.user_level == 1}"> --%>
	<input type="button" value="공지사항 작성" onclick="writeForm()">
<%-- </c:if> --%>

<br>
<br>

<table boarder="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>조회수</td>
		<td>등록일</td>
	</tr>

<c:forEach var="notice" items="${noticelist}">
	<tr>
		<td>${notice.noticecode}</td>
		<td><a href="readForm?noticecode=${board.noticecode}">${notice.ntitle}</a></td>
		<td>${notice.nhitup}</td>
		<td>${notice.ndate}</td>
	</tr>	
</c:forEach>
</table>

<br>

<%-- <div>
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 5})">◁◁</a>
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a>
		<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
		<c:if test="${counter == navi.currentPage}"><b></c:if>
		<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>
		<c:if test="${counter == navi.currentPage}"></b></c:if>
		</c:forEach>
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">▶</a>
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 5})">▷▷</a>
</div> --%>

<br>
	<%-- <form action="list" method="GET" id="pagingForm"><!-- 똑같은 함수 컨트롤러에 있는 list을 같이 이용하려면 이곳도 GET방식으로 만들어야 한답 -->
            <input type="hidden" name="page" id="page"><!-- 페이지라는 이름을 가지고 현재 페이지 값을 가지고 간다. -->
            <select name="searchSelect">
               <option value="title" <c:if test="${searchSelect == 'title' }"> selected </c:if>>タイトル</option>
               <option value="tc" <c:if test="${searchSelect == 'tc' }"> selected </c:if> >タイトル+内容</option>
               <option value="content" <c:if test="${searchSelect == 'content' }"> selected </c:if>>内容</option>
               <option value="id" <c:if test="${searchSelect == 'id' }"> selected </c:if>>作成者</option>
            </select>
            <input type="text" name="searchText" value="${searchText}"> 
            <input type="button" onclick="pagingFormSubmit(1)" value="検索"> <!-- 특정한 폼을 서브밋 하는 방법 검색을하고나면 항상 1페이지로 가기때문에 1을 넣어 준다. -->
      </form> --%>

<br><br><br>

 	<footer>
		<%@ include file="../footer.jsp" %>
	</footer>
	
</body>
</html>