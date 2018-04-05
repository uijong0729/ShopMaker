<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="/bigstar/resources/css/main.css?ver=2"/>  -->
<!-- <link rel="stylesheet" type="text/css" href="/bigstar/resources/css/eui_board.css?ver=2"/>  -->
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
        var sbAns = new StringBuffer();
        
        str.append('<table border="1"><tr>');
        	str.append('<th style="width: 20%;">글 제목</th>');
        	str.append('<td style="width: 48%;">' + result.qtitle +'</td>');
        str.append('</tr><tr>');
	    	str.append('<td colspan="2"><textarea cols="50" rows="10" readonly="readonly">' + result.qcontent +'</textarea></td></tr>');
	    
	    if(result.qreply == null || result.qreply == '')
	    {
	    	str.append('<tr><td colspan="2"><textarea rows="4" cols="50" id="AqnaReply"></textarea></td></tr>');
	    	//str.append('<tr><td colspan="2"><input id="AqnaReplySubmit" type="button" value="확인"><input id="AqnaReplyDelete" type="button" value="삭제"><td></tr>');
	    	sbAns.append('<input id="AqnaReplySubmit" type="button" class="button" value="확인"> <input id="AqnaReplyDelete" class="button" type="button" value="삭제">');
	    }
	    else
	    {
	    	str.append('<tr><td colspan="2"><textarea rows="4" cols="50" id="AqnaReply">'+ result.qreply +'</textarea></td></tr>');
	    	//str.append('<tr><td colspan="2"><input id="AqnaReplySubmit" type="button" value="확인"><input id="AqnaReplyDelete" type="button" value="삭제"><td></tr>');
	    	sbAns.append('<input id="AqnaReplySubmit" type="button" class="button" value="확인"> <input id="AqnaReplyDelete" class="button" type="button" value="삭제">');
	    }
	
        $('#readQna').html(str.toString());
        $('#answerQna').html(sbAns.toString());
        
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
			        	sb.append('<td style="width: 48%;">' + result.qtitle +'</td>');
			        sb.append('</tr><tr>');
			        sb.append('<td colspan="2"><textarea cols="50" rows="10" readonly="readonly">' + result.qcontent +'</textarea></td></tr>');
			        sb.append('<tr><td colspan="2"><textarea rows="4" cols="50" id="AqnaReply">'+ result.qreply +'</textarea></td></tr>');
			        //sb.append('<tr><td colspan="2"><input id="AqnaReplySubmit" type="button" value="확인"><input id="AqnaReplyDelete" type="button" value="삭제"><td></tr>');
	    			sbAnswer.append('<input id="AqnaReplySubmit" type="button" class="button" value="확인"> <input id="AqnaReplyDelete" type="button"  class="button" value="삭제">');
	    			
				  $('#readQna').html(sb.toString());
				  $('#answerQna').html(sbAnswer.toString());
				  
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
					var sbAnswer = new StringBuffer();
					
	    			sb.append('<table border="1"><tr>');
	    			sb.append('<th style="width: 20%;">글 제목</th>');
	    			sb.append('<td style="width: 48%;">' + result.qtitle +'</td>');
			        sb.append('</tr><tr>');
			        sb.append('<td colspan="2"><textarea cols="50" rows="10" readonly="readonly">' + result.qcontent +'</textarea></td></tr>');
			        sb.append('<tr><td colspan="2"><textarea rows="4" cols="50" id="AqnaReply"></textarea></td></tr>');
			        //sb.append('<tr><td colspan="2"><input id="AqnaReplySubmit" type="button" value="확인"><input id="AqnaReplyDelete" type="button" value="삭제"><td></tr>');
	    			sbAnswer.append('<input id="AqnaReplySubmit" type="button" class="button" value="확인"> <input id="AqnaReplyDelete" class="button" type="button" value="삭제">');
				  
	    			$('#readQna').html(sb.toString());
				    $('#answerQna').html(sbAnswer.toString());
	    			
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
		
		.clcik{
		
		cursor: pointer;
		text-align: center;
		margin: 3px;
		
		}
		
		.borderIb{
		display: inline-block;
		margin: 4px;
		background: rgb(38, 48, 52);
 		border-radius: 1em;
  		border-collapse: collapse;
  		margin: 1em;		
		}
		
		textarea {
		
		display: inline-block;
		margin: 4px;
		background: rgb(38, 48, 52);
 		border-radius: 0.25em;
  		border-collapse: collapse;
  		margin: 1em;	
  		color: #fff;  
  		
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
		
		.borderI{
		
		display: inline-block;
		width: 100%;
		margin: 4px;
		
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

		.th60
		{
		width: 60%;
		}
		
		tr:hover {
  		background: #014055;
		}
		
		tr {
  		transition: background 0.25s ease;
		}
		
		.button
		{
		border-radius:34px;
		border:5px solid rgba(255, 255, 255, 0.07);
		color:#ffffff ;
		font-size:10px;
		margin-top:15px;
		text-shadow: 0px 1px 0px rgba(255, 255, 255, 0.15);
		cursor:pointer;
		display:inline-block;
		display:inline-block;
		padding:5px 10px;
		background: none repeat scroll 0% 0% ;
		border-radius:20px;
		box-shadow: 0px 0px 1px rgba(255, 255, 255, 0.3) inset, 0px 2px 0px rgba(255, 255, 255,0.1) inset;
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
					<th class="th10">글 번호</th>
					<th class="title th40">제목</th>
					<th class="th10">작성자</th>
					<th class="th20">문의날짜</th>
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
								<td value="${ql.qtablecode}" class="click clickQna" style="width: 50%; text-align: center;">${ql.qtitle } 
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
							<td value="${ql.qtablecode}" class="click clickQna" style="width: 50%; text-align: center;">${ql.qtitle } </td>
						</c:if>	
						
						<td style="width: 10%; text-align: center;">${ql.membercode }</td>
						<td style="width: 10%; text-align: center;">${ql.qpushdate }</td>									
					
				</c:forEach>
			</table>
		
		<div class="borderI">
			<form id="searchQuestion" action="searchQuestion" method="get">
				<select name="option" id="option">
					<c:if test="${option eq 'qtitle' }">
						<option value="qtitle" selected="selected">제목</option>
						<option value="qcontent">내용</option>
					</c:if>
					<c:if test="${option eq 'qcontent' }">
						<option value="qtitle">제목</option>
						<option value="qcontent" selected="selected">내용</option>	
					</c:if>
					<c:if test="${option == null }">
						<option value="qtitle">제목</option>
						<option value="qcontent">내용</option>	
					</c:if>
				</select>
				
				<input name="keyword" id="keyword" value="${keyword }">
				
				<input type="submit" id="search" value="검색" class="button"> 
				
				<c:if test="${Amember != null }">	
			<div id="writeQna" class="button borderIb">글쓰기</div>
		</c:if>	
			</form>
		</div>
		
		

			
				<div style="text-align: center;" class="borderI">
		
					<c:forEach varStatus="s" begin="1" end="${countQnaList }" step="10">
						<!-- 해당 페이지의 링크 -->
						<c:if test="${s.count != currentpage }">
							<a href="#" onclick="javascript:qnaPage(${s.count });" style="color: #fff">[${s.count }]</a>
						</c:if>
						
						<!-- 해당페이지이면 링크 없애기 -->
						<c:if test="${s.count == currentpage }">
							<b style="color: #fff">[${s.count }]</b>
						</c:if>	
					</c:forEach>		
				</div>	
					
				
		</article>
		
		<div class="borderIb" style="width: 40%;">
			<div id="readQna" class="borderIb">
			 
			
			</div>
			
			<c:if test="${Amember.id eq 'bigstar' }">
				<div id="answerQna" class="borderIb">
					
					
				</div>
			</c:if>
		</div>
		
	<footer>
		<%@ include file="../footer.jsp" %>
	</footer>

</body>

</html>