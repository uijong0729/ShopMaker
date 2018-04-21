<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>마이페이지</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
		<script src="/bigstar/resources/js/jquery-ui.js"></script>

<style type="text/css">
.li
{
 background-color: #000000; 
 color: #ffffff; 
 font: bold;"
 margin: 3px;
 border-bottom: 1px solid white;
 padding: 9px;
 cursor: pointer;
}
li{

margin-bottom: 5px;

}

.layer-li
{
 background-color: #000000; 
 color: #ffffff; 
 font: bold;"
 margin: 3px;
 border-bottom: 1px solid white;
 padding: 9px;
 cursor: pointer;
}

.ib{
 display: inline-block;
}

.ib5{
 display: inline-block;
}

.ol{
	display: inline-block;
	border: 1px solid black;
	margin: 2px;
	padding: 3px;
}

.w1{width: 120px;}
.w2{width: 120px;}
.w3{width: 120px;}
.w4{width: 200px;}
.w5{width: 120px;}
.w6{width: 120px;}

.submit
{
  box-shadow:1px 1px 1px 1px black;
  display: inline-block;
  font-size: 16px;
  line-height: 42px;
  width: 150px;
  height: 46px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  float : center;
}

.submit:hover
{
  display: inline-block;
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}

</style>				
<script>
	var StringBuffer = function() {
	    this.buffer = new Array();
	};
	
	StringBuffer.prototype.append = function(str) {
	    this.buffer[this.buffer.length] = str;
	};
	
	StringBuffer.prototype.toString = function() {
	    return this.buffer.join("");
	};

$(document).ready(function(){
	/* $('#addComponentMp').on('click', addRowMp);
	$('.rowsButton').on("click", removeRow); */
	$('.li').on('click', changeColor);
	$('#tableLayer').css('background', "white");
	$('#tableLayer').css('border', '1px solid black');
			
	$('#verticalLayer').on('click', function(){
				$('#verticalLayer').css('background', "white");
				$('#tableLayer').css('background', "black");
				$('.ib').css('width', '100%');
				$('#verticalLayer').css('border', '1px solid black');
	});
			
	$('#tableLayer').on('click', function(){
				$('#tableLayer').css('background', "white");
				$('#tableLayer').css('border', '1px solid black');
				$('#verticalLayer').css('background', "black");
				$('.ib').css('width', '200px');
				$('.ib5').css('width', '205px');
				
	});
	$('.ui-dialog').remove();
	//오른쪽에 요소추가 창 
	start();
	
	$('#orderList').on('click', orderList);
			
});

//주문내역
function orderList(){
	var customercode = $('#customercode').val();
	var membercode = $('#membercode').val();
	//alert(customercode + " / " +membercode);
	$.ajax({
		url: 'getOrderlist',
		type: 'post',
		data: {customercode: customercode, membercode: membercode},
		dataType: 'json',
		success: function(result){
			if(result == null)
			{
				return;
			}
			else
			{
				 var innerText = new StringBuffer();
			        innerText.append('<li>');
					innerText.append('<span class="ol w1">주문번호</span>');
					innerText.append('<span class="ol w2">제품번호</span>');
					innerText.append('<span class="ol w3">주문수량</span>');
					innerText.append('<span class="ol w4">주문일</span>');
					innerText.append('<span class="ol w5">입금일</span>');
					innerText.append('<span class="ol w6">결제상태</span>');
					innerText.append('</li>');
					
					for (var i in result) {
						innerText.append('<li>');
						innerText.append('<span class="ol w1">' + result[i].ordercode + '</span>');
						innerText.append('<span class="ol w2">' + result[i].productcode + '</span>');
						innerText.append('<span class="ol w3">' + result[i].orderquantity + '</span>');
						innerText.append('<span class="ol w4">' + result[i].orderdate + '</span>');
						innerText.append('<span class="ol w5">' + result[i].orderdepositdate + '</span>');
						innerText.append('<span class="ol w6">' + result[i].orderpaymentstatus + '</span>');
						innerText.append('</li>');
					}
					$('#addRowTab2').html(innerText.toString());
			}
		}
		
	});
	
}

