<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sing - Tables Dynamicc</title>

	<script>
	function goodslist() {
		location.href='goodslist';
	}
	///web/goodslist3
	</script>
    
    <script type="text/javascript">
	function pagingFormSubmit(currentPage) {
		var form = document.getElementById("pagingForm");
		var page = document.getElementById("page");
		page.value = currentPage;
		form.submit();
	}
	</script>
    
    <link href="./resources/bootstrap/css/application.min.css" rel="stylesheet">
	<link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script src='<c:url value="/resources/js/jquery-3.1.1.js"/>'></script>
<script>
/* yeah we need this empty stylesheet here. It's cool chrome & chromium fix
   chrome fix https://code.google.com/p/chromium/issues/detail?id=167083
              https://code.google.com/p/chromium/issues/detail?id=332189
*/
</script>
<script>
jQuery(document).ready(function() {
   
    jQuery("#uploadB").change(function() {
        if(jQuery("#displayDiv").css("display") != "none") {
           jQuery("#displayDiv").css("display", "none");
        }
        
        else {

            jQuery("#displayDiv").css("display", "none"); 
        }
    });
});
   function testt() {
      alert("clicked!");
   }
   function sellerIDcheck() {
      window.open("sellerIDcheck", "width=400,height=300");
   }
   function add_sellerBEA2() {
      var html = "<div class='form-group'><label for='normal-field' class='col-sm-4 control-label'></label><div class='col-sm-7'><input type='text' id='sellerBEA2' class='form-control' placeholder='상세 주소'></div></div>";
      $("#div_sellerBEA2").html(html);
   }

   function beforeSubmit() {

      //회원수정 전 체크-------------------------------------------------------------- 
   
      var sellerId_tf = document.getElementById('sellerId_tf').value;
      var sellerPw = document.getElementById('sellerPw').value;
      var sellerPw2 = document.getElementById('sellerPw2').value;
      var sellerName = document.getElementById('sellerName').value;
      var sellerShopName = document.getElementById('sellerShopName').value;
      var sellerPhone = document.getElementById('sellerPhone').value;
      var sellerEmail = document.getElementById('sellerEmail').value;
      var sellerBEA_tf = document.getElementById('sellerBEA_tf').value;
      var sellerTOB = document.getElementById('sellerTOB').value;

   
      if (sellerPw == '') {
         alert('비밀번호를 입력하세요.');
         return false;
      } else if (sellerPw != sellerPw2) {
         alert('비밀번호가 일치하지 않습니다.');
         return false;
      } else if (sellerPw.length < 6 || sellerPw.length < 6) {
         alert('비밀번호는 영문 or 숫자 6자 이상이어야 합니다.');
         return false;
      } else if (sellerName == '') {
         alert('대표자 성명을 입력하세요');
         return false;
      }  else if (sellerPhone == '') {
         alert('매장 전화번호를 입력하세요');
         return false;
      } else if (sellerEmail == '') {
         alert('이메일을 입력하세요');
         return false;
      } 
      //------------------------------------------------------------------------------

      //이상 없으면 정상 진행

      var sellerBEA2 = document.getElementById('sellerBEA2').value;
      /* if (sellerBEA2 != null) {
         sellerBEA_tf = sellerBEA_tf + " " + sellerBEA2;
         document.getElementById('sellerBEA').value = sellerBEA_tf;
      } */

      //document.getElementById('sellerId').value = document.getElementById('sellerId_tf').value;

      document.getElementById('sellerupdateForm').submit(); //form을 submit해줌
      return true;
   }
