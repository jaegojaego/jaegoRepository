<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="./resources/js/jquery-3.1.1.js"/>"></script>
 <!-- 구글차트주석 -->
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

 <!-- 그래프파일위치 -->

   <script src="./resources/js/todaycricleChart.js"></script>
    <script type="text/javascript">
   
   /*  google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(todaycricleChart); */
    
    </script>
           
</head>
<body>
     
 	 <div id="tiechart_3d" style="width: 900px; height: 500px;"></div>
 	
  </body>
</html>
