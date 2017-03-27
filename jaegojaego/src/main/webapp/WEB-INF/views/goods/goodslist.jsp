<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록</title>
<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('.bplus').click(function() {
			var n = $('.bplus').index(this);
			var num = $(".afterQ:eq(" + n + ")").val();
			num = $(".afterQ:eq(" + n + ")").val(num * 1 + 1);
		});
		$('.bninus').click(function() {
			var n = $('.bninus').index(this);
			var num = $(".afterQ:eq(" + n + ")").val();
			num = $(".afterQ:eq(" + n + ")").val(num * 1 - 1);
		});
	});

	$(function() {
		$('#check').click(function() {
			var beforeQ = $(".beforeQ");
			//console.log(beforeQ);
			var data = {
					"goodsCode":"",
					"goodsQuantity":"" 
			};
			var dataArray = [];  
			
	
			$.each($('.afterQ'), function(index) {
				beforeQ.eq(index).text($(this).val());
			
				var sss = beforeQ.eq(index).text();
				var ddd = $('.goodscode').eq(index).text();
				
				$.ajax({
					type:"GET",
					url:"update",
					data:{
						goodsCode:ddd,
						goodsQuantity:sss
					}, 
					success:function(){
						location.href="goodslist";
					}
				});
			});
		});
	});


	$(function() {
		$('#ninus').click(function() {
			var checkbox = $(".checkbox");
			var goodscode = $(".goodscode");
			$(".tr").each(function(index,item) {
					var checked = checkbox.eq(index).prop("checked");
					if(checked){
						var delcode = goodscode.eq(index-1).text();
						
						$.ajax({
							type:"GET",
							url:"del",
							data:{
								goodsCode : delcode
							},
							success: function(){
								console.log(delcode);
								location.href="goodslist";
							}
						});
					}
			});
		});
	});
	
	$(function(){
		$('#checkboxall').click(function(){
			if($('#checkboxall').prop("checked")){
				$('input[name=checkbox]').prop("checked",true);
			}else{
				$('input[name=checkbox]').prop("checked",false);
			}
		});
	})
	
	$(function() {
		$('#plus').click(function() {
			location.href = "goodsinsert";
		});
	})
	
	$(function(){
		$('.btnupdate').click(function(){
			location.href = "goodsupdate";
		});
	})
	
</script>
<style type="text/css">
#table {
	float: left;
	border-top: 1px solid #cccccc;
	border-left: 1px solid #cccccc;
}

#table .tr {
	clear: both;
}

#table .tr div {
	float: left;
	border-right: 1px solid #cccccc;
	border-bottom: 1px solid #cccccc;
	width: 100px;
	text-align: center;
}
</style>
</head>
<body>
	<h2>[ 상품목록 ]</h2>
	<h3>현재 날짜 ${todate }</h3>
	<!-- 상품목록ㅇㅇ -->
	<div id="table">
		<div class="tr">
			<div>이미지</div>
			<div>상품명</div>
			<div>상품코드</div>
			<div>판매가격</div>
			<div>업로드 날짜</div>
			<div>현재수량</div>
			<div>변동수량</div>
			<div>삭제<input type="checkbox" id="checkboxall" class="checkbox"></div>
			<div>수정</div>
		</div>
		<c:forEach var="map" items="${list }">
			<div class="tr">
				<div><img src="./resources/image/${map.GOODSOIMAGE  }" width="50" height="30"></div>
				<div>${map.GOODSNAME }</div>
				<div class="goodscode">${map.GOODSCODE }</div>
				<div>${map.GOODSPRICE  }</div>
				<div>${map.GOODSDATEOFUPLOAD }</div>
				<div class="beforeQ">${map.GOODSQUANTITY  }</div>
				<div>
					<input type="text" size="3" value="${map.GOODSQUANTITY }"class="afterQ"> 
					<img src="./resources/image/ninus.png" class="bninus" width="10" height="10"> 
					<img src="./resources/image/plus.png" class="bplus" width="10" height="10">
				</div>
				<div>
					<input type="checkbox" name="checkbox" class="checkbox">
				</div>
				<div>
					<input type="button" value="수정" class="btnupdate">
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- 오른쪽 하단 버튼s -->
	<div style="position: fixed; bottom: 5px; right: 5px;">
		<img src="./resources/image/plus.png" id="plus" width="70" height="70">
		<img src="./resources/image/ninus.png" id="ninus" width="70"height="70"> 
		<img src="./resources/image/check.png" id="check" width="70" height="70">
	</div>
</body>
</html>