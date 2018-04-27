<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="./resources/css/Bpage/sellerProductUpload.css?ver=4" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script src="/bigstar/resources/js/jquery-ui.js"></script>
<script type="text/javascript">
	$('#vmMnDataSize').on('change', selectkind);

	//탭
	$(function() {
		$("#tabs").tabs();
	});

	function selectkind() {
		var typekind = $('#vmMnDataSize').val();
		if (typekind == '') {
			return;
		} else {
			$('.forDelete').remove();
			var list = ${json}; 
			var str = '';
			str += '<tr><td>상품 이름</td>';
			str += '<td>상품 가격</td>';
			str += '<td>상품 크기</td>';
			str += '<td>상품 색상</td>';
			str += '<td>상품 수량</td>';
			str += '<td>상품 삭제</td></tr>';
			for (let ele of list) {
				if (ele.productkind == typekind) {
					str += '<tr class="forDelete">';
					str += '<td class="classTd td1">' + ele.productname + '</td>';
					str += '<td class="classTd td2">' + ele.productprice + '</td>';
					str += '<td class="classTd td3">' + ele.productsize + '</td>';
					str += '<td class="classTd td4">' + ele.productcolor + '</td>';
					str += '<td class="classTd td5">' + ele.productquantity + '</td>';
					str += '<td class="classTd td6"><input type="button" class="submitBtn1" onclick="delProduct(' + ele.productcode + ');"style="cursor: pointer" value="삭제"></td>';
					str += '</tr>';
				}
			}
			$('#optionBox').html($('#optionBox1').html() + str);
		}
	}
	function delProduct(pc) {
		location.href='delProduct?productcode=' + pc;
	}

	
	$(document).ready(function (){
		$('#subBt').on('click', formUpload);
	
		$('#input_img').on('change', handleImgFileSelect);
		$('#input_img1').on('change', handleImgFileSelect1);
		$('#input_img2').on('change', handleImgFileSelect2);
		$('#input_img3').on('change', handleImgFileSelect3);
		$('#input_img4').on('change', handleImgFileSelect4);
		$('#input_img5').on('change', handleImgFileSelect5);
		
	})

	function formUpload(){
		
		var formData = new FormData($('#insertproduct')[0]);
		
		$.ajax({
			url : "uploadproduct",
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
				location.href="goBmain";
			},
			error : function(e){
				alert(JSON.stringify(e));
			}
		})		
	}

	var count = 1;

	

	var sel_file;
	
	function handleImgFileSelect(e){
		var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
	}
	
	function handleImgFileSelect1(e){
		var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img1").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
	}
	function handleImgFileSelect2(e){
		var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img2").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
	}
	function handleImgFileSelect3(e){
		var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img3").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
	}
	function handleImgFileSelect4(e){
		var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img4").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
	}
	function handleImgFileSelect5(e){
		var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img5").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
	}
	
</script>
<style type="text/css">
submitBtn {
	height: 100%;
}
</style>

