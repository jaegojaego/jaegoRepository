<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href="./resources/bootstrap/css/application.min.css">
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
<script src="./resources/bootstrap/js/index.js"></script>
<!-- page specific js -->
<script src="./resources/bootstrap/js/tables-dynamic.js"></script>
<script src="./resources/bootstrap/js/tables-basic.js"></script>

<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>



<script type="text/javascript">

	$(function() {
		$('.bplus').click(function() {
			var n = $('.bplus').index(this);
			var num = $(".afterQ:eq(" + n + ")").val();
			num = $(".afterQ:eq(" + n + ")").val(num * 1 + 1);
		});
		$('.bninus').click(function() {
			var n = $('.bninus').index(this);
			var num = $(".afterQ:eq(" + n + ")").val();
			num = $(".afterQ:eq(" + n + ")").val(num * 1 - 1);
		});
	});

	$(function() {
		$('#check').click(function() {
			
			$.each($('.afterQ'), function(index,item) {

				console.log($(this).val());
				console.log($('.beforeQ').eq(index).text());
				
				///////////////////////////////////////////////////////
				
				
 				//alert(CRN);
				//doSend();
				
				
				//////////////////////////////////////////////////////////
				
				if($('.afterQ').eq(index).val() != $('.beforeQ').eq(index).text()){
					
					var ninus = $('.afterQ').eq(index).val()-$('.beforeQ').eq(index).text();
					alert(ninus); 
					
					$('.beforeQ').eq(index).text($(this).val());
					var goodscode = $('.goodscode').eq(index).text();
					var beforeQuantity = $('.beforeQ').eq(index).text();
					
					$.ajax({
						type:"GET",
						url:"update",
						data:{
							goodsCode:goodscode,
							goodsQuantity:beforeQuantity
						}, 
						success:function(content){
							var jsonContent = JSON.parse(content);
							dosendcontent(jsonContent);
							//alert("!!!!!");
							doSend();
						},
						error:function(e){
							alert("왜??"+e);
							console.log(e);
						}
					});
					
					var goodsname = $('.goodsname').eq(index).text();
					var goodsprice = $('.goodsprice').eq(index).text();
					
					$.ajax({
						type:"GET",
						url:"insertsales",
						data:{
							salesCode:goodscode,
							salesQuantity:ninus,
							salesPrice:goodsprice,
							salesName:goodsname
						}
/* 
						success:function(){
							location.href="goodslist3";
//							doSend();
						} */
					});
				}
			});
		});
	});

	$(function() {
		$('#ninus').click(function() {
			var checkbox = document.getElementsByName("checkbox");
			var checkFlag = false;
			for(var i = 0 ; i < checkbox.length ; i++){
				if (checkbox[i].checked){
					checkFlag = true;
					break;
				}
			}
			if(checkFlag == false){
				alert("삭제할 항목을 선택해 주세요");
				return false;
			}
			
			var checkbox = $(".checkbox");
			var goodscode = $(".goodscode");
			$(".tr").each(function(index,item) {
					var checked = checkbox.eq(index).prop("checked");
					if(checked){
						var delcode = goodscode.eq(index-1).text();
						
						$.ajax({
							type:"GET",
							url:"del",
							data:{
								goodsCode : delcode
							},
							success: function(){
								console.log(delcode);
								location.href="goodslist";
							}
						});
					}
			});
		});
	});
	
	$(function(){
		$('#checkboxall').click(function(){
			if($('#checkboxall').prop("checked")){
				$('input[name=checkbox]').prop("checked",true);
			}else{
				$('input[name=checkbox]').prop("checked",false);
			}
		});
	})
	
	$(function(){
		$('.status').click(function(){
			 if( $(this).val() == 'off' ) {
			      $(this).val('on');
			      
			      var index = $('.status').index(this);
			      
			      var btnstatus = $(this).val();
			      var goodscode = $(".goodscode:eq("+index+")").text();
			      
			      $.ajax({
						type:"GET",
						url:"updatestatus",
						data:{
							goodsCode:goodscode,
							goodsStatus:btnstatus
						},
						success: function(){
							location.href="goodslist";
						}
					});
			 }else{
			      $(this).val('off');
				  var index = $('.status').index(this);
			      var btnstatus = $(this).val();
			      var goodscode = $(".goodscode:eq("+index+")").text();
			      alert(index);
			      $.ajax({
						type:"GET",
						url:"updatestatus",
						data:{
							goodsCode:goodscode,
							goodsStatus:btnstatus
						},
						success: function(){
							location.href="goodslist";
						}
				});
			 }
		});
	})
	
	$(function() {
		$('#plus').click(function() {
			location.href = "goodsinsert";
		});
	})
	
	$(function(){
		$('.btnupdate').click(function(){
			var index = $('.btnupdate').index(this);
		    var goodscode = $(".goodscode:eq("+index+")").text();
		    $.ajax({
				type:"GET",
				url:"goodsupdate",
				data:{
					goodsCode:goodscode,
				},
				success: function(){
					location.href="goodsupdate";
				}
			});
		});
	})
	
