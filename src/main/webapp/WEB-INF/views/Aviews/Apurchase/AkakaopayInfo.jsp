<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>카카오페이</title>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <link rel="stylesheet" type="text/css" href="//t1.daumcdn.net/kakaopay/tesla/20180108/pg_web/css/common.min.css">
    <script src="//t1.daumcdn.net/kakaopay/tesla/20180108/pg_web/js/lib/jquery.min.js"></script>

    
    

<script>
        var hash = "c21fca7515f567eadf803dad2b7ae2c190343686d5c8e9d746b819dc96aad502";
        var failUrl = "https://developers.kakao.com/payment/web/fail/e1bab21c-accf-4481-8b93-be08627a1142";
        var remainingSec = 899;
        var cancelUrl = "https://developers.kakao.com/payment/web/cancel/e1bab21c-accf-4481-8b93-be08627a1142";
        var isCancelPost = false;
        var isFailPost = false;
        var isApprovalPost = false;
	</script>

<script type="text/javascript" src="/js/v2/common_payment.js?v=version"></script>

<script type="text/javascript" src="/js/v2/user_info.js?v=version"></script>

</head>
<body>

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
		<div class="inner_kakaopay">
			<div class="layer_head">
				<strong class="img_pay logo_kakaopay">kakaopay</strong>
			</div>
			<div class="layer_body">
				<p class="txt_step">결제요청 메시지 전송을 위해<br> 카카오페이에 가입된<br>휴대폰 번호와 생년월일 6자리를 입력해주세요.</p>
				<form action="AkakaopayInfo2" id="userPost" method="post" action="/v1/c21fca7515f567eadf803dad2b7ae2c190343686d5c8e9d746b819dc96aad502/uinfo" >
					<fieldset>
						<legend class="screen_out">휴대폰 번호 및 생년월일 입력</legend>
						<div class="info_data">
							<span class="tit_data" id="thPhone_data">
								<label for="tfPhone" class="lab_data">휴대폰 번호</label>
								<em class="txt_emph">특수문자 없이 숫자만 입력해주세요.</em>
							</span>
							<input type="text" id="tfPhone" class="tf_kakaopay" maxlength="11" placeholder="예) 01056781234" name="tel" autocomplete="off">
							<span class="line_tf"><span class="inner_line"></span></span>
						</div>
						<div class="info_data" id="thBirthday_data">
							<span class="tit_data">
								<label for="tfBirthday" class="lab_data">생년월일</label>
								<em class="txt_emph">생년월일은 6자리로 입력해주세요. 예) 840101</em>
							</span>
							<input type="text" id="tfBirthday" class="tf_kakaopay" maxlength="6" placeholder="예) 840301" name="birthDate" autocomplete="off">
							<span class="line_tf"><span class="inner_line"></span></span>
						</div>
						<div class="area_btn">
							<button type="submit" class="btn_submit">결제요청</button> <!-- disabled="disabled" -->
						</div>
					</fieldset>
				</form>
			</div>
			<div class="layer_foot">
				<button class="btn_close"><span class="img_pay">닫기</span></button>
			</div>
		</div>
		<form id="actionPost" action="approval" method="post">
		</form>
	</div>

</body>
</html>
