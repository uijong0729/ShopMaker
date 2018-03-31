<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>빅스타 QnA</title>
<script src="/bigstar/resources/js/jquery-3.2.1.min.js">
</script>
<script>
	//스트링버퍼 설정
	var StringBuffer = function() {
	    this.buffer = new Array();
	};
	
	StringBuffer.prototype.append = function(str) {
	    this.buffer[this.buffer.length] = str;
	};
	
	StringBuffer.prototype.toString = function() {
	    return this.buffer.join("");
	};


$(document).ready(function(){
	
	$('#writeQna').on('click', function(){
		var child = window.open("AquestionForm","newwin","width=600px, height=450px");
	});
	
	$('.clickQna').on('click', openContent);

	
});

function openContent(){
	var what = $(this).attr('value');
	//alert(what);
	$.ajax({ 
     url: 'openQna', 
     type: 'get', 
     data:{what: what}, 
     dataType: 'json', 
     success: function(result) 
     { 
        //alert(result);
        var str = new StringBuffer();
        
        str.append('<table border="1"><tr>');
        	str.append('<th style="width: 20%;">글 제목</th>');
        	str.append('<td style="width: 78%;">' + result.qtitle +'</td>');
        str.append('</tr><tr>');
	    	str.append('<td colspan="2"><textarea cols="70" rows="10" readonly="readonly">' + result.qcontent +'</textarea></td></tr>');
	    
	    if(result.qreply == null || result.qreply == '')
	    {
	    	str.append('<tr><td colspan="2"><textarea rows="4" cols="70" id="AqnaReply"></textarea></td></tr>');
	    	str.append('<tr><td colspan="2"><input id="AqnaReplySubmit" type="button" value="확인"><input id="AqnaReplyDelete" type="button" value="삭제"><td></tr>');
	    }
	    else
	    {
	    	str.append('<tr><td colspan="2"><textarea rows="4" cols="70" id="AqnaReply">'+ result.qreply +'</textarea></td></tr>');
	    	str.append('<tr><td colspan="2"><input id="AqnaReplySubmit" type="button" value="확인"><input id="AqnaReplyDelete" type="button" value="삭제"><td></tr>');	    	
	    }
	
        $('#readQna').html(str.toString());
        
	    $('#AqnaReplySubmit').on('click', function(){
	    	var msg = $('#AqnaReply').val();
	    	var qtablecode = result.qtablecode;
	    	//alert(msg);
	    	$.ajax({
	    		url: 'AqnaReply',
	    		type: 'post',
	    		data: {msg: msg, qtablecode: qtablecode, req: 1},
	    		dataType: 'json',
	    		success: function(result){
	    			//alert(result);
	    			var sb = new StringBuffer();
	    			
	    			sb.append('<table border="1"><tr>');
			        	sb.append('<th style="width: 20%;">글 제목</th>');
			        	sb.append('<td style="width: 78%;">' + result.qtitle +'</td>');
			        sb.append('</tr><tr>');
			        sb.append('<td colspan="2"><textarea cols="70" rows="10" readonly="readonly">' + result.qcontent +'</textarea></td></tr>');
			        sb.append('<tr><td colspan="2"><textarea rows="4" cols="70" id="AqnaReply">'+ result.qreply +'</textarea></td></tr>');
			        sb.append('<tr><td colspan="2"><input id="AqnaReplySubmit" type="button" value="확인"><input id="AqnaReplyDelete" type="button" value="삭제"><td></tr>');
	    			
				  $('#readQna').html(sb.toString());
				  alert('작성되었습니다.');
	    		}
	    		
	    	});
		});
 		$('#AqnaReplyDelete').on('click', function(){
 			var msg = '';
	    	var qtablecode = result.qtablecode;
 			$.ajax({
	    		url: 'AqnaReply',
	    		type: 'post',
	    		data: {msg: msg, qtablecode: qtablecode, req: 2},
	    		dataType: 'json',
	    		success: function(result){
	    			//alert(result);
					var sb = new StringBuffer();
	    			
	    			sb.append('<table border="1"><tr>');
	    			sb.append('<th style="width: 20%;">글 제목</th>');
	    			sb.append('<td style="width: 78%;">' + result.qtitle +'</td>');
			        sb.append('</tr><tr>');
			        sb.append('<td colspan="2"><textarea cols="70" rows="10" readonly="readonly">' + result.qcontent +'</textarea></td></tr>');
			        sb.append('<tr><td colspan="2"><textarea rows="4" cols="70" id="AqnaReply"></textarea></td></tr>');
			        sb.append('<tr><td colspan="2"><input id="AqnaReplySubmit" type="button" value="확인"><input id="AqnaReplyDelete" type="button" value="삭제"><td></tr>');
	    			
				  $('#readQna').html(sb.toString());
				  alert('삭제되었습니다.');
	    		}
	    		
	    	});
		});
        
     }
	});
}

