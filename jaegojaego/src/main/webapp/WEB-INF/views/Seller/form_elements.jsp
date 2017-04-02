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
    <link rel="shortcut icon" href="./resources/bootstrap/img/favicon.png">
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
                        <form class="form-horizontal" role="form" action="test">
                            <fieldset>
                                <legend><strong>Horizontal</strong> form</legend>
                                <div class="form-group">
                                    <label for="normal-field" class="col-sm-4 control-label">사업자 번호</label>
                                    <div class="col-sm-7">
                                        <input type="text" id="normal-field" name="test" class="form-control" placeholder="사업자 번호를 입력하세요">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="hint-field" class="col-sm-4 control-label">
                                        Label hint
                                        <span class="help-block">Some help text</span>
                                    </label>
                                    <div class="col-sm-7">
                                        <input type="text" id="hint-field" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="tooltip-enabled">Tooltip enabled</label>
                                    <div class="col-sm-7">
                                        <input type="text" id="tooltip-enabled" class="form-control"
                                               data-placement="top" data-original-title="Some explanation text here"
                                               placeholder="Hover over me..">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="disabled-input">Disabled input</label>
                                    <div class="col-sm-7">
                                        <input type="text" id="disabled-input" class="form-control"
                                               disabled="disabled" value="Default value" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="max-length">Max length</label>
                                    <div class="col-sm-7">
                                        <input type="text" id="max-length" maxlength="3"
                                               class="form-control"
                                               placeholder="Max length 3 characters"
                                               data-placement="top" data-original-title="You cannot write more than 3 characters.">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="prepended-input">Prepended input</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <input id="prepended-input" class="form-control" size="16" type="text" placeholder="Username">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="password-field">Password</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                            <input type="password" class="form-control" id="password-field" placeholder="Password">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="appended-input">Appended input</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <input id="appended-input" class="form-control" size="16" type="text">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="combined-input">Combined</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <span class="input-group-addon">$</span>
                                            <input id="combined-input" class="form-control" size="16" type="text">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="transparent-input">
                                        Append Transparent
                                    </label>
                                    <div class="col-sm-7">
                                        <div class="input-group input-group-transparent">
                                            <input id="transparent-input" class="form-control" type="text">
                                            <span class="input-group-addon">
                                                <i class="fa fa-camera"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-sm-offset-4 col-sm-7">
                                        <button type="submit" class="btn btn-primary">Save Changes</button>
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