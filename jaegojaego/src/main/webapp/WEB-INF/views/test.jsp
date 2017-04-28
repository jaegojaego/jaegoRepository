		<%@ page language="java" contentType="text/html; charset=UTF-8"
		    pageEncoding="UTF-8"%>
		
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ page session="false" %>
		<html>
		<head>
			<title>Home</title>
		</head>
		<body>
		<h1>
			Hello world!  
		</h1>
		
		<P>  The time on the server is ${serverTime}. </P>
		
		
		
		
		
		<!-- Display the countdown timer in an element -->
		<p id="demo">시간들어갈자리</p>
		
		<script>
		// Set the date we're counting down to
		var countDownDate = new Date("2017-04-28 00:00:00").getTime();				// 파란글자에 DB에서 불러온 유통기한 넣어주면 됨..
		alert(countDownDate);
		// Update the count down every 1 second
		var x = setInterval(function() {
		
		  // Get todays date and time
		  var now = new Date().getTime();
		  alert(now+"읭");
		
		  // Find the distance between now an the count down date
		  var distance = countDownDate - now;
		
		  // Time calculations for days, hours, minutes and seconds
		  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
		  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
		
		  // Display the result in the element with id="demo"
		  document.getElementById("demo").innerHTML = days + " 일 " + hours + "시간 "
		  + minutes + "분 " + seconds + "초 ";
		
		  // If the count down is finished, write some text 
		  if (distance < 0) {
		    clearInterval(x);
		    document.getElementById("demo").innerHTML = "기한만료(EXPIRED)"; // 유통기한이 다되면 시간자리에 기한만료가 뜸..
		  }
		}, 1000);
		</script>
		
		
		
		
		
		
		</body>
		</html>
