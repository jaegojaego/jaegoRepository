<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sing - Forms</title>

	<script>
	function goodslist() {
		location.href='goodslist';
	}
	///web/goodslist3
	</script>

<script src="./resources/js/jquery-3.1.1.js"></script>

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

<%--============================================================= --%>


<script>
$(function(){
	
	$("#CSReplyConfirm").on("click",function(){
		
		var REV_TXT = $("#retext").val();
		var boardnum = ${csboard.boardnum};
		console.log(boardnum);
		if(REV_TXT.length ==0) {
			alert("데이터를 입력해 주세요");
			return;
		} 

		$.ajax({
			type : "post",
            url : "csreplyWrite",
            data :{
            	text : REV_TXT,
            	boardnum : boardnum
			},

			success : function(data){
				console.log(data);
				var html ="";
				html ="<table>";
                $.each(data,function(index,item){
					console.log(item);
					html+= "<tr>";
                	html+= "<td>"+item.id+"</td>";
                	html+= "<td>"+item.text+"</td>";
                	html+= "<td>"+item.inputdate+"</td>";
                	html+= '<td><a href="#none" onclick="deleteReply('+item.replynum+','+item.boardnum+')">'+item.replynum+'번 댓글 삭제 </a></td>';
                	html+= "</tr>";
                	
                
                })
                html +="</table>"
                $("#review").html(html);
              

                
                $('#retext').val('');      
            },
            error : function(e){
               console.log(e);
            }
            
         });

         });
      });
      




//삭제
function deleteReply(replynum, boardnum){
   
   $.ajax({
      
      type : "get",
      url : "deleteCSReply",
      data : {
    	  replynum : replynum,
    	  boardnum : boardnum
      },
      success : function(data){
         console.log(data);
         var html ="";
         
            $.each(data, function(index,item){
            	html+= "<tr>";
            	html+= "<td>"+item.id+"</td>";
            	html+= "<td>"+item.text+"</td>";
            	html+= "<td>"+item.inputdate+"</td>";
            	html+= '<td><a href="#none" onclick="deleteReply('+item.replynum+','+item.boardnum+')">'+item.replynum+'번 댓글 삭제 </a></td>';
            	html+= "</tr>";
            	
            
            })
            html +="</table>"
            $("#review").html(html);


         $("#replytable").html(html);
      },
      error : function(e){
         console.log(e);
      }
   })
      
}
</script>
<%--============================================================= --%>    
    <script>
        /* yeah we need this empty stylesheet here. It's cool chrome & chromium fix
           chrome fix https://code.google.com/p/chromium/issues/detail?id=167083
                      https://code.google.com/p/chromium/issues/detail?id=332189
        */
    </script>
	<script>
	function deleteCheck(boardnum) {
		if (confirm("정말 삭제하시겠습니까?")) {
			location.href = 'delete?boardnum='+boardnum;		
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

            <li>
                <a class="collapsed" href="analysis1">
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
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-md-* > .widget.  -->
    <main id="content" class="content" role="main">
        <ol class="breadcrumb">
            <li>현재 위치</li>
            <li class="active">고객 상담</li>
        </ol>
        <h1 class="page-title">고객 상담 - <span class="fw-semi-bold">게시물 읽기</span></h1>
       
        
        
        

        <div class="row">
            <div class="col-md-6">
                <section class="widget">
                    <header>
                        <h5>
                            Simple <strong>file uploads</strong>
                        </h5>
                    </header>
                    <div class="widget-body">
                        <form class="form-horizontal" <%--role="form" action="write"--%> method="post" enctype="multipart/form-data">
                            <fieldset>
                                <legend>상담 내용 읽기</legend>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="default-textarea">작성자</label>
                                    <div class="col-sm-8">
                                        <%--<input type="text" class="form-control" id="default-textarea" name="id" value="${csboard.id}" readonly />--%>
                                        ${csboard.id} (${csboard.type})
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="default-textarea">제목</label>
                                    <div class="col-sm-8">
                                        <%--<input type="text" class="form-control" id="default-textarea" name="title" value="${csboard.title}" readonly />--%>
                                        ${csboard.title}
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="default-textarea">본문</label>
                                    <div class="col-sm-8">
                                        <%--<textarea rows="12" class="form-control" id="default-textarea" name="content" readonly>${csboard.content}</textarea>--%>
                                        <pre>${csboard.content}</pre>                                        
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="default-textarea">파일 첨부</label>
                                    <div class="col-sm-8">
                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                            <div>
	                                            <c:if test="${csboard.originalfile != null}">
													<a href="csbdownload?boardnum=${csboard.boardnum}">${csboard.originalfile}</a>
												</c:if>
												<c:if test="${csboard.originalfile == null}">
													첨부된 파일이 없습니다.
												</c:if>
                                            </div>
                                        </div>
									</div>
								</div>



								<div class="form-group">
                                    <label class="col-sm-3 control-label" for="default-textarea">댓글</label>
                                    <div class="col-sm-8">
                                        <span class="help-block">                                        


리플내용
	<input type="hidden" name="boardnum" value="${csboard.boardnum}"/>
	<input type="text" name="text" id="retext"/>
	<a href="#" id="CSReplyConfirm">확인</a>


<div id="review">
<table>
<%-- <c:if test="${csreplylist != null}"> --%>
	<c:forEach var="csreplylist" items="${csreplylist}">
		<tr>
			<td>${csreplylist.id}</td>
			<td>${csreplylist.text}</td>
			<td>${csreplylist.inputdate}</td>
			<td>
				<c:if test="${custid==csreplylist.id}">
					<a href="#" onclick="deleteReply('${csreplylist.replynum}','${csreplylist.boardnum}')">${csreplylist.replynum}번 댓글 삭제</a>
				</c:if>
			</td>
		</tr>
	</c:forEach>
<%-- </c:if> --%>
</table>
</div>




                                        </span>
			                            <div class="form-actions">
			                                <div class="row">
			                                    <div class="col-sm-offset-4 col-sm-7">
			                                    	<script>function rejectUpdate(){alert('작성자만 수정할 수 있습니다.');}</script>			                                    	
			                                        <c:if test="${custid==csboard.id}"><button type="button" class="btn btn-primary" onclick="location.href='editForm?boardnum=${csboard.boardnum}'">수정</button></c:if>
													<c:if test="${custid!=csboard.id}"><button type="button" class="btn btn-primary" onclick="rejectUpdate()">수정</button></c:if>
			                                        <button type="button" class="btn btn-inverse">취소</button>
			                                    </div>
			                                </div>
			                            </div>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
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