<%-- 회원가입 : 박진우 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
</head>
<body>
<h1>[ 회원 가입 ]</h1>

<form action="sellerJoin" method="post" enctype="multipart/form-data">
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
			<%--
			<input type="text" name="sellerBEA" id="sellerBEA">
			<input type="button" onclick="sellerMap()" value="주소 입력">
			--%>
			<input type="text" name="sellerBEA" id="sellerBEA" placeholder="주소소소">
			<input type="button" onclick="sample5_execDaumPostcode()" value="주소 입력">
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
			<input type="file" name="upload">
		</td>
	</tr>

	<tr>
		<td>위도</td>
		<td>
			<input type="hidden" name="sellerLat" id="sellerLat">
		</td>
	</tr>
	<tr>
		<td>경도</td>
		<td>
			<input type="hidden" name="sellerLong" id="sellerLong">
		</td>
	</tr>
</table>



<%-- ↓ API 사용부 --%>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"></script>
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

                        
                        
						//20170320 박진우 : alert 테스트
    					var sellerLat = result.addr[0].lat;
    					var sellerLong = result.addr[0].lng;
                        alert(sellerLat); 
                        alert(sellerLong);

						//20170321 박진우 : 경도 및 위도 값을 넘겨줌
						document.getElementById("sellerLat").value = sellerLat;
						document.getElementById("sellerLong").value = sellerLong;



                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
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



<input type="submit" value="가입">
</form>

</body>
</html>