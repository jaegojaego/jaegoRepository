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
<script src="./resources/js/send.js"></script>
<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<link rel="stylesheet" href="/resources/demos/style.css">

<script type="text/javascript">
var eleChart = []; 
var ele = [];
google.charts.load('current', {'packages':['corechart']});

	$(document).ready(function() { 
		var today = new Date();
		var date1 = today.getFullYear()+"-"+(today.getMonth() + 1)+"- 01";
		var date2 = today.getFullYear()+"-"+(today.getMonth() + 1)+"-"+today.getDate();
			
		ajax(date1,date2);	
	 }); 
	 
	$(function() {
		$( "#date1" ).datepicker({dateFormat:"yy-mm-dd"});
		$( "#date2" ).datepicker({dateFormat:"yy-mm-dd"});
	});

	 $(function(){
		 	
		$('#ok').click(function(){
		var date1=$( "#date1" ).val();
		var date2=$( "#date2" ).val();
			
		ajax(date1,date2);
		});
	}) 
	
	function ajax(date1,date2){
		 $.ajax({
			type:"GET",
			url:"analysismoney",
			data:{
				date1:date1,
				date2:date2
			},
			success: function(result){
				console.log(result);
				if(result.length==0){
					alert("자료가 존재하지 않습니다.");
					ele = ['',0];
					eleChart=[];
					eleChart.push(ele);
					console.log(ele);
					console.log(eleChart);
					google.charts.setOnLoadCallback(drawChart);
				}else{
				alert("성공?");
				eleChart = [];
				$.each(result, function(index, item) {
	   				ele = [item.SALESTIME, item.PRICE];
	   					
	   				eleChart.push(ele);
	   				console.log(ele);
	   				google.charts.setOnLoadCallback(drawChart);
   				})
				}
			}
		}); 
	}
</script>


<%--<script type="text/javascript">
	function pagingFormSubmit(currentPage) {
		var form = document.getElementById("pagingForm");
		var page = document.getElementById("page");
		page.value = currentPage;
		form.submit();
	}
	</script>--%>
    
    <link href="./resources/bootstrap/css/application.min.css" rel="stylesheet">

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

<%--
            <li>
                <a href="inbox.html">
                    <span class="icon">
                        <i class="fa fa-envelope"></i>
                    </span>
                    Email
                    <span class="label label-danger">
                        9
                    </span>
                </a>
            </li>
--%>

        </ul>




















<%--↓================================================================================================================================--%>        
<%--
        <!-- every .sidebar-nav may have a title -->
        <h5 class="sidebar-nav-title">템플릿 <a class="action-link" href="#"><i class="glyphicon glyphicon-refresh"></i></a></h5>
        <ul class="sidebar-nav">
--%>
<%--
            <li>
                <!-- an example of nested submenu. basic bootstrap collapse component -->
                <a class="collapsed" href="#sidebar-forms" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="glyphicon glyphicon-align-right"></i>
                    </span>
                    Forms
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-forms" class="collapse">
                    <li><a href="form_elements.html">Form Elements</a></li>
                    <li><a href="form_validation.html">Form Validation</a></li>
                    <li><a href="form_wizard.html">Form Wizard</a></li>
                </ul>
            </li>

            <li>
                <a class="collapsed" href="#sidebar-ui" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="glyphicon glyphicon-tree-conifer"></i>
                    </span>
                    UI Elements
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-ui" class="collapse">
                    <li><a href="ui_components.html">Components</a></li>
                    <li><a href="ui_notifications.html">Notifications</a></li>
                    <li><a href="ui_icons.html">Icons</a></li>
                    <li><a href="ui_buttons.html">Buttons</a></li>
                    <li><a href="ui_tabs_accordion.html">Tabs & Accordion</a></li>
                    <li><a href="ui_list_groups.html">List Groups</a></li>
                </ul>
            </li>

            <li>
                <a href="grid.html">
                    <span class="icon">
                        <i class="glyphicon glyphicon-th"></i>
                    </span>
                    그리이드
                </a>
            </li>
--%>

<%--             <li>
                <a class="collapsed" href="http://www.naver.com/#sidebar-maps" data-toggle="collapse" data-parent="#sidebar">

                    <span class="icon">
                        <i class="glyphicon glyphicon-map-marker"></i>
                    </span>
                    지도호우
 --%>
                    <%--<i class="toggle fa fa-angle-down"></i>--%>	<%--하향 화살표 삭제--%>
<%--                </a>--%>
                <%--<ul id="sidebar-maps" class="collapse">
                    <!-- data-no-pjax turns off pjax loading for this link. Use in case of complicated js loading on the
                         target page -->
                    <li><a href="maps_google.html" data-no-pjax>Google Maps</a></li>
                    <li><a href="maps_vector.html">Vector Maps</a></li>
                </ul>
            </li>

<%--
            <li>
                <a class="collapsed" href="#sidebar-extra" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="fa fa-leaf"></i>
                    </span>
                    Extra
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-extra" class="collapse">
                    <li><a href="calendar.html">Calendar</a></li>
                    <li><a href="invoice.html">Invoice</a></li>
                    <li><a href="login.html" target="_blank" data-no-pjax>Login Page</a></li>
                    <li><a href="error.html" target="_blank" data-no-pjax>Error Page</a></li>
                    <li><a href="gallery.html">Gallery</a></li>
                    <li><a href="search.html">Search Results</a></li>
                    <li><a href="time_line.html" data-no-pjax>Time Line</a></li>
                </ul>
            </li>
