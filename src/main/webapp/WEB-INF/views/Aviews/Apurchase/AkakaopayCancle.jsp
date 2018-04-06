<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>카카오페이 - 취소</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" media="screen" href="/assets/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" media="screen" href="/vassets/stylesheets/payment.css"/>
<script src="/assets/libs/jquery-1.10.2.min.js"></script>
<div id="payment">
<div class="header">
<strong>
<kakaopay></kakaopay>
</strong>.
</div>
<div class="body">
<div class="content">
<p>결제가 취소되었습니다.</p>
<p>결제상태: QUIT_PAYMENT</p>
<p>상품명: 커피</p>
<p>취소금액: 1100원</p>
</div>
<div class="alert alert-warning">
해당 페이지는 카카오페이에서 제공하는 페이지가 아닙니다.
</div>
</div>
<div class="footer">
<button class="btn-wrap">
<span id="closeBtn"></span>
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>카카오페이 - 취소</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" media="screen" href="/assets/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" media="screen" href="/vassets/stylesheets/payment.css"/>
<script src="/assets/libs/jquery-1.10.2.min.js"></script>
<div id="payment">
<div class="header">
<strong>
<kakaopay></kakaopay>
</strong>.
</div>
<div class="body">
<div class="content">
<p>결제가 취소되었습니다.</p>
<p>결제상태: QUIT_PAYMENT</p>
<p>상품명: 커피</p>
<p>취소금액: 1100원</p>
</div>
<div class="alert alert-warning">
해당 페이지는 카카오페이에서 제공하는 페이지가 아닙니다.
</div>
</div>
<div class="footer">
<button class="btn-wrap">
<span id="closeBtn"></span>
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
>>>>>>> master