</script>
<%--이미지 업로드 미리 보기--%>
<script type="text/javascript">
   $(function() {
      $("#uploadB").on('change', function(){
         readURL(this);
         });
      });

        function readURL(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
               
               $('#blah').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
         }
      }
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
			<a href="index.html">saiko</a>
            

            
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
                <a class="collapsed" href="#sidebar-dashboard" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="fa fa-desktop"></i>
                    </span>
                    판매자 메인
                    <i></i>
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-dashboard" class="collapse">
                    <li><a href="index.html">Dashboard</a></li>
                    <li><a href="widgets.html">Widgets</a></li>
                </ul>
            </li>

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



            <li>
                <a class="collapsed" href="charts.html">
                    <span class="icon">
                        <i class="glyphicon glyphicon-stats"></i>
                    </span>
                    매출 분석
                </a>                
            </li>
            



            <li class="active">
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





        
        <!-- every .sidebar-nav may have a title -->
        <h5 class="sidebar-nav-title">템플릿 <a class="action-link" href="#"><i class="glyphicon glyphicon-refresh"></i></a></h5>
        <ul class="sidebar-nav">



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




            <li>
                <a <%--class="collapsed"--%> href="http://www.naver.com/<%--#sidebar-maps--%>" <%--data-toggle="collapse"--%> <%--data-parent="#sidebar"--%>>
                    <span class="icon">
                        <i class="glyphicon glyphicon-map-marker"></i>
                    </span>
                    지도호우
                    <%--<i class="toggle fa fa-angle-down"></i>--%>	<%--하향 화살표 삭제--%>
                </a>
                <%--<ul id="sidebar-maps" class="collapse">
                    <!-- data-no-pjax turns off pjax loading for this link. Use in case of complicated js loading on the
                         target page -->
                    <li><a href="maps_google.html" data-no-pjax>Google Maps</a></li>
                    <li><a href="maps_vector.html">Vector Maps</a></li>
                </ul>--%>
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
            <li>
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
            </li>
        </ul>





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
            <ul class="nav navbar-nav navbar-right visible-xs">
                <li>
                    <!-- toggles chat -->
                    <a href="#" data-toggle="chat-sidebar">
                        <span class="rounded rounded-lg bg-gray text-white"><i class="fa fa-globe fa-lg"></i></span>
                    </a>
                </li>
            </ul>
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
                        <span class="input-group-addon">
                            <i class="fa fa-search"></i>
                        </span>
                        <input class="form-control" type="text" placeholder="Search Dashboard">
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
                        Philip <strong>Smith</strong>&nbsp;
                        <span class="circle bg-warning fw-bold">
                            13
                        </span>
                        <b class="caret"></b></a>
                    <!-- ready to use notifications dropdown.  inspired by smartadmin template.
                         consists of three components:
                         notifications, messages, progress. leave or add what's important for you.
                         uses Sing's ajax-load plugin for async content loading. See #load-notifications-btn -->
                    <div class="dropdown-menu animated fadeInUp" id="notifications-dropdown-menu">
                        <section class="panel notifications">
                            <header class="panel-heading">
                                <div class="text-align-center mb-sm">
                                    <strong>You have 13 notifications</strong>
                                </div>
                                <div class="btn-group btn-group-sm btn-group-justified" id="notifications-toggle" data-toggle="buttons">
                                    <label class="btn btn-default active">
                                        <!-- ajax-load plugin in action. setting data-ajax-load & data-ajax-target is the
                                             only requirement for async reloading -->
                                        <input type="radio" checked
                                               data-ajax-trigger="change"
                                               data-ajax-load="demo/ajax/notifications.html"
                                               data-ajax-target="#notifications-list"> Notifications
                                    </label>
                                    <label class="btn btn-default">
                                        <input type="radio"
                                               data-ajax-trigger="change"
                                               data-ajax-load="demo/ajax/messages.html"
                                               data-ajax-target="#notifications-list"> Messages
                                    </label>
                                    <label class="btn btn-default">
                                        <input type="radio"
                                               data-ajax-trigger="change"
                                               data-ajax-load="demo/ajax/progress.html"
                                               data-ajax-target="#notifications-list"> Progress
                                    </label>
                                </div>
                            </header>
                            <!-- notification list with .thin-scroll which styles scrollbar for webkit -->
                            <div id="notifications-list" class="list-group thin-scroll">
                                <div class="list-group-item">
                                    <span class="thumb-sm pull-left mr clearfix">
                                        <img class="img-circle" src="./resources/bootstrap/demo/img/people/a3.jpg" alt="...">
                                    </span>
                                    <p class="no-margin overflow-hidden">
                                        1 new user just signed up! Check out
                                        <a href="#">Monica Smith</a>'s account.
                                        <time class="help-block no-margin">
                                            2 mins ago
                                        </time>
                                    </p>
                                </div>
                                <a class="list-group-item" href="#">
                                    <span class="thumb-sm pull-left mr">
                                        <i class="glyphicon glyphicon-upload fa-lg"></i>
                                    </span>
                                    <p class="text-ellipsis no-margin">
                                        2.1.0-pre-alpha just released. </p>
                                    <time class="help-block no-margin">
                                        5h ago
                                    </time>
                                </a>
                                <a class="list-group-item" href="#">
                                    <span class="thumb-sm pull-left mr">
                                        <i class="fa fa-bolt fa-lg"></i>
                                    </span>
                                    <p class="text-ellipsis no-margin">
                                        Server load limited. </p>
                                    <time class="help-block no-margin">
                                        7h ago
                                    </time>
                                </a>
                                <div class="list-group-item">
                                    <span class="thumb-sm pull-left mr clearfix">
                                        <img class="img-circle" src="./resources/bootstrap/demo/img/people/a5.jpg" alt="...">
                                    </span>
                                    <p class="no-margin overflow-hidden">
                                        User <a href="#">Jeff</a> registered
                                        &nbsp;&nbsp;
                                        <button class="btn btn-xs btn-success">Allow</button>
                                        <button class="btn btn-xs btn-danger">Deny</button>
                                        <time class="help-block no-margin">
                                            12:18 AM
                                        </time>
                                    </p>
                                </div>
                                <div class="list-group-item">
                                    <span class="thumb-sm pull-left mr">
                                        <i class="fa fa-shield fa-lg"></i>
                                    </span>
                                    <p class="no-margin overflow-hidden">
                                        Instructions for changing your Envato Account password. Please
                                        check your account <a href="#">security page</a>.
                                        <time class="help-block no-margin">
                                            12:18 AM
                                        </time>
                                    </p>
                                </div>
                                <a class="list-group-item" href="#">
                                    <span class="thumb-sm pull-left mr">
                                        <span class="rounded bg-primary rounded-lg">
                                            <i class="fa fa-facebook text-white"></i>
                                        </span>
                                    </span>
                                    <p class="text-ellipsis no-margin">
                                        New <strong>76</strong> facebook likes received.</p>
                                    <time class="help-block no-margin">
                                        15 Apr 2014
                                    </time>
                                </a>
                                <a class="list-group-item" href="#">
                                    <span class="thumb-sm pull-left mr">
                                        <span class="circle circle-lg bg-gray-dark">
                                            <i class="fa fa-circle-o text-white"></i>
                                        </span>
                                    </span>
                                    <p class="text-ellipsis no-margin">
                                        Dark matter detected.</p>
                                    <time class="help-block no-margin">
                                        15 Apr 2014
                                    </time>
                                </a>
                            </div>
                            <footer class="panel-footer text-sm">
                                <!-- ajax-load button. loads demo/ajax/notifications.php to #notifications-list
                                     when clicked -->
                                <button class="btn btn-xs btn-link pull-right"
                                        id="load-notifications-btn"
                                        data-ajax-load="demo/ajax/notifications.php"
                                        data-ajax-target="#notifications-list"
                                        data-loading-text="<i class='fa fa-refresh fa-spin mr-xs'></i> Loading...">
                                    <i class="fa fa-refresh"></i>
                                </button>
                                <span class="fs-mini">Synced at: 21 Apr 2014 18:36</span>
                            </footer>
                        </section>
                    </div>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-cog fa-lg"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="glyphicon glyphicon-user"></i> &nbsp; My Account</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Calendar</a></li>
                        <li><a href="#">Inbox &nbsp;&nbsp;<span class="badge bg-danger animated bounceIn">9</span></a></li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out"></i> &nbsp; Log Out</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" data-toggle="chat-sidebar">
                        <i class="fa fa-globe fa-lg"></i>
                    </a>
                    <div id="chat-notification" class="chat-notification hide">
                        <div class="chat-notification-inner">
                            <h6 class="title">
                                <span class="thumb-xs">
                                    <img src="./resources/bootstrap/demo/img/people/a6.jpg" class="img-circle mr-xs pull-left">
                                </span>
                                Jess Smith
                            </h6>
                            <p class="text">Hey! What's up?</p>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="chat-sidebar" id="chat">
    <div class="chat-sidebar-content">
        <header class="chat-sidebar-header">
            <h4 class="chat-sidebar-title">Contacts</h4>
            <div class="form-group no-margin">
                <div class="input-group input-group-dark">
                    <input class="form-control fs-mini" id="chat-sidebar-search" type="text" placeholder="Search...">
                    <span class="input-group-addon">
                        <i class="fa fa-search"></i>
                    </span>
                </div>
            </div>
        </header>
        <div class="chat-sidebar-contacts chat-sidebar-panel open">
            <h5 class="sidebar-nav-title">Today</h5>
            <div class="list-group chat-sidebar-user-group">
                <a class="list-group-item" href="#chat-sidebar-user-1">
                    <i class="fa fa-circle text-success pull-right"></i>
                    <span class="thumb-sm pull-left mr">
                        <img class="img-circle" src="./resources/bootstrap/demo/img/people/a2.jpg" alt="...">
                    </span>
                    <h5 class="message-sender">Chris Gray</h5>
                    <p class="message-preview">Hey! What's up? So many times since we</p>
                </a>
                <a class="list-group-item" href="#chat-sidebar-user-2">
                    <i class="fa fa-circle text-gray-light pull-right"></i>
                <span class="thumb-sm pull-left mr">
                    <img class="img-circle" src="./resources/bootstrap/img/avatar.png" alt="...">
                </span>
                    <h5 class="message-sender">Jamey Brownlow</h5>
                    <p class="message-preview">Good news coming tonight. Seems they agreed to proceed</p>
                </a>
                <a class="list-group-item" href="#chat-sidebar-user-3">
                    <i class="fa fa-circle text-danger pull-right"></i>
                <span class="thumb-sm pull-left mr">
                    <img class="img-circle" src="./resources/bootstrap/demo/img/people/a1.jpg" alt="...">
                </span>
                    <h5 class="message-sender">Livia Walsh</h5>
                    <p class="message-preview">Check out my latest email plz!</p>
                </a>
                <a class="list-group-item" href="#chat-sidebar-user-4">
                    <i class="fa fa-circle text-gray-light pull-right"></i>
                <span class="thumb-sm pull-left mr">
                    <img class="img-circle" src="./resources/bootstrap/img/avatar.png" alt="...">
                </span>
                    <h5 class="message-sender">Jaron Fitzroy</h5>
                    <p class="message-preview">What about summer break?</p>
                </a>
                <a class="list-group-item" href="#chat-sidebar-user-5">
                    <i class="fa fa-circle text-success pull-right"></i>
                <span class="thumb-sm pull-left mr">
                    <img class="img-circle" src="./resources/bootstrap/demo/img/people/a4.jpg" alt="...">
                </span>
                    <h5 class="message-sender">Mike Lewis</h5>
                    <p class="message-preview">Just ain't sure about the weekend now. 90% I'll make it.</p>
                </a>
            </div>
            <h5 class="sidebar-nav-title">Last Week</h5>
            <div class="list-group chat-sidebar-user-group">
                <a class="list-group-item" href="#chat-sidebar-user-6">
                    <i class="fa fa-circle text-gray-light pull-right"></i>
                <span class="thumb-sm pull-left mr">
                    <img class="img-circle" src="./resources/bootstrap/demo/img/people/a6.jpg" alt="...">
                </span>
                    <h5 class="message-sender">Freda Edison</h5>
                    <p class="message-preview">Hey what's up? Me and Monica going for a lunch somewhere. Wanna join?</p>
                </a>
                <a class="list-group-item" href="#chat-sidebar-user-7">
                    <i class="fa fa-circle text-success pull-right"></i>
                <span class="thumb-sm pull-left mr">
                    <img class="img-circle" src="./resources/bootstrap/demo/img/people/a5.jpg" alt="...">
                </span>
                    <h5 class="message-sender">Livia Walsh</h5>
                    <p class="message-preview">Check out my latest email plz!</p>
                </a>
                <a class="list-group-item" href="#chat-sidebar-user-8">
                    <i class="fa fa-circle text-warning pull-right"></i>
                <span class="thumb-sm pull-left mr">
                    <img class="img-circle" src="./resources/bootstrap/demo/img/people/a3.jpg" alt="...">
                </span>
                    <h5 class="message-sender">Jaron Fitzroy</h5>
                    <p class="message-preview">What about summer break?</p>
                </a>
                <a class="list-group-item" href="#chat-sidebar-user-9">
                    <i class="fa fa-circle text-gray-light pull-right"></i>
                <span class="thumb-sm pull-left mr">
                    <img class="img-circle" src="./resources/bootstrap/img/avatar.png" alt="...">
                </span>
                    <h5 class="message-sender">Mike Lewis</h5>
                    <p class="message-preview">Just ain't sure about the weekend now. 90% I'll make it.</p>
                </a>
            </div>
        </div>
        <div class="chat-sidebar-chat chat-sidebar-panel" id="chat-sidebar-user-1">
            <h5 class="title">
                <a class="js-back" href="#">
                    <i class="fa fa-angle-left mr-xs"></i>
                    Chris Gray
                </a>
            </h5>
            <ul class="message-list">
                <li class="message">
                    <span class="thumb-sm">
                        <img class="img-circle" src="./resources/bootstrap/demo/img/people/a2.jpg" alt="...">
                    </span>
                    <div class="message-body">
                        Hey! What's up?
                    </div>
                </li>
                <li class="message">
                    <span class="thumb-sm">
                        <img class="img-circle" src="./resources/bootstrap/demo/img/people/a2.jpg" alt="...">
                    </span>
                    <div class="message-body">
                        Are you there?
                    </div>
                </li>
                <li class="message">
                    <span class="thumb-sm">
                        <img class="img-circle" src="./resources/bootstrap/demo/img/people/a2.jpg" alt="...">
                    </span>
                    <div class="message-body">
                        Let me know when you come back.
                    </div>
                </li>
                <li class="message from-me">
                    <span class="thumb-sm">
                        <img class="img-circle" src="./resources/bootstrap/img/avatar.png" alt="...">
                    </span>
                    <div class="message-body">
                        I am here!
                    </div>
                </li>
            </ul>
        </div>
        <div class="chat-sidebar-chat chat-sidebar-panel" id="chat-sidebar-user-2">
            <h5 class="title">
                <a class="js-back" href="#">
                    <i class="fa fa-angle-left mr-xs"></i>
                    Jamey Brownlow
                </a>
            </h5>
            <ul class="message-list">
            </ul>
        </div>
        <div class="chat-sidebar-chat chat-sidebar-panel" id="chat-sidebar-user-3">
            <h5 class="title">
                <a class="js-back" href="#">
                    <i class="fa fa-angle-left mr-xs"></i>
                    Livia Walsh
                </a>
            </h5>
            <ul class="message-list">
            </ul>
        </div>
        <div class="chat-sidebar-chat chat-sidebar-panel" id="chat-sidebar-user-4">
            <h5 class="title">
                <a class="js-back" href="#">
                    <i class="fa fa-angle-left mr-xs"></i>
                    Jaron Fitzroy
                </a>
            </h5>
            <ul class="message-list">
            </ul>
        </div>
        <div class="chat-sidebar-chat chat-sidebar-panel" id="chat-sidebar-user-5">
            <h5 class="title">
                <a class="js-back" href="#">
                    <i class="fa fa-angle-left mr-xs"></i>
                    Mike Lewis
                </a>
            </h5>
            <ul class="message-list">
            </ul>
        </div>
        <div class="chat-sidebar-chat chat-sidebar-panel" id="chat-sidebar-user-6">
            <h5 class="title">
                <a class="js-back" href="#">
                    <i class="fa fa-angle-left mr-xs"></i>
                    Freda Edison
                </a>
            </h5>
            <ul class="message-list">
            </ul>
        </div>
        <div class="chat-sidebar-chat chat-sidebar-panel" id="chat-sidebar-user-7">
            <h5 class="title">
                <a class="js-back" href="#">
                    <i class="fa fa-angle-left mr-xs"></i>
                    Livia Walsh
                </a>
            </h5>
            <ul class="message-list">
            </ul>
        </div>
        <div class="chat-sidebar-chat chat-sidebar-panel" id="chat-sidebar-user-8">
            <h5 class="title">
                <a class="js-back" href="#">
                    <i class="fa fa-angle-left mr-xs"></i>
                    Jaron Fitzroy
                </a>
            </h5>
            <ul class="message-list">
            </ul>
        </div>
        <div class="chat-sidebar-chat chat-sidebar-panel" id="chat-sidebar-user-9">
            <h5 class="title">
                <a class="js-back" href="#">
                    <i class="fa fa-angle-left mr-xs"></i>
                    Mike Lewis
                </a>
            </h5>
            <ul class="message-list">
            </ul>
        </div>
        <footer class="chat-sidebar-footer form-group">
            <input class="form-control input-dark fs-mini" id="chat-sidebar-input" type="text"  placeholder="Type your message">
        </footer>
    </div>
