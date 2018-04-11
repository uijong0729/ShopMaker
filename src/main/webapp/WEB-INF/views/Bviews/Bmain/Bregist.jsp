<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
		<script src="/bigstar/resources/js/jquery-ui.js"></script>
<script>

var counter = 0;

$( function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      position:{
          my:"center",
          at:"right",
          of:"#Bcenter" 
          },
      show: {
        effect: "blind",
        duration: 300
      },
      hide: {
        effect: "explode",
        duration: 300
      }
    });
 
    $( "#opener" ).on( "click", function() {
      $( "#dialog" ).dialog( "open" );
    });
 
} );

$( "#dialog" ).position({
	  my: "right center",
	  at: "right center",
	  of: "document"
	});

$(document).ready(function(){
	
	$('#addComponent').on('click', showAdder);
	
});

function showAdder(){
	
	
	$('#addRow').append('<tr class="rows" id="newrow'+ counter +'"><td width="100px;">텍스트</td><td width="200px;"><input></td><td><input id="delete'+counter+'" class="rowsButton" type="button" value="삭제"></td></tr>');
	counter = counter + 1;
	
	$('.rowsButton').on("click", function() {
		 $(this).parent().parent().remove();
	});
	
}


</script>

</head>
<body>




		<div style="display: inline-block; position: static; margin-top: 150px;">
				
					<table>
						<tr>
							<th width="100px;">아이디</th>
							<td width="200px;"><input id="Bid" name="Bid"></td>	
						</tr>
						
						<tr>
							<th width="100px;">비밀번호</th>
							<td width="200px;"><input type="password" id="Bpw" name="Bpw"></td>
						</tr>
						
						<tr>
							<th width="100px;">비밀번호 확인</th>
							<td width="200px;"><input type="password" id="Bpw2"></td>
						</tr>
					</table>
					
					<h4>선택항목</h4>
					
					<table id="addRow">
							
						
					</table>
					
						<button id="addComponent">새로운 항목을 추가 해보세요</button>
				</div>
				<br><br><br><br>
				
				<input type="submit" value="가입하기">

	<!-- 디지털 아카이빙 -->
	<!-- 스누핑, 스니핑, 스푸핑 -->
		
	<div id="dialog" title="다음 중에서 요소를 추가하세요">
	    <ul style="list-style: none;">
	    	<li><input type="checkbox" value="address">주소</li>
	    	<li><input type="checkbox" value="phone">전화번호</li>
	    	<li><input type="checkbox" value="name">이름</li>
	    </ul>
	</div>

<button id="opener">요소추가</button>
	
</body>
</html>