</script>




<%--20170422 박진우 박시원 웹소켓 테스트============================================= --%>
 <script type="text/javascript">
	/* 		
 			var CRN = $(".sellerCRN").val();
 			console.log(CRN); */
 			
 			
 			//내가 만든 function
      
        	function client(evt){
        		/* alert(evt);
        		alert(evt.data);
        		
        		var gaek = JSON.parse(evt.data);

        		var storeid = gaek.storeid;
        		var goodsid = gaek.goodsid;
        		
        		alert(storeid);
        		alert(goodsid); */
        	}
        	
        	
        	function seller(){
        		//뭐시기뭐시기뭐시기 dosend;        		
        		dosend();
        	}
           
            var wsUri = "ws://203.233.196.93:8888/web/echo.do";
           
            function init() {
				output = document.getElementById("output");
				websocket = new WebSocket(wsUri);									//yc>본인소켓주소인가..
				websocket.onopen = function(evt) {										
					onOpen(evt) 					//여기에는 뭐가들어오는거지..
				};
			}

            function send_message() {						//q>중간에 evt가 사라진게..좀 send_message(없어졌는데);
				websocket.onmessage = function(evt) {
					onMessage(evt)						//여기지우면뭐보냈는지 안띄움  pf>받은 메세지는 여기 들어오는거다..
				};
				websocket.onerror = function(evt) {
					onError(evt)
				};
			}

			function onOpen(evt) { //WebSocket 연결						
				//writeToScreen("Connected to Endpoint!");    //여기에 들어오면 evt에서 값뺄수있음...
				send_message();
			}
            
			function onMessage(evt) { //메시지 수신
				// writeToScreen("Message Received: " + evt.data);
				client(evt);
            }
			function onError(evt) {  // 전송 에러 발생
				writeToScreen('ERROR: ' + evt.data);
			} 
			function doSend(str) {
				
				//var message = document.getElementById("textID").value;
				//writeToScreen("Message Sent: " + message);
				//writeToScreen("뭐보내는지 표시하려고 ");
				
				var CRN = document.getElementById("sellerCRN").value;
				/*//////////////////////////////////////////////////////////////  */
				
				var glist= []; 
                  var content2="";

                    $.ajax({//type필수임
                        type : "get",   //RequestMethod Type
                        url: "Goodslist", //RequestMapping value
                        data:{
                           sellerCRN:CRN
                        },
                        
                        success : function(data){
                        	$.each(data,function(index,item){
                               
                               glist.push({
                                  GN: item.goodsName,
                                   GP: item.goodsPrice,
                                   GQ: item.goodsQuantity,
                                   GI: item.goodsOimage,
                                   GC: item.goodsCode

                               });
                               
                             });
                            /////////////////////////////////////////////////////

                       
                           var content = '<div class="goodsinfo" id="'+CRN+'" style="overflow-y:scroll">'+
                            '<table><tr><th>상품명</th><th>상품가격</th><th>상품개수</th><th>이미지보기</th></tr>';
                            
                            for (var i = 0, len = glist.length; i < len; i++) {
                              //  total+= glist[i].GN;
                            // 마커를 생성하고 지도위에 표시합니다
                            content += '<tr><th>'+glist[i].GN+'</th><th>'+glist[i].GP+"</th><th>"+glist[i].GQ
                            +'</th><th><div class="thth"><img src="./resources/image/picture.png" width="20px" height="20px" class="abcd" imgData="goodsimg?sellerCRN='+CRN+'&goodsCode='+glist[i].GC+'">'+
                            '<span class="immm"><img src="goodsimg?sellerCRN='+CRN+'&goodsCode='+glist[i].GC+'" width="90px" height="70px" > </span></div></th></tr>';
                            }
                            
                            content += '</table></div>';
                            
                            
                        	
            				var pk = {storeid : CRN, goodsid : content};
            				var jsonstr = JSON.stringify(pk);
                            websocket.send(jsonstr); // 스트링 배열만들어서 보내면 되겠네...
                            //websocket.close();
                            
    //ajax //////////////////////////////////////////////////////////////////////////////////////
    },
                        error : function(e){
                           //ajax통신 실패시
                           console.log(e);
                        }
                     });
				
				
				/*///////////////////////////////////////////////////////////////////  */

            }
			
			function dosendcontent(content){
				alert("dosendcontent(고객아이디들) : " + content.buyer_id);
				var message={};
				message.message = content.shopname;
				message.to = content.buyer_id;
				alert(JSON.stringify(message));
				websocket.send(JSON.stringify(message));
			} 
			
			function writeToScreen(message) {						//메세지를 화면에 띄워줌...
				var pre = document.createElement("p");
				pre.style.wordWrap = "break-word";
				pre.innerHTML = message;
				                
				output.appendChild(pre);
			}
			window.addEventListener("load", init, false);
        </script>
