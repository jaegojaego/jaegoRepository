var ele; 
var ala;
var tichartList = [];
var tichart=[];
google.charts.load('current', {'packages':['corechart']});
$(function(){
      	
      	$.ajax({
      		type : "GET",
      		url : "analysismonth",
      		dataType : "json",
      		success : function(data) {
      			console.log(data);
      			ele=data[0];
      			ala=data[1];
      			
      			tichartList.push(ele);
      			tichartList.push(ala);
      			console.log(tichartList);
      			google.charts.setOnLoadCallback(barmonth);
      		},
      		error : function(e) {
      		}
      	});  	      	
      });
    
  

      function barmonth() {
	
        // Some raw data (not necessarily accurate)
  
    	 console.log(ala.length);
    	
    	  
    		  var data = google.visualization.arrayToDataTable(tichartList);  

        	  var options = {
        		      title : '일별매출',
        		      vAxis: {title: "금액"},
        		      hAxis: {title: '일수'},
        		      seriesType: 'bars',
        		    };

        	    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        	    chart.draw(data, options)
}