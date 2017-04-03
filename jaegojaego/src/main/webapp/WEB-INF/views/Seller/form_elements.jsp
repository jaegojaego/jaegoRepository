<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sing - Forms</title>
    <link href="./resources/bootstrap/css/application.min.css" rel="stylesheet">
    <!-- as of IE9 cannot parse css files with more that 4K classes separating in two files -->
    <!--[if IE 9]>
        <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]-->
<%--<link rel="shortcut icon" href="./resources/bootstrap/img/favicon.png">--%>
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
    function testt() {
    	alert("clicked!");
    }
    function sellerIDcheck() {
    	window.open("sellerIDcheck","width=400,height=300");
    }
    </script>

    <script>    
	function beforeSubmit() {
    
		//회원가입 전 체크-------------------------------------------------------------- 
		var sellerCRN = document.getElementById('sellerCRN').value;
		var sellerId = document.getElementById('sellerId').value;
		var sellerPw = document.getElementById('sellerPw').value;
		var sellerPw2 = document.getElementById('sellerPw2').value;
		var sellerName = document.getElementById('sellerName').value;
		var sellerShopName = document.getElementById('sellerShopName').value;
		var sellerPhone = document.getElementById('sellerPhone').value;
		var sellerEmail = document.getElementById('sellerEmail').value;
		var sellerBEA = document.getElementById('sellerBEA').value;		
		var sellerTOB = document.getElementById('sellerTOB').value;
		
		if (sellerCRN == '') {
			alert('사업자번호를 입력하세요.');
			return false;
		} else if (sellerId == '') {
			alert('ID를 입력하세요.');
			return false;
		} else if (sellerId.length < 6) {
			alert('ID는 영문 or 숫자 6자 이상이어야 합니다.');
			return false;			
		} else if (sellerPw == '') {
			alert('비밀번호를 입력하세요.');
			return false;
		} else if (sellerPw != sellerPw2) {
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		} else if (sellerPw.length < 6 || sellerPw.length < 6 ) {
			alert('비밀번호는 영문 or 숫자 6자 이상이어야 합니다.');
			return false;			
		} else if (sellerName == '') {
			alert('대표자 성명을 입력하세요');
			return false;
		} else if (sellerShopName == '') {
			alert('상호를 입력하세요');
			return false;
		} else if (sellerPhone == '') {
			alert('매장 전화번호를 입력하세요');
			return false;
		} else if (sellerEmail == '') {
			alert('이메일을 입력하세요');
			return false;
//		} else if (sellerBEA == '') {
//			alert('매장 주소를 입력하세요');
//			return false;
		} else if (sellerTOB == '') {
			alert('업종을 입력하세요');
			return false;
		}
		//------------------------------------------------------------------------------
		
		//이상 없으면 정상 진행		
		document.getElementById('sellerJoinForm').submit();		//form을 submit해줌
		return true;
	}
</script>
    
</head>
<body>
<div class="content-wrap">
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-md-* > .widget.  -->
    <main id="content" class="content" role="main">
        <ol class="breadcrumb">
            <li>YOU ARE HERE</li>
            <li class="active">Form Elements</li>
        </ol>
        <h1 class="page-title">Form - <span class="fw-semi-bold">판매자 등록</span></h1>
        <div class="row">
            <div class="col-md-6">
                <section class="widget">
                    <header>
                        <h5>
                            Inputs
                        </h5>
                        <div class="widget-controls">
                            <a href="#"><i class="glyphicon glyphicon-cog"></i></a>
                            <a href="#"><i class="fa fa-refresh"></i></a>
                            <a href="#" data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
                        </div>
                    </header>
                    <div class="widget-body">
                        <form method="post" id="sellerJoinForm" enctype="multipart/form-data" class="form-horizontal" role="form" action="sellerJoin">
                            <fieldset>
                                <legend><strong>Horizontal</strong> form</legend>



                                <div class="form-group">
                                    <label for="normal-field" class="col-sm-4 control-label">사업자번호</label>
                                    <div class="col-sm-7">
										<input type="text" name="sellerCRN" id="sellerCRN"
											class="form-control" placeholder="사업자번호를 입력하세요">
									</div>
                                </div>



								<div class="form-group">
                                    <label class="col-sm-4 control-label" for="prepended-input">ID</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <input type="text" name="sellerId" id="sellerId" class="form-control" size="16" type="text" placeholder="Username">
                                        </div>
                                        <a href="#" onclick="sellerIDcheck()">ID 중복 체크(a태그)</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="password-field">비밀번호</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                            <input type="password" class="form-control" name="sellerPw" id="sellerPw" placeholder="Password">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="password-field">비밀번호 확인</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                            <input type="password" class="form-control" id="sellerPw2" placeholder="Password">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="hint-field" class="col-sm-4 control-label">
                                        대표자 성명
                                        <%--<span class="help-block">Some help text</span>--%>
                                    </label>
                                    <div class="col-sm-7">
                                        <input type="text" name="sellerName" id="sellerName" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="hint-field" class="col-sm-4 control-label">
                                        상호
                                        <%--<span class="help-block">Some help text</span>--%>
                                    </label>
                                    <div class="col-sm-7">
                                        <input type="text" name="sellerShopName" id="sellerShopName" class="form-control">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="hint-field" class="col-sm-4 control-label">
                                        전화번호
                                        <span class="help-block">-를 제외한 번호만 입력하세요</span>
                                    </label>
                                    <div class="col-sm-7">
                                        <input type="text" name="sellerPhone" id="sellerPhone" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="normal-field" class="col-sm-4 control-label">E-mail</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="sellerEmail" id="sellerEmail" class="form-control" placeholder="사업자 번호를 입력하세요">
                                    </div>
                                </div> 

                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="disabled-input">매장 주소</label>
                                    <div class="col-sm-7">
                                        <input type="text" id="sellerBEA<%--disabled-input--%>" class="form-control"
                                               disabled="disabled">
										<input type="hidden" name="sellerLat" id="sellerLat">
										<input type="hidden" name="sellerLong" id="sellerLong"><br>                                               
                                    </div>
                                </div>
                                
                                <div id="div_sellerBEA2"></div>

                                <div class="form-group">
                                    <label for="normal-field" class="col-sm-4 control-label">업종</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="sellerTOB" id="sellerTOB" class="form-control" placeholder="">
                                    </div>
                                </div> 

                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="transparent-input">
                                        매장 사진
                                    </label>
                                    <div class="col-sm-7">
                                        <div class="input-group input-group-transparent">
                                            <input name="upload" id="uploadB" class="form-control" type="text">
                                            <span class="input-group-addon">
                                                <i class="fa fa-camera" onclick="testt()"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-sm-offset-4 col-sm-7">
                                        <button type="submit" onclick="return beforeSubmit()" class="btn btn-primary">Save Changes</button>
                                        <button type="button" class="btn btn-inverse">Cancel</button>
                                    </div>
                                </div>
                            </div>
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