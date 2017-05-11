function cricleChart() {

	var data = google.visualization.arrayToDataTable(ele);

	var options = {
		title : '総販売商品本数',
		is3D : true,
	};

	var chart = new google.visualization.PieChart(document
			.getElementById('piechart_3d'));
	chart.draw(data, options);
}
