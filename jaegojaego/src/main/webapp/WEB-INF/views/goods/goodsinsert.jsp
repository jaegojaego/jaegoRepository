<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sing - Forms 상품추가</title>
    <link href="./resources/bootstrap/css/application.min.css" rel="stylesheet">
    <!-- as of IE9 cannot parse css files with more that 4K classes separating in two files -->
    <!--[if IE 9]>
        <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]-->
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   <script src='<c:url value="/resources/js/jquery-3.1.1.js"/>' ></script>    
    <script>
        /* yeah we need this empty stylesheet here. It's cool chrome & chromium fix
           chrome fix https://code.google.com/p/chromium/issues/detail?id=167083
                      https://code.google.com/p/chromium/issues/detail?id=332189
        */
    </script>
    <script>
   function goodslist() {
      location.href='goodslist';
   }
   ///web/goodslist3
   </script>
         <script>
         
         
         
         
         
         
         function beforeSubmit() {
             //상품이름 입력여부 검사
            
             var goodsName=document.getElementById('goodsName').value;
             var goodsPrice=document.getElementById('goodsPrice');
             var goodsQuantity=document.getElementById('goodsQuantity');
             var goodsInfo=document.getElementById('goodsInfo').value;
             var expiredDate=document.getElementById('expiredDate').value;
            if(goodsName==""){
              alert("상품이름을 입력하지 않았습니다.");
              return false;
             }
             
            else if(goodsPrice.value==''){
              alert("상품 가격을 입력하지 않았습니다.");
             
              return false;
             }
            
            else if(expiredDate==''){
                 alert("상품 유통기한을 입력하지 않았습니다.");
                
                 return false;
                }
            
            
            else if(isNaN(goodsPrice.value)){
               alert("상품가격에 숫자아닌값이 있습니다 확인해주세요");
               return false;
            }
            else if(goodsQuantity.value==''){
              alert("상품수량을 입력하지 않았습니다.");
              return false;
             }
            else if(isNaN(goodsQuantity.value)){
               alert("상품수량에 숫자아닌값이 있습니다 확인해주세요");
               return false;
            }

            else if(goodsInfo==""){
              alert("상품설명을 입력하지 않았습니다.");
              return false;
             } 
            return true;
         }
         
         
         
         
         
         
/*            var upload = document.getElementsByTagName('input')[0], 
            holder = document.getElementById('holder'), 
            state = document.getElementById('status');

            if (typeof window.FileReader === 'undefined') {
               state.className = 'fail';
            } else {
               state.className = 'success';
               state.innerHTML = '이미지';
            }

            upload.onchange = function(e) {
               e.preventDefault();

               var file = upload.files[0], reader = new FileReader();
               reader.onload = function(event) {
                  var img = new Image();
                  img.src = event.target.result;
                  img.height=200;
                  img.width=250;
                     // note: no onload required since we've got the dataurl...I think! :)
                  if (img.width > 260) { // holder width
                     img.width = 260;
                  }
                     holder.innerHTML = '';
                     holder.appendChild(img);
                  };
                  reader.readAsDataURL(file);
                  return false;
            };*/
            </script>
</head>
<body>
<jsp:scriptlet>
   pageContext.setAttribute("cr","\r");
   pageContext.setAttribute("lf","\n");
   pageContext.setAttribute("crlf","\r\n");
</jsp:scriptlet>
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
                    </sup>--%>   <%-- new 표시 주석 처리 --%>
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
                    <%--<i class="toggle fa fa-angle-down"></i>--%>   <%--하향 화살표 삭제--%>
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
                        <%--<img class="img-circle" src="demo/img/people/a5.jpg" alt="...">--%>
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
                                    <%--<img class="img-circle" src="demo/img/people/a3.jpg" alt="...">--%>
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
                                    <%--<img class="img-circle" src="demo/img/people/a5.jpg" alt="...">--%>
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
                                <%--<img src="demo/img/people/a6.jpg" class="img-circle mr-xs pull-left">--%>
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
                    <%--<img class="img-circle" src="demo/img/people/a2.jpg" alt="...">--%>
                    </span>
                    <h5 class="message-sender">Chris Gray</h5>
                    <p class="message-preview">Hey! What's up? So many times since we</p>
                </a>
                <a class="list-group-item" href="#chat-sidebar-user-2">
                    <i class="fa fa-circle text-gray-light pull-right"></i>
                <span class="thumb-sm pull-left mr">
                <%--<img class="img-circle" src="img/avatar.png" alt="...">--%>
                </span>
                    <h5 class="message-sender">Jamey Brownlow</h5>
                    <p class="message-preview">Good news coming tonight. Seems they agreed to proceed</p>
                </a>
                <a class="list-group-item" href="#chat-sidebar-user-3">
                    <i class="fa fa-circle text-danger pull-right"></i>
                <span class="thumb-sm pull-left mr">
                <%--<img class="img-circle" src="demo/img/people/a1.jpg" alt="...">--%>
                </span>
                    <h5 class="message-sender">Livia Walsh</h5>
                    <p class="message-preview">Check out my latest email plz!</p>
                </a>
                <a class="list-group-item" href="#chat-sidebar-user-4">
                    <i class="fa fa-circle text-gray-light pull-right"></i>
                <span class="thumb-sm pull-left mr">
                <%--<img class="img-circle" src="img/avatar.png" alt="...">--%>
                </span>
                    <h5 class="message-sender">Jaron Fitzroy</h5>
                    <p class="message-preview">What about summer break?</p>
                </a>
                <a class="list-group-item" href="#chat-sidebar-user-5">
                    <i class="fa fa-circle text-success pull-right"></i>
                <span class="thumb-sm pull-left mr">
                <%--<img class="img-circle" src="demo/img/people/a4.jpg" alt="...">--%>
                </span>
                    <h5 class="message-sender">Mike Lewis</h5>
                    <p class="message-preview">Just ain't sure about the weekend now. 90