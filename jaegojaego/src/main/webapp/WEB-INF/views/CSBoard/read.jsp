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
<table>
	<tr>
		<td>번호</td><td>${csboard.boardnum}</td>
	</tr>
	<tr>
		<td>제목</td><td>${csboard.title}</td>
	</tr>
	<tr>		
		<td>작성자</td><td>${csboard.id}</td>
	</tr>
	<tr>		
		<td>조회수</td><td>${csboard.hits}</td>
	</tr>
	<tr>		
		<td>작성일</td><td>${csboard.inputdate}</td>
	</tr>
	<tr>		
		<td>내용</td><td>${csboard.content}</td>
	</tr>
	<tr>		
		<td>파일첨부</td>
		<td>
		<c:if test="${csboard.originalfile != null}">
			<a href="csbdownload?boardnum=${csboard.boardnum}">
				${csboard.originalfile}
			</a>
		</c:if>
		</td>
	</tr>
	<tr>		
		<td>분류</td><td>${csboard.type}</td>
	</tr>
<%-- 이미지 파일 브라우저에서 직접 읽는 태그
	<tr>
		<td><img alt="" src="download?boardnum=${board.boardnum}"></td>
	</tr>
 --%>	
</table>
</body>
</html>