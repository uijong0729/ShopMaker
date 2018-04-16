<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/Bpage/sellerProductUpload.css?ver=1" />
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#size_type').on('change',selectSize);	
});

function selectSize() {
	var sizetype = document.getElementById('size_type');
	var msg = sizetype.value;
	
	if(msg == '직접입력'){
		document.getElementById('size').value = '';
	} else {
		document.getElementById('size').value = msg;
	}
}
</script>
<title>ProductInsert</title>
</head>
<body>
	<div class="sellerProduct_wrapper">
    <div class="sellerProduct_header">
    <p class="sellerProduct_title1">상품등록_</p>
   	<p class="sellerProduct_titl2">자세한 상품등록 방법은 공지사항에서 확인해주세요</p>
</div>
<div id="clear"></div>
    <form name="options" method="post" action="insertProduct.do" enctype="multipart/form-data">
        <table class="optionBox">
            <tr>
                <td >상품타입</td> <!-- productkind -->
                <td>
                    <select id="select_type" name="p_type">
                        <option selected>Outer</option>
                        <option>Top</option>
                        <option>Bottom</option>
                        <option>Shoes</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>상품명</td>
                <td><input class="productname" type="text" name="p_name"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input class="price" type="text"><font style="font-size: 13px; margin-left: 5px">원</font></td>
            </tr>
            <tr>
                <td>수량</td>
                <td id="type_detail">
                    <input class="price" type="text"><font style="font-size: 13px; margin-left: 5px">개</font>
                </td>
          	</tr>
            <tr>
                <td>사이즈</td>
                <td>
                    <input class="price" type="text" placeholder="숫자만 입력해주세요."><font style="font-size: 13px; margin-left: 5px">
                </td>
            </tr>
            <tr>
                <td>색상</td>
                <td>
                    <input class="price" type="text"><font style="font-size: 13px; margin-left: 5px">
                </td>
            </tr>
            
            <tr>
                <td>상품설명</td>
                <td><textarea style="width:600px;height: 300px;margin-top: 10px;margin-bottom: 10px;"></textarea></td>
            </tr>
            <tr>
                <td>노출이미지 (350x350)</td>
                <td>
                   <div id="imgbox">
                       <p class="imgbox_text"><b style="font-size: 14px;">&lt; 사진 1 &gt;</b> 상품 목록에서 기본으로 보이는 사진</p>
                        <div class="img_wrap"><img id="img1"/></div>
                        
                        <div class="filebox">
                        <input class="upload-name" value="파일선택" readOnly>
                        <label for="input_img1">업로드</label>
                         <input type="file" id="input_img1" class="upload-hidden"> 
                        </div>
                    </div>
                    
                    <d iv id="imgbox">
                            <p class="imgbox_text"><b style="font-size: 14px;">&lt; 사진 2 &gt;</b> 마우스 포인터를 올렸을때 보이는 사진</p>
                            <div class="img_wrap"><img id="img2"/></div>
                            <div class="filebox">
                                <input class="upload-name" value="파일선택" readOnly>
                                <label for="input_img2">업로드</label>
                                 <input type="file" id="input_img2" class="upload-hidden"> 
                                </div>
                        </div>
                    
                        
                    
                </td>
            </tr>
            <tr>
                <td>상품상세사진<br>(가로 800px 이하의 사진)</td>
                <td>
                    <div id="dtimgbox">
                         <div class="dtimg_wrap"><img id="img3"/></div> 
                         <div class="dtfilebox">
                         <input class="dtupload-name" value="파일선택" readOnly>
                         <label for="input_img3">업로드</label>
                          <input type="file" id="input_img3" class="dtupload-hidden"> 
                         </div>
                     </div>

                     <div id="dtimgbox">
                         <div class="dtimg_wrap"><img id="img4"/></div>
                         <div class="dtfilebox">
                         <input class="dtupload-name" value="파일선택" readOnly>
                         <label for="input_img4">업로드</label>
                          <input type="file" id="input_img4" class="dtupload-hidden"> 
                         </div>
                     </div>

                     <div id="dtimgbox">
                        <div class="dtimg_wrap"><img id="img5"/></div>
                        <div class="dtfilebox">
                        <input class="dtupload-name" value="파일선택" readOnly>
                        <label for="input_img5">업로드</label>
                         <input type="file" id="input_img5" class="dtupload-hidden"> 
                        </div>
                    </div>

                    <div id="dtimgbox">
                        <div class="dtimg_wrap"><img id="img6"/></div>
                        <div class="dtfilebox">
                        <input class="dtupload-name" value="파일선택" readOnly>
                        <label for="input_img6">업로드</label>
                         <input type="file" id="input_img6" class="dtupload-hidden"> 
                        </div>
                    </div>

                    <div id="dtimgbox">
                        <div class="dtimg_wrap"><img id="img7"/></div>
                        <div class="dtfilebox">
                        <input class="dtupload-name" value="파일선택" readOnly>
                        <label for="input_img7">업로드</label>
                         <input type="file" id="input_img7" class="dtupload-hidden"> 
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <!-- <button type="button" onclick="valueShow()">valueShow</button> -->
        <center><input type="submit" class="submitBtn" style="cursor:pointer" value="등록"></center>
    </form>
</div>
            
	
</body>
</html>