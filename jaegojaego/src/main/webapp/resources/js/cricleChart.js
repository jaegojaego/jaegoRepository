var ele; 
var ala;
var tichartList = [];
var tichart=[];

google.charts.load("current", {packages:["corechart"]});

  $(function(){
      	
      	$.ajax({
      		type : "GET",
      		url : "circle",
      		dataType : "json",
      		success : function(data) {
      			
      			console.log(data);
      			ele=data[0];
  			
      			
      			console.log(ele);
      			google.charts.setOnLoadCallback(cricleChart);
      			
      		},
      		error : function(e) {
      		}
      	})      	      	
      })
        
 
    
      function cricleChart() {
     
    	  
   		  var data = google.visualization.arrayToDataTable(ele);  

        var options = {
          title: '총판매수량',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }

