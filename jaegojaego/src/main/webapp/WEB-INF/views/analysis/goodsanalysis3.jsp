<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="./resources/js/jquery-3.1.1.js"/>"></script>
<!-- 구글차트주석 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 그래프파일위치 -->
<script src="./resources/js/send.js"></script>
<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<script type="text/javascript">
var eleChart = []; 
var ele = [];
google.charts.load('current', {'packages':['corechart']});

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
			url:"analysismoney",
			data:{
				date1:date1,
				date2:date2
			},
			success: function(result){
				console.log(result);
				if(result.length==0){
					alert("자료가 존재하지 않습니다.");
					ele = ['',0];
					eleChart=[];
					eleChart.push(ele);
					console.log(ele);
					console.log(eleChart);
					google.charts.setOnLoadCallback(drawChart);
				}else{
				alert("성공?");
				eleChart = [];
				$.each(result, function(index, item) {
	   				ele = [item.SALESTIME, item.PRICE];
	   					
	   				eleChart.push(ele);
	   				console.log(ele);
	   				google.charts.setOnLoadCallback(drawChart);
   				})
				}
			}
		}); 
	}
			
</script>

</head>
<body>

	<input type="text" id="date1">~<input type="text" id="date2">
	<input type="button" id="ok" value="조회">
	<div id="curve_chart" style="width: 900px; height: 500px;"></div>

</body>
</html>
