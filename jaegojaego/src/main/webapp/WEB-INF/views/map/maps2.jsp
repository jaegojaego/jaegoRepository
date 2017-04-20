<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"> </script>
<script type="text/javascript" src="./resources/js/function.js"> </script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=58be92da2825bdc2b27886ae673b8712&libraries=services"></script>
<script>
   
   $(function(){
   
      var adrr = "삼성동";
      console.log(adrr);
      var flag = [];
      var sellertob;
      a(adrr,flag,sellertob);
      
/*       navigator.geolocation.getCurrentPosition( function(pos) {
            var latitude = pos.coords.latitude;
            var longitude = pos.coords.longitude;
            
            adrr = "부천시"; //무조건 검색이 되어야 받아오는거라서 부천시라고 임의로 지정해둠 
            flag = [latitude,longitude];
            console.log(flag);
            a(adrr,flag,sellertob);
       
       });   */
      $(".tob").on("click",function(){
      
        sellertob = $(this).text();
        a(adrr,flag,sellertob);
      });
      
      
      $("li li").on("click",function(){
         adrr = $(this).text();
         a(adrr,flag,sellertob);
      
      });
   
      $("#btn1").on("click",function(){
         adrr = $("#adr").val(); //클래스를 찾자
         a(adrr,flag,sellertob);

      });
      
           
      function a(adrr,flag,sellertob){
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
              var coords;
                 coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
              
              $.ajax({//type필수임
                  type : "get",   //RequestMethod Type
                  url: "Shoplist", //RequestMapping value
                  data: {
                     sellerTOB:sellertob
                  },
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
           
                  var marker;
                  
                  
                  var glist= []; 
                  var content2="";
                 
                    $.ajax({//type필수임
                        type : "get",   //RequestMethod Type
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
                                   GI: item.goodsOimage,
                                   GC: item.goodsCode

                               });
                               
                             });
                            /////////////////////////////////////////////////////
                            var imageSrc;
                    $.ajax({//type필수임
                        type : "post",   //RequestMethod Type
                        url: "markimg", //RequestMapping value
                        data:{
                           sellerCRN:position.CRN
                        },
                        
                        success : function(data){
                           var imageSize;
                           
                           if(data>0){
                              imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
                              imageSize = new daum.maps.Size(24, 35);
                           }else{
                              imageSrc = "./resources/image/mark.png";
                              imageSize = new daum.maps.Size(30, 35); 
                           }
                            /////////////////////////////////////////////////
                           // var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
                            // 마커 이미지의 이미지 크기 입니다
                            
                            
                            
                            
                            // 마커 이미지를 생성합니다    
                            var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
                            
                            // 마커를 생성합니다
                            marker = new daum.maps.Marker({
                                map: map, // 마커를 표시할 지도
                                position: position.latlng, // 마커를 표시할 위치
                                title : "재고 수 :"+position.goods, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                image : markerImage,// 마커 이미지 
                                clickable: true
                                
                            });
                            //
                            
                       
                           var content = '<div class="wrap">' + 
                            '    <div class="info">' + 
                            '      <div class="title">' + 
                            position.title + 
                            '      <div class="close" title="닫기"></div>' + 
                            '      </div>' + 
                            '      <div class="body">' + 
                            '      <div class="img"><div class="img2">' +
                            '      <img src="shopimg?sellerCRN='+position.CRN+'" width="120" height="130"></img>' +
                            '      </div> <div class="shopinfo" width="180">가게설명:'+position.shopaddress+'<br><h3>관심매장추가</h3><img src="./resources/image/picture.png" width="20px" height="20px" class="addshop"><div class="star" style="width=20px;">별점</div></div></div>' + 
                            '      <div class="desc">' + 

                            '<div class="goodsinfo" id="'+position.CRN+'"style="overflow-y:scroll">'+
                            '<table><tr><th>상품명</th><th>상품가격</th><th>상품개수</th><th>이미지보기</th></tr>';
                            
                            for (var i = 0, len = glist.length; i < len; i++) {
                              //  total+= glist[i].GN;
                            // 마커를 생성하고 지도위에 표시합니다
                            content += '<tr><th>'+glist[i].GN+'</th><th>'+glist[i].GP+"</th><th>"+glist[i].GQ
                            +'</th><th><div class="thth"><img src="./resources/image/picture.png" width="20px" height="20px" class="abcd" imgData="goodsimg?sellerCRN='+position.CRN+'&goodsCode='+glist[i].GC+'">'+
                            '<span class="immm"><img src="goodsimg?sellerCRN='+position.CRN+'&goodsCode='+glist[i].GC+'" width="90px" height="70px" > </span></div></th></tr>';
                            }
                            
                            content += '</table></div></div>' + 
                            '           </div>' + 
                            '        <div><댓글목록></div><div class="comments"></div><div><select class="starcheck"><option value="1">★</option><option value="2">★★</option>'+
                            '<option value="3">★★★</option><option value="4">★★★★</option><option value="5">★★★★★</option></select><input type="text" class="comment"><input type="button" class="bnt" value="입력"></div></div>' + 
                            
                            '    </div>' +    
                            '</div> <div class="goodsimg"></div>';
                            
                           
                            
                       
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
                        
               
                                $(".close").on("click",function(){
                                   overlay.setMap(null);
                                   marker.setClickable(true);
                                   selectedMarker = null;
                              
                                });
                                //////////////////////////////////////////
                                
                                
                                $.ajax({//type필수임
                                         type : "get",   //RequestMethod Type
                                         url: "starsac", //RequestMapping value
                                         data:{
                                            sellerCRN:position.CRN
                                                                                    
                                         },
                                         
                                       success:function(data){
                                    
                                       
                                          var starsss;
                                         if(data<=1){
                                            starsss = "★☆☆☆☆";
                                         }else if(data<=2){
                                            starsss = "★★☆☆☆"
                                         }else if(data<=3){
                                            starsss = "★★★☆☆"
                                         }else if(data<=4){
                                            starsss = "★★★★☆"
                                         }else if(data<=5){
                                            starsss = "★★★★★"
                                         }
                                         
                                        $(".star").html("별점:"+starsss);
                                       },                             
                                       error:function(e){
                                          console.log(e);
                                       }
                                 });
                                
                                $.ajax({//type필수임
                                         type : "get",   //RequestMethod Type
                                         url: "gradelist", //RequestMapping value
                                         data:{
                                            sellerCRN:position.CRN
                                                                                    
                                         },
                                         
                                       success:function(data){
                                          
                                          var htm = "";
                                             htm += '<div style="overflow-y:scroll; height: 100px;"><table><tr><th>작성자</th><th>댓글</th></tr>';
                                       
                                          $.each(data,function(index,item){                                             
                                                htm += '<tr><td>'+item.buyerId+'</td><td>'+item.ment+'</td></tr>';
											
                                              }); 
                                          
                                             htm += '</table></div>';
                                              $(".comments").html(htm);
                                       },                             
                                       error:function(e){
                                          console.log(e);
                                       }
                                 });
                                
                                
                                
                             
                                
                                
                                var nostar;
                                var addcomment;
                                
                                
                                //////////////////////////////////////////////
                                $(".bnt").on("click",function(){
                                 
                                   
                                   addcomment = $(".comment").val();
                                   if(addcomment==""){
                                      alert("내용을 입력해주세요");
                                      return false;
                                   }
                                   ///////////////////////////////////////
                       /*             $.ajax({//type필수임
                                         type : "get",   //RequestMethod Type
                                         url: "nostar", //RequestMapping value
                                         data:{
                                            sellerCRN:position.CRN
                                         },
                                         
                                       success:function(data){
                                          if(data!=0){
                                             return false;
                                          }
                                       },                             
                                       error:function(e){
                                          console.log(e);
                                       }
                                 });
                                    */
                                   
                                   //////////////////////////////////////
                                   var starss = $(".starcheck").val();
                                   
                             
                                     $.ajax({//type필수임
                                         type : "get",   //RequestMethod Type
                                         dataType : "json",
                                         url: "gradelist2", //RequestMapping value
                                         data:{
                                            sellerCRN:position.CRN,
                                            ment:addcomment,
                                            star:starss
                                            
                                         },
                                         
                                       success:function(data){
                                          console.log(data.star);
                                          var htm = "";
                                             htm += '<div style="overflow-y:scroll; height: 100px;"><table><tr><th>작성자</th><th>댓글</th></tr>';
                                       
                                          $.each(data.gradelist,function(index,item){                                             
                                                htm += '<tr><td>'+item.buyerId+'</td><td>'+item.ment+'</td></tr>';

                                              }); 
                                          
                                             htm += '</table></div>';
                                              $(".comments").html(htm);
                                              
                                              var starsss;
                                              if(data.star<=1){
                                                 starsss = "★☆☆☆☆";
                                              }else if(data.star<=2){
                                                 starsss = "★★☆☆☆"
                                              }else if(data.star<=3){
                                                 starsss = "★★★☆☆"
                                              }else if(data.star<=4){
                                                 starsss = "★★★★☆"
                                              }else if(data.star<=5){
                                                 starsss = "★★★★★"
                                              }
                                              
                                             $(".star").html("별점:"+starsss);
                                             alert("등록완료");
                                             $(".comment").val("");
                                             
                                       },                             
                                       error:function(e){
                                          
                                       }
                                 });
                                  
                                
                                ////////////// 여기 별점 새로 가져오는것도 해야함
                                
                                }); 
                                
                                $(".addshop").on("click",function(){
                                   ///
                              
                                    $.ajax({//type필수임
                                        type : "get",   //RequestMethod Type
                                        url: "addshop", //RequestMapping value
                                        data:{
                                           sellerCRN:position.CRN
                                        },
                                        
                                      success:function(data){
                                            alert(JSON.stringify(data));
                                         },                             
                                      error:function(e){
                                         console.log(e);
                                      }
                                });
                    });
                                
                            });
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

                     }          
                  }         
          }else{
             alert("다시검색해주세요");

          } 
      });    
      }
   /////////////////////////////////////////////////////////////////////////////////
   
   });
