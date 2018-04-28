<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객관리</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
</style>

<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
<script src="/bigstar/resources/js/jquery-ui.js"></script>
<!-- loader.js 는 Bmain에 옮겼음 -->
<script type="text/javascript">
var date = new Date();

//이번달
var month = date.getMonth() + 1;

//저번달 = 이번달 - 1
var month2 = month - 1;
if(month2 <= 0){month2 = month2 + 12}

//저저저번달
var month3 = month - 2;
if(month3 <= 0){month3 = month3 + 12}

//저저저저번달
var month4 = month - 3;
if(month4 <= 0){month4 = month4 + 12}

//저저저저번달
var month5 = month - 4;
if(month5 <= 0){month5 = month5 + 12}

var membercode = ${Amember.membercode};


    $(document).ready(function(){
    	
    	//최신버전 load
    	google.charts.load('current', {'packages':['corechart']});
    	//drawChart 은 함수이름
    	google.charts.setOnLoadCallback(drawChart); 
    	
    	$.ajax({
    		url:'getChart',
    		type:'POST',
    		data:{membercode: membercode},
    		dataType:'json',
    		success: function(result){
    	    	
    			var arr = new Array(5);
    			$.each(result, function(index, item){
    				arr[index] = item;
                });

    			//고객 유입수
    	        var cData = new google.visualization.DataTable();
    	        
    	        cData.addColumn('string', '월');
    	        cData.addColumn('number', '회원 수');
    	        cData.addColumn('number', '총 회원 수');
    	        cData.addRows([
    	          ["" + month5 + "월", arr[4], arr[4]],
    	          ["" + month4 + "월", arr[3], arr[3] + arr[4]],
    	          ["" + month3 + "월", arr[2], arr[2] + arr[3] + arr[4]],
    	          ["" + month2 + "월", arr[1], arr[1] + arr[2] + arr[3] + arr[4]],
    	          ["" + month + "월", arr[0], arr[0] + arr[1] + arr[2] + arr[3] + arr[4]]
    	        ]);
    	      
    	        //차트2
    	        var BcountMember = {'title':'회원 유입 추이',
    	                'is3D':true,
    	                'width':800,
    	                'height':400};
    	       
    	        var lineChart = new google.visualization.LineChart(document.getElementById('chart_div2'));
    	        lineChart.draw(cData, BcountMember); 
    		},
    		error: function(){
    			alert("차트를 불러 올 수 없습니다");
    		}
    	});
    	 
    	//탭
    	$( "#tabs" ).tabs({show: { effect: "blind", duration: 800 }});
    	$('#Bbuy').html('선호 상품 분석');
    	$('#Binput').html('유입량 분석');
    });
    
    function drawChart() {
    	
    	$.ajax({
    		url: 'getClient',
    		type:'POST',
    		data: {membercode: membercode},
    		dataType: 'json',
    		success: function(result){
    			
    			var code = new Array(3);
    			var count = new Array(3);
    			
    			//리스트를 foreach로 출력
    			$.each(result, function(index, item){
    				code[index] = item.customerCode;
    				count[index] = item.countCustomer;
    				
                });
    			
    			 // 판매량
    	        var pData = new google.visualization.DataTable();
    	        pData.addColumn('string', 'VIP고객');
    	        pData.addColumn('number', '구매량');
    	        pData.addRows([
    	          [code[0], count[0]],
    	          [code[1], count[1]],
    	          [code[2], count[2]],
    	        ]);
    	        
    	        //정렬
    	        pData.sort({column: 1, desc: true});
    	        
    	        //차트1
    	        var Bpurchase =
    	        {'title':'Best3 고객 (내림차순)',
    	                       'is3D':true,
    	                       'width':800,
    	                       'height':400
    	        }
    	        
    	        // 차트를 그린다..... //draw를 해줘야 화면에 등장.
    	        var barChart = new google.visualization.BarChart(document.getElementById('chart_div1'));
    	        barChart.draw(pData, Bpurchase);
    		},
    		error: function(){
    			alert('잠시만 기다려주세요');
    		}
    	});
      
    }

    
    
    

</script>
</head>
<body>



<h1>고객관리</h1>

<%-- 탭을 이용할 때에는 li로 탭을 작성하고, a태그로 묶어줘야함 --%>
<div style="text-align: center;">
	<div id="tabs" style="display:inline-block; 800px; list-style: none;">
			<ul>
				<%-- a태그의 href는 div의 id로해서 앞에 #을 붙임  --%>
			    <li><a id="Bbuy" href="#chart_div1"></a></li>
			    <li><a id="Binput" href="#chart_div2"></a></li>
			</ul>
			
	        <div id="chart_div1"></div>
	        <div id="chart_div2"></div>
	        
	</div>
</div>
</body>
</html>