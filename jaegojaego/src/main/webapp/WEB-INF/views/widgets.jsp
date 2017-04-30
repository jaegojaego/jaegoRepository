<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sing - Statistics</title>
    <link href="./resources/bootstrap/css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script>
    </script>
    
</head>
<body>








    <script>
    </script>
<%--
<!-- common libraries. required for every page-->
<script src="./resources/bootstrap/vendor/jquery/dist/jquery.min.js"></script>
<script src="./resources/bootstrap/vendor/jquery-pjax/jquery.pjax.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/transition.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/collapse.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/dropdown.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/button.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/tooltip.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/alert.js"></script>
<script src="./resources/bootstrap/vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="./resources/bootstrap/vendor/widgster/widgster.js"></script>
<script src="./resources/bootstrap/vendor/pace.js/pace.js" data-pace-options='{ "target": ".content-wrap", "ghostTime": 1000 }'></script>
<script src="./resources/bootstrap/vendor/jquery-touchswipe/jquery.touchSwipe.js"></script>

<!-- common app js -->
<script src="./resources/bootstrap/js/settings.js"></script>
<script src="./resources/bootstrap/js/app.js"></script>

<!-- page specific libs -->
<script src="./resources/bootstrap/vendor/underscore/underscore.js"></script>
<script src="./resources/bootstrap/vendor/jquery.sparkline/index.js"></script>
<script src="./resources/bootstrap/vendor/d3/d3.min.js"></script>
<script src="./resources/bootstrap/vendor/rickshaw/rickshaw.min.js"></script>
<script src="./resources/bootstrap/vendor/raphael/raphael-min.js"></script>
<script src="./resources/bootstrap/vendor/jQuery-Mapael/js/jquery.mapael.js"></script>
<script src="./resources/bootstrap/vendor/jQuery-Mapael/js/maps/usa_states.js"></script>
<script src="./resources/bootstrap/vendor/jQuery-Mapael/js/maps/world_countries.js"></script>
<script src="./resources/bootstrap/vendor/flot/jquery.flot.js"></script>
<script src="./resources/bootstrap/vendor/MetroJS/release/MetroJs.Full/MetroJs.js"></script>
<script src="./resources/bootstrap/vendor/skycons/skycons.js"></script>

<!-- page specific js -->
<script src="./resources/bootstrap/demo/js/_fake-world-data.js"></script>
<script src="./resources/bootstrap/js/widgets.js"></script>
--%>




























<div class="content-wrap">
    <main id="content" class="content" role="main">
        <div class="row">
            <div class="col-md-4">
                <section class="widget">
                    <div class="widget-controls">
                    <%--<a href="#"><i class="fa fa-refresh"></i></a>--%>
                        <a href="" class="close" data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
                    </div>
                    <div class="widget-body">
                        <div class="widget-top-overflow windget-padding-md clearfix bg-warning text-white">
                        <p class="text-light fs-mini m">　</p>
                        <p class="text-light fs-mini m">　</p>                           
                            <ul class="tags text-white pull-right">
                                <li><a href="#" class="addshop">관심매장 추가</a></li>
                                <li><a href="#" class="delshop">관심매장 삭제</a></li>
                            </ul>
                       </div>

                       <div class="post-user mt-n-lg">
                            <span class="thumb-lg pull-left mr">
                                <%--<img class="img-circle" src="./resources/bootstrap/demo/img/people/a44.jpg" alt="...">--%>
                                <img class="img-circle" src="소스부분" width="120" height="130" alt="..."></img>
                            </span>
                            <h5 class="mt-sm fw-normal text-white">커피커피 ★★★★☆<small class="text-white text-light">010-1234-5678</small></h5>
                            <p class="fs-mini text-muted"><time>카페</time> &nbsp; <i class="fa fa-map-marker"></i> &nbsp; 서울시 강남구 삼성동 1-1</p>
                        </div>

                        <p class="text-light fs-mini m">
                        	<table>

                        		<tr>
                        			<th>상품명a</th><th>　</th><th>가격</th><th>　</th><th>수량</th><th>　</th><th>유통기한</th><th>　</th><th>이미지</th>
                        		</tr>

                        		<tr>
                        			<td>빵</td><td>　</td><td>2000</td><th>　</th><td>15</td><th>　</th><td>9시간 6분 17초</td><th>　</th><td>사진</td>
                        		</tr>
                        		
                        	</table>
                        </p>
                    </div>
                    <footer class="bg-body-light">
<%--                    <ul class="post-links">
                            <li><a href="#">1 hour</a></li>
                            <li><a href="#"><span class="text-danger"><i class="fa fa-heart"></i> Like</span></a></li>
                            <li><a href="#">Comment</a></li>
                        </ul>--%>
                        <ul class="post-comments mt mb-0" style="overflow-y:scroll; height:150px;">
                        
                            <li>
                                <span class="thumb-xs avatar pull-left mr-sm">
                                <%--<img class="img-circle" src="img/avatar.png" alt="...">--%>
								댓글
                                </span>
                                <div class="comment-body">
                                	</a><input class="form-control input-sm" type="text" placeholder="후기를 남겨주세요"><br>
                                	<select class="starcheck" align="center"><option value="1">★</option><option value="2">★★</option><option value="3">★★★</option><option value="4">★★★★</option><option value="5">★★★★★</option></select><input type="button" class="bnt" value="입력">
                                </div>
                            </li>

                            <li>
                                <span class="thumb-xs avatar pull-left mr-sm">
                                	<%--<img class="img-circle" src="demo/img/people/a1.jpg" alt="...">--%>
                                	사진
                                </span>
                                <div class="comment-body">
                                    <h6 class="author fw-semi-bold">hongkk <small>2017-04-29 17:53</small></h6>
                                    <p>정말 맛있어요</p>
                                    <h6 class="author fw-semi-bold">hongkk <small>2017-04-29 17:53</small></h6>
                                    <p>우왕 굿</p>
                                    <h6 class="author fw-semi-bold">hongkk <small>2017-04-29 17:53</small></h6>
                                    <p>하하하</p>
                                </div>
                            </li>
                        </ul>
                    </footer>
                </section>
            </div>
        </div>
    </main>
</div>
<!-- The Loader. Is shown when pjax happens -->
<div class="loader-wrap hiding hide">
    <i class="fa fa-circle-o-notch fa-spin-fast"></i>
</div>










</body>
</html>