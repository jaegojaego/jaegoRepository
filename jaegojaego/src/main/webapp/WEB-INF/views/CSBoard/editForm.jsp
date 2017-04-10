<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="edit" method="post" enctype="multipart/form-data">				<%-- ★ enctype은 파일 전송을 위한 설정 : form-data는 '다른 form data도 간다'는 뜻 --%>

	<input type="hidden" name="boardnum" value="${csboard.boardnum}">
	<input type="hidden" name="id" value="${csboard.id}">
	<input type="hidden" name="inputdate" value="${csboard.inputdate}">
	
	<table>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title" id="title" value="${csboard.title}">
			</td>
		</tr>
		<tr>
			<td>본문</td>
			<td>
				<textarea rows="3" cols="3" name="content">${csboard.content}</textarea>
			</td>
		</tr>
		<tr>
			<td>파일 첨부</td>
			<td>
				<input type="file" name="upload" value="${csboard.originalfile}">		<%-- multiple="multiple"이란 속성을 추가하면 파일 복수 업로드도 가능하지만, 그러려면 Controller 등 연결된 부분도 수정해야 함 : 컨트롤러에서 받는 매개변수도 MultipartFile의 ArrayList로 바꾸는 등... --%>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="저장"">
			</td>
		</tr>
	</table>

</form>

</body>
</html>