<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/Bpage/getBoard_Inquiry.css"> 
<script type="text/javascript">
function goqnalist() {
	location.href="Bqnalist";
}
</script>
<title>Insert title here</title>
</head>
<body>
        <br><br><br>
        <div id="getBoardInquiry_wrapper">
            <p class="pibTitle" >상품 문의</p>
            <form method="post" name="replyInsertForm">
                <table>
                    <tr><td class="td1">제목</td><td class="td1">${Inquery.inqu_title}</td></tr>
                    <tr><td>작성자</td><td>${Inquery.m_no}</td></tr>
                    <tr><td>글번</td><td><input class="inquno" type="text" value="${Inquery.inqu_no}" name="inqu_no" readOnly/></td></tr>
                    <tr><td>작성일</td><td>${Inquery.inqu_reg}</td></tr>
                    <tr><td colspan="2" class="boardContent">${Inquery.inqu_content}</td></tr>
                    
                    <tr><td colspan="2" class="boardImg"><img src="/biz/uploadimg/${Inquery.m_id }/${Inquery.fileName_date}.png" style="cursor:pointer" onerror="this.style.display='none'" onclick="doImgPop(this.src)"></td></tr>
                  
                </table>
            <a><p class="listbtn" style="cursor: pointer" onclick="goqnalist()">목록</p></a>
            <c:if test="${authMember.m_no ==Inquery.m_no }">
            <a href="updateInquery.jsp?inqu_no=${Inquery.inqu_no}"><p class="listbtn" style="cursor: pointer">수정</p></a>
            <a href="deleteInquery.do?inqu_no=${Inquery.inqu_no}&r_no=${Inquery.r_no}"><p class="listbtn" style="cursor: pointer">삭제</p></a>
            </c:if>
			<br>          
            <c:if test="${ empty authMember }">
            <div class="insert_reply">
            	<textarea rows="" cols="" name="inqu_reply_content" class="reply_content" required="required" disabled="disabled">로그인한 사람에게만 댓글 쓰기를 허용합니다.</textarea>
            	<button class="listbtn btnReply" style="cursor: pointer" onclick="loginAlert()">댓글달기</button>
            </div>
            </c:if>
            <c:if test="${! empty authMember }">
            <div class="insert_reply">
            	<textarea rows="" cols="" name="inqu_reply_content" class="reply_content" required="required" ></textarea>
            	<button name="insertButton" class="listbtn btnReply" style="cursor: pointer">댓글달기</button>
            </div>
            </c:if>
            </form>
            

        </div>
        

        
</body>
</html>