function qnaPage(page){
	location.href="AqnaPage?page=" + page;
}
</script>

	<style type="text/css">
		
		.button{
		
		cursor: pointer;
		text-align: center;
		margin: 3px;
		
		}
		
		.borderIb{
		
		display: inline-block;
		border: 1px dotted black;
		margin: 4px;
		
		}
		
		.borderI{
		
		display: inline-block;
		border: 1px dotted black;
		width: 100%;
		margin: 4px;
		
		}
		
	</style>
</head>
<body>
	
	<header>
		<%@ include file="../header.jsp" %>
	</header>
		<article class="borderIb" style="width: 55%;">
			<table class="borderIb">
				<tr>
					<th>글 번호</th>
					<th style="width: 50%;">제목</th>
					<th>작성자</th>
					<th style="width: 30%;">문의날짜</th>
					<!-- 내용, 감추기/보이기, 답글, 답변날짜-->
				</tr>
			
			
			<!-- //0 : 공개글
			//1 : 비밀글		 -->	
				
				<!-- 반복출력 -->
				
				<c:forEach items="${qnaList }" var="ql">
					<tr id="AQnAcontent" style="text-align: center;">
						<td style="width: 10%; text-align: center;">${ql.qtablecode }</td>
						
						<c:if test="${ql.qvisible == 1 }">
							<!-- 로그인 당사자일 경우 비밀글 접근-->
							<c:if test="${ql.membercode == Amember.membercode}">
								<td value="${ql.qtablecode}" class="button clickQna" style="width: 50%; text-align: center;">${ql.qtitle } 
									<span style="color: red;">(비밀글)</span>
								</td>
							</c:if>
							
							<!-- 로그인 당사자가 아닌 경우의 비밀글 접근 -->
							<c:if test="${ql.membercode != Amember.membercode}">
								<td value="${ql.qtablecode}" style="width: 50%; text-align: center;">${ql.qtitle } 
									<span style="color: red;">(비밀글)</span>
								</td>
							</c:if>
						</c:if>
						
						<!-- 일반글 접근 -->
						<c:if test="${ql.qvisible == 0 }">
							<td value="${ql.qtablecode}" class="button clickQna" style="width: 50%; text-align: center;">${ql.qtitle } </td>
						</c:if>	
						
						<td style="width: 10%; text-align: center;">${ql.membercode }</td>
						<td style="width: 10%; text-align: center;">${ql.qpushdate }</td>									
					
				</c:forEach>
			</table>
		
		<div></div>
		
		<c:if test="${Amember != null }">	
			<div id="writeQna" class="button borderIb">글쓰기</div>
		</c:if>	

			
				<div style="text-align: center;" class="borderI">
		
					<c:forEach varStatus="s" begin="1" end="${countQnaList }" step="10">
						<!-- 해당 페이지의 링크 -->
						<c:if test="${s.count != currentpage }">
							<a href="#" onclick="javascript:qnaPage(${s.count });">[${s.count }]</a>
						</c:if>
						
						<!-- 해당페이지이면 링크 없애기 -->
						<c:if test="${s.count == currentpage }">
							<b>[${s.count }]</b>
						</c:if>	
					</c:forEach>
		
				</div>	
					
			<c:if test="${currentpage > 1 }">
				<div style="text-align: center;" class="borderIb">
					<a href="AqnaPage?page=${currentpage - 1 }"><div>이전</div></a>	
				</div>
			</c:if>
			
			<c:if test="${currentpage < lastPage }">
			<div style="margin-left: 90%;" class="borderIb">
				<a href="AqnaPage?page=${currentpage + 1 }"><div>다음</div></a>
			</div>
			</c:if>	
				
		</article>
		
		<div id="readQna" class="borderIb" style="width: 40%;">
		 
		
		</div>
		
	<footer>
		<%@ include file="../footer.jsp" %>
	</footer>

</body>

</html>