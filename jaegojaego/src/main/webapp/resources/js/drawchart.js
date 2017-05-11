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
      			
      			ele=data[0];
      			ala=data[1];
      			
      			tichartList.push(ele);
      			tichartList.push(ala);
      			
      			google.charts.setOnLoadCallback(barmonth);
      		},
      		error : function(e) {
      		}
      	});  	      	
      });
    
  

      function barmonth() {
	
        // Some raw data (not necessarily accurate)
  
  
    		  var data = google.visualization.arrayToDataTable(tichartList);  

        	  var options = {
        		      title : '今日売うり出だし',
        		      vAxis: {title: "金額"},
        		      hAxis: {title: 'アイテム'},
        		      seriesType: 'bars',
        		    };

        	    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        	    chart.draw(data, options)
}