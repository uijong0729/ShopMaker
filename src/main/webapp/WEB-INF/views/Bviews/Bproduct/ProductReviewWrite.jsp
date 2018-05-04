<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/Bpage/insertBoard.css">
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">


$(document).ready(function (){
	$('#subBt').on('click', formUpload);
	$('#fileAddBt').on('click', fileFormAdd);
})

function formUpload(){
	
	var formData = new FormData($('#uploadForm')[0]);
	
	$.ajax({
		url : "upload",
		type : "POST",
		dataType: "json",
		//data : $('#uploadForm').serialize(),
		data : formData,
        processData : false,
        contentType : false,
		success : function(result){
			if(result!="1"){
				alert("이미지 업로드에 실패하였습니다.");
				return;
			}
			alert("이미지 업로드가 완료되었습니다.");
			location.href="goMyShop?code=${Amember.membercode}&page=Bmainlist?rows=4";
		},
		error : function(e){
			alert(JSON.stringify(e));
		}
	})		
}

var count = 1;

function fileFormAdd(){
	if(count < 1){
		var str = $('#fileDiv').html();
		str += '<input type="file" name="uploadFile'+(count++)+'">';
		$('#fileDiv').html(str);
	}
}


function goreviewlist() {
	location.href="productReview";
}


</script>
</head>
<body>
	<br>
	<br>
	<br>
	<div id="insertBoard_wrapper">
		<p class="insertBoard_Title">상품 후기</p>
		<form id="uploadForm" enctype="multipart/form-data">
			<!-- review.reviewcode는 시퀀스이기 때문에 히든값을 따로 매핑 할 필요가 없다. -->
			<!-- review.reviewdate는 DB Default 값이 sysdate이기 때문에 히든값을 따로 매핑 할 필요가 없다. -->
			<!-- review.score도 DB Default 값 존재-->
			<table>
				<tr>
					<td class="td1">제목</td>
					<td class="td1"><input type="text" name="reviewtitle" class="inpt">
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<!-- 세션에서 Bcustomer 객체를 불러와서 심어주고 있기 때문에 로그인을 하지 않을 경우 에러가 발생하니 주의! -->
						<input type="text" name="customername" class="writerbox" value="Bigstar" readOnly>
						<%-- <input type="hidden" name="customercode" value="${bCustomer.customercode}">  --%>
					</td>
				</tr>

				<tr>
				
					<td colspan="2" class="boardContent"><textarea name="reviewcontent" class="content_inpt" rows="10" cols="30"></textarea></td>
				</tr>
				<tr>
					<td style="padding-bottom: 8px; padding-top: 8px;">사진 첨부<br><font style="font-size:12px; color:#F78181">사진은 수정이 불가하니<br>신중히 올려주세요</font></td>
					<td>
						<input type="file" class="upload" name="uploadFile" style="padding-top:20px; font-size: 13px;">
						<!-- <input type="button" value="추가" id="fileAddBt" class="button" style="width:50px; font-size:13px; padding:3 0 3 0;"> -->
						<div id="fileDiv">
						</div>
					</td>
				</tr>
			</table>
			<a><button type="button" style="cursor: pointer" class="submit_btn1" onclick="goreviewlist()">목록</a>
			<button type="button" id="subBt" class="submit_btn2" style="cursor: pointer">작성</button>
		</form>

	</div>
</body>
</html>