//텍스트 추가		
/* function addRowMp(){
			$('#addrowMp').append('<ul style="list-style: none;"><li><span>텍스트</span></li><li><input> <input class="rowsButton" type="button" value="삭제"></li></ul>');
			$('.rowsButton').on("click", removeRow);
			
}
		
function removeRow(){
			 $(this).parent().parent().remove();
}
 */
 
$(document).mousedown(function(ev) {
			if (ev.which == 3) {
				if ($(this.activeElement).attr("id").startsWith("button") || $(this.activeElement).attr("id").startsWith("text") || $(this.activeElement).attr("id").startsWith("image") || $(this.activeElement).attr("id").startsWith("select")) {
					return false;
				} else {
					var inputString = prompt('변경할 텍스트를 입력해 주세요', 'none');
					if (inputString == 'none' || inputString == '' || inputString == null) {
						return false;
					} else {
						console.log($(this.activeElement).attr("id"));
						$(this.activeElement).text(inputString);
						return false;
					}
					return false;
				}
			}
});

//탭
$( function() {
    var tabs = $( "#tabs" ).tabs();
    tabs.find( ".ui-tabs-nav" ).sortable({
        axis: "x",
        stop: function() {
          tabs.tabs( "refresh" );
        }
      });
  } );

//다이얼로그
function start(){
	$( function() { 		
				$( "#dialog" ).dialog({
				    autoOpen: true,
				    position:{
				        my:"center",
				        at:"right",
				        of:"#Bcenter" 
				        },
				    show: {
				      effect: "blind",
				      duration: 300
				    },
				    hide: {
				      effect: "explode",
				      duration: 300
				    }
				});
				$('#forHover').mouseleave(function(){
					$('#dialog').dialog( "close" );
				});
	});
}		
//다이얼로그 위치 조정		
$( "#dialog" ).position({
			  my: "right center",
			  at: "right center",
			  of: "document"
});

//색깔 변화
function changeColor(){
	var color = $(this).attr('color');
	var id = $(this).attr('id');
	
	if(color == "black")
	{
		$(this).attr('color', "white");
		$(this).css('background', "white");
		$(this).css('border', '1px solid black');
	
				if(id == "id")
				{						
					$('#addRowTab1').append('<li id="Bid"><div id="text_id" tabindex="0" class="ib5" style="width: 205px; border: 1px solid black">아이디</div>'
					+ '<div class="ib"><input value="${Blogin.customerid}" readonly="readonly" id="BInId" style="border: none; width: 200px; text-align: center;" name="customeraddress" required="required"></div></li>');
				}
				else if(id == "pw")
				{
					$('#addRowTab1').append('<li id="Bpw"><div id="text_pw" tabindex="0" class="ib5" style="width: 205px; border: 1px solid black">비밀번호</div>'
							+ '<div class="ib"><input placeholder="비밀번호 변경하기" id="BInPw" style="border: none; width: 200px; text-align: center;" name="customerhp" required="required"></div></li>');
				}
				else if(id == "address")
				{						
					$('#addRowTab1').append('<li id="Baddress"><div id="text_address" tabindex="0" class="ib5" style="width: 205px; border: 1px solid black">주소</div>'
					+ '<div class="ib"><input value="${Blogin.customeraddress}" id="BInAddress" style="border: none; width: 200px; text-align: center;" name="customeraddress" required="required"></div></li>');
				}
				else if(id == "phone")
				{
					$('#addRowTab1').append('<li id="Bphone"><div id="text_hp" tabindex="0" class="ib5" style="width: 205px; border: 1px solid black">전화번호</div>'
							+ '<div class="ib"><input value="${Blogin.customerhp}" readonly="readonly" id="BInHp" style="border: none; width: 200px; text-align: center;" name="customerhp" required="required"></div></li>');
				}
				else if(id == "name")
				{
					$('#addRowTab1').append('<li id="Bname"><div id="text_name" tabindex="0" class="ib5" style="width: 205px; border: 1px solid black">이름</div>'
							+ '<div class="ib"><input value="${Blogin.customername}" readonly="readonly" id="BInName" style="border: none; width: 200px; text-align: center;" name="customername" required="required"></div></li>');
				}
	}
	else
	{
		$(this).attr('color', "black");
		$(this).css('background', "black");
		$(this).css('border', '1px solid white');
		
		if(id == "id")
		{
			$("#Bid").remove();
		}
		else if(id == "pw")
		{
			$("#Bpw").remove();
		}
		else if(id == "address")
		{
			$("#Baddress").remove();
		}
		else if(id == "name")
		{
			$("#Bname").remove();
		}
		else if(id == "phone")
		{
			$("#Bphone").remove();
		}
	}
}

