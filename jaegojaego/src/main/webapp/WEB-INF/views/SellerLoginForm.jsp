<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function formCheck() {
	//알아서 완성시키리라 믿고 ^^; 일단 true 반환
	return true;
}

</script>
</head>
<body>

<h1>판매자 로그인</h1>

<form action="SellerLogin" method="post" onsubmit="return formCheck()">
아뒤 : <input type="text" id="custid" name="custid"><br>
비번 : <input type="password" id="password" name="password"><br>
<input type="submit" value="로그인">
</form>

<c:if test="${loginErr != null}">
로그인 에러입니다.
</c:if>

</body>
</html>