</div>

<div class="content-wrap">
   <%--<div class="content-wrap">--%>
   <%-- 좌 → 우로 이동하는 파란색 띠 --%>
   <!-- main page content. the place to put widgets in. usually consists of .row > .col-md-* > .widget.  -->
   <main id="content" class="content" role="main">






















		<ol class="breadcrumb">
			<li>YOU ARE HERE</li>
			<li class="active">블라블라블라</li>
		</ol>
		<h1 class="page-title">회원 수정 : <span class="fw-semi-bold">판매자</span></h1>

		<div class="row">
			<div class="col-md-6">
				<section class="widget">
				<header>
				<h5>
					<%--                            Inputs--%>
				</h5>
               <%--                    <div class="widget-controls">
                            <a href="#"><i class="glyphicon glyphicon-cog"></i></a>
                            <a href="#"><i class="fa fa-refresh"></i></a>
                            <a href="#" data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
                        </div>--%>
				</header>

				<div class="widget-body">
				<form method="post" id="sellerupdateForm" enctype="multipart/form-data" class="form-horizontal" role="form" action="sellerupdateForm">
					<fieldset>
						<legend><strong> <%--Horizontal--%></strong><%-- form--%></legend>
						<div class="form-group">
							<label for="normal-field" class="col-sm-4 control-label">사업자 번호</label>
							<div class="col-sm-7">
								<input type="text" name="sellerCRN" id="sellerCRN" class="form-control" readonly="readonly" value="${seller.sellerCRN}">
							</div>
					</div>



					<div class="form-group">
						<label class="col-sm-4 control-label" for="prepended-input">ID</label>
						<div class="col-sm-7">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" name="sellerId_tf" id="sellerId_tf" class="form-control" size="16" disabled="disabled" readonly="readonly" value="${seller.sellerId}">
								<input type="hidden" name="sellerId" id="sellerId" value="${seller.sellerId}">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" for="password-field">비밀번호</label>
						<div class="col-sm-7">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" name="sellerPw" id="sellerPw" placeholder='영문 or 숫자 6자 이상'>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" for="password-field">비밀번호 확인</label>
						<div class="col-sm-7">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" id="sellerPw2" placeholder="비밀번호 재입력">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="hint-field" class="col-sm-4 control-label">
							대표자 성명
							<%--<span class="help-block">Some help text</span>--%>
						</label>
						<div class="col-sm-7">
							<input type="text" name="sellerName" id="sellerName" class="form-control" placeholder='대표자 성명' value="${seller.sellerName}">
						</div>
					</div>

					<div class="form-group">
						<label for="hint-field" class="col-sm-4 control-label">
							상호
							<%--<span class="help-block">Some help text</span>--%>
						</label>
						<div class="col-sm-7">
							<input type="text" name="sellerShopName" id="sellerShopName" class="form-control" readonly="readonly" value="${seller.sellerShopName}">
						</div>
					</div>

					<div class="form-group">
						<label for="hint-field" class="col-sm-4 control-label">
							전화번호
							<%--<span class="help-block">-를 제외한 번호만 입력하세요</span>--%>
						</label>
						<div class="col-sm-7">
							<input type="text" name="sellerPhone" id="sellerPhone" class="form-control" placeholder='-를 제외한 번호만 입력하세요'>
						</div>
					</div>

					<div class="form-group">
						<label for="normal-field" class="col-sm-4 control-label">E-mail</label>
						<div class="col-sm-7">
							<input type="text" name="sellerEmail" id="sellerEmail" class="form-control" placeholder='E-mail'>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-4 control-label" for="disabled-input">매장 주소</label>
						<div class="col-sm-7">
							<input type="text" id="sellerBEA_tf<%--disabled-input--%>"name="sellerBEA_tf" class="form-control"
									disabled="disabled" readonly="readonly" value="${seller.sellerBEA}">
							<input type="hidden" id="sellerBEA" name="sellerBEA" value="${seller.sellerBEA}">

