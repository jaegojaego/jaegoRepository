<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">

<style> 
.wf-mplus1p { font-family: "Mplus 1p"; }
.wf-nicomoji { font-family: "Nico Moji"; }
.wf-hannari { font-family: "Hannari";}
.rubik      {font-family: 'Rubik Mono One', sans-serif;}
.russo      {font-family: 'Russo One', sans-serif;}
.jeju {font-family: 'Jeju Gothic', sans-serif;font-size: large;}

html{
   background-image: url("./resources/image/1234.png");
   width: 100%;
   background-repeat: no-repeat;
   background-position: center;
}

</style>

</head>
<body>
<header class="site__header island">
  <div class="wrap">
   <span id="animationSandbox" style="display: block;"><h1 class="wf-nicomoji" style="color: #f35626">JOIN</h1></span>
  </div>
</header><!-- /.site__header -->

<main class="site__content island" role="content">
   <hr />
  <div class="wrap">
    <form>
      <button class="butt3" style="background-color: white"><a href="sellerJoinForm" class="jeju" style="text-decoration: none;">Seller</a></button>
      <button class="butt3" style="background-color: white"><a href="buyerJoinForm" class="jeju" style="text-decoration: none;">Buyer</a></button>
    </form> 

    <p class="meta"><a href="/">HOME</a> </p>

  </div>
</main><!-- /.site__content -->

<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script>


  $(function(){
	  $('#animationSandbox').removeClass().addClass(' animated fadeInDown').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
	    });
  });
  
</script>

</body>
</html>