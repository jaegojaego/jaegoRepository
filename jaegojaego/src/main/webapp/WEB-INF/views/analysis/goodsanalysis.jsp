<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>판매분석</title>
<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="./resources/js/cricleChart.js"></script>
  
<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

	<script type="text/javascript">
	var ele; 
	var ala;
	var tichartList = [];
	var tichart=[];
	
	google.charts.load("current", {packages:["corechart"]});
	
	$(document).ready(function() { 
		var today = new Date();
		var date1 = today.getFullYear()+"-"+(today.getMonth() + 1)+"- 01";
		var date2 = today.getFullYear()+"-"+(today.getMonth() + 1)+"-"+today.getDate();
		ajax(date1,date2);	
	 }); 
	 
	$(function() {
		$( "#date1" ).datepicker({dateFormat:"yy-mm-dd"});
		$( "#date2" ).datepicker({dateFormat:"yy-mm-dd"});
	});
	
	$(function(){
		$('#ok').click(function(){
			var date1=$( "#date1" ).val();
			var date2=$( "#date2" ).val();
			
			ajax(date1,date2);
		});
	}) 
	
	function ajax(date1,date2){
		 $.ajax({
			type:"GET",
			url:"circle",
			data:{
				date1:date1,
				date2:date2
			},
			dataType : "json",
	      	success : function(data) {
	      		if(data=="타이틀,상품"){
	      			alert("자료가 존재하지 않습니다.");
	      		}else{
		      		alert("원형성공?");
	      		}
	      		console.log(data);
	      		ele=data[0];
	      			
	      		console.log(ele);
	      		google.charts.setOnLoadCallback(cricleChart);
	      	}
		}); 
	}

</script>  
     
</head>
<body>
 	<input type="text" id="date1" name="date1">~<input type="text" id="date2">
	<input type="button" id="ok" value="조회">
    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
</body>
</html> 
