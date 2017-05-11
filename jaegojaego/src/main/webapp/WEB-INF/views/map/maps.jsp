<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%--흐엉--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <title>Sing - Tables Dynamics</title>

	<script>
	function goodslist() {
		location.href='goodslist';
	}
	///web/goodslist3
	</script>

<script type="text/javascript" src="<c:url value="./resources/js/jquery-3.1.1.js"/>"></script>






<script type="text/javascript" src="./resources/js/function.js"> </script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a14aced40ff3bc7cb1d2485146b53b0a&libraries=services"></script>

    <link href="./resources/bootstrap/css/application.min.css" rel="stylesheet">

	<link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<script>

var markers=[];
var flag = [];
var sellertob;



function timetest(i,goodscode,goodsDT) {
	
  
  
  var countDownDate = new Date(goodsDT).getTime();			
	///////////////////////
	
		// Update the count down every 1 second
		var x = setInterval(function() {
		
		  // Get todays date and time
		  var now = new Date().getTime();
		 
		  // Find the distance between now an the count down date
		  var distance = countDownDate - now;
		
		  // Time calculations for days, hours, minutes and seconds
		  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
		  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
	
		  document.getElementById(goodscode).innerHTML = days + "日" + hours + "時"
		  + minutes + "分" + seconds + "秒";  
		  
		
		  if (distance < 0) {
		    clearInterval(x);
		    document.getElementById(goodscode).innerHTML = "期限満了(EXPIRED)"; // 유통기한이 다되면 시간자리에 기한만료가 뜸..
		  }
		  
		}, 1000);

  
  
  //////////////////////////////////////////////////////
  
  
  
  
}




function newfunction(imgtitle,imgcrn){
	

	swal({
		  title: "<"+imgtitle+">",
		  text: "<img src='shopimg?sellerCRN="+imgcrn+"' width='300' height='200'>",
		  confirmButtonColor: "#FFBB00",
		  html: true
		});
	
	
}




