<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/bigstar/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

  	$(document).ready(function(){
  		
  		google.charts.load('current', {packages: ['corechart']});
  	    google.charts.setOnLoadCallback(drawChart);
  	  	google.charts.load('current', {packages: ['corechart', 'bar']});
  		google.charts.setOnLoadCallback(drawBasic);
  		
  		
  		
  	});
  	
  	 function drawChart() {
  		 
  		$.ajax({
    		  url: 'getSalesVolumeByName',
    		  type: 'POST',
    		  //data: {SalesVolumeByName: SalesVolumeByName},
    		  dataType:'json',
    		  success: function(result){
    			  //alert(result);
    			var productName = new Array(6);
    			var totalSales = new Array(6);
  			  
  			//리스트를 foreach로 배열에 입력
  			$.each(result, function(index, item){
  				productName[index] = item.productName;
  				totalSales[index] = item.totalSales;
  				//alert(productName[index] + "/"+ totalSales[index]);
  			});		

  				var DataOfSalesVolumeByName = new google.visualization.DataTable();
  				
  				DataOfSalesVolumeByName.addColumn('string', '누적 판매금액');
  				DataOfSalesVolumeByName.addColumn('number', '판매량');
  				DataOfSalesVolumeByName.addRows([
  					[productName[0], totalSales[0]],
  					[productName[1], totalSales[1]],
  					[productName[2], totalSales[2]],
  					[productName[3], totalSales[3]],
  					[productName[4], totalSales[4]],
  					[productName[5], totalSales[5]]
  				]);
  				
  		        var options = {
  					'title':'상품별 누적 판매금액',
                      'is3D':true,
                      'width':800,
                      'height':400
  		        };
  			
  	        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
  	        chart.draw(DataOfSalesVolumeByName, options);
  	         
    		  },
    		  error:function()
    		  {
    			  alert('에러');
    		  }
        });
  		 
  		 
  	 }
  	 
  	 
  	function drawBasic() {
  		
  		$.ajax({
  			url: 'getSalesVolumeByOrderdate',
  			type:'POST',
  			dataType:'json',
  			success: function(result){
			
  				alert(result);
  				var orderDate = new Array(7);
    			var totalSales = new Array(7);
  			  
  			//리스트를 foreach로 배열에 입력 = TODO: result 출력 성공! 그래프에 데이터만 적용시키면 됨!!
  			$.each(result, function(index, item){
  				orderdate[index] = item.productName;
  				totalSales[index] = item.totalSales;
  				alert(orderdate[index] + "/"+ totalSales[index]);
  			});
  			
  			},
  			error:function()
  		 	{
  			  alert('에러');
  			}
  		});

  	      var data = google.visualization.arrayToDataTable([
  	        ['구매일자', '원(KRW)',],
  	        ['18/04/30', 8175000],
  	        ['18/05/01', 3792000],
  	        ['18/05/02', 2695000],
  	        ['18/05/03', 2099000],
  	        ['18/05/04', 1526000]
  	      ]);

  	      var options = {
  	        title: '일자별 매출액',
  	        chartArea: {width: '50%'},
  	        hAxis: {
  	          title: 'Total Population',
  	          minValue: 0
  	        },
  	        vAxis: {
  	          title: '구매일자'
  	        }
  	      };

  	      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

  	      chart.draw(data, options);
  	    }
    
    	
</script>

</head>
<body>

<h1>매출관리</h1>

<div id="chart_div"></div>
<div id="piechart_3d" style="width: 900px; height: 500px;"></div>



</body>
</html>