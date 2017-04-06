<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="csboardWriteForm">글쓰기 폼 이동</a>

<h3>[게시판]</h3>

<table>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>조회수</td>
		<td>작성일</td>
	</tr>

	<c:forEach var="i" items="${csbList}">
	<tr>
		<tr>
			<td>${i.boardnum}</td>
			<td>${i.title}</td>
			<td>${i.id}</td>
			<td>${i.hits}</td>
			<td>${i.inputdate}</td>
		</tr>
	</c:forEach>
		
</table>

</body>
</html>