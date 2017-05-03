<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Animate.css</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="initial-scale=1, minimal-ui" />

  <link rel="dns-prefetch" href="//fonts.googleapis.com" />
  <link rel="dns-prefetch" href="//code.jquery.com" />
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed|Rubik+Mono+One" rel="stylesheet">
  <link href='//fonts.googleapis.com/css?family=Roboto:400,100,400italic,700italic,700' rel='stylesheet' type='text/css'>
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed|Rubik+Mono+One|Russo+One" rel="stylesheet">
  <link rel="stylesheet" href="./resources/css/animate.css?ver=1"/>
  <link rel="stylesheet" href="./resources/css/style.css" />
  <link href="https://fonts.googleapis.com/earlyaccess/mplus1p.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/earlyaccess/hannari.css" rel="stylesheet" />

<style> 
.wf-mplus1p { font-family: "Mplus 1p"; }
.wf-nicomoji { font-family: "Nico Moji"; }
.wf-hannari { font-family: "Hannari";}
.rubik      {font-family: 'Rubik Mono One', sans-serif;}
.russo      {font-family: 'Russo One', sans-serif; font-size: x-large;}


html{
   background-image: url("./resources/image/1234.png");
   width: 100%;
   background-repeat: no-repeat;
   background-position: center;
}

</style>
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

$(function() {
	var custid = document.getElementById("custid").value;
	var type = document.getElementById("type").value;
	
	if (custid != null) {
		if (type == '판매자') {
			location.href='goodslist';
		} else if (type == '구매자') {
			location.href='map1';
		}		
	} else if (custid == null) {
		location.href='home';
	}
});

</script>
</head>
<body>
<input type="hidden" id="custid" value="${sessionScope.custid}">
<input type="hidden" id="type" value="${sessionScope.type}">

<header class="site__header island">
  <div class="wrap">
   <span id="animationSandbox" style="display: block;"><h1 class="site__title mega wf-nicomoji">さいごのザイコ</h1></span>
  </div>
</header><!-- /.site__header -->

<main class="site__content island" role="content">
   <hr />
  <div class="wrap">
    <form>
      <button class="butt js--triggerAnimation" style="background-color: white"><a href="homejoin" class="russo" style="text-decoration: none;">JOIN</a></button>
      <button class="butt js--triggerAnimation" style="background-color: white"><a href="homelogin" class="russo" style="text-decoration: none;">LOGIN</a></button>
    </form> 

   
    <p style="font-size: medium; font-weight:bolder; color: #5D5D5D" class="wf-mplus1p" >SC IT マスター 32期 ゆくゆく</p>
  </div>
</main><!-- /.site__content -->




</body>
</html>