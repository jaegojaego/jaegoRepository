<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

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
				
			</div>
		</div>






	</form>
</body>
</html>