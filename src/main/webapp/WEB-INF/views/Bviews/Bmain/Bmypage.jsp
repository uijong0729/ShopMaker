<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>마이페이지</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
		<script src="/bigstar/resources/js/jquery-ui.js"></script>
		
		
<script>
$(document).ready(function(){
			$('#addComponentMp').on('click', addRowMp);
			$('.rowsButton').on("click", removeRow);
});
		
function addRowMp(){
			$('#addrowMp').append('<ul style="list-style: none;"><li><span>텍스트</span></li><li><input> <input class="rowsButton" type="button" value="삭제"></li></ul>');
			$('.rowsButton').on("click", removeRow);
			
}
		
function removeRow(){
			 $(this).parent().parent().remove();
}

$(document).mousedown(function(ev) {
			if (ev.which == 3) {
				if ($(this.activeElement).attr("id").startsWith("button") || $(this.activeElement).attr("id").startsWith("text") || $(this.activeElement).attr("id").startsWith("image") || $(this.activeElement).attr("id").startsWith("select")) {
					return false;
				} else {
					var inputString = prompt('변경할 텍스트를 입력해 주세요', 'none');
					if (inputString == 'none' || inputString == '' || inputString == null) {
						return false;
					} else {
						console.log($(this.activeElement).attr("id"));
						$(this.activeElement).text(inputString);
						return false;
					}
					return false;
				}
			}
});
		
		
$( function() { 		
			$( "#dialog" ).dialog({
			    autoOpen: true,
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
			$('#forHover').mouseleave(function(){
				$(dialog).dialog( "close" );
			});
});
		
$( "#dialog" ).position({
			  my: "right center",
			  at: "right center",
			  of: "document"
});
</script>
		
	</head>
	<body>
	
		<div style="text-align: center;">
			<div style="display: inline-block;">
				<h1 id="text_mypageTitle" tabindex="0">마이페이지</h1>
				
		
			</div>
		</div>
		
		
		
		<%-- dialog 부분 --%>
					<div id="dialog" title="편집 메뉴">
						<h6>요소 추가하기</h6>
					    <ul style="list-style: none; display:inline;">
					    	<li class="li" id="address" color="black"><span>아이디</span></li>
					    	<li class="li" id="phone" color="black"><span>비밀번호</span></li>
					    	<li class="li" id="name" color="black"><span>주소</span></li>
					    	<li class="li" id="name" color="black"><span>전화번호</span></li>
					    	<li class="li" id="name" color="black"><span>이름</span></li>
					    </ul>
					    
					    <h6>배치 수정하기</h6>
					    <ul style="list-style: none; display:inline;">
					    	<li id="tableLayer" class="layer-li">테이블형 배치</li>
					    	<li id="verticalLayer" class="layer-li">수직형 배치</li>
					    </ul>
					</div>
	
	</body>
</html>