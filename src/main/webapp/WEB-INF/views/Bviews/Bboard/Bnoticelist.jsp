<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/Bpage/getNoticeList.css">
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function gonoticewrite() {
	location.href="Bnoticewrite";
}
</script>
</head>
<body>
<div class="wraper">
		<br> <br> <br>
		<div id="noticeList_wrapper">
			<p class="pibTitle">공지사항</p>
			<form action="getNoticeList.do" method="post">
				<div class="selectDiv">

					<select id="selectBox" name="searchCondition">
						<c:forEach items="${conditionMap }" var="option">
							<option value="${option.value }">${option.key }
						</c:forEach>
					</select> <input id="selectText" name="searchKeyword" type="text"> <input
						id="selectBtn" type="submit" value="검색" style="cursor: pointer">

				</div>

				<c:if test="${! empty authMember }">
					<c:if test="${authMember.m_id eq 'ndgndg91' }">
						<a><p class="inquiryBtn" style="cursor: pointer" onclick="gonoticewrite()">공지하기</p></a>
					</c:if>
				</c:if>

				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>

					<c:if test="${noticePage.hasNoNotices() }">
						<tr>
							<td colspan="5">공지사항이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${noticePage.content}" var="notice">

						<tr>
							<td>${notice.notice_no}</td>
							<td><a id="notice_title" href="getNotice.do?notice_no=${notice.notice_no}">${notice.notice_title}</a></td>
							<td>관리자</td>
							<td>${notice.reg_date}</td>
							<td>${notice.notice_cnt }</td>
						</tr>
					</c:forEach>
					<c:if test="${noticePage.hasNotices() }">
						<tr>
							<td colspan="5">
								<c:if test="${noticePage.startPage > 5 }">
									<a class="paging"href="getNoticeList.do?pNo=${noticePage.startPage -5 }">[이전]</a>
								</c:if>
								<c:forEach var="pNo" begin="${noticePage.startPage }" end="${noticePage.endPage }">
									<a class="paging"href="getNoticeList.do?pNo=${pNo }">[${pNo }]</a>
								</c:forEach>
								<c:if test="${noticePage.endPage < noticePage.totalPages }">
									<a class="paging"href="getNoticeList.do?pNo=${noticePage.startPage+5 }">[다음]</a>
								</c:if>
							</td>
						</tr>
					</c:if>
				</table>
			</form>
		</div>
	</div>
</body>
</html>