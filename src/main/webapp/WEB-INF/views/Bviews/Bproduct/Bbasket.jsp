<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/Bpage/basket.css">
<title>Insert title here</title>
</head>
<body>
<div id="basket">
		
	
	<div id="bkTitle">
		<p id="bktext1">Bcustomer</p> <p id="bktext2">CART</p>
	</div>
	
	<form>
	
	<div class="cart_list_table">
		<table width="100%" border="1" cellpadding="0" cellspacing="0">
			<thead style="height: 150px;">
				<tr>
					<th scope="col" style="width: 50%">
						<span>상품</span>
					</th>
					<th scope="col" style="width: 10%">
						<span>수량</span>
					</th>
					<th scope="col" style="width: 14%">
						<span>가격</span>
					</th>
					<th scope="col" style="width: 13%">
						<span>배송정보</span>
					</th>
					<th scope="col" style="width: 5%">
						
					</th>
				</tr>
			</thead>
			
			
			<tbody style="border-left-color: white; border-right-color: white;">
				<!--구매자가 장바구니에 담은 상품 정보-->
				<c:choose>
					<c:when test="${basketListsize == 0 }">
						<tr>
							<td colspan="5">
								<p class="text_font">장바구니에 담겨있는 상품이 없습니다.</p>
							</td>
						</tr>
					</c:when>
					
					<c:when test="${basketListsize != 0 }">
						<c:forEach items="${basketList}" var="basket">
							<tr>
								<td id="test" align="center" scope="row" style="width: 50%;height: 50px">${basket.p_name} : ${basket.p_identifier }</td>
								<td align="center" scope="row" style="width: 10%;height: 50px">${basket.c_cnt}개</td>
								<td align="center" scope="row" style="width: 14%;height: 50px">${basket.p_price}원</td>
								<td align="center" scope="row" style="width: 13%;height: 50px">
									<c:choose>
										<c:when test="${basket.p_price >= 35000}">무료</c:when>
										<c:when test="${basket.p_price < 35000}">2500원</c:when>
									</c:choose>
								</td>
										
								<td align="center" scope="row" style="width: 5%;height: 50px">
								<div id="tx_btn_bor">
									<a class="delete_btn" href="deleteBasket.do?c_no=${basket.c_no}">삭제</a>
								</div>
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>			
			</tbody>
		</table>
	</div>
	
	<hr id="hr2">
	
	<div class="pay_section">
		<div class="lt_article">
			<div class="benerfit">
				<strong>구매 후 추가혜택</strong>
				<dl>
					<dt class="ng_a_scope1">상품명 작성하면</dt>
					<dd class="ng_a_scope2">Balpoom Point</dd>
					<dt class="ng_b_scope1">포토상품평 작성하면</dt>
					<dd class="ng_b_scope2">최대 Balpoom Point 200 P</dd>
					<dt class="ng_c_scope1">상품평 작성 제휴포인트 추가혜택</dt>
					<dd class="ng_c_scope2">Balpoom VIP회원</dd>
				</dl>
			</div>
		</div>
		
		<div class="paylist">
			<div class="total_bx">
				<h4 class="cp_title">
					<span>결제 예정금액</span>
				</h4>
				<ul class="bs_list">
					<li>
						<dl>
							<dt>상품가격</dt>
							<dd>
								<span class="number">
									<!--장바구니에 담은 제품들의 가격-->
								</span>
								<span class="won">원</span>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>할인 가격</dt>
							<dd>
								<span class="number">
									<!--할인율이 적용되는 상품이라면 -->
								</span>
								<span class="won">원</span>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>배송비</dt>
							<dd>
								<span class="number">
									<!--얼마이상이면 배송비 무료 얼마 이상이 아니라면 해당 사이트 정책의 배송비-->
								</span>
								<span class="won">원</span>
							</dd>
						</dl>
						
					</li>
				</ul>
				<dl class="result_list">
					<dd>
						<span class="rs_number">
							<!--총 금액-->
						</span>
						<span class="rs_won">원</span>
					</dd>
				</dl>
			</div>
		</div>
	</div>
	
	</form>
	
	<form>
	<input type="hidden">
	<input type="hidden">
	<input type="hidden">
	
	<div class="order_btn">
		<button class="im_btn" style="cursor:pointer;" onclick="test()">주문결제</button>
	</div>
	</form>
</div>

<script type="text/javascript">
	function test() {
		if($("#test").val() == null){
			alert('장바구니에 상품이 없습니다.');
			event.preventDefault();
		}
	}
</script>
</body>
</html>