<%--------------------------------------------------------------------------------------------------------------------------------------------------------------------
                           ↓ API 지도 표시부
                           <div id="map"
                              style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>

                           <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                           <script
                              src="//apis.daum.net/maps/maps3.js?apikey=1e403c6110d8f3b7f15a41476c1642be&libraries=services"></script>
                           <script>
                              var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                                 mapOption = {
                                    center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                                    level : 5 // 지도의 확대 레벨
                                 };
                           
                              //지도를 미리 생성
                              var map = new daum.maps.Map(mapContainer, mapOption);
                              //주소-좌표 변환 객체를 생성
                              var geocoder = new daum.maps.services.Geocoder();
                              //마커를 미리 생성
                              var marker = new daum.maps.Marker({
                                 position : new daum.maps.LatLng(37.537187, 127.005476),
                                 map : map
                              });
                           
                              function sample5_execDaumPostcode() {
                                 new daum.Postcode({
                                    oncomplete : function(data) {
                                       // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                       var fullAddr = data.address; // 최종 주소 변수
                                       var extraAddr = ''; // 조합형 주소 변수
                           
                                       // 기본 주소가 도로명 타입일때 조합한다.
                                       if (data.addressType === 'R') {
                                          //법정동명이 있을 경우 추가한다.
                                          if (data.bname !== '') {
                                             extraAddr += data.bname;
                                          }
                                          // 건물명이 있을 경우 추가한다.
                                          if (data.buildingName !== '') {
                                             extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                          }
                                          // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                                          fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                                       }
                           
                                       // 주소 정보를 해당 필드에 넣는다.
                                       document.getElementById("sellerBEA_tf").value = fullAddr;
                                       // 주소로 좌표를 검색
                                       geocoder.addr2coord(data.address, function(status, result) {
                                          // 정상적으로 검색이 완료됐으면
                                          if (status === daum.maps.services.Status.OK) {
                                             // 해당 주소에 대한 좌표를 받아서
                                             var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                                             //여기서 result.addr[0].lat, result.addr[0].lng 이걸받아와서 저장하면 될듯
                           
                           
                           
                                             //20170321 박진우 : 경도 및 위도 값을 넘겨줌
                                             var sellerLat = result.addr[0].lat;
                                             var sellerLong = result.addr[0].lng;
                                             document.getElementById("sellerLat").value = sellerLat;
                                             document.getElementById("sellerLong").value = sellerLong;
                           
                           
                           
                                             // 지도를 보여준다.
                                             //                  mapContainer.style.display = "block";      //20170328 안나오는 걸로 변경...
                                             add_sellerBEA2();
                           
                                             map.relayout();
                                             // 지도 중심을 변경한다.
                                             map.setCenter(coords);
                                             // 마커를 결과값으로 받은 위치로 옮긴다.
                                             marker.setPosition(coords)
                           
                                          }
                                       });
                                    }
                                 }).open();
                              }
                           </script> --%>
                           <%----------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
										<input type="hidden" name="sellerLat" id="sellerLat" value="${seller.sellerLat}">
										<input type="hidden" name="sellerLong" id="sellerLong" value="${seller.sellerLong}"><br>
									</div>
								</div>


								<div id="div_sellerBEA2">
                        			<%-- 상세주소 확장부 --%>
								</div>

								<div class="form-group">
									<label for="normal-field" class="col-sm-4 control-label">업종</label>
									<div class="col-sm-7">
										<input type="text" name="sellerTOB" id="sellerTOB" class="form-control" readonly="readonly" value="${seller.sellerTOB}">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-4 control-label" for="transparent-input">
                                        매장 사진
									</label>
									<div class="col-sm-7">
										<div class="input-group input-group-transparent">
										<%--<input name="upload" id="uploadB" class="form-control" type="text">--%>



										<input type="file" name="upload" id="uploadB" <%--style="display:none"--%> placeholder='매장 사진'>
										<br>
										
										<div id="displayDiv">
											<c:if test ="${seller.sellerShopOimg !=null}">
	   											<img alt="" src="sellerdownload?sellerId=${seller.sellerId}" height="200" width="350">
											</c:if>
										</div> 
										<img id="blah" alt="" width="350" /><%-- 박진우 --%>

										</div>
									</div>
								</div>
							</fieldset>
							<div class="form-actions">
								<div class="row">
									<div class="col-sm-offset-4 col-sm-7">
										<button type="submit" onclick="return beforeSubmit()" class="btn btn-primary">가입</button>
										<button type="button" class="btn btn-inverse">취소</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</section>
			</div>
		</div>
	</main>
<%--</div>--%>

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
<%--
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
--%>

















<!-- page specific libs -->
<script src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/tooltip.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/modal.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="./resources/bootstrap/vendor/jquery-autosize/jquery.autosize.min.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap3-wysihtml5/lib/js/wysihtml5-0.3.0.min.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap3-wysihtml5/src/bootstrap3-wysihtml5.js"></script>
<script src="./resources/bootstrap/vendor/select2/select2.min.js"></script>
<script src="./resources/bootstrap/vendor/switchery/dist/switchery.min.js"></script>
<script src="./resources/bootstrap/vendor/moment/min/moment.min.js"></script>
<script src="./resources/bootstrap/vendor/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="./resources/bootstrap/vendor/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<script src="./resources/bootstrap/vendor/jasny-bootstrap/js/inputmask.js"></script>
<script src="./resources/bootstrap/vendor/jasny-bootstrap/js/fileinput.js"></script>
<script src="./resources/bootstrap/vendor/holderjs/holder.js"></script>
<script src="./resources/bootstrap/vendor/dropzone/dist/min/dropzone.min.js"></script>
<script src="./resources/bootstrap/vendor/markdown/lib/markdown.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="./resources/bootstrap/vendor/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>

<!-- page specific js -->
<script src="./resources/bootstrap/js/form-elements.js"></script>













</body>
</html>




















   <%-- 좌 → 우로 이동하는 파란색 띠 --%>
   <!-- The Loader. Is shown when pjax happens -->

<%---

   <div class="loader-wrap hiding hide">
      <i class="fa fa-circle-o-notch fa-spin-fast"></i>
   </div>

   <!-- common libraries. required for every page-->
   <script src="./resources/bootstrap/vendor/jquery/dist/jquery.min.js"></script>
   <script src="./resources/bootstrap/vendor/jquery-pjax/jquery.pjax.js"></script>
   <script
      src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/transition.js"></script>
   <script
      src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/collapse.js"></script>
   <script
      src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/dropdown.js"></script>
   <script
      src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/button.js"></script>
   <script
      src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/tooltip.js"></script>
   <script
      src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/alert.js"></script>
   <script
      src="./resources/bootstrap/vendor/slimScroll/jquery.slimscroll.min.js"></script>
   <script src="./resources/bootstrap/vendor/widgster/widgster.js"></script>
   <script src="./resources/bootstrap/vendor/pace.js/pace.js"
      data-pace-options='{ "target": ".content-wrap", "ghostTime": 1000 }'></script>
   <script
      src="./resources/bootstrap/vendor/jquery-touchswipe/jquery.touchSwipe.js"></script>

   <!-- common app js -->
   <script src="./resources/bootstrap/js/settings.js"></script>
   <script src="./resources/bootstrap/js/app.js"></script>

   <!-- page specific libs -->
   <script
      src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/tooltip.js"></script>
   <script
      src="./resources/bootstrap/vendor/bootstrap-sass/assets/javascripts/bootstrap/modal.js"></script>
   <script
      src="./resources/bootstrap/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
   <script
      src="./resources/bootstrap/vendor/jquery-autosize/jquery.autosize.min.js"></script>
   <script
      src="./resources/bootstrap/vendor/bootstrap3-wysihtml5/lib/js/wysihtml5-0.3.0.min.js"></script>
   <script
      src="./resources/bootstrap/vendor/bootstrap3-wysihtml5/src/bootstrap3-wysihtml5.js"></script>
   <script src="./resources/bootstrap/vendor/select2/select2.min.js"></script>
   <script
      src="./resources/bootstrap/vendor/switchery/dist/switchery.min.js"></script>
   <script src="./resources/bootstrap/vendor/moment/min/moment.min.js"></script>
   <script
      src="./resources/bootstrap/vendor/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
   <script
      src="./resources/bootstrap/vendor/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
   <script
      src="./resources/bootstrap/vendor/jasny-bootstrap/js/inputmask.js"></script>
   <script
      src="./resources/bootstrap/vendor/jasny-bootstrap/js/fileinput.js"></script>
   <script src="./resources/bootstrap/vendor/holderjs/holder.js"></script>
   <script
      src="./resources/bootstrap/vendor/dropzone/dist/min/dropzone.min.js"></script>
   <script src="./resources/bootstrap/vendor/markdown/lib/markdown.js"></script>
   <script
      src="./resources/bootstrap/vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
   <script
      src="./resources/bootstrap/vendor/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>

   <!-- page specific js -->
   <script src="./resources/bootstrap/js/form-elements.js"></script>
</body>
</html>

--%>