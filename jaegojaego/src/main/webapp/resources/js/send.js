function drawChart() {
	
	
    var data = google.visualization.arrayToDataTable([]);
    data.addColumn('string','일자');
    data.addColumn('number','총판매가격');
    
    data.addRows(eleChart);

    var options = {
      title: '일자별 총판매수익',
      curveType: 'function',
      legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
    chart.draw(data, options);
  }