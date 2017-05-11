function drawChart() {
	
	
    var data = google.visualization.arrayToDataTable([]);
    data.addColumn('string','日付');
    data.addColumn('number','総販売価格');
    
    data.addRows(eleChart);

    var options = {
      title: '日付別総販売収入',
      curveType: 'function',
      legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
    chart.draw(data, options);
  }