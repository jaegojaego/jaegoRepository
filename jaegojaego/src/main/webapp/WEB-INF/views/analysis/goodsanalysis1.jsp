<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sing - Tables Dynamic</title>

	<script>
	function goodslist() {
		location.href='goodslist';
	}
	///web/goodslist3
	</script>

<script type="text/javascript" src="<c:url value="./resources/js/jquery-3.1.1.js"/>"></script>
<!-- 구글차트주석 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 그래프파일위치 -->
<script src="./resources/js/cricleChart.js"></script>


    
<%--<script type="text/javascript">
	function pagingFormSubmit(currentPage) {
		var form = document.getElementById("pagingForm");
		var page = document.getElementById("page");
		page.value = currentPage;
		form.submit();
	}
	</script>--%>
    
    <link href="./resources/bootstrap/css/application_for_graph.min.css" rel="stylesheet">

	<link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script>
        /* yeah we need this empty stylesheet here. It's cool chrome & chromium fix
         chrome fix https://code.google.com/p/chromium/issues/detail?id=167083
         https://code.google.com/p/chromium/issues/detail?id=332189
         */
    </script>
</head>
<body>
<!--
  Main sidebar seen on the left. may be static or collapsing depending on selected state.

    * Collapsing - navigation automatically collapse when mouse leaves it and expand when enters.
    * Static - stays always open.
-->
<nav id="sidebar" class="sidebar" role="navigation">
    <!-- need this .js class to initiate slimscroll -->
    <div class="js-sidebar-content">
        <header class="logo hidden-xs">
            <a href="/web/">saiko</a>
				<a class="hidden-sm hidden-xs" id="nav-state-toggle" href="#" title="슬라이드 메뉴 고정 on/off" data-placement="bottom">
					<i class="fa fa-bars fa-lg"></i>
				</a>
        </header>
        <!-- seems like lots of recent admin template have this feature of user info in the sidebar.
             looks good, so adding it and enhancing with notifications -->
        <div class="sidebar-status visible-xs">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="thumb-sm avatar pull-right">
                    <img class="img-circle" src="./resources/bootstrap/demo/img/people/a5.jpg" alt="...">
                </span>
                <!-- .circle is a pretty cool way to add a bit of beauty to raw data.
                     should be used with bg-* and text-* classes for colors -->
                <span class="circle bg-warning fw-bold text-gray-dark">
                    13
                </span>
                &nbsp;
                Philip <strong>Smith</strong>
                <b class="caret"></b>
            </a>
            <!-- #notifications-dropdown-menu goes here when screen collapsed to xs or sm -->
        </div>
        <!-- main notification links are placed inside of .sidebar-nav -->
        <ul class="sidebar-nav">

            <li>
                <!-- an example of nested submenu. basic bootstrap collapse component -->
                <a href="" <%--data-toggle="collapse" data-parent="#sidebar"--%> onclick="goodslist()">
                    <span class="icon">
                        <i class="fa fa-table"></i>
                    </span>
                    상품 목록
                    <%--<i class="toggle fa fa-angle-down"></i>--%>
                </a>
                <%--<ul id="sidebar-tables" class="collapse in">
                    <li><a href="tables_basic.html">Tables Basic</a></li>
                    <li class="active"><a href="tables_dynamic.html">Tables Dynamic</a></li>
                </ul>--%>
            </li>

            <li class="active">
                <a class="collapsed" href="analysis1">
                    <span class="icon">
                        <i class="glyphicon glyphicon-stats"></i>
                    </span>
                    매출 분석
                </a>                
            </li>

            <li>
                <a href="/web/csboardlist">
                    <span class="icon">
                        <i class="glyphicon glyphicon-user"></i>
                    </span>
                    고객 상담
<%--                    <sup class="text-warning fw-semi-bold">
                        new
                    </sup>--%>	<%-- new 표시 주석 처리 --%>
                </a>
            </li>



        </ul>


<%--↓================================================================================================================================--%>        

<%--↑================================================================================================================================--%>


    </div>
</nav>

<!-- This is the white navigation bar seen on the top. A bit enhanced BS navbar. See .page-controls in _base.scss. -->
<nav class="page-controls navbar navbar-default">
    <div class="container-fluid">
        <!-- .navbar-header contains links seen on xs & sm screens -->

        <div class="navbar-header">


            <!-- xs & sm screen logo -->
            <a class="navbar-brand visible-xs" href="index.html">
                <i class="fa fa-circle text-gray mr-n-sm"></i>
                <i class="fa fa-circle text-warning"></i>
                &nbsp;
                sing
                &nbsp;
                <i class="fa fa-circle text-warning mr-n-sm"></i>
                <i class="fa fa-circle text-gray"></i>
            </a>
        </div>




        <!-- this part is hidden for xs screens -->
        <div class="collapse navbar-collapse">
            <!-- search form! link it to your search server -->
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <div class="input-group input-group-no-border">
                        <%--
                        <span class="input-group-addon">
                        	<i class="fa fa-search"></i>
                        </span>
                        --%>
                        <label class="form-control">この世界のすべての在庫が消える日まで！<span class="fw-semi-bold">最後の在庫</span></h1></label><%--<input class="form-control" type="text" placeholder="Search Dashboard">--%>                        
                    </div>
                </div>
            </form>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
					<a href="#" class="dropdown-toggle dropdown-toggle-notifications" id="notifications-dropdown-toggle" data-toggle="dropdown">
                        <span class="thumb-sm avatar pull-left">
                            <img class="img-circle" src="./resources/bootstrap/demo/img/people/a5.jpg" alt="...">
                        </span>
                        &nbsp;
                        ${sessionScope.name} <strong>${sessionScope.sellerShopName}</strong>&nbsp;

                        <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="sellerupdatePJW"><i class="glyphicon glyphicon-user"></i> &nbsp; 회원정보</a></li>
                        <li class="divider"></li>
