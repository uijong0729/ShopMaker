<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<html>

<script src="/bigstar/resources/js/jquery-3.2.1.min.js">
</script>
<script>
$(document).ready(function(){
	var a = opener.document.getElementById('Bcenter').innerHTML;
	document.getElementById('content').innerHTML = a;
	var itf = document.getElementById('itf').value;
	
	if(itf == '0')
	{
		var con = confirm('적용된 footer가 존재합니다. 적용하시겠습니까?');	
		if(con == true)
		{
			$.ajax({
				url: 'getFooter',
				type: 'post',
				dataType: 'text',
				success: function(result){
					alert(result);
					document.getElementById('footer').innerHTML = result;
				}
			});
			
		}
		else
		{
			
		}
	}
});

</script>


<body>

	<div id="header" style="display: inline-block; width:100%; height: 150px; top: 0; margin: 0;">
		
	</div>


		<div id="content" style="display: inline;">
			
		</div>


	<div id="footer" style="display: inline-block; width:98%; height: 150px; bottom: 0; margin: 0;">
	
		<input id="itf" type="hidden" value="${isThereFooter }">
	
	</div>


</body>

</html>