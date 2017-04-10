<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
function deleteCheck(boardnum) {
	if (confirm("정말 삭제하시겠습니까?")) {
		location.href = 'delete?boardnum='+boardnum;		
	}	
}
</script>

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

<div>
	<c:if test="${custid==csboard.id}">
		<a href="javascript:deleteCheck(${csboard.boardnum})">삭제</a>
		<a href="editForm?boardnum=${csboard.boardnum}">수정</a>
	</c:if>
	<a href="csboardlist">목록 보기</a>
</div>

<form action="csreplyWrite" method="post" id="csreplyform">
리플내용
	<input type="hidden" name="boardnum" value="${csboard.boardnum}"/>
	<input type="text" name="text" id="retext"/>
	<input type="submit" value="확인"/>
</form>

<table>
<c:if test="${csreplylist != null}">
	<c:forEach var="csreplylist" items="${csreplylist}">
		<tr>
			<td>${csreplylist.id}</td>
			<td>${csreplylist.text}</td>
			<td>${csreplylist.inputdate}</td>
			<td>
				<c:if test="${custid==csreplylist.id}">
					<a href="deleteCSReply?replynum=${csreplylist.replynum}">${csreplylist.replynum}번 댓글 삭제</a>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</c:if>
</table>

</body>
</html>