</script>

<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 303px;height: 500px;margin-left: -150px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}

    .wrap .info {width: 303px;height: 500px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: white;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;background:white;}
    .info .desc {position: relative;margin: 140px 0 0 6px;height: 135px;}
    .shopinfo {position: absolute;left: 120px;text-overflow: shopinfo;background:white;}
    .desc .goodsinfo {top: 6px;left: 5px;text-overflow: goodsinfo;background:pink;width: 289px;height: 130px;border: 1px solid #ddd;color: #888;}
    .info .img2 {position: absolute;width: 120px;height: 130px;overflow: hidden;}
    .info .img {position: absolute;top: 6px;left: 6px;width: 289px;height: 130px;border: 1px solid #ddd;color: #888;overflow: hidden;background:green;}
   .prd_box {position:relative;} 
   .prd_over {position:absolute; width:100%; height:50px; top:95px; bottom:0; left:0; opacity:0; background:url('/shop/data/skin/apple_tree_C/img/djds/etc/prd_over.png') 0 0 no-repeat;}    
   .thth {position:relative; display:inline-block}
   .thth span {visibility:hidden; position:absolute; margin-top:0; margin-left:-20px;}
   .thth:hover span {visibility:visible}

</style>



<link rel="stylesheet" style type="text/css" href="./resources/css/font-awesome.css">
</style>
<link rel="stylesheet" style type="text/css" href="./resources/css/menu.css">
</style>
</head>
<body>


<div id="wrap">
    <header>
        <div class="inner relative"><div style="top:10px; height:30px; background-color: black"><a class="tob">카페</a><br><a class="tob">베이커리</a><br><a class="tob">식당</a>
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
</div>
<div id="map" style="width:100%;height:700px;"></div>


<div id="sellergoods" style="width:100%;height:300px;"></div>

</body>
</html>