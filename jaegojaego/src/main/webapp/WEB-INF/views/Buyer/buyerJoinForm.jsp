<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원 가입 : 구매자</title>
<%--<link href="./resources/bootstrap/css/application.min.css" rel="stylesheet">--%>
	<link href="./resources/bootstrap/css/application.css" rel="stylesheet">    
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
    function buyerIDcheck() {
    	window.open("buyerIDcheck","width=400,height=300");
    }

    function beforeSubmit() {
    
		//회원가입 전 체크-------------------------------------------------------------- 
		var buyerId_tf = document.getElementById('buyerId_tf').value;
		var buyerPw = document.getElementById('buyerPw').value;
		var buyerPw2 = document.getElementById('buyerPw2').value;
		var buyerName = document.getElementById('buyerName').value;
		var buyerShopName = document.getElementById('buyerShopName').value;
		var buyerPhone = document.getElementById('buyerPhone').value;
		var buyerEmail = document.getElementById('buyerEmail').value;

		if (buyerId_tf == '') {
			alert('ID를 입력하세요.');
			return false;
		} else if (buyerId_tf.length < 6) {
			alert('ID는 영문 or 숫자 6자 이상이어야 합니다.');
			return false;			
		} else if (buyerPw == '') {
			alert('비밀번호를 입력하세요.');
			return false;
		} else if (buyerPw != buyerPw2) {
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		} else if (buyerPw.length < 6 || buyerPw.length < 6 ) {
			alert('비밀번호는 영문 or 숫자 6자 이상이어야 합니다.');
			return false;			
		} else if (buyerName == '') {
			alert('성명을 입력하세요');
			return false;
		} else if (buyerPhone == '') {
			alert('전화번호를 입력하세요');
			return false;
		} else if (buyerEmail == '') {
			alert('이메일을 입력하세요');
			return false;
		}
		//------------------------------------------------------------------------------
		
		//이상 없으면 정상 진행
		
		document.getElementById('buyerId').value = document.getElementById('buyerId_tf').value;
		
		document.getElementById('buyerJoinForm').submit();		//form을 submit해줌
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
					alert(reader.value);
					$('#blah').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
</script>
    
</head>
<body>
<%--<div class="content-wrap">--%>		<%-- 좌 → 우로 이동하는 파란색 띠 --%>
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-md-* > .widget.  -->
    <main id="content" class="content" role="main">
        <ol class="breadcrumb">
<%--        <li>YOU ARE HERE</li>
            <li class="active">Form Elements</li>--%>
        </ol>
        <h1 class="page-title">회원 가입 : <span class="fw-semi-bold">구매자</span></h1>
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
                        <form method="post" id="buyerJoinForm" enctype="multipart/form-data" class="form-horizontal" role="form" action="buyerJoin">
                            <fieldset>
                                <legend><strong><%--Horizontal--%></strong><%-- form--%></legend>



								<div class="form-group">
                                    <label class="col-sm-4 control-label" for="prepended-input">ID</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <input type="text" name="buyerId_tf" id="buyerId_tf" class="form-control" size="16" disabled="disabled" placeholder="'ID 중복 검사'를 클릭하세요">
                                            <input type="hidden" name="buyerId" id="buyerId">
                                        </div>
                                        <a href="#" onclick="buyerIDcheck()">ID 중복 검사</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="password-field">비밀번호</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                            <input type="password" class="form-control" name="buyerPw" id="buyerPw" placeholder='영문 or 숫자 6자 이상'>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="password-field">비밀번호 확인</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                            <input type="password" class="form-control" id="buyerPw2" placeholder="비밀번호 재입력">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="hint-field" class="col-sm-4 control-label">
                                        성명
                                        <%--<span class="help-block">Some help text</span>--%>
                                    </label>
                                    <div class="col-sm-7">
                                        <input type="text" name="buyerName" id="buyerName" class="form-control" placeholder='대표자 성명'>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="hint-field" class="col-sm-4 control-label">
                                        전화번호
                                        <%--<span class="help-block">-를 제외한 번호만 입력하세요</span>--%>
                                    </label>
                                    <div class="col-sm-7">
                                        <input type="text" name="buyerPhone" id="buyerPhone" class="form-control" placeholder='-를 제외한 번호만 입력하세요'>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="normal-field" class="col-sm-4 control-label">E-mail</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="buyerEmail" id="buyerEmail" class="form-control" placeholder='E-mail'>
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
<%--</div>--%>			<%-- 좌 → 우로 이동하는 파란색 띠 --%>
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