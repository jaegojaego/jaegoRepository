<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"> </script>
<script type="text/javascript" src="./resources/js/function.js"> </script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1e403c6110d8f3b7f15a41476c1642be&libraries=services"></script>
<script>
   
   $(function(){
	

      
      
      var adrr = "부천시";
      a(adrr);

      
      $("li li").on("click",function(){
         adrr = $(this).text();
         a(adrr);
      
      });
   
      $("#btn1").on("click",function(){
         adrr = $("#adr").val(); //클래스를 찾자
         a(adrr);

      })
           
      function a(adrr){
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };  

      // 지도를 생성합니다    
      var map = new daum.maps.Map(mapContainer, mapOption); 

      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new daum.maps.services.Geocoder();

      // 주소로 좌표를 검색합니다
      geocoder.addr2coord(adrr, function(status, result) {

          // 정상적으로 검색이 완료됐으면 
           if (status === daum.maps.services.Status.OK) {

              var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
              
              $.ajax({//type필수임
                  type : "get",   //RequestMethod Type
                  url: "Shoplist", //RequestMapping value
                  success : function(data){
                     mdata(data);
                     
               },
                  error : function(e){
                     //ajax통신 실패시   
                     console.log(e);
                  }
               });
              
              
              function mdata(data){
                 
                   var positions = [],
                   selectedMarker = null; // 클릭한 마커를 담을 변수
                  
                  $.each(data,function(index,item){
                     
                     positions.push({
                        title: item.sellerShopName,
                        CRN: item.sellerCRN,
                        goods: item.sellerCRN, // 이부분수정
                        latlng: new daum.maps.LatLng(item.sellerLat,item.sellerLong),
                        sellername: item.sellerName,
                        shopaddress: item.sellerBEA
                        
                     // 여기에 추가할 오버레이 내용을 입력하면 됩니다 ~~~
                     ///////////////////////////////////////////////////////////////////////////
                     });
   
                  
                  });
                   
                  for (var i = 0, len = positions.length; i < len; i++) {
                       
                       // 마커를 생성하고 지도위에 표시합니다
                       addMarker(positions[i]);
                   }

                  function addMarker(position) {
                  var overlay;
                  var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
                  var marker;
                  
                  
                  var glist= []; 
                  var content2="";
                 
                    $.ajax({//type필수임
                        type : "post",   //RequestMethod Type
                        url: "Goodslist", //RequestMapping value
                        data:{
                           sellerCRN:position.CRN
                        },
                        
                        success : function(data){
                        	
                            $.each(data,function(index,item){
                            	
                            	glist.push({
                            		GN: item.goodsName,
                                	GP: item.goodsPrice,
                                	GQ: item.goodsQuantity,
                                	GI: item.goodsOimage

                            	});
                            	
                             });
                            

                            
                            // 마커 이미지의 이미지 크기 입니다
                            var imageSize = new daum.maps.Size(24, 35); 
                            
                            // 마커 이미지를 생성합니다    
                            var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
                            
                            // 마커를 생성합니다
                            marker = new daum.maps.Marker({
                                map: map, // 마커를 표시할 지도
                                position: position.latlng, // 마커를 표시할 위치
                                title : "재고 수 :"+position.goods, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                image : markerImage,// 마커 이미지 
                                clickable: true,
                                
                            });
                            //
                            
                        	var content = '<div class="wrap">' + 
                            '    <div class="info">' + 
                            '      <div class="title">' + 
                            position.title + 
                            '      <div class="close" title="닫기"></div>' + 
                            '      </div>' + 
                            '      <div class="body">' + 
                            '      <div class="img">' +
                            '      <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="100" height="300">' +
                            '      </div>' + 
                            '      <div class="desc">' + 
                            '      <div class="ellipsis" >'+
                            '</div>' + 
                            '<div class="jibun ellipsis">'+position.shopaddress+'</div><div class="goodsinfo">';
                            
                            for (var i = 0, len = glist.length; i < len; i++) {
                              //  total+= glist[i].GN;
             				   // 마커를 생성하고 지도위에 표시합니다
          				      content += "상품명: "+glist[i].GN+"상품가격: "+glist[i].GP+"상품개수: "+glist[i].GQ;
             				  content += '<br>';
             				   console.log(glist[i]);
          				      /* content += '<div class="goodsinfo"> </div>'; */
                            }
                            
                            content += '</div><div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
                            '            </div>' + 
                            '        </div>' + 
                            
                            '    </div>' +    
                            '</div>';
                    
                            overlay = new daum.maps.CustomOverlay({
                                clickable: true,
                                content: content+content2,
                                map: map,
                                position: marker.getPosition()
                                
                            });
                            
                            
                            overlay.setMap(null);

                            daum.maps.event.addListener(marker, 'click', function() {

                                // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
                                // 마커의 이미지를 클릭 이미지로 변경합니다
                                if (selectedMarker == null) {
                                    // 클릭된 마커 객체가 null이 아니면
                                    // 클릭된 마커의 이미지를 기본 이미지로 변경하고
                                   overlay.setMap(map);
                                   marker.setClickable(false);
                                   selectedMarker=marker;
                                }else{
                                   alert("한가게씩 선택해주세요!");
                                   
                                }

                                // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
                               
                                $(".close").on("click",function(){
                                   overlay.setMap(null);
                                   marker.setClickable(true);
                                   selectedMarker = null;
                              
                                });
                            });
    },
                        error : function(e){
                           //ajax통신 실패시   
                           console.log(e);
                        }
                     });

                     }          
                  }         
          }else{
             alert("다시검색해주세요");

          } 
      });    
      }

   // 
   });
</script>

<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 400px;height: 400px;margin-left: -185px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}

    .wrap .info {width: 400px;height: 400px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 130px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 13px;width: 370px;height: 130px;border: 1px solid #ddd;color: #888;overflow: hidden;}
   /* .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')} */
    .info .link {color: #5085BB;}
</style>



<link rel="stylesheet" style type="text/css" href="./resources/css/font-awesome.css">
</style>
<link rel="stylesheet" style type="text/css" href="./resources/css/menu.css">
</style>
</head>
<body>

<div id="wrap">
    <header>
        <div class="inner relative">
            <a class="logo" href="https://www.freshdesignweb.com"><img src="images/logo.png" alt="fresh design web"></a>
           <nav id="navigation">
                <ul id="main-menu">
                    <li class="parent">

                        <a href="home">지역선택</a>   
                  <지역검색>
<input type="text" id="adr">
<input type="button" name="" id="btn1" value="직접검색">
                  
                  
                  
                        <ul class="sub-menu">

                            <li>서울특별시</li>
                            <li>경기도</li>                           
                            <li>인천광역시</li>
                            <li>부산광역시</li>
                            <li>울산광역시</li>                           
                            <li>대구광역시</li>
                            <li>대전광역시</li>
                            <li>광주광역시</li>                            
                     <li>
                                <div class="parent"> 제주도</div>
                                <div >
                                <ul class="sub-menu">
                                    <li>서귀포</li>
                                    <li>제주시</li>
                                   </ul>
                            </li>
                        </ul>
                    </li>
            </nav>

    </header>
</div>
<div id="map" style="width:100%;height:500px;"></div>


<div id="sellergoods" style="width:100%;height:300px;"></div>



</body>
</html>