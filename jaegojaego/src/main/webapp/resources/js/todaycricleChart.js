var ele; 
var ala;
var tichartList = [];
var tichart=[];
google.charts.load("current", {packages:["corechart"]});
  $(function(){
      	
      	$.ajax({
      		type : "GET",
      		url : "todaycircle",
      		dataType : "json",
      		success : function(data) {
      			
      			
      			ele=data[0];
  			
      			
      			
      			 google.charts.setOnLoadCallback(todaycricleChart);
      			
      		},
      		error : function(e) {
      		}
      	})      	      	
      })
      
      function todaycricleChart() {
     
   	  
   		  var data = google.visualization.arrayToDataTable(ele);  

        var options = {
          title: '오늘판매수량',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('tiechart_3d'));
        chart.draw(data, options);
      }


