<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객관리</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
<script src="/bigstar/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    
    $(document).ready(function(){
    	
    	//탭 : 탭은 하위 단에 li태그를 포함해야만 작동
    	$( function() {
    	    $( "#tabs" ).tabs();
    	  } );
    	
    	//최신버전 load
        google.charts.load('current', {'packages':['corechart']});
        
        //drawChart 은 함수이름
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            // 차트에 반영 할 테이블
            var pData = new google.visualization.DataTable();
            pData.addColumn('string', '판매물품');
            pData.addColumn('number', '판매량');
            pData.addRows([
              ['청바지', 30],
              ['티셔츠', 5],
              ['신발', 10],
              ['목걸이', 40],
              ['입걸이', 20]
            ]);
            //정렬
            pData.sort({column: 1, desc: true});
            
            var cData = new google.visualization.DataTable();
            cData.addColumn('string', '연도');
            cData.addColumn('number', '회원 수');
            cData.addRows([
              ['2014', 30],
              ['2015', 5],
              ['2016', 10],
              ['2017', 40],
              ['2018', 20]
            ]);
            //정렬
            cData.sort({column: 1, desc: true});
            
            //차트1
            var Bpurchase =
            {'title':'고객 별 상품 구입현황',
                           'is3D':true,
                           'width':800,
                           'height':400
            }
            
            //차트2
            var BcountMember = {'title':'회원 유입 추이',
                    'is3D':true,
                    'width':800,
                    'height':400};
            
            // 차트를 그린다..... //draw를 해줘야 화면에 등장.
            var barChart = new google.visualization.BarChart(document.getElementById('chart_div1'));
            barChart.draw(pData, Bpurchase);
           
            var lineChart = new google.visualization.LineChart(document.getElementById('chart_div2'));
            lineChart.draw(cData, BcountMember); 
        }
    });
    

    
    
    

</script>
</head>
<body>
<h1>고객관리</h1>

<%-- 탭을 이용할 때에는 li로 탭을 작성하고, a태그로 묶어줘야함 --%>
<div style="text-align: center;">
	<div id="tabs" style="display:inline-block; 800px; list-style: none;">
			<ul>
				<%-- a태그의 href는 div의 id로해서 앞에 #을 붙임  --%>
			    <li><a href="#chart_div1">고객 별 상품 구입현황</a></li>
			    <li><a href="#chart_div2">회원 유입 추이</a></li>
			</ul>
			
	        <div id="chart_div1"></div>
	        <div id="chart_div2"></div>
	        
	</div>
</div>
</body>
</html>