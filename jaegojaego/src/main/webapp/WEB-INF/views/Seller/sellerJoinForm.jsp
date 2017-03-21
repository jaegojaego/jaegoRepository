<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

//주소 입력받기(ajax)
function sellerMap() {
	window.open("sellerMap","width=400,height=300");
}

</script>
</head>
<body>
<h1>[ 회원 가입 ]</h1>

<form action="sellerJoin" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td>사업자번호</td>
		<td>
			<input type="text" name="sellerCRN" id="sellerCRN">
		</td>
	</tr>
	<tr>
		<td>ID</td>
		<td>
			<input type="text" name="sellerId" id="sellerId">
		</td>
	</tr>	
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="sellerPw" id="sellerPw"><br>
			<input type="password" id="sellerPw2">
		</td>
	</tr>
	<tr>
		<td>대표자 성명</td>
		<td>
			<input type="text" name="sellerName" id="sellerName">
		</td>
	</tr>
	<tr>
		<td>상호</td>
		<td>
			<input type="text" name="sellerShopName" id="sellerShopName">
		</td>
	</tr>
	<tr>
		<td>매장 전화번호</td>
		<td>
			<input type="text" name="sellerPhone" id="sellerPhone">
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>
			<input type="text" name="sellerEmail" id="sellerEmail">
		</td>
	</tr>
	<tr>
		<td>매장 주소</td>
		<td>
			<input type="text" name="sellerBEA" id="sellerBEA">
			<input type="button" onclick="sellerMap()" value="주소 입력">
		</td>
	</tr>		
	<tr>
		<td>업종</td>
		<td>
			<input type="text" name="sellerTOB" id="sellerTOB">
		</td>
	</tr>

	<tr>
		<td>매장 사진</td>
		<td>
		<!--<input type="text" name="sellerShopOimg" id="sellerShopOimg">-->
			<input type="file" name="upload">
		</td>
	</tr>

	<tr>
		<td>위도</td>
		<td>
			<input type="hidden" name="sellerLat" id="sellerLat">
		</td>
	</tr>
	<tr>
		<td>경도</td>
		<td>
			<input type="hidden" name="sellerLong" id="sellerLong">
		</td>
	</tr>
</table>
<input type="submit" value="가입">
</form>

</body>
</html>