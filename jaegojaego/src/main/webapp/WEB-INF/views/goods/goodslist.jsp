<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%--1--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sing - Tables Dynamic</title>

<script type="text/javascript" src="<c:url value="./resources/js/jquery-3.1.1.js"/>"></script>

	<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>
	<script>
 	$(function() {
		doSend();
	}); 
	</script>

	<script>
	function goodslist() {
		//20170503 박진우		alert('어찌하스까이이');
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

            <li class="active">
                <!-- an example of nested submenu. basic bootstrap collapse component -->
                <a href="" <%--data-toggle="collapse" data-parent="#sidebar"--%> onclick="goodslist()">
                    <span class="icon">
                        <i class="fa fa-table"></i>
                    </span>
                    상품 목록
                   
                </a>
             
            </li>

            <li>
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

                </a>
            </li>

        </ul>

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
<%--================================================================================================================================================--%>

<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('.bplus').click(function() {
			var n = $('.bplus').index(this);
			var numb = $('.beforeQ:eq('+n+')').text();
			var numa = $('.afterQ:eq('+n+')').val();
			var btnnum = $('.status:eq('+n+')').val();
			
			if(btnnum=='on'){
				if(numb-1<numa){
					alert("상품의 상태를 'off'로 한 후 상품등록이 가능합니다");
				} else{
					var num = $(".afterQ:eq(" + n + ")").val();			
					num = $(".afterQ:eq(" + n + ")").val(num * 1 + 1);			
				}
			}else{
				var num = $(".afterQ:eq(" + n + ")").val();			
				num = $(".afterQ:eq(" + n + ")").val(num * 1 + 1);	
			}
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


				if($('.afterQ').eq(index).val() != $('.beforeQ').eq(index).text()){
					
					var ninus = $('.beforeQ').eq(index).text()-$('.afterQ').eq(index).val();
					//20170503 박진우					alert(ninus); 
					
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
							/* alert("content: "+content); */
							var jsonContent = JSON.parse(content);
							/* alert("jsonContent : "+jsonContent); */
							dosendcontent(jsonContent);
							//alert("!!!!!");
							doSend();
							alert('수량이 변경되었습니다.');
						},
						error:function(e){
							//20170503 박진우							alert("왜??"+e);
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
						},
						
						error:function(e){
						
						}
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
					//20170503 박진우					alert(index);
//20170503 박진우					alert(checked);
					if(checked){
						var delcode = goodscode.eq(index).text();
						//20170503 박진우						alert("index야"+index);
//20170503 박진우						alert(delcode);
						$.ajax({
							type:"GET",
							url:"del",
							data:{
								goodsCode : delcode
							},
							success:function(){
								alert("상품이 삭제되었습니다.");
								doSend();
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
						success: function(content){
							//20170503 박진우							alert("content : "+content);
							var jsonContent = JSON.parse(content);
							/* alert("jsonContent : "+jsonContent); */
							dosendcontent(jsonContent);
							doSend();
							//location.href="goodslist";
							alert('상품이 등록되었습니다.');
						}
					});
			 }else{
			      $(this).val('off');
				  var index = $('.status').index(this);
			      var btnstatus = $(this).val();
			      var goodscode = $(".goodscode:eq("+index+")").text();
			    //20170503 박진우			      alert(index);
			      $.ajax({
						type:"GET",
						url:"updatestatus",
						data:{
							goodsCode:goodscode,
							goodsStatus:btnstatus
						},
						success: function(){
							doSend();
							//location.href="goodslist";
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
			location.href="goodsupdate?goodsCode="+goodscode;
		});
	})
</script>


<%--20170422 박진우 박시원 웹소켓 테스트============================================= --%>
 <script type="text/javascript">
	
      
        	function client(evt){
        		
        	}
        	
        	
        	function seller(){
        		  		
        		doSend();
        	}
           
            var wsUri = "ws://203.233.196.92:8889/web/echo.do";
           
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
			
				var CRN = document.getElementById("sellerCRN").value;
				/*//////////////////////////////////////////////////////////////  */
				
				var glist= []; 
				var goodstime = [];
                  

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
                                   GC: item.goodsCode,
                                   DT: item.expiredDate

                               });
                               
                             });
                            /////////////////////////////////////////////////////

                            
                            
                            var content0 = '<div class="goodsinfo" id="'+CRN+'" style="overflow-y:scroll;overflow-x:hidden">'+
                                         			'<table width="100%"><tr><th>商品名</th><th>値段</th><th>數量</th><th width="140px">賞味期限</th><th>写真</th></tr>';
                               
                                   for (var i = 0, len = glist.length; i < len; i++) {
                                   		
                                         content0 += '<tr><th>'+glist[i].GN+'</th><th>'+glist[i].GP+"</th><th>"+glist[i].GQ
                                         +'</th><th><div name="demo" id="'+glist[i].GC+'" class="demos" attr="'+glist[i].GC+'"></div></th><th style="position:relative;left:10px"><img src="./resources/image/picture4.png" width="20px" height="20px" class="getgoodsimg" goodsimgcode="'+glist[i].GC+'">'+
                                         '</th></tr>';
                                        
                                         
                                         goodstime.push({goodscodes:glist[i].GC,goodsDTs:glist[i].DT});
                                         
                                           }
                              
                         
                            
                            //
                            
                            
                            
                            content0 += '</table></div>';
                            
                        
                        	
                            $.ajax({//type필수임
                                type : "post",   //RequestMethod Type
                                url: "markimg", //RequestMapping value
                                data:{
                                   sellerCRN:CRN
                                },
                                
                                success : function(data){
                                	//20170503 박진우                                	alert(data);
                    				var pk = {storeid : CRN, goodsid : content0,flag:data,fortimes:goodstime};
                    				var jsonstr = JSON.stringify(pk);
                                    websocket.send(jsonstr); // 스트링 배열만들어서 보내면 되겠네...
                                    //websocket.close();
                                    
               
                                },
                                error : function(e){
                                   //ajax통신 실패시   
                                   console.log(e);
                                }
                             });
                            
  
                            
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
				
				var message={};
				message.sellerCRN = content.sellerCRN;
						
				message.from = content.color;
						
				message.message = content.shopname;
				message.to = content.buyer_id;
			
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
        <ol class="breadcrumb">
            <li>현재 위치</li>
            <li class="active">상품 목록</li>
        </ol>


		<h1 class="page-title">Tables - <span class="fw-semi-bold">상품 목록 </span></h1>

		<div class="row">
			<div class="col-md-12">
				<section class="widget"> 
				<header>
				<h4>
					Today <span class="fw-semi-bold">${todate }</span>
				</h4>
				</header>
				
				<div class="table-responsive">
					<table class="table table-hover tablesorter" id="tableapi">
						<thead>
							<tr>
								<th style="padding-left: 12px;">写真</th>
								<th>商品名</th>
								<th>商品コード</th>
								<th>値段</th>
								<th style="padding-left: 34px;">アップロード日</th>
								<th style="padding-left: 41px;">賞味期限</th>
								<th>現在數量</th>
								<th>変更數量</th>
								<th>
									<span>
									削除<input type="checkbox" id="checkboxall" style="width:15px;height:15px;margin-left: 5px;">
									</span>
								</th>
								<th style="padding-left: 13px;">修正</th>
								<th>状態</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="map" items="${list }">
							<tr class="tr">
								<td>
									<img src="download?goodsCode=${map.goodsCode }" width="50" height="30"> 
								</td>
								<td class="goodsname" style="padding-top: 12px;">${map.goodsName }</td><!--  -->
								<td class="goodscode" style="padding-top: 12px;">${map.goodsCode }</td>
								<td class="goodsprice" style="padding-top: 12px;padding-left: 19px;">${map.goodsPrice  }</td><!--  -->
								<td style="padding-top: 12px;">${map.goodsDateOfUpload }</td>
								<td style="padding-top: 12px;">${map.expiredDate }</td>
								<td class="beforeQ" style="padding-top: 12px;padding-left: 19px;">${map.goodsQuantity  }</td>
								<td>
									<input type="text" size="4" value="${map.goodsQuantity }"class="afterQ"
									style="margin-top: 2px;margin-left: 3px;"> 
									<img src="./resources/image/ninus.png" class="bninus" width="10" height="10"> 
									<img src="./resources/image/plus.png" class="bplus" width="10" height="10">
								</td>
								<td>
									<input type="checkbox" name="checkbox" class="checkbox" 
									style="width:15px;height:15px;margin-top: 15px;margin-left: 13px;">
								</td>
								<td>
									<input type="button" value="수정" class="btnupdate" style="margin-top: 3px;">
								</td>
								<td>
									<input type="button" value="${map.goodsStatus }" class="status" style="margin-top: 3px;">
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
		

<%--================================================================================================================================================--%>
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