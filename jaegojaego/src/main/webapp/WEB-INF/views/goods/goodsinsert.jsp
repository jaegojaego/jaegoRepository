<%-- 상품등록 : 권록헌 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
<script>
/* function sendIt(){
	 //상품이름 입력여부 검사
	if(document.goodsName.value=="")
	 {
	  alert("상품이름을 입력하지 않았습니다.")
	  document.goodsName.focus()
	  return
	 }
	if(document.goodsPrice.value=="")
	 {
	  alert("상품 가격을 입력하지 않았습니다.")
	  document.goodsPrice.focus()
	  return
	 }
	if(document.goodsQuantity.value=="")
	 {
	  alert("상품수량을 입력하지 않았습니다.")
	  document.goodsQuantity.focus()
	  return
	 }
	if(document.goodsInfo.value=="")
	 {
	  alert("상품내용을 입력하지 않았습니다.")
	  document.goodsInfo.focus()
	  return
	 } */
	
</script>
</head>
<body>
	<form action="rgoodsinsert" method="post" enctype="multipart/form-data">
		<div id="salesTable">
			<div id="salesContent">
			 <p id="status"></p>
			 <div id="holder"></div>
				<input type="file" name="upload" size="100" id="salesUpload">
				 <script>
					var upload = document.getElementsByTagName('input')[0], 
					holder = document.getElementById('holder'), 
					state = document.getElementById('status');

					if (typeof window.FileReader === 'undefined') {
						state.className = 'fail';
					} else {
						state.className = 'success';
						state.innerHTML = '이미지';
					}

					upload.onchange = function(e) {
						e.preventDefault();

						var file = upload.files[0], reader = new FileReader();
						reader.onload = function(event) {
							var img = new Image();
							img.src = event.target.result;
							// note: no onload required since we've got the dataurl...I think! :)
							if (img.width > 460) { // holder width
								img.width = 460;
							}
							holder.innerHTML = '';
							holder.appendChild(img);
						};
						reader.readAsDataURL(file);

						return false;
					};
				</script> 
				<br> 상품이름 <input type="text" id="goodsName" name="goodsName">
				<br> 상품가격 <input type="text" id="goodsPrice" name="goodsPrice">
				<br> 상품수량 <input type="text" id="goodsQuantity" name="goodsQuantity"> 
				<br> 상품설명 <input type="text" id="goodsInfo" name="goodsInfo"> 
				<input type="hidden" id="goodsCode">
				<input type="hidden" id="goodsDateOfUpload">
				<input type="hidden" id="goodsDateOfUpdate">
				<input type="hidden" id="goodsStatus">
				<br> <input type="submit" value="등록">
				<!-- <a HREF="javascript:sendIt()">[등록]</a> -->
			
			</div>
		</div>






	</form>
</body>
</html>