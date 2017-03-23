<%-- 20170322 박진우 : ID 중복체크 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>
<script>

$(function(){

	//.css는 .on처럼 자체적으로 포함된 기능
	//처음엔 적용하기 버튼이 뜨지 않도록 설정("display"의 설정을 "none"으로)
	$("#btn").css("display","none");

	//id가 btn인 것을 누르면 opener로 검색한 ID값을 넘겨줌
	$("#btn").on("click",function(){
		var idcheck_ok = $("#idcheck_tf").val();
		opener.document.getElementById("sellerId").value = idcheck_ok;
		window.close();
	});

	$("#idcheckbtn").on("click",function(){
		var idcheck_tf = $("#idcheck_tf").val();
		$.ajax({
			type : "POST",
			url : "sellerIDcheck",
			data : {
				idcheck_to_ctr : idcheck_tf
			//	idcheck_to_ctr(key)는 controller에서 받는 매개변수명과 맞춰줌 / idcheck_tf(value)는 위에서 받아놓은 var 변수명 
			},
			success : function (data){
				console.log(data);	//확인용
				if(data == "") {
					$('#idcheck_tf').val(idcheck_tf);
					alert('사용할 수 있는 ID입니다.');
					$("#btn").css("display","");		//id가 btn인 것을 을 보여줌
				} else {
					$('#idcheck_tf').val("");	//검색란을 비워줌
					alert('사용중인 ID입니다.');
					$("#btn").css("display","none");	//id가 btn인 것을 보여주지 않음
				}
			},
			error : function(e){
				console.log(e);
			}
		});
	});

});

</script>
</head>
<body>

<h1>[ 아이디 중복 확인인인 ]</h1>

<input type="text" id="idcheck_tf" name="idcheck_tf">
<input type="button" id="idcheckbtn" value="검색">

<%-- 검색 결과에 따라 div 안에 설정된 btn을 보여줌/보여주지 않음 --%>
<div>
	<input type="button" id="btn" value="적용하기">
</div>

</body>
</html>