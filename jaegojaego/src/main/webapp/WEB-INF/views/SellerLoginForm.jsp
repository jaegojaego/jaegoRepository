<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Sing - Login</title>
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





<script type="text/javascript">
function formCheck() {
	//알아서 완성시키리라 믿고 ^^; 일단 true 반환
	return true;
}
</script>





</head>
<body class="login-page">

<div class="container">
    <main id="content" class="widget-login-container" role="main">
        <div class="row">
            <div class="col-lg-4 col-sm-6 col-xs-10 col-lg-offset-4 col-sm-offset-3 col-xs-offset-1">
                <h4 class="widget-login-logo animated fadeInUp">
                    <i class="fa fa-circle text-gray"></i>
                    saiko
                    <i class="fa fa-circle text-warning"></i>
                </h4>
                <section class="widget widget-login animated fadeInUp">
                    <header>
                        <h3>最後の在庫にログイン</h3>
                    </header>
                    <div class="widget-body">
                        <p class="widget-login-info">
販売者IDと暗証番号を入力してください。
                        </p>
                        <p class="widget-login-info">
まだアカウントが無ければ、'会員登録'をクリックしてください。
                        </p>
                        <form class="login-form mt-lg" action="SellerLogin" method="post" onsubmit="return formCheck()" id="form">
                            <div class="form-group">
                                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="販売者ID" name="custid" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control" id="pswd" type="password" placeholder="購買者暗証番号" name="password"
                                onkeypress="javascript:if(event.keyCode == 13){document.getElementById('form').submit();}">
                            </div>
                            <div class="clearfix">
                                <div class="btn-toolbar pull-right">



                                    <%--<button type="button" class="btn btn-default btn-sm">Create an Account</button>--%>
                                    <%--<a class="btn btn-inverse btn-sm" href="index.html">Login</a>--%>
                                    <a class="btn btn-inverse btn-sm" onclick="document.getElementById('form').submit();">ログイン</a>



                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-sm-push-6">
                                    <div class="clearfix">
                                        <div class="checkbox widget-login-info pull-right ml-n-lg">
                                            <input type="checkbox" id="checkbox1" value="1">
                                            <label for="checkbox1">ログイン状態を維持 </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-sm-pull-6">
                                    <a class="mr-n-lg" href="sellerJoinForm">会員登録</a>
                                </div>
                            </div>
                        </form>
                        <c:if test="${loginErr != null}">
							<script type="text/javascript">alert('로그인 에러입니다.');</script>
						</c:if>
                    </div>
                </section>
            </div>
        </div>
    </main>
    <footer class="page-footer">
        2017 &copy; saiko.
    </footer>
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

<!-- common app js -->
<script src="./resources/bootstrap/js/settings.js"></script>
<script src="./resources/bootstrap/js/app.js"></script>

<!-- page specific libs -->
<!-- page specific js -->
</body>
</html>