<title>ProductInsert</title>
</head>
<body>


	<!-- 탭 부분 -->
	<div id="tabs">

		<!-- 탭 리스트 -->
		<ul>
			<li style="margin-left: 250px;"><a href="#tabs-1"
				style="width: 500px;">상품 등록</a></li>
			<li><a href="#tabs-2" style="width: 500px;">상품 삭제</a></li>
		</ul>

		<!-- 제 1탭 -->
		<div id="tabs-1">
			<div class="sellerProduct_wrapper">
				<div class="sellerProduct_header">
					<p class="sellerProduct_title1">상품등록_</p>
					<p class="sellerProduct_titl2">자세한 상품등록 방법은 공지사항에서 확인해주세요</p>
				</div>
				<div id="clear"></div>
				<form id="insertproduct" enctype="multipart/form-data">
					<table class="optionBox">
						<tr>
							<td>상품 종류</td>
							<td><select
								id="productkind" name="productkind">
									<option id="selectprokind" value="">선택</option>

									<option value="Sofa">Sofa</option>
									<option value="Rug">Rug</option>
									<option value="Storage">Storage</option>
									<option value="AndSoOn">AndSoOn</option>
									<option value="Table">Table</option>
									<option value="Chair">Chair</option>
									<option value="Cabinet">Cabinet</option>
									<option value="AndSoOn ">AndSoOn </option>
									<option value="Bed">Bed</option>
									<option value="Wardrobe">Wardrobe</option>
									<option value="Desk">Desk</option>
									<option value="ETC">ETC</option>
									<option value="BabyBed">BabyBed</option>
									<option value="BabyDesk">BabyDesk</option>
									<option value="BookShelf">BookShelf</option>
									<option value="ETC ">ETC </option>


							</select></td>
						</tr>
						<tr>
							<td>상품명</td>
							<td><input name="productname" type="text" name="p_name"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input name="productprice" type="text"><font
								style="font-size: 13px; margin-left: 5px">원</font></td>
						</tr>
						<tr>
							<td>수량</td>
							<td id="type_detail"><input name="productquantity"
								type="text"><font
								style="font-size: 13px; margin-left: 5px">개</font></td>
						</tr>
						<tr>
							<td>사이즈</td>
							<td><input name="productsize" type="text"
								placeholder="숫자만 입력해주세요."><font
								style="font-size: 13px; margin-left: 5px"></td>
						</tr>
						<tr>
							<td>색상</td>
							<td><input name="productcolor" type="text"><font
								style="font-size: 13px; margin-left: 5px"></td>
						</tr>

						<tr>
							<td>상품설명</td>
							<td><textarea name="productspec"
									style="width: 600px; height: 300px; margin-top: 10px; margin-bottom: 10px;"></textarea></td>
						</tr>
						<tr>
							<td>노출이미지 (350x350)</td>
							<td>
								<div name="imgbox">
									<p class="imgbox_text">
										<b style="font-size: 14px;">&lt; 사진 1 &gt;</b> 상품 목록에서 기본으로
										보이는 사진
									</p>
									<div class="img_wrap">
										<img id="img" />
									</div>
									<!-- <input type="file" id="input_img" class="upload"
										name="uploadFile" style="padding-top: 20px; font-size: 13px;">
									<input type="button" value="추가" id="fileAddBt" class="button" style="width:50px; font-size:13px; padding:3 0 3 0;">
									<div id="fileDiv"></div> -->
									<div class="dtfilebox">
										<input type="file" id="input_img" class="upload"
											name="uploadFile" value="파일선택" readOnly> <label
											for="input_img" id="fileAddBt">업로드</label> <input type="file"
											id="input_img" class="dtupload-hidden">
										<div id="fileDiv"></div>
									</div>
								</div>

							</td>
						</tr>

						<tr>
							<td>상품상세사진<br>(가로 800px 이하의 사진)
							</td>
							<td>
								<!-- <div name="dtimgbox1">
									<p class="imgbox_text">
										<b style="font-size: 14px;">&lt; 제품 상세이미지 &gt;</b>
									</p>
									<div class="dtimg_wrap">
										<img id="img1" />
									</div>
									<input type="file" id="input_img1" class="dtupload-name" name="uploadFile"
										style="padding-top: 20px; font-size: 13px;">
									<input type="button" value="추가" id="fileAddBt" class="button" style="width:50px; font-size:13px; padding:3 0 3 0;">
									<div id="fileDiv"></div>
								</div> -->

								<div name="dtimgbox1">
									<p class="imgbox_text">
										<b style="font-size: 14px;">&lt; 제품 상세이미지 &gt;</b>
									</p>
									<div class="dtimg_wrap">
										<img id="img1" />
									</div>
									<div class="dtfilebox">
										<input type="file" id="input_img1" class="dtupload-name"
											name="uploadFile1" value="파일선택" readOnly> <label
											for="input_img1" id="fileAddBt">업로드</label> <input
											type="file" id="input_img1" class="dtupload-hidden">
										<div id="fileDiv"></div>
									</div>
								</div>

								<div name="dtimgbox2">
									<div class="dtimg_wrap">
										<img id="img2" />
									</div>
									<div class="dtfilebox">
										<input type="file" id="input_img2" class="dtupload-name"
											name="uploadFile2" value="파일선택" readOnly> <label
											for="input_img2" id="fileAddBt">업로드</label> <input
											type="file" id="input_img2" class="dtupload-hidden">
										<div id="fileDiv"></div>
									</div>
								</div>

								<div name="dtimgbox3">
									<div class="dtimg_wrap">
										<img id="img3" />
									</div>
									<div class="dtfilebox">
										<input type="file" id="input_img3" class="dtupload-name"
											name="uploadFile3" value="파일선택" readOnly> <label
											for="input_img3" id="fileAddBt">업로드</label> <input
											type="file" id="input_img3" class="dtupload-hidden">
										<div id="fileDiv"></div>
									</div>
								</div>

								<div name="dtimgbox4">
									<div class="dtimg_wrap">
										<img id="img4" />
									</div>
									<div class="dtfilebox">
										<input type="file" id="input_img4" class="dtupload-name"
											name="uploadFile4" value="파일선택" readOnly> <label
											for="input_img4" id="fileAddBt">업로드</label> <input
											type="file" id="input_img4" class="dtupload-hidden">
										<div id="fileDiv"></div>
									</div>
								</div>

								<div name="dtimgbox5">
									<div class="dtimg_wrap">
										<img id="img5" />
									</div>
									<div class="dtfilebox">
										<input type="file" id="input_img5" class="dtupload-name"
											name="uploadFile5" value="파일선택" readOnly> <label
											for="input_img5" id="fileAddBt">업로드</label> <input
											type="file" id="input_img5" class="dtupload-hidden">
										<div id="fileDiv"></div>
									</div>
								</div>
							</td>
						</tr>
					</table>
					<!-- <button type="button" onclick="valueShow()">valueShow</button> -->
					<center>
						<input id="subBt" type="button" class="submitBtn"
							style="cursor: pointer" value="등록">
					</center>
				</form>
			</div>

		</div>

		<!-- 제 2탭 -->
		<div id="tabs-2">

			<div class="sellerProduct_wrapper">
				<div class="sellerProduct_header">
					<p class="sellerProduct_title1">상품삭제_</p>
					<p class="sellerProduct_titl2">삭제할 상품 종류를 선택하세요?</p>
					<p>
						<select id="vmMnDataSize" name="dataVolumn">
							<option id="selectDataSize" value="">선택</option>
							<c:forEach items="${selectkind}" var="s">
								<option value="${s.productkind }">${s.productkind }</option>
							</c:forEach>
						</select>
					</p>

				</div>
				<div id="deletelist">
					<form method="post" action="deleteproduct">
						<table id="optionBox" class="optionBox1">
							<tr>
								<td>상품 이름</td>
								<td>상품 가격</td>
								<td>상품 크기</td>
								<td>상품 색상</td>
								<td>상품 수량</td>
								<td>상품 삭제</td>
							</tr>
							<c:forEach items="${allproduct}" var="a">
								<tr class="forDelete">

									<td class="classTd td1">${a.productname }</td>
									<td class="classTd td2">${a.productprice }</td>
									<td class="classTd td3">${a.productsize }</td>
									<td class="classTd td4">${a.productcolor }</td>
									<td class="classTd td5">${a.productquantity }</td>
									<td class="classTd td6"><input type="button"
										class="submitBtn1"
										onclick="javascript:delProduct('${a.productcode}')"
										style="cursor: pointer" value="삭제"></td>
								</tr>
							</c:forEach>
						</table>
						<center></center>
					</form>
				</div>
			</div>
		</div>
	</div>





</body>
</html>