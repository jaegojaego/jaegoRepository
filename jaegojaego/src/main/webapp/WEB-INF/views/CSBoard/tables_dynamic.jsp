<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sing - Tables Dynamic</title>
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
            <a href="index.html">sing</a>
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
                    Dashboard
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-dashboard" class="collapse">
                    <li><a href="index.html">Dashboard</a></li>
                    <li><a href="widgets.html">Widgets</a></li>
                </ul>
            </li>
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
            <li>
                <a href="charts.html">
                    <span class="icon">
                        <i class="glyphicon glyphicon-stats"></i>
                    </span>
                    Charts
                </a>
            </li>
            <li>
                <a href="profile.html">
                    <span class="icon">
                        <i class="glyphicon glyphicon-user"></i>
                    </span>
                    Profile
                    <sup class="text-warning fw-semi-bold">
                        new
                    </sup>
                </a>
            </li>
        </ul>
        <!-- every .sidebar-nav may have a title -->
        <h5 class="sidebar-nav-title">Template <a class="action-link" href="#"><i class="glyphicon glyphicon-refresh"></i></a></h5>
        <ul class="sidebar-nav">
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
                    Grid
                </a>
            </li>
            <li>
                <a class="collapsed" href="#sidebar-maps" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="glyphicon glyphicon-map-marker"></i>
                    </span>
                    Maps
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-maps" class="collapse">
                    <!-- data-no-pjax turns off pjax loading for this link. Use in case of complicated js loading on the
                         target page -->
                    <li><a href="maps_google.html" data-no-pjax>Google Maps</a></li>
                    <li><a href="maps_vector.html">Vector Maps</a></li>
                </ul>
            </li>
            <li class="active">
                <!-- an example of nested submenu. basic bootstrap collapse component -->
                <a href="#sidebar-tables" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="fa fa-table"></i>
                    </span>
                    Tables
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-tables" class="collapse in">
                    <li><a href="tables_basic.html">Tables Basic</a></li>
                    <li class="active"><a href="tables_dynamic.html">Tables Dynamic</a></li>
                </ul>
            </li>
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
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-md-* > .widget.  -->
    <main id="content" class="content" role="main">
        <ol class="breadcrumb">
            <li>YOU ARE HERE</li>
            <li class="active">Tables Basic</li>
        </ol>
        <h1 class="page-title">Dynamic - <span class="fw-semi-bold">Tables</span></h1>
        <section class="widget">
            <header>
                <h4>
                    Table <span class="fw-semi-bold">Styles</span>
                </h4>
                <div class="widget-controls">
                    <div class="width-200">
                        <div class="input-group input-group-sm input-group-transparent input-group-rounded">
                            <span class="input-group-addon">
                                <i class="fa fa-search"></i>
                            </span>
                            <input class="form-control " id="search-countries" type="text" placeholder="Search Countries">
                        </div>
                    </div>
                </div>
            </header>
            <div class="widget-body">
                <p>
                    Editable, validatable, filterable and sortable table made with
                    <a href="http://backgridjs.com/" target="_blank">Backgrid.js</a>
                </p>
                <div id="table-dynamic"></div>
            </div>
        </section>
        <section class="widget">
            <header>
                <h4>Table <span class="fw-semi-bold">Styles</span></h4>
                <div class="widget-controls">
                    <a data-widgster="expand" title="Expand" href="#"><i class="glyphicon glyphicon-chevron-up"></i></a>
                    <a data-widgster="collapse" title="Collapse" href="#"><i class="glyphicon glyphicon-chevron-down"></i></a>
                    <a data-widgster="close" title="Close" href="#"><i class="glyphicon glyphicon-remove"></i></a>
                </div>
            </header>
            <div class="widget-body">
                <p>
                    Column sorting, live search, pagination. Built with
                    <a href="http://www.datatables.net/" target="_blank">jQuery DataTables</a>
                </p>
                <div class="mt">
                    <table id="datatable-table" class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th class="no-sort hidden-xs">Info</th>
                            <th class="hidden-xs">Description</th>
                            <th class="hidden-xs">Date</th>
                            <th class="no-sort">Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td><span class="fw-semi-bold">Algerd</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; JPEG
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 200x150
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Palo Alto</a></td>
                            <td class="hidden-xs">June 27, 2013</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-success" style="width: 29%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><span class="fw-semi-bold">Vitaut</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; PNG
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 6433x4522
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Vilnia</a></td>
                            <td class="hidden-xs">January 1, 1442</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-danger" style="width: 19%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><span class="fw-semi-bold">Honar</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; AVI
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 1440x980
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Berlin</a></td>
                            <td class="hidden-xs">August 6, 2013</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-gray-light" style="width: 49%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><span class="fw-semi-bold">Jack</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; PNG
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 12x43
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">San Francisco</a></td>
                            <td class="hidden-xs">August 19, 2013</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar" style="width: 69%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td><span class="fw-semi-bold">Leon</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; MP4
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 800x480
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Brasilia</a></td>
                            <td class="hidden-xs">October 1, 2013</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-gray-light" style="width: 9%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td><span class="fw-semi-bold">Max</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; TXT
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; -
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Helsinki</a></td>
                            <td class="hidden-xs">October 29, 2013</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-warning" style="width: 38%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td><span class="fw-semi-bold">Pol</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; MOV
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 640x480
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Radashkovichi</a></td>
                            <td class="hidden-xs">November 11, 2013</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-danger" style="width: 83%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td><span class="fw-semi-bold">Chrishna</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; DOC
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; -
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Mumbai</a></td>
                            <td class="hidden-xs">December 2, 2013</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-info" style="width: 40%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td><span class="fw-semi-bold">Leslie</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; AVI
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 4820x2140
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Singapore</a></td>
                            <td class="hidden-xs">December 6, 2013</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-warning" style="width: 18%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td><span class="fw-semi-bold">David</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; XML
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; -
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Portland</a></td>
                            <td class="hidden-xs">December 13, 2013</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-gray-light" style="width: 54%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td><span class="fw-semi-bold">Andrej</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; VOB
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 6433x4522
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Minsk</a></td>
                            <td class="hidden-xs">December 14, 2013</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar" style="width: 25%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>12</td>
                            <td><span class="fw-semi-bold">Julia</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; JPEG
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 40x40
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Hrodna</a></td>
                            <td class="hidden-xs">July 9, 2012</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-warning" style="width: 50%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>13</td>
                            <td><span class="fw-semi-bold">Ihnat</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; JAVA
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; -
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Los Angeles</a></td>
                            <td class="hidden-xs">August 2, 2012</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-success" style="width: 8%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>14</td>
                            <td><span class="fw-semi-bold">Abraham</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; DOCX
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; -
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Panama</a></td>
                            <td class="hidden-xs">September 3, 2012</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-gray-light" style="width: 80%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>15</td>
                            <td><span class="fw-semi-bold">Tomas</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; JPEG
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 1800x1420
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Amsterdam</a></td>
                            <td class="hidden-xs">November 13, 2012</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-gray-light" style="width: 10%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>16</td>
                            <td><span class="fw-semi-bold">Scott</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; PNG
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 240x460
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Sluck</a></td>
                            <td class="hidden-xs">December 5, 2012</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar" style="width: 93%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>17</td>
                            <td><span class="fw-semi-bold">Pham</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; MAIL
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; -
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Tokyo</a></td>
                            <td class="hidden-xs">December 8, 2012</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-danger" style="width: 44%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>18</td>
                            <td><span class="fw-semi-bold">Peter</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; PNG
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 8320x6400
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Cape Town</a></td>
                            <td class="hidden-xs">December 29, 2012</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-gray-light" style="width: 5%;"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>19</td>
                            <td><span class="fw-semi-bold">Uladz'</span></td>
                            <td class="hidden-xs">
                                <small>
                                    <span class="fw-semi-bold">Type:</span>
                                    &nbsp; JPEG
                                </small>
                                <br>
                                <small>
                                    <span class="fw-semi-bold">Dimensions:</span>
                                    &nbsp; 2200x1600
                                </small>
                            </td>
                            <td class="hidden-xs"><a href="#">Mahileu</a></td>
                            <td class="hidden-xs">December 7, 2013</td>
                            <td class="width-150">
                                <div class="progress progress-sm mt-xs">
                                    <div class="progress-bar progress-bar-gray-light" style="width: 0%;"></div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
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
<script src="./resources/bootstrap/vendor/datatables/media/js/jquery.dataTables.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>

<!-- page specific js -->
<script src="./resources/bootstrap/js/tables-dynamic.js"></script>
</body>
</html>