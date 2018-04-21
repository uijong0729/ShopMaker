<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
			    var myKey = "OHW6aYr7rGso3MZx5dpnKQ"; // sweet tracker에서 발급받은 자신의 키 넣는다.
			    var t_code = $('#code').val();
			    var t_invoice = $('#invoice').val();
		            $.ajax({
		                type:"GET",
		                dataType : "json",
		                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
		                success:function(data){
		                    console.log(data);
		                    var myInvoiceData = "";
		                    if(data.status == false){
		                        myInvoiceData += ('<p>'+data.msg+'<p>');
		                    }else{
		                        myInvoiceData += ('<tr>');                
		                        myInvoiceData += ('<th>'+"보내는사람"+'</td>');                  
		                        myInvoiceData += ('<th>'+data.senderName+'</td>');                  
		                        myInvoiceData += ('</tr>');     
		                        myInvoiceData += ('<tr>');                
		                        myInvoiceData += ('<th>'+"제품정보"+'</td>');                   
		                        myInvoiceData += ('<th>'+data.itemName+'</td>');                    
		                        myInvoiceData += ('</tr>');     
		                        myInvoiceData += ('<tr>');                
		                        myInvoiceData += ('<th>'+"송장번호"+'</td>');                   
		                        myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                   
		                        myInvoiceData += ('</tr>');     
		                        myInvoiceData += ('<tr>');                
		                        myInvoiceData += ('<th>'+"배송지"+'</td>');                   
		                        myInvoiceData += ('<th>'+data.receiverAddr+'</td>');                    
		                        myInvoiceData += ('</tr>');                                       
		                    }
		                     
		                     
		                    $("#track1").html(myInvoiceData);
		                     
		                    var trackingDetails = data.trackingDetails;
		                     
		                     
		                    var myTracking="";
		                    var header ="";
		                    header += ('<tr>');               
		                    header += ('<th>'+"시간"+'</th>');
		                    header += ('<th>'+"장소"+'</th>');
		                    header += ('<th>'+"유형"+'</th>');
		                    header += ('<th>'+"전화번호"+'</th>');                  
		                    header += ('</tr>');     
		                     
		                    $.each(trackingDetails,function(key,value) {
		                        myTracking += ('<tr>');               
		                        myTracking += ('<td>'+value.timeString+'</td>');
		                        myTracking += ('<td>'+value.where+'</td>');
		                        myTracking += ('<td>'+value.kind+'</td>');
		                        myTracking += ('<td>'+value.telno+'</td>');                     
		                        myTracking += ('</tr>');                                  
		                    });
		                     
		                    $("#track2").html(header+myTracking);
		                     
		                }
		            });
			});
		</script>
	</head>
	<body>
		<table id="track1"></table>
		<table id="track2"></table>
		<input id="code" type="hidden" value="${param.t_code}">
		<input id="invoice" type="hidden" value="${param.t_invoice}">
	</body>
</html>