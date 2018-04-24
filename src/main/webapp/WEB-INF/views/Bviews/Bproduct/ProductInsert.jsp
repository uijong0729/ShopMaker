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
                           <td class="classTd td6"><input type="button" class="submitBtn1" onclick="javascript:delProduct('${a.productcode}')" style="cursor: pointer" value="삭제"></td>
                        </tr>
                     </c:forEach>
                  </table>
                  <center>
                     <input type="submit" class="submitBtn1" style="cursor: pointer"value="삭제">
                  </center>
               </form>
            </div>
            
            
         </div>


      </div>


	</div>





</body>
</html>