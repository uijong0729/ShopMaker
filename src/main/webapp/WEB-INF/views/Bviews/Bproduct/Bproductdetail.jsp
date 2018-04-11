<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/Bpage/Bproductdetail.css"/>
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
        <div class="a">
            <diV class="half_detail_Info_Img">
                <div class="show_Img">
                    <img class="showingImg" src="./resources/img/c2.jpg">
                </div>
                <div class="wating_Img_place">
                    <img class="wating_Img img1" onclick="switchImg(this.src)" src="./resources/img/c1.jpg">
                    <img class="wating_Img img2" onclick="switchImg(this.src)" src="./resources/img/c2.jpg">
                </div>
            </diV><!-- 이미지 프리뷰 -->
            <div class="half_detail_Info_Text">
                <form action="detailaddOrder.do">
                    <div class="info_box1">
                        <p class="product_name">
                            <h3>까치</h3>
                        </p>
                    </div>
                    <br>
                    <table class="Info_table">
                        <tr>
                            <td>가격</td>
                            <td><span>10000원</span></td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td>30,000원 이상 무료, 미만 2,500원</td>
                        </tr>
                        <tr>
                            <td>색상</td>
                            <td>색상을 선택해 주세요 <br> 
                            	<select class="option_selecter" id="color_selecter" onchange="color_select(this.value)">
                                            
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>사이즈</td>
                            <td>사이즈를 선택해 주세요 <br> <select class="option_selecter"
                                id="size_selecter" onchange="size_select(this.value)">
                                           
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">옵션은 5개 까지 추가 가능합니다 &nbsp;&nbsp;&nbsp;
                                <button type="button" onclick="valueShow()" class="evtBtn">옵션추가</button>
                            </td>
                        </tr>
                        <tr id="amount_set_TR">
                            <td colspan="2" class="amount_set_TD"></td>
                        </tr>
                    </table>
                    <input type="hidden" name="index"> 
                    <input type="hidden" id="base_price"> 
                    <input type="hidden" id="p_common_name"> 
                    <input type="hidden" name="r_no">
                    <button type="submit" class="pageMoveBtn">바로 주문</button>
                </form>
                <form action="addBasket.do" class="cartData">
                    <input type="hidden" name="index">
                    <button type="submit" class="pageMoveBtn">장바구니</button>
                </form>

                <div class="detail_toolBox">
                    <a onclick="changeAction_place(this.id)" id="product_info">
                    	<div class="tool">
                        	<p>상세 설명</p>
                    	</div>
                    </a> 
                    <a href="getReviewList.do?r_no=${ProductOne.r_no }" target="action_place" onclick="changeAction_place(this.id)" id="product_iframe">
                    	<div class="tool">
                        	<p>상품 후기</p>
                    	</div>
                    </a> 
                    <a href="getInqueryList.do?r_no=${ProductOne.r_no }" target="action_place" onclick="changeAction_place(this.id)" id="product_iframe">
                    	<div class="tool">
                        	<p>상품 문의</p>
                    	</div>
                    </a> 
                    <a onclick="changeAction_place(this.id)" id="delivery_info">
                    	<div class="tool">
                        	<p>배송 정보</p>
                    	</div>
                    </a>
                </div>
                <br>
                
            </div><!-- 주문 디테일 -->
        </div>
        <div class="product_img_place">
            <!-- 상세 이미지 -->
        </div>
        
        <script type="text/javascript">
        function switchImg(src) {
            $('.showingImg').attr('src', src);
        }
        </script>
</body>
</html>