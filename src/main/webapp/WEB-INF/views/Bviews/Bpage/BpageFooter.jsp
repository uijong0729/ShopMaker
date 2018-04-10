<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/bigstar/resources/css/headerfooter.css?ver=4">
<script src="/bigstar/resources/js/jquery-3.2.1.min.js">
		</script>
<script>

$(document).ready(function(){
	$('#applyFooter').on('click', apply);
    $('#cancleFooter')on('click', cancle);
});

function cancle(){
	var getId = document.getElementById('getId').value;
	$.ajax({
		url: 'footerCancle',
		type: 'post',
		data: {getId: getId},
		dataType: 'text',
		success: function(){
			alert('제거');
		}
	});
}

function apply(){
	var text = document.getElementById('footer').innerHTML;
	var getId = document.getElementById('getId').value;
		
	$.ajax({
		url: 'makeFooter',
		type: 'post',
		data:{text: text, getId: getId},
		dataType: 'text',
		success: function(result){
			if(result == '0')
			{
				alert('적용 되었습니다.');
			}
		}
	});
}

</script>

</head>

	<body>
	<input id="getId" type="hidden" value='${Amember.Id }'>
	
	<div style="display: inline; height: 150px; border: 1px solid black;">
	
		<div id="footer" style="bottom: 0; display: inline-block; width: 100%; height: 150px; border: 1px solid black;">
		
		
		
		</div>
	
	</div>
	
	<input id="applyFooter" type="button" value="footer적용">
	<input id="cancleFooter" type="button" value="footer지우기">
	
	</body>
</html>