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
	location.href="./";
}

</script>
<div id="payment">
<div class="header">
<strong>
<kakaopay></kakaopay>
</strong>
</div>
<div class="body">
<div class="content">
		<div style="margin-bottom: 100px;">
			<%@ include file="../../Aheader.jsp" %>
		</div>

</div>
<img src="resources/image/payment_icon_small.png">
<br>
<p>카카오페이 결제가 정상적으로 완료되었습니다.</p>
<p>결제일시: ${serverTime }</p>
<p>템플릿명: ${templateforValue }</p>
<p>결제금액: ${paymentforValue }원</p>
<p>결제기간: ${daysforValue }일</p>
<p>결제만료일: ${paymentexpirationdate }</p>
<div class="alert alert-warning">
<!-- 해당 페이지는 카카오페이에서 제공하는 페이지가 아닙니다. -->
</div>
</div>
<div class="footer">
<button class="btn-wrap" onclick="finish()">
<span id="closeBtn">메인 페이지로 돌아갑니다</span>
</button>
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
