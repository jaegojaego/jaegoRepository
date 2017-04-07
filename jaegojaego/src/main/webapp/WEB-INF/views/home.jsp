<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<c:choose>
	<c:when test="${sessionScope.custid == null}">
		<ul>
			<li><a href="sellerJoinForm">회원가입 (판매자)</a></li>
			<li><a href="buyerJoinForm">회원가입 (구매자)</a></li>
			<li><a href="SellerLoginForm">로그인 (판매자)</a></li>
			<li><a href="BuyerLoginForm">로그인 (구매자)</a></li>
			<li><a href="csboardlist">게시판</a></li>
		</ul>
	</c:when>
	<c:otherwise>
		<ul>
			<li>${sessionScope.custid} (${sessionScope.name}) 님 환영합니다.</li>
			<li><a href="csboardlist">게시판</a></li>			
			<li><a href="logout">로그아웃</a></li>
		</ul>	
	</c:otherwise>
</c:choose>

</body>
</html>