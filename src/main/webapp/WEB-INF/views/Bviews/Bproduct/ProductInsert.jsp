<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="./resources/css/Bpage/sellerProductUpload.css?ver=1" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script src="/bigstar/resources/js/jquery-ui.js"></script>
<script type="text/javascript">
	//탭
	$(function() {
		$("#tabs").tabs();
	});
</script>

<title>ProductInsert</title>
</head>
<body>
	<!-- 탭 부분 -->
	<div id="tabs">

		<!-- 탭 리스트 -->
		<ul >
			<li style="margin-left: 250px;"><a href="#tabs-1" style="width: 500px;">상품 등록</a></li>
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
				<form method="post" action="insertproduct">
					<table class="optionBox">
						<tr>
							<td>상품 종류</td>
							<td><input name="productkind" type="text"><font
								style="font-size: 13px; margin-left: 5px"></font></td>
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
										<img id="img1" />
									</div>

									<div class="filebox">
										<input class="upload-name" value="파일선택" readOnly> <label
											for="input_img1">업로드</label> <input type="file"
											id="input_img1" class="upload-hidden">
									</div>
								</div>

							</td>
						</tr>
						<tr>
							<td>상품상세사진<br>(가로 800px 이하의 사진)
							</td>
							<td>
								<div name="dtimgbox1">
									<p class="imgbox_text">
										<b style="font-size: 14px;">&lt; 제품 상세이미지 &gt;</b>
									</p>
									<div class="dtimg_wrap">
										<img id="img3" />
									</div>
									<div class="dtfilebox">
										<input class="dtupload-name" value="파일선택" readOnly> <label
											for="input_img3">업로드</label> <input type="file"
											id="input_img3" class="dtupload-hidden">
									</div>
								</div>

								<div name="dtimgbox2">
									<div class="dtimg_wrap">
										<img id="img4" />
									</div>
									<div class="dtfilebox">
										<input class="dtupload-name" value="파일선택" readOnly> <label
											for="input_img4">업로드</label> <input type="file"
											id="input_img4" class="dtupload-hidden">
									</div>
								</div>
							</td>
						</tr>
					</table>
					<!-- <button type="button" onclick="valueShow()">valueShow</button> -->
					<center>
						<input type="submit" class="submitBtn" style="cursor: pointer"
							value="등록">
					</center>
				</form>
			</div>

		</div>

		<!-- 제 2탭 -->
		<div id="tabs-2"></div>


	</div>





</body>
</html>