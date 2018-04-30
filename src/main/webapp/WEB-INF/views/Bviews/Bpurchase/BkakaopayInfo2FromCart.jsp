<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>카카오페이</title>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <link rel="stylesheet" type="text/css" href="//t1.daumcdn.net/kakaopay/tesla/20180108/pg_web/css/common.min.css">
    <script src="//t1.daumcdn.net/kakaopay/tesla/20180108/pg_web/js/lib/jquery.min.js"></script>

    
    

<script>
		var hash = "61b11a795616fc712413db6e2447a2a90db1d79d51e00cca043493fa1198771e";
		var failUrl = "https://developers.kakao.com/payment/web/fail/2a8aadc7-c914-4d5b-b0c5-0a3fdf4ba3d8";
		var remainingSec = 899;
		var cancelUrl = "https://developers.kakao.com/payment/web/cancel/2a8aadc7-c914-4d5b-b0c5-0a3fdf4ba3d8";
		var isCancelPost = false;
		var isFailPost = false;
		var isApprovalPost = false;
	</script>

<script src="//t1.daumcdn.net/kakaopay/tesla/20180108/pg_web/js/lib/spin.min.js"></script>

<script src="/js/v2/common_payment.js?v=version"></script>

<script src="/js/v2/web_waiting.js?v=version"></script>

</head>
<body>

<div style="margin-bottom: 100px;">
			<%@ include file="../Bmain/Bheader.jsp" %>
</div>

<div id="payPopupDiv" class="pay_popup hide">
    <div class="inner_terms_layer">
        <div class="layer_head">
            <strong class="tit_terms">제목</strong>
        </div>
        <div class="layer_body">
            <div class="desc_terms">
                내용
            </div>
        </div>
        <div class="layer_foot">
            <button type="button" class="btn_terms">확인</button>
        </div>
    </div>
</div>

<div id="payAlertDiv" class="hide">
    <div class="agree_layer">
        <div class="inner_agree_layer inner_agree_layer2">
            <div class="layer_body">
                <div class="desc_agree"></div>
            </div>
            <div class="layer_foot">
                <button id="alertOkButton" class="btn_layer">확인</button>
            </div>
        </div>
    </div>
</div>

<div id="payConfirmDiv" class="hide">
    <div class="agree_layer">
        <div class="inner_agree_layer inner_agree_layer2">
            <div class="layer_body">
                <strong class="desc_agree">카카오페이 결제를 중단하시겠습니까?</strong>
            </div>
            <div class="layer_foot">
                <button id="confirmCancelButton" class="btn_layer2">취소</button>
                <button id="confirmOkButton" class="btn_layer2">확인</button>
            </div>
        </div>
    </div>
</div>


<script>

	function finish(){
		location.href="BkakaopaySuccessFromCart";
	}

    <!-- /* ---------------------------------- 곧 제거 될 것 임 ------------------------------------------ */ -->
    function closeTalkPgWebview() {
        
        window.location = "app://kakaopay/close";
    }

    function payPopup(title, msg) {
        var payPopupDiv = $("#payPopupDiv");
        payPopupDiv.removeClass("hide");
        $("body").addClass("layer_on");
        $(".tit_terms", payPopupDiv).html(title);
        $(".desc_terms", payPopupDiv).html(msg);

        $(".btn_terms", payPopupDiv).click(function() {
            $("body").removeClass("layer_on");
            payPopupDiv.addClass("hide");
        });
    }

    function payAlert(msg, onOk) {
        $("#payAlertDiv").removeClass("hide");
        $("body").addClass("layer_on");
        $(".desc_agree").html(msg);
        $("#alertOkButton").click(function() {
            $("body").removeClass("layer_on");
            $("#payAlertDiv").addClass("hide");
            if(onOk) {
                onOk();
            }
        });
    }

    function payConfirm(msg, onOk, onCancel) {
        $("#payConfirmDiv").removeClass("hide");
        $("body").addClass("layer_on");
        $(".desc_agree").html(msg);

        hide = function () {
            $("body").removeClass("layer_on");
            $("#payConfirmDiv").addClass("hide");
        };

        $("#confirmOkButton").click(function () {
            hide();
            onOk();
        });
        $("#confirmCancelButton").click(function () {
            hide();
            if (onCancel) {
                onCancel();
            }
        });
    }
    <!-- /* ---------------------------------- 곧 제거 될 것 임 ------------------------------------------ */ -->


    (function() {
        function closeTalkPgWebview() {
            
            window.location = "app://kakaopay/close";
        }

        function payPopup(title, msg) {
            var payPopupDiv = $("#payPopupDiv");
            payPopupDiv.removeClass("hide");
            $("body").addClass("layer_on");
            $(".tit_terms", payPopupDiv).html(title);
            $(".desc_terms", payPopupDiv).html(msg);

            $(".btn_terms", payPopupDiv).click(function() {
                $("body").removeClass("layer_on");
                payPopupDiv.addClass("hide");
            });
        }

        function payAlert(msg, onOk) {
            $("#payAlertDiv").removeClass("hide");
            $("body").addClass("layer_on");
            $(".desc_agree").html(msg);
            $("#alertOkButton").click(function() {
                $("body").removeClass("layer_on");
                $("#payAlertDiv").addClass("hide");
                if(onOk) {
                    onOk();
                }
            });
        }

        function payConfirm(msg, onOk, onCancel) {
            $("#payConfirmDiv").removeClass("hide");
            $("body").addClass("layer_on");
            $(".desc_agree").html(msg);

            hide = function () {
                $("body").removeClass("layer_on");
                $("#payConfirmDiv").addClass("hide");
            };

            $("#confirmOkButton").click(function () {
                hide();
                onOk();
            });
            $("#confirmCancelButton").click(function () {
                hide();
                if (onCancel) {
                    onCancel();
                }
            });
        }

        window.teslaBaseCommon = {
            closeTalkPgWebview: closeTalkPgWebview,
            payPopup: payPopup,
            payAlert: payAlert,
            payConfirm: payConfirm
        };

    })();

</script>

<div class="kakaopay_layer">
		<span class="dimmed_layer loading_layer" style="display:none"></span>
		<span id="spin"></span>
		<div class="inner_kakaopay">
			<div class="layer_head">
				<strong class="img_pay logo_kakaopay">kakaopay</strong>
			</div>
			<div class="layer_body">
				<p class="txt_step">입력하신 휴대폰 번호로<br>결제 메시지가 전송되었습니다.</p>
				<form>
					<fieldset>
						<legend class="screen_out">휴대폰 번호 및 생년월일 입력</legend>
						<ol class="list_order">
							<li><em class="emph_num">1</em>휴대폰에서 카카오페이 결제 후, </li>
							<li><em class="emph_num">2</em><em class="emph_info">하단의 결제 완료 버튼</em>을 눌러주세요.</li>
						</ol>
						<div class="area_btn">
							<button type="button" class="btn_submit" onclick="finish()">결제 완료</button>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="layer_foot">
				<button class="btn_close"><span class="img_pay">닫기</span></button>
			</div>
		</div>
		<form id="approvalPost" action="approval" method="post">
		</form>
	</div>
	
		<div style="margin-top: 200px;">
			<%@ include file="../Bmain/Bfooter.jsp" %>
	</div>
	

</body>
</html>