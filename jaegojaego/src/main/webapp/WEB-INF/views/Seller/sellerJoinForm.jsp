<%-- 회원가입 : 박진우 / 20170324 업로드할 파일 이름이 한 박자 느리게 표시되는 상태 - 업로드만 버튼으로 하자! --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='<c:url value="/resources/js/jquery-3.1.1.js"/>' ></script>
<title>Insert title here</title>
<script type="text/javascript"></script>

<script>
function sellerIDcheck() {
	window.open("sellerIDcheck","width=400,height=300");
}


//innerHTML로 주소2 추가a
function add_sellerBEA2() {
	alert("주소2!");
	var html = "<input type='text' id='sellerBEA2' placeholder='주소소소'>";
	$("#div_sellerBEA2").html(html);

	alert("주소2 완료!");
}

//20170324 가입(a태그)
$(function(){		//ready 함수
	$("#submitA").on("click",function(){
		
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
		} else if (sellerPw == '') {
			alert('비밀번호를 입력하세요.');
			return false;
		} else if (sellerPw != sellerPw2) {
			alert('비밀번호가 일치하지 않습니다.');
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
		} else if (sellerBEA == '') {
			alert('매장 주소를 입력하세요');
			return false;
		} else if (sellerTOB == '') {
			alert('업종을 입력하세요');
			return false;
		}
		//------------------------------------------------------------------------------
		
		//이상 없으면 정상 진행		
		document.getElementById('sellerJoinForm').submit();		//form을 submit해줌

	})
})
</script>

</head>
<body>
<h1>[ 회원 가입 ]</h1>

<form action="sellerJoin" method="post" id="sellerJoinForm" enctype="multipart/form-data">		<%-- form에 id를 줌으로써 JavaScript에서 submit해줌 --%>
<table>
	<tr>
		<td>사업자번호</td>
		<td>
			<input type="text" name="sellerCRN" id="sellerCRN">
		</td>
	</tr>
	<tr>
		<td>ID</td>
		<td>
			<input type="text" name="sellerId" id="sellerId">
<%--		<input type="button" onclick="sellerIDcheck()" value="ID 중복 체크">--%>
			<a href="#" onclick="sellerIDcheck()">ID 중복 체크(a태그)</a>
		</td>
	</tr>	
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="sellerPw" id="sellerPw"><br>
			<input type="password" id="sellerPw2">
		</td>
	</tr>
	<tr>
		<td>대표자 성명</td>
		<td>
			<input type="text" name="sellerName" id="sellerName">
		</td>
	</tr>
	<tr>
		<td>상호</td>
		<td>
			<input type="text" name="sellerShopName" id="sellerShopName">
		</td>
	</tr>
	<tr>
		<td>매장 전화번호</td>
		<td>
			<input type="text" name="sellerPhone" id="sellerPhone">
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>
			<input type="text" name="sellerEmail" id="sellerEmail">
		</td>
	</tr>
	<tr>
		<td>매장 주소</td>
		<td>
			<input type="text" name="sellerBEA" id="sellerBEA" placeholder="주소">
<%--		<input type="button" onclick="sample5_execDaumPostcode()" value="주소 입력">--%>
			<a href="#" onclick="sample5_execDaumPostcode()">주소 입력(a 태그)</a>			
			<input type="hidden" name="sellerLat" id="sellerLat">
			<input type="hidden" name="sellerLong" id="sellerLong"><br>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<div id="div_sellerBEA2"></div>
		</td>
	</tr>



	<tr>
		<td>
		</td>
		<td>



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
                document.getElementById("sellerBEA").value = fullAddr;
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



		</td>
	</tr>		
	<tr>
		<td>업종</td>
		<td>
			<input type="text" name="sellerTOB" id="sellerTOB">
		</td>
	</tr>

	<tr>
		<td>매장 사진</td>
		<td>
		<%--<input type="text" name="sellerShopOimg" id="sellerShopOimg">--%>
		<%--<input type="file" name="upload">--%>
<%--	<a href="#" id="uploadA">파일 업로드</a>--%>	<%-- a 태그 클릭시 파일 버튼으로 연결--%>
		<input type="file" name="upload" id="uploadB" <%--style="display:none"--%>/>   			
		</td>
	</tr>
</table>



<%-- 20170324 가입(a태그) --%>
<%--<input type="submit" value="가입">--%>
<a href="#" id="submitA">가입(a태그)</a>



</form>

</body>
</html>