function newfunction2(imgCode){

	swal({
		  title: "<詳細写真>",
		  text: "<img src='goodsimg?goodsCode="+imgCode+"' width='300' height='200'>",
		  confirmButtonColor: "#FFBB00",
		  html: true
		});
	
	
}

   
   $(function(){
   	
	  var CRN;
      var adrr = "삼성동";
  
      a(adrr,flag,sellertob);
      var marker;
    
      
      
      
      
      /* $("#890").on("click",function(){
      
    	  var countDownDate = new Date("2017-04-28 00:00:00").getTime();				// 파란글자에 DB에서 불러온 유통기한 넣어주면 됨..
    	 
    	  // Update the count down every 1 second
    	  var x = setInterval(function() {

    	    // Get todays date and time
    	    var now = new Date().getTime();
    	    

    	    // Find the distance between now an the count down date
    	    var distance = countDownDate - now;

    	    // Time calculations for days, hours, minutes and seconds
    	    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    	    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    	    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    	    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    	    
    	    var all = days + " 일 " + hours + "시간 "+ minutes + "분 " + seconds + "초 ";
    	  
    	    // Display the result in the element with id="demo"
    	    document.getElementById("demo").innerHTML = days + " 일 " + hours + "시간 "
    	    + minutes + "분 " + seconds + "초 ";

    	    // If the count down is finished, write some text 
    	    if (distance < 0) {
    	      clearInterval(x);
    	      document.getElementById("demo").innerHTML = "기한만료(EXPIRED)"; // 유통기한이 다되면 시간자리에 기한만료가 뜸..
    	    }
    	  }, 1000);
      
      
      
      }); */
      
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
      
      
      $(".region").on("click",function(){
         adrr = $(this).text();
         a(adrr,flag,sellertob);
      
      });
      
//20170503 박진우
      $(".regionPJW").on("click",function(){
         adrr = '서울특별시'
         a(adrr,flag,sellertob);
      
      });      
   
      $("#btn1").on("click",function(){
         adrr = $("#adr").val(); //클래스를 찾자
         a(adrr,flag,sellertob);

      });
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
                        tob: item.sellerTOB,
                        phone: item.sellerPhone,
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
           	      var glist= []; 
                  
                 
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
                              imageSrc = "./resources/image/markerStar.png";
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
                                title : position.CRN, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                image : markerImage,// 마커 이미지 
                                clickable: true
                                
                            });
                            //
                            
                             markers.push(marker);
                       
                            
                             //레이아웃 css 설정
                            
                           var content = '<div class="wrap">' + 
                            '    <div class="info">' + 
                            '      <div class="title">' + 
                            position.title + '<img src="./resources/image/pictures.png" width="20px" height="22px" class="getshopimg" imgtitle="'+position.title+'" imgcrn="'+position.CRN+'">'+
                            '      <div class="close" title="닫기"></div>' + 
                            '      </div>' + 
                            '      <div class="body">' + 
                            '      <div class="img"><div class="shopinfo" style="width:390px;height:132px;text-overflow: ellipsis;line-height:190%">業種:'+position.tob+'<br>住所:'+position.shopaddress+'<br>電話番号:'+position.phone+'<br><div class="star" style="width:20px;">評点</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                            +'<span class="addshop" style="font-weight:bolder;font-color:black;">[ブックマーク設定/</span><span class="delshop">解除]</span></div></div>' + 
                            '      <div class="desc">';
                            
                            content += '</div>' + 
                            '           </div>' + 
                            '        <div class="comments"></div><div align="center" style="width:289px;position: relative;top: 5px;left:3px" class="starcomment"><select class="starcheck" align="center" style="height:24px;border: 0px;color:#EDA900"><option value="1">★</option><option value="2">★★</option>'+
                            '<option value="3">★★★</option><option value="4">★★★★</option><option value="5">★★★★★</option></select>&nbsp;<input type="text" class="comment" placeholder="評点を選擇してからコメントを入力して下さい。 선택 후 コメント을 입력해주세요" style="width:267px;height:24px;border: 0px;font-size:13px">&nbsp;<input type="button" class="bnt" value="입력" style="border: 0px;height:24px;background:#EDA900;color:white;font-size:13px"></div></div>' + 
                            
                            '    </div>' +    
                            '</div> <div class="goodsimg"></div>';
                            
                   
                            var markerstitle;
                            var markersposition;
                         
                             for (var i = 0, len = markers.length; i < len; i++) {
                            	 markerstitle = markers[i].getTitle();
                      		    
                      		     if(position.CRN==markerstitle){
                      		    	markersposition = markers[i].getPosition();
                            	
                      		     }
                            } 
                            
                            
                       
                            overlay = new daum.maps.CustomOverlay({
                                clickable: true,
                                content: content,
                                map: map,
                                position: markersposition
                                
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
                                   return false;
                                   
                                }
                        
                                $(".getshopimg").on("click",function(){
                               	 
                                	var imgtitle = $(this).attr("imgtitle");
                                	var imgcrn = $(this).attr("imgcrn");
                                	
                                	
                                        newfunction(imgtitle,imgcrn);
                                  });
                                
                                /* $(".getgoodsimg").on("click",function(){
                                	
                                	alert("꺙");
                                  	 
                                	/* var imgcode = $(this).attr("goodsimgcode");
                                	
                                	
                                        newfunction2(imgcode); */
                                 // });
                                 
                                
							
                                
                                
                                
                                
               
                                $(".close").on("click",function(){
                                   overlay.setMap(null);
                                   marker.setClickable(true);
                                   selectedMarker = null;
                              
                                });
                                //////////////////////////////////////////
                                
                                 var glist = [];
                                
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
                                                GC: item.goodsCode,
                                                DT: item.expiredDate
                                                

                                            });
                                            
                                          });
                                         
                                         //레이아웃 css 설정
                                         
                                         var content0 = '<div class="goodsinfo" id="'+position.CRN+'" style="overflow-y:scroll;overflow-x:hidden">'+
                                         			'<table width="100%" style="text-align:center"><tr><th>商品名</th><th>値段</th><th>數量</th><th width="140px">賞味期限</th><th>写真</th></tr>';
                                         for (var i = 0, len = glist.length; i < len; i++) {
                                   		
                                         content0 += '<tr><th>'+glist[i].GN+'</th><th>'+glist[i].GP+"</th><th>"+glist[i].GQ
                                         +'</th><th><div name="demo" id="'+glist[i].GC+'" class="demos" attr="'+glist[i].GC+'"></div></th><th style="position:relative;left:10px"><img src="./resources/image/picture4.png" width="20px" height="20px" class="getgoodsimg" goodsimgcode="'+glist[i].GC+'">'+
                                         '</th></tr>';
                                        
                                         
                                        	 timetest(i, glist[i].GC,glist[i].DT);
                                         }
                                       
                                         content0 += '</table></div>';
                                         $(".desc").html(content0); 
                                         
                                         ///////////////////////////////////////////////////
                                         
                                         $("area").on("click",function(){
                                   
                                   var areas = $(this).attr("title");
                                
                                   
                                    for (var i = 0, len = markers.length; i < len; i++) {
                                        markerstitle2 = markers[i].getTitle();
                                    
                                        
                                         if(areas==markerstitle2){
                                           markersposition2 = markers[i].getPosition();
                                           console.log(markersposition2);
                                           var moveLatLon = new daum.maps.LatLng(markersposition2.hb,markersposition2.gb);  
                                           console.log(moveLatLon);
                                           map.panTo(moveLatLon);     
                                         }
                                    } 
                                    
                                   
                                   
                                });
                                         
                                         
                                         $(".getgoodsimg").on("click",function(){
                                	
                                
                                  	 
		                                	var imgcode = $(this).attr("goodsimgcode");
		                                	
		                                	
		                                        newfunction2(imgcode); 
		                                 });
		                                 
                                         
                                         
                                             	
                                     },error:function(e){
                                     	console.log(e);
                                     
                                     }
                                     
                                    });
                                 
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
                                         
                                        $(".star").html("評点:"+starsss);
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
                                          
                                          var htm = '<table><tr><th width="100px" >作成者</th><th width="280px">コメント</th></tr>';
                                       
                                          $.each(data,function(index,item){                                             
                                                htm += '<tr><td>'+item.buyerId+'</td><td>'+item.ment+'</td></tr>';
											
                                              }); 
                                          
                                             htm += '</table>';
                                              $(".comments").html(htm);
                                       },                             
                                       error:function(e){
                                          console.log(e);
                                       }
                                 });
                                
                                
                                
                             
                                
                                
                                var nostar;
                                var addcomment;
                                
                                var id0 = $('.goodsinfo').attr('id');
                                
                                
                  
                                //////////////////////////////////////////////
                                $(".bnt").on("click",function(){
                                 
                                   
                                   addcomment = $(".comment").val();
                                   if(addcomment==""){
                                      alert("내용을 입력해주세요");
                                      return false;
                                   }
         
                                   
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
                                         
                                          var htm = '<table><tr><th width="100px" >作成者</th><th width="280px">コメント</th></tr>';
                                       
                                          $.each(data.gradelist,function(index,item){                                             
                                                htm += '<tr><td>'+item.buyerId+'</td><td>'+item.ment+'</td></tr>';

                                              }); 
                                          
                                             htm += '</table>';
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
                                              
                                             $(".star").html("評点:"+starsss);
                                             alert("登録完了");
                                             $(".comment").val("");
                                             
                                       },                             
                                       error:function(e){
                                          
                                       }
                                 });
                                  
                                
                                ////////////// 여기 評点 새로 가져오는것도 해야함
                                
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
                                           
                                            
                                            swal({
                                     		   title: JSON.stringify(data),
                                     		   confirmButtonColor: "#FFBB00",
                                     		   showConfirmButton: true
                                     		 });
                                            
                                         },                             
                                      error:function(e){
                                         console.log(e);
                                      }
                                });
                    });
                                
                                
                                
                                
                                
                                $(".delshop").on("click",function(){
                                    ///
                               
                                     $.ajax({//type필수임
                                         type : "get",   //RequestMethod Type
                                         url: "delshop", //RequestMapping value
                 
                                         data:{
                                            sellerCRN:position.CRN
                                         },
                                         
                                       success:function(data){
                                           
                                    	   swal({
                                    		   title: JSON.stringify(data),
                                    		   confirmButtonColor: "#FFBB00",
                                    		   showConfirmButton: true
                                    		 });
                                    	   
                                    	   /* 
                                             swal(JSON.stringify(data)); */
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
   
  


<!--//////////////////////////////////////////////////////////////////////////////////////  -->








        
        	
        	//내가 만든 function
        	
			function client(evt){
//진우 주석				alert(evt);
//진우 주석				alert(evt.data);
				        		
				var gaek = JSON.parse(evt.data);
				console.log(gaek);
				
				var storeid = gaek.storeid;
				var goodsid = gaek.goodsid;
				
				var flag = gaek.flag;
				var times = gaek.fortimes;
				
				        		
//진우 주석		alert("가게 : " + storeid);//a
//진우 주석		alert("품목 : " + goodsid);
				
				
				
				
				
				
//----------------------------------------------------------------------                
//				alert("테스트 메소드1");
//				var message2 = "<img sytle='width:20px;' src='resources/img/message.png'> ";
				var message2 = "<h5>tttest<h5> ";
				//var inner = $(".messagestatus").html();
				
				var crn2 = $(".goodsinfo").attr("id");
				if(crn2==storeid) {
					$(".desc").html(goodsid);
					
					if(times!=null){
					
					for (var i = 0, len = times.length; i < len; i++) {
						
						timetest(i,times[i].goodscodes,times[i].goodsDTs);
	
					}
					}

				}
				
				
				var markerscolor;
				
				
                for (var i = 0, len = markers.length; i < len; i++) {
                	markerscolor = markers[i].getTitle();
         		    
         		     if(storeid==markerscolor){
         		    	 if(flag==0){
         		    	
    						var markerImage = new daum.maps.MarkerImage("./resources/image/mark.png",
    		                        new daum.maps.Size(30, 35), new daum.maps.Point(13, 34));
    		                        markers[i].setImage(markerImage);
         		    	 }else{
    							var markerImage = new daum.maps.MarkerImage("http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
    		                        new daum.maps.Size(24, 35), new daum.maps.Point(13, 34));
    		                        markers[i].setImage(markerImage);          		    		 
         		    	 }

         		     }
               } 
//----------------------------------------------------------------------	
                $(".getgoodsimg").on("click",function(){
                	
                    
                 	 
                	var imgcode = $(this).attr("goodsimgcode");
                	
                	
                        newfunction2(imgcode); 
                 });
				
				
				
				
				
			}
        	
			function seller(){
				//뭐시기뭐시기뭐시기 dosend;        		
				dosend();	
			}
           
			var wsUri = "ws://203.233.196.92:8889/web/echo.do";
           
			function init() {				//yc>이게 시작이 되는가? 왜 이게 시작이 되지?  ->> 아마 socket 핸들러에서 보낸거가  여기로 들어오는듯..
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
            	
            	var message = JSON.parse(evt.data);
//20170503 박진우            		alert("message떠야해: "+message);
            	var messagesellerCRN = message.sellerCRN;
            	//20170503 박진우            		alert("sellerCRN떠야해: "+messagesellerCRN);
            	var messagefrom = message.from;
            	var messagecontent = message.message;
            	//20170503 박진우            	 alert("message내용 : "+messagecontent);  
            	var tomessage = message.to;
            	//20170503 박진우            	 alert("buyerid배열"+message.to);  
            	
            	var buyerid = document.getElementById("buyerid").value;
            	//20170503 박진우           		 alert("hidden값 : "+buyerid);
//20170503 박진우            	alert("buyerid배열 길이: "+tomessage.length);
            		for(var i = 0 ; i < tomessage.length ; i++){
            			if (buyerid == tomessage[i].buyerId){
            			/* console.log(tomessage[i].buyerId); */
            			/* alert(tomessage[i].buyerId); */
            				if(messagefrom == "on"){//상품등록
	            				$.toast(messagecontent+"<div id=\"aclick\">click</div>",{
	            						duration: 3000,
	        			          		type: 'info'
	            				 });
            				}else{
            					//20170503 박진우            				 	alert("list");//수량변경
	            				 $.toast(messagecontent+"<div id=\"aclick\">click</div>",{
	            						 duration: 3000
	            			     });
            				}
            			}
            		}
		            $('#aclick').click(function() {
		        		$.ajax({
		        			type:"GET",
		        			url:"selectsellerBEA",
		        			data:{
		        				sellerCRN:messagesellerCRN
		        			},
		        			success: function(sellerBEA){
		        				//20170503 박진우		        						        				alert("잘왔엉"+sellerBEA);
		        				var adrr = sellerBEA;
		        				a(adrr,flag,sellertob);
		        			},
		        			error: function(e){
		        				//20170503 박진우		        						        				alert('머ㅜㄴ데');
		        			}
		        		});
		        	}); 
            }
            
            function onError(evt) {  // 전송 에러 발생
                writeToScreen('ERROR: ' + evt.data);
            } 
  /*           function doSend(str) {
				//var message = document.getElementById("textID").value;
            	//writeToScreen("Message Sent: " + message);
            	//writeToScreen("뭐보내는지 표시하려고 ");
            	
            	var pk = {storeid : "커피가게", goodsid : "2잔"};
            	
            	
            	var jsonstr = JSON.stringify(pk);
            	
            	
                websocket.send(jsonstr); // 스트링 배열만들어서 보내면 되겠네...
                
                
                
                //websocket.close();
            } */
            function writeToScreen(message) {						//메세지를 화면에 띄워줌...
                var pre = document.createElement("p");
                pre.style.wordWrap = "break-word";
                pre.innerHTML = message;
                
                output.appendChild(pre);
            }
            window.addEventListener("load", init, false);
        </script>


<!--//////////////////////////////////////////////////////////////////////////////////////   -->


<style>
	.toast #aclick {display: inline-block;float: right;}
	#aclick:HOVER {text-decoration: underline;pause: 60s;}
	
	
	/*  여기서부터 */
    .wrap {position: absolute;left: 0;bottom: 40px;width: 400px;height: 450px;margin-left: -200px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;border-color: black;border: 1px}

    .wrap .info {width: 400px;height: 450px;border-radius: 5px;border-bottom: 2px solid red;overflow: hidden;background: #EAEAEA;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 6px;height: 35px;background: #FFBB00;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;background:white;}
    .info .desc {position: relative;margin: 140px 0 0 6px;height: 112px;}
    .shopinfo {position: absolute;background:#FFBB00;overflow: hidden;color:white;left:7px;font-size: 14px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;border-bottom: thick;}
    .desc .goodsinfo {left: 2px;text-overflow: goodsinfo;width: 394px;height: 110px;color: #888;font-size: 14px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;}
    .info .img2 {position: absolute;width: 120px;height: 130px;overflow: hidden;}
    .info .img {position: absolute;width: 400px;height: 138px;color: #888;overflow: hidden;background:#FFBB00;}
   .prd_box {position:relative;} 
   .prd_over {position:absolute; width:100%; height:50px; top:95px; bottom:0; left:0; opacity:0; background:url('/shop/data/skin/apple_tree_C/img/djds/etc/prd_over.png') 0 0 no-repeat;}    

   .starcomment{top:10px;}
   .comments{overflow-y:scroll;margin:auto;height:120px;width:391px;position:relative;left:4px;font-size: 14px}
   .getshopimg{position: relative;bottom: 2px;left:3px}
</style>


<%--
<link rel="stylesheet" style type="text/css" href="./resources/css/font-awesome.css">
</style>
<link rel="stylesheet" style type="text/css" href="./resources/css/menu.css">
</style>
--%>
</head>
<body>


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








            
            <li>
                 <a class="collapsed" href="#sidebar-maps" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="glyphicon glyphicon-map-marker"></i>
                    </span>
                    지역 선택
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-maps" class="collapse">
                    <li><a class="region" data-no-pjax>서울특별시</a></li>
                    <li><a class="region">경기도</a></li>                           
                    <li><a class="region">인천광역시</a></li>
                    <li><a class="region">부산광역시</a></li>
                    <li><a class="region">울산광역시</a></li>                           
                    <li><a class="region">대구광역시</a></li>
                    <li><a class="region">대전광역시</a></li>
                    <li><a class="region">광주광역시</a></li>                    
                </ul>
            </li>







            <li>




                <a class="collapsed" href="#sidebar-extra" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="fa fa-leaf"></i>
                    </span>
                    업종 선택
                    <i class="toggle fa fa-angle-down"></i><%-- 1 --%>
                </a>
                <ul id="sidebar-extra" class="collapse">
                    <li><a class="tob">카페</a></li>
                    <li><a class="tob">베이커리</a></li>                           
                    <li><a class="tob">식당</a></li>
                </ul>

            </li>


<%--
            <li>
                <a href="/web/csboardlist">
                    <span class="icon">
                        <i class="glyphicon glyphicon-user"></i>
                    </span>
                    고객 상담--%>
<%--                    <sup class="text-warning fw-semi-bold">
                        new
                    </sup>--%>	<%-- new 표시 주석 처리 --%>
<%--                </a>
            </li>--%>

<%--
            <li>
                <a href="inbox.html">
                    <span class="icon">
                        <i class="fa fa-envelope"></i>
                    </span>
                    Email
                    <span class="label label-danger">
                        9
                    </span>
                </a>
            </li>
--%>

        </ul>




















<%--↓================================================================================================================================--%>        
<%--
        <!-- every .sidebar-nav may have a title -->
        <h5 class="sidebar-nav-title">템플릿 <a class="action-link" href="#"><i class="glyphicon glyphicon-refresh"></i></a></h5>
        <ul class="sidebar-nav">
--%>
<%--
            <li>
                <!-- an example of nested submenu. basic bootstrap collapse component -->
                <a class="collapsed" href="#sidebar-forms" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="glyphicon glyphicon-align-right"></i>
                    </span>
                    Forms
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-forms" class="collapse">
                    <li><a href="form_elements.html">Form Elements</a></li>
                    <li><a href="form_validation.html">Form Validation</a></li>
                    <li><a href="form_wizard.html">Form Wizard</a></li>
                </ul>
            </li>

            <li>
                <a class="collapsed" href="#sidebar-ui" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="glyphicon glyphicon-tree-conifer"></i>
                    </span>
                    UI Elements
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-ui" class="collapse">
                    <li><a href="ui_components.html">Components</a></li>
                    <li><a href="ui_notifications.html">Notifications</a></li>
                    <li><a href="ui_icons.html">Icons</a></li>
                    <li><a href="ui_buttons.html">Buttons</a></li>
                    <li><a href="ui_tabs_accordion.html">Tabs & Accordion</a></li>
                    <li><a href="ui_list_groups.html">List Groups</a></li>
                </ul>
            </li>

            <li>
                <a href="grid.html">
                    <span class="icon">
                        <i class="glyphicon glyphicon-th"></i>
                    </span>
                    그리이드
                </a>
            </li>
--%>

<%--             <li>
                <a class="collapsed" href="http://www.naver.com/#sidebar-maps" data-toggle="collapse" data-parent="#sidebar">

                    <span class="icon">
                        <i class="glyphicon glyphicon-map-marker"></i>
                    </span>
                    지도호우
 --%>
                    <%--<i class="toggle fa fa-angle-down"></i>--%>	<%--하향 화살표 삭제--%>
<%--                </a>--%>
                <%--<ul id="sidebar-maps" class="collapse">
                    <!-- data-no-pjax turns off pjax loading for this link. Use in case of complicated js loading on the
                         target page -->
                    <li><a href="maps_google.html" data-no-pjax>Google Maps</a></li>
                    <li><a href="maps_vector.html">Vector Maps</a></li>
                </ul>
            </li>

<%--
            <li>
                <a class="collapsed" href="#sidebar-extra" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="fa fa-leaf"></i>
                    </span>
                    Extra
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-extra" class="collapse">
                    <li><a href="calendar.html">Calendar</a></li>
                    <li><a href="invoice.html">Invoice</a></li>
                    <li><a href="login.html" target="_blank" data-no-pjax>Login Page</a></li>
                    <li><a href="error.html" target="_blank" data-no-pjax>Error Page</a></li>
                    <li><a href="gallery.html">Gallery</a></li>
                    <li><a href="search.html">Search Results</a></li>
                    <li><a href="time_line.html" data-no-pjax>Time Line</a></li>
                </ul>
            </li>
--%>
<!--             <li>
                <a class="collapsed" href="#sidebar-levels" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="fa fa-folder-open"></i>
                    </span>
                    Menu Levels
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-levels" class="collapse">
                    <li><a href="#">Level 1</a></li>
                    <li>
                        <a class="collapsed" href="#sidebar-sub-levels" data-toggle="collapse" data-parent="#sidebar-levels">
                            Level 2
                            <i class="toggle fa fa-angle-down"></i>
                        </a>
                        <ul id="sidebar-sub-levels" class="collapse">
                            <li><a href="#">Level 3</a></li>
                            <li><a href="#">Level 3</a></li>
                        </ul>
                    </li>
                </ul>
            </li> -->
        </ul>
<%--↑================================================================================================================================--%>




















<%--
        <h5 class="sidebar-nav-title">Labels <a class="action-link" href="#"><i class="glyphicon glyphicon-plus"></i></a></h5>
        <!-- some styled links in sidebar. ready to use as links to email folders, projects, groups, etc -->
        <ul class="sidebar-labels">
            <li>
                <a href="#">
                    <!-- yep, .circle again -->
                    <i class="fa fa-circle text-warning mr-xs"></i>
                    <span class="label-name">My Recent</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-circle text-gray mr-xs"></i>
                    <span class="label-name">Starred</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-circle text-danger mr-xs"></i>
                    <span class="label-name">Background</span>
                </a>
            </li>
        </ul>
        <h5 class="sidebar-nav-title">Projects</h5>
        <!-- A place for sidebar notifications & alerts -->
        <div class="sidebar-alerts">
            <div class="alert fade in">
                <a href="#" class="close" data-dismiss="alert" aria-hidden="true">&times;</a>
                <span class="text-white fw-semi-bold">Sales Report</span> <br>
                <div class="progress progress-xs mt-xs mb-0">
                    <div class="progress-bar progress-bar-gray-light" style="width: 16%"></div>
                </div>
                <small>Calculating x-axis bias... 65%</small>
            </div>
            <div class="alert fade in">
                <a href="#" class="close" data-dismiss="alert" aria-hidden="true">&times;</a>
                <span class="text-white fw-semi-bold">Personal Responsibility</span> <br>
                <div class="progress progress-xs mt-xs mb-0">
                    <div class="progress-bar progress-bar-danger" style="width: 23%"></div>
                </div>
                <small>Provide required notes</small>
            </div>
        </div>
--%>
    </div>
</nav>




















<!-- This is the white navigation bar seen on the top. A bit enhanced BS navbar. See .page-controls in _base.scss. -->
<nav class="page-controls navbar navbar-default">
    <div class="container-fluid">
        <!-- .navbar-header contains links seen on xs & sm screens -->

        <div class="navbar-header">
<%--
            <ul class="nav navbar-nav">
                <li>
                    <!-- whether to automatically collapse sidebar on mouseleave. If activated acts more like usual admin templates -->
                    <a class="hidden-sm hidden-xs" id="nav-state-toggle" href="#" title="Turn on/off sidebar collapsing" data-placement="bottom">
                        <i class="fa fa-bars fa-lg"></i>
                    </a>
                    <!-- shown on xs & sm screen. collapses and expands navigation -->
                    <a class="visible-sm visible-xs" id="nav-collapse-toggle" href="#" title="Show/hide sidebar" data-placement="bottom">
                        <span class="rounded rounded-lg bg-gray text-white visible-xs"><i class="fa fa-bars fa-lg"></i></span>
                        <i class="fa fa-bars fa-lg hidden-xs"></i>
                    </a>
                </li>
                <li class="ml-sm mr-n-xs hidden-xs"><a href="#"><i class="fa fa-refresh fa-lg"></i></a></li>
                <li class="ml-n-xs hidden-xs"><a href="#"><i class="fa fa-times fa-lg"></i></a></li>
            </ul>
--%>

<%--
            <ul class="nav navbar-nav navbar-right visible-xs">
                <li>
                    <!-- toggles chat -->
                    <a href="#" data-toggle="chat-sidebar">
                        <span class="rounded rounded-lg bg-gray text-white"><i class="fa fa-globe fa-lg"></i></span>
                    </a>
                </li>
            </ul>
--%>            
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



                        <li><a href="buyerupdateFormPJW"><i class="glyphicon glyphicon-user"></i> &nbsp; 회원정보</a></li>
                        <li><a href="map1"><i class="glyphicon glyphicon-map-marker"></i> &nbsp; 지도</a></li>
                        <li><a href="csboardlist2"><i class="fa fa-desktop"></i> &nbsp; 고객상담</a></li>

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
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-md-* > .widget.  -->
    <main id="content" class="content" role="main">






<div id="map" style="width:100%;height:830px;" ></div>
<input type="hidden" id = "buyerid" value="${custid }">

<div id="sellergoods" style="width:100%;height:300px;"></div>
            
            

            
            
            


<%--
<div id="wrap">
    <header>
        <div class="inner relative"><div style="top:10px; height:30px; background-color: black"><a class="tob">카페</a><br><a class="tob">베이커리</a><br><a class="tob">식당</a>
           <nav id="navigation">
                <ul id="main-menu">
                    <li class="parent">
            
                        <a href="home">지역선택</a>   
                  <지역검색>
<input type="text" id="adr" width="30px">
<input type="button" id="btn1" value="직접검색">

                     
                  
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
<div id="map" style="width:100%;height:700px;" ></div>
<input type="hidden" id = "buyerid" value="${custid }">

<div id="sellergoods" style="width:100%;height:300px;"></div>
--%>













	</main>
</div>
<!-- The Loader. Is shown when pjax happens -->
<div class="loader-wrap hiding hide">
    <i class="fa fa-circle-o-notch fa-spin-fast"></i>
</div>
<!-- common libraries. required for every page -->
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
<script src="./resources/bootstrap/vendor/datatables/media/js/jquery.dataTables.js"></script>
<script src="./resources/bootstrap/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>


<!-- page specific js -->
<script src="./resources/bootstrap/js/tables-dynamic.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>






<link rel="stylesheet" href="./resources/css/jquery.toast.min.css" />
<link rel="stylesheet" type="text/css" href="./resources/dist/sweetalert.css">
<script type="text/javascript" src="./resources/js/jquery.toast.js"></script>
<script type="text/javascript" src="./resources/js/jquery.toast.min.js"></script>
<script src="./resources/dist/sweetalert.min.js"></script>



</body>
</html>