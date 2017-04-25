<%-- 상품등록 : 권록헌헌헌 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="./resources/js/jquery-3.1.1.js"/>"></script>

<title>상품수정</title>
 <script>
function beforeSubmit() {
    //상품이름 입력여부 검사
   
    var goodsName=document.getElementById('goodsName').value;
    var goodsPrice=document.getElementById('goodsPrice');
    var goodsQuantity=document.getElementById('goodsQuantity');
    var goodsInfo=document.getElementById('goodsInfo').value;
   if(goodsName==""){
     alert("상품이름을 입력하지 않았습니다.");
     return false;
    }
    
   else if(goodsPrice.value==''){
     alert("상품 가격을 입력하지 않았습니다.");
    
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

function resizeImg(img, height, width) {
   alert("d");
          img.height = height;
          img.width = width;
      }
   
</script>
</head>
<body>


<!-- ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->

   <form action="rgoodsinsert" method="post" enctype="multipart/form-data" onsubmit="return beforeSubmit();">
      <div id="salesTable">
         <div id="salesContent">
          <p id="status"></p>
          <div id="holder"></div>
            <input type="file" name="upload" size="100" id="salesUpload" onload="resizeImg(img, 200, 100)">
             <script>
               var upload = document.getElementsByTagName('input')[0], 
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
               };
            </script> 
            <br> 상품이름 <input type="text" id="goodsName" name="goodsName">
            <br> 상품가격 <input type="text" id="goodsPrice" name="goodsPrice">
            <br> 상품수량 <input type="text" id="goodsQuantity" name="goodsQuantity"> 
            <br> 상품설명 <input type="text" id="goodsInfo" name="goodsInfo"> 
            <input type="hidden" id="goodsCode">
            <input type="hidden" id="goodsDateOfUpload">
            <input type="hidden" id="goodsDateOfUpdate">
            <input type="hidden" id="goodsStatus" value="off">
            <br> <input type="submit"  value="등록">
            <!-- <a HREF="javascript:sendIt()">[등록]</a> -->
         
         </div>
      </div>





<!-- <nav id="sidebar" class="sidebar" role="navigation">
    need this .js class to initiate slimscroll
    <div class="js-sidebar-content">
        <header class="logo hidden-xs">
            <a href="index.html">sing</a>
        </header>
        seems like lots of recent admin template have this feature of user info in the sidebar.
             looks good, so adding it and enhancing with notifications
        <div class="sidebar-status visible-xs">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="thumb-sm avatar pull-right">
                    <img class="img-circle" src="demo/img/people/a5.jpg" alt="...">
                </span>
                .circle is a pretty cool way to add a bit of beauty to raw data.
                     should be used with bg-* and text-* classes for colors
                <span class="circle bg-warning fw-bold text-gray-dark">
                    13
                </span>
                &nbsp;
                Philip <strong>Smith</strong>
                <b class="caret"></b>
            </a>
            #notifications-dropdown-menu goes here when screen collapsed to xs or sm
        </div>
        main notification links are placed inside of .sidebar-nav
        <ul class="sidebar-nav">
            <li>
                an example of nested submenu. basic bootstrap collapse component
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
        every .sidebar-nav may have a title
        <h5 class="sidebar-nav-title">Template <a class="action-link" href="#"><i class="glyphicon glyphicon-refresh"></i></a></h5>
        <ul class="sidebar-nav">
            <li>
                an example of nested submenu. basic bootstrap collapse component
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
                    data-no-pjax turns off pjax loading for this link. Use in case of complicated js loading on the
                         target page
                    <li><a href="maps_google.html" data-no-pjax>Google Maps</a></li>
                    <li><a href="maps_vector.html">Vector Maps</a></li>
                </ul>
            </li>
            <li class="active">
                an example of nested submenu. basic bootstrap collapse component
                <a href="#sidebar-tables" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="fa fa-table"></i>
                    </span>
                    Tables
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-tables" class="collapse in">
                    <li class="active"><a href="tables_basic.html">Tables Basic</a></li>
                    <li><a href="tables_dynamic.html">Tables Dynamic</a></li>
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
        some styled links in sidebar. ready to use as links to email folders, projects, groups, etc
        <ul class="sidebar-labels">
            <li>
                <a href="#">
                    yep, .circle again
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
        A place for sidebar notifications & alerts
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


common libraries. required for every page
<script src="./resources/bootstrap/js/jquery.min.js"></script>
<script src="./resources/bootstrap/js/jquery.pjax.js"></script>
<script src="./resources/bootstrap/js/transition.js"></script>
<script src="./resources/bootstrap/js/collapse.js"></script>
<script src="./resources/bootstrap/js/dropdown.js"></script>
<script src="./resources/bootstrap/js/button.js"></script>
<script src="./resources/bootstrap/js/tooltip.js"></script>
<script src="./resources/bootstrap/js/alert.js"></script>
<script src="./resources/bootstrap/js/jquery.slimscroll.min.js"></script>
<script src="./resources/bootstrap/js/widgster.js"></script>
<script src="./resources/bootstrap/js/pace.js" data-pace-options='{ "target": ".content-wrap", "ghostTime": 1000 }'></script>
<script src="./resources/bootstrap/js/jquery.touchSwipe.js"></script>

common app js
<script src="./resources/bootstrap/js/settings.js"></script>
<script src="./resources/bootstrap/js/app.js"></script>

page specific libs
<script src="./resources/bootstrap/js/index.js"></script>
page specific js
<script src="./resources/bootstrap/js/tables-basic.js"></script> -->
   </form>
</body>
</html>