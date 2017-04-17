<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원 가입 : 판매자</title>
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
    function sellerIDcheck() {
    	window.open("sellerIDcheck","width=400,height=300");
    }
    function add_sellerBEA2() {
    	var html = "<div class='form-group'><label for='normal-field' class='col-sm-4 control-label'></label><div class='col-sm-7'><input type='text' id='sellerBEA2' class='form-control' placeholder='상세 주소'></div></div>";
    	$("#div_sellerBEA2").html(html);
    }

    function beforeSubmit() {
    
		//회원가입 전 체크-------------------------------------------------------------- 
		var sellerCRN = document.getElementById('sellerCRN').value;
		var sellerId_tf = document.getElementById('sellerId_tf').value;
		var sellerPw = document.getElementById('sellerPw').value;
		var sellerPw2 = document.getElementById('sellerPw2').value;
		var sellerName = document.getElementById('sellerName').value;
		var sellerShopName = document.getElementById('sellerShopName').value;
		var sellerPhone = document.getElementById('sellerPhone').value;
		var sellerEmail = document.getElementById('sellerEmail').value;
		var sellerBEA_tf = document.getElementById('sellerBEA_tf').value;		
		var sellerTOB = document.getElementById('sellerTOB').value;

		if (sellerCRN == '') {
			alert('사업자 번호를 입력하세요.');
			return false;
		} else if (sellerId_tf == '') {
			alert('ID를 입력하세요.');
			return false;
		} else if (sellerId_tf.length < 6) {
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
		} else if (sellerBEA_tf == '') {
			alert('매장 주소를 입력하세요');
			return false;
		} else if (sellerTOB == '') {
			alert('업종을 입력하세요');
			return false;
		}
		//------------------------------------------------------------------------------
		
		//이상 없으면 정상 진행
		
		var sellerBEA2 = document.getElementById('sellerBEA2').value;
		if (sellerBEA2 != null) {
			sellerBEA_tf = sellerBEA_tf + " " + sellerBEA2;
			document.getElementById('sellerBEA').value = sellerBEA_tf;
		}
		
		document.getElementById('sellerId').value = document.getElementById('sellerId_tf').value;
		
		document.getElementById('sellerJoinForm').submit();		//form을 submit해줌
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
        <h1 class="page-title">회원 가입 : <span class="fw-semi-bold">판매자</span></h1>
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
                        <form method="post" id="sellerJoinForm" enctype="multipart/form-data" class="form-horizontal" role="form" action="sellerJoin">
                            <fieldset>
                                <legend><strong><%--Horizontal--%></strong><%-- form--%></legend>



                                <div class="form-group">
                                    <label for="normal-field" class="col-sm-4 control-label">사업자 번호</label>
                                    <div class="col-sm-7">
										<input type="text" name="sellerCRN" id="sellerCRN"
											class="form-control" placeholder="사업자 번호를 입력하세요">
									</div>
                                </div>



								<div class="form-group">
                                    <label class="col-sm-4 control-label" for="prepended-input">ID</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <input type="text" name="sellerId_tf" id="sellerId_tf" class="form-control" size="16" disabled="disabled" placeholder="'ID 중복 검사'를 클릭하세요">
                                            <input type="hidden" name="sellerId" id="sellerId">
                                        </div>
                                        <a href="#" onclick="sellerIDcheck()">ID 중복 검사</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="password-field">비밀번호</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                            <input type="password" class="form-control" name="sellerPw" id="sellerPw" placeholder='영문 or 숫자 6자 이상'>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="password-field">비밀번호 확인</label>
                                    <div class="col-sm-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                            <input type="password" class="form-control" id="sellerPw2" placeholder="비밀번호 재입력">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="hint-field" class="col-sm-4 control-label">
                                        대표자 성명
                                        <%--<span class="help-block">Some help text</span>--%>
                                    </label>
                                    <div class="col-sm-7">
                                        <input type="text" name="sellerName" id="sellerName" class="form-control" placeholder='대표자 성명'>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="hint-field" class="col-sm-4 control-label">
                                        상호
                                        <%--<span class="help-block">Some help text</span>--%>
                                    </label>
                                    <div class="col-sm-7">
                                        <input type="text" name="sellerShopName" id="sellerShopName" class="form-control" placeholder='상호'>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="hint-field" class="col-sm-4 control-label">
                                        전화번호
                                        <%--<span class="help-block">-를 제외한 번호만 입력하세요</span>--%>
                                    </label>
                                    <div class="col-sm-7">
                                        <input type="text" name="sellerPhone" id="sellerPhone" class="form-control" placeholder='-를 제외한 번호만 입력하세요'>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="normal-field" class="col-sm-4 control-label">E-mail</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="sellerEmail" id="sellerEmail" class="form-control" placeholder='E-mail'>
                                    </div>
                                </div> 

                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="disabled-input">매장 주소</label>
                                    <div class="col-sm-7">
                                        <input type="text" id="sellerBEA_tf<%--disabled-input--%>" name="sellerBEA_tf" class="form-control"
                                               disabled="disabled" placeholder="'주소 검색'을 클릭하세요">
										<input type="hidden" id="sellerBEA" name="sellerBEA">                                               
										<a href="#" onclick="sample5_execDaumPostcode()">주소 검색</a>

<%----------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
<%-- ↓ API 지도 표시부 --%>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=1e403c6110d8f3b7f15a41476c1642be&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
    
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sellerBEA_tf").value = fullAddr;
                // 주소로 좌표를 검색
                geocoder.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        //여기서 result.addr[0].lat, result.addr[0].lng 이걸받아와서 저장하면 될듯

                        
                        
						//20170321 박진우 : 경도 및 위도 값을 넘겨줌
    					var sellerLat = result.addr[0].lat;
    					var sellerLong = result.addr[0].lng;
						document.getElementById("sellerLat").value = sellerLat;
						document.getElementById("sellerLong").value = sellerLong;



                        // 지도를 보여준다.
//						mapContainer.style.display = "block";		//20170328 안나오는 걸로 변경...
						add_sellerBEA2();

                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                        
                    }
                });
            }
        }).open();
    }    
</script>
<%----------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
										<input type="hidden" name="sellerLat" id="sellerLat">
										<input type="hidden" name="sellerLong" id="sellerLong"><br>                                               
                                    </div>
                                </div>



								<div id="div_sellerBEA2">
									<%-- 상세주소 확장부 --%>								                                
                                </div>                                



                                <div class="form-group">
                                    <label for="normal-field" class="col-sm-4 control-label">업종</label>
                                    <div class="col-sm-7">
                                        <input type="text" name="sellerTOB" id="sellerTOB" class="form-control" placeholder='업종'>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="transparent-input">
                                        매장 사진
                                    </label>
                                    <div class="col-sm-7">
                                        <div class="input-group input-group-transparent">
                                        <%--<input name="upload" id="uploadB" class="form-control" type="text">--%>



                                        <input type="file" name="upload" id="uploadB" <%--style="display:none"--%> placeholder='매장 사진'>
                                        <br>
                                        <img id="blah" src="#" alt="your image" width="350" />





                                            <%--<span class="input-group-addon">--%>
                                            <%--<i class="fa fa-camera" onclick="testt()"></i>--%>
                                            <%--</span>--%>
                                        </div>
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