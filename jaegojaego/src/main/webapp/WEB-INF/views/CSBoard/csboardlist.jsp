<%-- 20170406 박진우 : 게시판 목록 폼 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function pagingFormSubmit(currentPage) {
	var form = document.getElementById("pagingForm");
	var page = document.getElementById("page");
	page.value = currentPage;
	form.submit();
}
</script>

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
		<td>구분</td>
	</tr>

	<c:forEach var="i" items="${csbList}">
	<tr>
		<tr>
			<td>${i.boardnum}</td>
			<td>${i.title}</td>
			<td>${i.id}</td>
			<td>${i.hits}</td>
			<td>${i.inputdate}</td>
			<td>${i.type}</td>
		</tr>
	</c:forEach>
		
</table>

<br>

<div>
	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁</a>
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a>
	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
		<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>
	</c:forEach>
	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a>
	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
</div>

<form action="csboardlist" method="get" id="pagingForm">
	<input type="hidden" id="page" name="page">		<%-- name에 있는 page는 BoardController에 들어갈 RequestParam의 page와 연결됨 --%>
</form>

</body>
</html>