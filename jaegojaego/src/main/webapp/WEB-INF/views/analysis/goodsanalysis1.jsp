<%--메인--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="./resources/js/jquery-3.1.1.js"/>"></script>
 <!-- 구글차트주석 -->
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

 
           
</head>
<body>
     

 	<input id="btn1" type="button" onclick="javascript:location.href='goodsanalysis'" value="test1"><%--총 수량--%>
 	<input id="btn2" type="button" onclick="javascript:location.href='goodsanalysis2'" value="test2"><%--오늘 수량--%>
 	<input id="btn3" type="button" onclick="javascript:location.href='goodsanalysis3'" value="test3"><%--총 수입--%>
 	<input id="btn4" type="button" onclick="javascript:location.href='goodsanalysis4'" value="test4"><%--막대--%>
 
 
 	
  </body>
</html>
