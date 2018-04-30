<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

    	  $.ajx({
    		  url: 'SalesVolumeByName',
    		  type: 'POST',
    		  data: {SalesVolumeByName: SalesVolumeByName},
    		  dataType:'json',
    		  seccess: function(result){
    			  
    			//리스트를 foreach로 출력
				$.each(result, function(index, item){
					productName[index] = item.productName;
					totalSales[index] = totalSales;
				
				})
    			  
					var DataOfSalesVolumeByName = google.visualization.arrayToDataTable([
						
						['상품명', '누적 판매금액'],
						[productName[0], totalSales[0]],
						[productName[1], totalSales[1]],
						[productName[2], totalSales[2]],
						[productName[3], totalSales[3]],
						[productName[4], totalSales[4]],
						[productName[5], totalSales[5]],
						
				        var options = {
				          title: '상품별 누적 판매금액'
				        };
						
					])
				
		        var chart = new google.visualization.PieChart(document.getElementById('SalesVolumeByName'));
		
		        chart.draw(DataOfSalesVolumeByName, options);
    		  },
    		  
    		  error: function(){
    			  alert('데이터 분석 중 입니다. 잠시만 기다려주세요.');
    		  }
    		  
    	  });
    	  

      }
    </script>

</head>
<body>

<h1>매출관리</h1>

<div id="SalesVolumeByName" style="width: 900px; height: 500px;"></div>

</body>
</html>