<%--
                        <li><a href="#">Calendar</a></li>
                        <li><a href="#">Inbox &nbsp;&nbsp;<span class="badge bg-danger animated bounceIn">9</span></a></li>
                        <li class="divider"></li>
--%>                        
                        <li><a href="logout"><i class="fa fa-sign-out"></i> &nbsp; 로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="content-wrap">
	<main id="content" class="content" role="main">
		<ol class="breadcrumb">
			<li>現在の位置</li>
			<li class="active">売上分析</li>
		</ol>
		<h1 class="page-title">売上分析 - <span class="fw-semi-bold">グラフ選択</span></h1>


<%--총 수량--%><%--오늘 수량--%><%--총 수입--%><%--막대--%>
<%--
 	<input id="btn1" type="button" onclick="javascript:location.href='goodsanalysis'" value="test1">
 	<input id="btn2" type="button" onclick="javascript:location.href='goodsanalysis2'" value="test2">
 	<input id="btn3" type="button" onclick="javascript:location.href='goodsanalysis3'" value="test3">
 	<input id="btn4" type="button" onclick="javascript:location.href='goodsanalysis4'" value="test4">
--%>


        <div class="row">



            <div class="col-lg-4 col-md-12">
                <section class="widget">
                    <header>
                        <h4>
                            <span class="fw-semi-bold">総販売商品本数</span>
                        </h4>
                    </header>
                    <div class="widget-body">
                        <p class="fs-mini text-muted">
                        	<br><img src="./resources/image/g1.jpg" alt="..."><br><br>
<!--Use any of the available button classes to quickly create a styled button. Semantically distinguishable beauty.-->
                        </p>
                        <p class="text-align-center">
                            <button class="btn btn-default width-100 mb-xs" role="button" id="btn1" onclick="javascript:location.href='goodsanalysis'" value="test1">
                                	選択
                            </button>
                        </p>
                    </div>
                </section>
            </div>



            <div class="col-lg-4 col-md-12">
                <section class="widget">
                    <header>
                        <h4>
                            <span class="fw-semi-bold">今日の販売数量</span>
                        </h4>
                    </header>
                    <div class="widget-body">
                        <p class="fs-mini text-muted">
                        	<br><img src="./resources/image/g2.jpg" alt="..."><br><br>
<!--Use any of the available button classes to quickly create a styled button. Semantically distinguishable beauty.-->
                        </p>
                        <p class="text-align-center">
                            <button class="btn btn-default width-100 mb-xs" role="button" id="btn2" onclick="javascript:location.href='goodsanalysis2'" value="test2">
                                	選択
                            </button>
                        </p>
                    </div>
                </section>
            </div>



            <div class="col-lg-4 col-md-12">
                <section class="widget">
                    <header>
                        <h4>
                            <span class="fw-semi-bold">日付別総販売収入</span>
                        </h4>
                    </header>
                    <div class="widget-body">
                        <p class="fs-mini text-muted">
                        	<br><img src="./resources/image/g3.jpg" alt="..."><br><br>
<!--Use any of the available button classes to quickly create a styled button. Semantically distinguishable beauty.-->
                        </p>
                        <p class="text-align-center">
                            <button class="btn btn-default width-100 mb-xs" role="button" id="btn3" onclick="javascript:location.href='goodsanalysis3'" value="test3">
                                	選択
                            </button>
                        </p>
                    </div>
                </section>
            </div>



            <div class="col-lg-4 col-md-12">
                <section class="widget">
                    <header>
                        <h4>
                            <span class="fw-semi-bold">今日の販売収入</span>
                        </h4>
                    </header>
                    <div class="widget-body">
                        <p class="fs-mini text-muted">
                        	<br><img src="./resources/image/g4.jpg" alt="..."><br><br>
<!--Use any of the available button classes to quickly create a styled button. Semantically distinguishable beauty.-->
                        </p>
                        <p class="text-align-center">
                            <button class="btn btn-default width-100 mb-xs" role="button" id="btn4" onclick="javascript:location.href='goodsanalysis4'" value="test4">
                                	選択
                            </button>
                        </p>
                    </div>
                </section>
            </div>




        </div> 	



	</main>
</div>


<!-- The Loader. Is shown when pjax happens -->
<div class="loader-wrap hiding hide">
    <i class="fa fa-circle-o-notch fa-spin-fast"></i>
</div>

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
<script src="./resources/bootstrap/vendor/underscore/underscore-min.js"></script>
<script src="./resources/bootstrap/vendor/backbone/backbone.js"></script>
<script src="./resources/bootstrap/vendor/backbone.paginator/lib/backbone.paginator.min.js"></script>
<script src="./resources/bootstrap/vendor/backgrid/lib/backgrid.js"></script>
<script src="./resources/bootstrap/vendor/backgrid-paginator/backgrid-paginator.js"></script>
<%--<script src="./resources/bootstrap/vendor/datatables/media/js/jquery.dataTables.js"></script>--%>
<script src="./resources/bootstrap/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>

<!-- page specific js -->
<%--<script src="./resources/bootstrap/js/tables-dynamic.js"></script>--%>
</body>
</html>