--%>
<!--             <li>
                <a class="collapsed" href="#sidebar-levels" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="fa fa-folder-open"></i>
                    </span>
                    Menu Levels
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-levels" class="collapse">
                    <li><a href="#">Level 1</a></li>
                    <li>
                        <a class="collapsed" href="#sidebar-sub-levels" data-toggle="collapse" data-parent="#sidebar-levels">
                            Level 2
                            <i class="toggle fa fa-angle-down"></i>
                        </a>
                        <ul id="sidebar-sub-levels" class="collapse">
                            <li><a href="#">Level 3</a></li>
                            <li><a href="#">Level 3</a></li>
                        </ul>
                    </li>
                </ul>
            </li> -->
        </ul>
<%--↑================================================================================================================================--%>




















<%--
        <h5 class="sidebar-nav-title">Labels <a class="action-link" href="#"><i class="glyphicon glyphicon-plus"></i></a></h5>
        <!-- some styled links in sidebar. ready to use as links to email folders, projects, groups, etc -->
        <ul class="sidebar-labels">
            <li>
                <a href="#">
                    <!-- yep, .circle again -->
                    <i class="fa fa-circle text-warning mr-xs"></i>
                    <span class="label-name">My Recent</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-circle text-gray mr-xs"></i>
                    <span class="label-name">Starred</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-circle text-danger mr-xs"></i>
                    <span class="label-name">Background</span>
                </a>
            </li>
        </ul>
        <h5 class="sidebar-nav-title">Projects</h5>
        <!-- A place for sidebar notifications & alerts -->
        <div class="sidebar-alerts">
            <div class="alert fade in">
                <a href="#" class="close" data-dismiss="alert" aria-hidden="true">&times;</a>
                <span class="text-white fw-semi-bold">Sales Report</span> <br>
                <div class="progress progress-xs mt-xs mb-0">
                    <div class="progress-bar progress-bar-gray-light" style="width: 16%"></div>
                </div>
                <small>Calculating x-axis bias... 65%</small>
            </div>
            <div class="alert fade in">
                <a href="#" class="close" data-dismiss="alert" aria-hidden="true">&times;</a>
                <span class="text-white fw-semi-bold">Personal Responsibility</span> <br>
                <div class="progress progress-xs mt-xs mb-0">
                    <div class="progress-bar progress-bar-danger" style="width: 23%"></div>
                </div>
                <small>Provide required notes</small>
            </div>
        </div>
--%>
    </div>
</nav>




















<!-- This is the white navigation bar seen on the top. A bit enhanced BS navbar. See .page-controls in _base.scss. -->
<nav class="page-controls navbar navbar-default">
    <div class="container-fluid">
        <!-- .navbar-header contains links seen on xs & sm screens -->

        <div class="navbar-header">
<%--
            <ul class="nav navbar-nav">
                <li>
                    <!-- whether to automatically collapse sidebar on mouseleave. If activated acts more like usual admin templates -->
                    <a class="hidden-sm hidden-xs" id="nav-state-toggle" href="#" title="Turn on/off sidebar collapsing" data-placement="bottom">
                        <i class="fa fa-bars fa-lg"></i>
                    </a>
                    <!-- shown on xs & sm screen. collapses and expands navigation -->
                    <a class="visible-sm visible-xs" id="nav-collapse-toggle" href="#" title="Show/hide sidebar" data-placement="bottom">
                        <span class="rounded rounded-lg bg-gray text-white visible-xs"><i class="fa fa-bars fa-lg"></i></span>
                        <i class="fa fa-bars fa-lg hidden-xs"></i>
                    </a>
                </li>
                <li class="ml-sm mr-n-xs hidden-xs"><a href="#"><i class="fa fa-refresh fa-lg"></i></a></li>
                <li class="ml-n-xs hidden-xs"><a href="#"><i class="fa fa-times fa-lg"></i></a></li>
            </ul>
--%>

<%--
            <ul class="nav navbar-nav navbar-right visible-xs">
                <li>
                    <!-- toggles chat -->
                    <a href="#" data-toggle="chat-sidebar">
                        <span class="rounded rounded-lg bg-gray text-white"><i class="fa fa-globe fa-lg"></i></span>
                    </a>
                </li>
            </ul>
--%>            
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
                        <label class="form-control">이 세상의 모든 재고가 사라지는 날까지!　<span class="fw-semi-bold">最後の在庫</span></h1></label><%--<input class="form-control" type="text" placeholder="Search Dashboard">--%>                        
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
<%--
			<li>YOU ARE HERE</li>
			<li class="active">블라블라블라</li>
--%>			
		</ol>
		<h1 class="page-title"><%--그래프 : --%><span class="fw-semi-bold">일자별 총 판매 수익</span></h1>


	<input type="text" id="date1">~<input type="text" id="date2">
	<input type="button" id="ok" value="조회">
	<div id="curve_chart" style="width: 900px; height: 500px;"></div>



	</main>
</div>
<!-- The Loader. Is shown when pjax happens -->
<div class="loader-wrap hiding hide">
    <i class="fa fa-circle-o-notch fa-spin-fast"></i>
</div>
<!-- common libraries. required for every page -->
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
<script src="./resources/bootstrap/vendor/datatables/media/js/jquery.dataTables.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>


<!-- page specific js -->
<script src="./resources/bootstrap/js/tables-dynamic.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
</body>
</html>