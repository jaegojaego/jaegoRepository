<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form actio="insert" method="post" enctype="mulitpart/form-data">
		<div id="salesTable">
			<div id="salesContent">
			이미지 <input type="file" name="salesUpload" size="100">
			
			<br>
			상품이름 	<input type="text" id="goodsName" name="goodsName">
			<br>
			상품가격	<input type="text" id="goodsPrice" name="goodsPrice">
			<br>
			상품수량 <input type="text" id="goodsQuantity" name="goodsQuantity">
			<br>
			상품설명  <input type="text" id="goodsQuantity" name="goodsQuantity">
			<br>
			
			</div>
		</div>




	</form>
</body>
</html>