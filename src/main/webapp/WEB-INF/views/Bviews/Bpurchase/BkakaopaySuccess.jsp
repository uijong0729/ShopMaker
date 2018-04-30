<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>카카오페이 - 승인</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" media="screen" href="/assets/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" media="screen" href="/vassets/stylesheets/payment.css"/>
<script src="/assets/libs/jquery-1.10.2.min.js"></script>
<script>

function finish(){
	location.href="goMyShop?code=${Amember.membercode}&page=BpageMain";  
}

</script>

<style>
.btn_submit2{
    width: 90%;
    height: 54px;
    font-size: 18px;
    color: #222;
    background-color: #ffeb00;
    cursor: pointer;
}

.btn_submit2:hover{
	color: white;
	background-color: black;
}

.euj-tr
{
	padding: 15px;
}

.euj-td
{
	padding: 15px;
}

.column-euj
{
	text-align: center;
}


.kakao-main-euj
{
	border: 1px thin #fdd835;
}

</style>

<div style="margin-bottom: 100px;">
			<%@ include file="../Bmain/Bheader.jsp" %>
</div>

<div id="payment">
<div class="header">
	<strong>
	<kakaopay></kakaopay>
	</strong>
</div>

<div style="text-align: center;">
	<div class="body" style="text-align: center; display: inline-block;">
			<div class="content" style="display: inline-block;"></div>
			<img width="200px" src="resources/image/payment_icon_small.png">
		
			<h4 style="color: gray;">카카오페이 결제가 정상적으로 완료되었습니다.</h4>
			<hr>
				<table style="display: inline-block;">
					<tr class="euj-tr">
						<td class="euj-td column-euj">주문자명</td>
						<td class="euj-td" style="border-bottom: 1px solid gray;">${Blogin.customername }</td>
					</tr>
					<tr class="euj-tr">
						<td class="euj-td column-euj">결제일시</td>
						<td class="euj-td" style="border-bottom: 1px solid gray;">${serverTime }</td>
					</tr>
					<tr class="euj-tr">
						<td class="euj-td column-euj">결제금액</td>
						<td class="euj-td" style="border-bottom: 1px solid gray;">${totalPrice }원</td>
					</tr>
				
				</table>
			
			<div class="footer" style="margin-top: 80px;">
				<button class="btn-wrap btn_submit2" onclick="finish()">
					<span id="closeBtn">메인 페이지로 돌아갑니다</span>
				</button>
			</div>
		</div>		
	</div>
</div>
	<div style="margin-top: 200px;">
			<%@ include file="../Bmain/Bfooter.jsp" %>
	</div>

<script type='text/javascript'>
  //<![CDATA[
    $(document).ready(function() {
        $(".btn-wrap").click(function() {
            self.close();
        });
    });
  //]]>
</script>
