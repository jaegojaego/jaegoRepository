 var eleChart = []; 
 google.charts.load('current', {'packages':['corechart']});
$(function(){
      	
      	$.ajax({
      		type : "GET",
      		url : "analysismoney",
      		success : function(data) {
      			$.each(data, function(index, item) {
      					var ele = [item.SALESTIME, item.PRICE];
      					
      					eleChart.push(ele);
      					console.log(ele);
      					 google.charts.setOnLoadCallback(drawChart);
      			})
      		},
      		error : function(e) {
      			console.log(e);
      		}
      	})
      	
      })
      
function drawChart() {
	
	console.log(eleChart);
    var data = google.visualization.arrayToDataTable([]);
    data.addColumn('string','일자');
    data.addColumn('number','총판매가격');

   
    data.addRows(eleChart);

    var options = {
      title: '품목별 총판매수익',
      curveType: 'function',
      legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

    chart.draw(data, options);
 	
   
  }