</script>
		
	</head>
	<body>

<!-- 로그인 정보 -->
<input id="id" type="hidden" value="${Blogin.customerid}">
<input id="pw" type="hidden" value="${Blogin.customerpw}">
<input id="address" type="hidden" value="${Blogin.customeraddress}">
<input id="hp" type="hidden" value="${Blogin.customerhp}">
<input id="name" type="hidden" value="${Blogin.customername}">
<input id="customercode" type="hidden" value="${Blogin.customercode}">
<input id="membercode" type="hidden" value="${Blogin.membercode}">	
	
		<div style="text-align: center;">
			<div style="display: inline-block;">
				<h1 id="text_mypageTitle" tabindex="0">마이페이지</h1>
				
				<!-- 탭 부분 -->
				<div id="tabs">
				
				  <!-- 탭 리스트 -->
				  <ul>
				    <li><a href="#tabs-1" style="width: 220px;">계정정보</a></li>
				    <li><a id="orderList" href="#tabs-2" style="width: 220px;">주문내역</a></li>
				    <li><a href="#tabs-3" style="width: 220px;">장바구니</a></li>
				    <li><a href="#tabs-4" style="width: 220px;">배송정보</a></li>
				  </ul>
				  
				  <!-- 제 1탭 -->
				  <div id="tabs-1">
				  	<ul style="list-style: none;" id="addRowTab1">
							
					</ul>	  
					<div class="submit">수정사항 반영</div>
				  </div>
				  
				  <!-- 제 2탭 -->
				  <div id="tabs-2">
				  	<ul style="list-style: none;" id="addRowTab2">
						<li>주문 내역이 없습니다</li>
					</ul>	
				  </div>
				  
				  <!-- 제 3탭 -->
				  <div id="tabs-3">
				  	<ul style="list-style: none;" id="addRowTab3">
						<li>장바구니가 없습니다.</li>		
					</ul>	
				  </div>
				  
				  <!-- 제 4탭 -->
				  <div id="tabs-4">
				  	<ul style="list-style: none;" id="addRowTab4">
				  		<li>배송정보가 없습니다.</li>
				  	</ul>
				  </div>
				
				</div>
			</div>
		</div>
		
		
		
		<%-- dialog 부분 --%>
					<div id="dialog" title="내 계정 편집 메뉴">
						<h6>요소 추가하기</h6>
					    <ul style="list-style: none; display:inline;">
					    	<li class="li" id="id" color="black"><span>아이디</span></li>
					    	<li class="li" id="pw" color="black"><span>비밀번호</span></li>
					    	<li class="li" id="address" color="black"><span>주소</span></li>
					    	<li class="li" id="phone" color="black"><span>전화번호</span></li>
					    	<li class="li" id="name" color="black"><span>이름</span></li>
					    </ul>
					    
					    <h6>배치 수정하기</h6>
					    <ul style="list-style: none; display:inline;">
					    	<li id="tableLayer" class="layer-li">테이블형 배치</li>
					    	<li id="verticalLayer" class="layer-li">수직형 배치</li>
					    </ul>
					</div>
					
	<!-- 이부분을 통과하면 다이얼로그가 파괴됩니다. -->
	<div id="forHover" style="background: white; height: 400px; width: 60px; position: absolute; left: 5px; top: 100px;">
	</div>
	</body>
</html>