<%--=========================================================================== --%>








</head>
<body>
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
                    <img class="img-circle" src="demo/img/people/a5.jpg" alt="...">
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
<!-- ///////////////////////////////////////////////////////////////////////////////////////// -->
	<div class="content-wrap">
		<main id="content" class="content" role="main">

		<ol class="breadcrumb">
			<li>YOU ARE HERE</li>
			<li class="active">Goods List</li>
		</ol>

		<h1 class="page-title">
			Tables - <span class="fw-semi-bold">상품 목록 </span>
		</h1>

		<div class="row">
			<div class="col-md-12">
				<section class="widget"> 
				<header>
				<h4>
					Today <span class="fw-semi-bold">${todate }</span>
				</h4>
				</header>
				
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>이미지</th>
								<th>상품명</th>
								<th>상품코드</th>
								<th>판매가격</th>
								<th>업로드 날짜</th>
								<th>현재수량</th>
								<th>변동수량</th>
								<th>
									<span>
									삭제<input type="checkbox" id="checkboxall" class="checkbox" style="width:15px;height:15px">
									</span>
								</th>
								<th>수정</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="map" items="${list }">
							<tr class="tr">
								<td>
									<img src="download?goodsCode=${map.goodsCode }" width="50" height="30"> 
								</td>
								<td class="goodsname">${map.goodsName }</td><!--  -->
								<td class="goodscode">${map.goodsCode }</td>
								<td class="goodsprice">${map.goodsPrice  }</td><!--  -->
								<td>${map.goodsDateOfUpload }</td>
								<td class="beforeQ">${map.goodsQuantity  }</td>
								<td>
									<input type="text" size="3" value="${map.goodsQuantity }"class="afterQ"> 
									<img src="./resources/image/ninus.png" class="bninus" width="10" height="10"> 
									<img src="./resources/image/plus.png" class="bplus" width="10" height="10">
								</td>
								<td>
									<input type="checkbox" name="checkbox" class="checkbox" style="width:15px;height:15px">
								</td>
								<td>
									<input type="button" value="수정" class="btnupdate">
								</td>
								<td>
									<input type="button" value="${map.goodsStatus }" class="status">
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
					<div class="clearfix">
						<div style="position: fixed; bottom: 5px; right: 5px;">
							<img src="./resources/image/plus2.png" id="plus" width="100" height="100">
							<img src="./resources/image/ninus2.png" id="ninus" width="100"height="100"> 
							<img src="./resources/image/update.png" id="check" width="100" height="100">
	                     </div>
					</div>
					
				</div>
				</section>
			</div>
		</div>
		<input type="hidden" id="sellerCRN" value="${sessionScope.sellerCRN}">
</body>
</html>