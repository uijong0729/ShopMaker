<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>카카오페이 - 승인</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" media="screen" href="/assets/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" media="screen" href="/vassets/stylesheets/payment.css"/>

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
	padding: 5px;
	padding-bottom: 8px;
}

.euj-td
{
	padding: 5px;
	padding-bottom: 8px;
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

<script src="/assets/libs/jquery-1.10.2.min.js"></script>
<script>

function finish(){
	location.href="./";
}

</script>



<div id="payment">
<div class="header">

</div>
<div class="body">
<div class="content">
		<div style="margin-bottom: 100px;">
			<%@ include file="../../Aheader.jsp" %>
		</div>

</div>
<div style="text-align: center;">
	<div class="kakao-main-euj" style="text-align: center; display: inline-block;">
		<div style="display: inline-block;">
			<img style="width: 180px;"  src="resources/image/payment_icon_medium.png">
		</div>
		<div>
			<div style="display: inline-block; text-align: center;">
				<h5 style="color: gray;">카카오페이 결제가 정상적으로 완료되었습니다.</h5>
				<hr>
				<table style="display: inline-block;">
					<tr class="euj-tr">
						<td class="euj-td column-euj">결제일시</td>
						<td class="euj-td" style="border-bottom: 1px solid gray;">${serverTime }</td>
					</tr>
					<tr class="euj-tr">
						<td class="euj-td column-euj">템플릿명</td>
						<td class="euj-td" style="border-bottom: 1px solid gray;">${templateforValue }</td>
					</tr>
					<tr class="euj-tr">
						<td class="euj-td column-euj">결제금액</td>
						<td class="euj-td" style="border-bottom: 1px solid gray;">${paymentforValue }원</td>
					</tr>
					<tr class="euj-tr">
						<td class="euj-td column-euj">결제기간</td>
						<td class="euj-td" style="border-bottom: 1px solid gray;">${daysforValue }일</td>
					</tr>
					<tr class="euj-tr">
						<td class="euj-td column-euj">결제만료일</td>
						<td class="euj-td" style="border-bottom: 1px solid gray;">${paymentexpirationdate }</td>
					</tr>
				</table>
			</div>
			
			<div class="footer" style="margin-top: 60px;">
				<button class="btn-wrap btn_submit2" onclick="finish()">
					<span id="closeBtn">메인 페이지로 돌아갑니다</span>
				</button>
			</div>
		</div>
	
	</div>	
</div>

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
