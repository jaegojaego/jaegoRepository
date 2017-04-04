<%-- 상품수정 : 권록헌 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="./resources/js/jquery-3.1.1.js"/>"></script>

<script type="text/javascript">
 jQuery(document).ready(function() {
	
    jQuery("#salesUpload").change(function() {
        if(jQuery("#displayDiv").css("display") != "none") {
        	jQuery("#displayDiv").css("display", "none");
        }
        
        else {

            jQuery("#displayDiv").css("display", "none"); 
        }
    });
});

 function resizeImg(img, height, width) {
	    img.height = height;
	    img.width = width;
	}

</script>
</head>
<body>

<form action="rgoodsupdate" method="post" enctype="multipart/form-data">
	
		<div id="salesTable">
			<div id="salesContent">
			 <p id="status"></p>
			 <div id="holder" ></div>
			 <div id="displayDiv">
				<c:if test ="${goods.goodsOimage !=null}">
	
						<img  alt="" src="download?goodsCode=${goods.goodsCode}" height="200" width="250">
						
				</c:if>
			</div> 
			
						<input type="file" name="upload" size="100" id="salesUpload" onload="resizeImg(img, 200, 100)">
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
							if (img.width > 260) { // holder width
								img.width = 260;
							}
							holder.innerHTML = '';
							holder.appendChild(img);
						};
						reader.readAsDataURL(file);

						return false;
					};
				</script> 
				<br> 상품이름 <input type="text" id="goodsName" name="goodsName" value="${goods.goodsName}">
				<br> 상품가격 <input type="text" id="goodsPrice" name="goodsPrice" value="${goods.goodsPrice}">
				<br> 상품수량 <input type="text" id="goodsQuantity" name="goodsQuantity" value="${goods.goodsQuantity}"> 
				<br> 상품설명 <textarea cols="20" rows="10" name="goodsInfo" id="goodsInfo">${goods.goodsInfo}</textarea>
				<input type="hidden" name="goodsCode" value="${goods.goodsCode}">
				<input type="hidden" name="goodsDateOfUpload" value="${goods.goodsDateOfUpload}">
				<input type="hidden" id="goodsDateOfUpdate">
				<input type="hidden" name="goodsStatus" value="${goods.goodsStatus}">
				<br> <input type="submit" value="등록">
				<!-- <a HREF="javascript:sendIt()">[등록]</a> -->
			
			</div>
		</div>






	</form>
</body>

</html>