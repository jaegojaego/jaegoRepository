<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Animate.css</title>
  <meta charset="utf-8" />
<!--   <meta name="viewport" content="initial-scale=1, minimal-ui" />
 -->
    <link href="./resources/bootstrap/css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
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

</head>
<body>
<div class="content-wrap">
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-md-* > .widget.  -->
    <main id="content" class="content" role="main">
        <div class="row">
            <div class="col-md-4">
                <section class="widget">
                    <div class="widget-controls">
                        <a href="#"><i class="fa fa-refresh"></i></a>
                        <a href="#" data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
                    </div>
                    <div class="widget-body">
                        <div class="widget-top-overflow windget-padding-md clearfix bg-warning text-white">
                        <p class="text-light fs-mini m">업종 : + position.tob +</p>
                        <p class="text-light fs-mini m">주소 : + position.shopaddress +</p>
                        <p class="text-light fs-mini m">전번 : + position.phone +</p>
                        <p class="text-light fs-mini m">별점 : ★★★★☆</p>                            
                            <ul class="tags text-white pull-right">
                                <li><a href="#">관심매장 추가</a></li>
                            </ul>
                        </div>
<%--                    <div class="post-user mt-n-lg">
                            <span class="thumb-lg pull-left mr">
                                <img class="img-circle" src="demo/img/people/a4.jpg" alt="...">
                            </span>
                            <h5 class="mt-sm fw-normal text-white">Jeremy <small class="text-white text-light">@sing</small></h5>
                            <p class="fs-mini text-muted"><time>25 mins</time> &nbsp; <i class="fa fa-map-marker"></i> &nbsp; near Amsterdam</p>
                        </div>--%>
                        <p class="text-light fs-mini m">
                           <table border="1px">
                              <tr>
                                 <th>상품명</th><th>　</th><th>가격</th><th>　</th><th>수량</th><th>　</th><th>유통기한</th><th>　</th><th>이미지</th>
                              </tr>
                              <tr>
                                 <td>빵</td><td>　</td><td>2000</td><th>　</th><td>15</td><th>　</th><td>9시간 6분 17초</td><th>　</th><td>사진</td>
                              </tr>
                              <tr>
                                 <td>카레빵</td><td>　</td><td>5000</td><th>　</th><td>10</td><th>　</th><td>3시간 18분 53초</td><th>　</th><td>사진</td>
                              </tr>
                              <tr>
                                 <td>쌀빵</td><td>　</td><td>2000</td><th>　</th><td>35</td><th>　</th><td>2시간 16분 15초</td><th>　</th><td>사진</td>
                              </tr>
                              <tr>
                                 <td>토스트</td><td>　</td><td>1500</td><th>　</th><td>25</td><th>　</th><td>3시간 18분 37초</td><th>　</th><td>사진</td>
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
                                   </a><input class="form-control input-sm" type="text" placeholder="후기를 남겨주세요">
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
                                    <p >우왕 굿</p>
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




</body>
</html>