<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

</style>
<script type="text/javascript" src="./resources/js/jquery-3.1.1.js"> </script>
<link rel="stylesheet" href="./resources/css/jquery.toast.min.css" />
<script type="text/javascript" src="./resources/js/jquery.toast.js"></script>
<script type="text/javascript" src="./resources/js/jquery.toast.min.js"></script>     

<script type="text/javascript" src="./resources/js/function.js"> </script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=98b5ff77fd0570ce46f2ef84207626b0&libraries=services"></script>


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
	
		  document.getElementById(goodscode).innerHTML = days + " �� " + hours + "�ð� "
		  + minutes + "�� " + seconds + "�� ";  
		  
		
		  if (distance < 0) {
		    clearInterval(x);
		    document.getElementById(goodscode).innerHTML = "���Ѹ���(EXPIRED)"; // ��������� �ٵǸ� �ð��ڸ��� ���Ѹ��ᰡ ��..
		  }
		  
		}, 1000);

  
  
  //////////////////////////////////////////////////////
  
  
  
  
}


   
   
   $(function(){
	   
	  
   	
	  var CRN;
      var adrr = "�Ｚ��";
      console.log(adrr);
      a(adrr,flag,sellertob);
      
      
      
/*       navigator.geolocation.getCurrentPosition( function(pos) {
            var latitude = pos.coords.latitude;
            var longitude = pos.coords.longitude;
            
            adrr = "��õ��"; //������ �˻��� �Ǿ�� �޾ƿ��°Ŷ� ��õ�ö�� ���Ƿ� �����ص� 
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
         adrr = $("#adr").val(); //Ŭ������ ã��
         a(adrr,flag,sellertob);

      });
   });
      function a(adrr,flag,sellertob){
      var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
          mapOption = {
              center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
              level: 3 // ������ Ȯ�� ����
          };  

      // ������ �����մϴ�    
      var map = new daum.maps.Map(mapContainer, mapOption); 

      // �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
      var geocoder = new daum.maps.services.Geocoder();

      // �ּҷ� ��ǥ�� �˻��մϴ�
      geocoder.addr2coord(adrr, function(status, result) {

          // ���������� �˻��� �Ϸ������ 
           if (status === daum.maps.services.Status.OK) {
              var coords;
                 coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

              // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
              map.setCenter(coords);
              
              $.ajax({//type�ʼ���
                  type : "get",   //RequestMethod Type
                  url: "Shoplist", //RequestMapping value
                  data: {
                     sellerTOB:sellertob
                  },
                  success : function(data){
                     mdata(data);
                     
               },
                  error : function(e){
                     //ajax��� ���н�   
                     console.log(e);
                  }
               });
              
              
              function mdata(data){
                 
                   var positions = [],
                   selectedMarker = null; // Ŭ���� ��Ŀ�� ���� ����
                  
                  $.each(data,function(index,item){
                     
                     positions.push({
                        title: item.sellerShopName,
                        CRN: item.sellerCRN,
                        goods: item.sellerCRN, // �̺κм���
                        latlng: new daum.maps.LatLng(item.sellerLat,item.sellerLong),
                        sellername: item.sellerName,
                        tob: item.sellerTOB,
                        phone: item.sellerPhone,
                        shopaddress: item.sellerBEA
                        
                     // ���⿡ �߰��� �������� ������ �Է��ϸ� �˴ϴ� ~~~
                     ///////////////////////////////////////////////////////////////////////////
                     });
   
                  
                  });
                   
                  for (var i = 0, len = positions.length; i < len; i++) {
                       
                       // ��Ŀ�� �����ϰ� �������� ǥ���մϴ�
                       addMarker(positions[i]);
                   }

                  function addMarker(position) {
                  var overlay;
           	      var glist= []; 
                  
                 
                    $.ajax({//type�ʼ���
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
                    $.ajax({//type�ʼ���
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
                            // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
                            
                            
                            
                            
                            // ��Ŀ �̹����� �����մϴ�    
                            var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
                            
                            // ��Ŀ�� �����մϴ�
                            marker = new daum.maps.Marker({
                                map: map, // ��Ŀ�� ǥ���� ����
                                position: position.latlng, // ��Ŀ�� ǥ���� ��ġ
                                title : position.CRN, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
                                image : markerImage,// ��Ŀ �̹��� 
                                clickable: true
                                
                            });
                            //
                            
                             markers.push(marker);
                       
                           var content = '<div class="wrap">' + 
                            '    <div class="info">' + 
                            '      <div class="title">' + 
                            position.title + 
                            '      <div class="close" title="�ݱ�"></div>' + 
                            '      </div>' + 
                            '      <div class="body">' + 
                            '      <div class="img"><div class="img2">' +
                            '      <img src="shopimg?sellerCRN='+position.CRN+'" width="120" height="130"></img>' +
                            '      </div> <div class="shopinfo">����:'+position.tob+'<br>�ּ�:'+position.shopaddress+'<br>��ȭ��ȣ:'+position.phone+'<br><div class="star" style="width=20px;">����</div><span class="addshop" style="font-weight:bolder;font-color:black"><���ɸ����߰�></span></div></div>' + 
                            '      <div class="desc">' + 

                            '<div class="goodsinfo" id="'+position.CRN+'">'+
                            '<table><tr><th>ǰ��</th><th>����</th><th>����</th><th>�̹���</th><th>�������</th></tr>';
                            
                            for (var i = 0, len = glist.length; i < len; i++) {
                              //  total+= glist[i].GN;
                            // ��Ŀ�� �����ϰ� �������� ǥ���մϴ�
                            content += '<tr><th>'+glist[i].GN+'</th><th>'+glist[i].GP+"</th><th>"+glist[i].GQ
                            +'</th><th><div class="thth"><img src="./resources/image/picture.png" width="20px" height="20px" class="abcd" imgData="goodsimg?sellerCRN='+position.CRN+'&goodsCode='+glist[i].GC+'">'+
                            '<span class="immm"><img src="goodsimg?sellerCRN='+position.CRN+'&goodsCode='+glist[i].GC+'" width="90px" height="70px" > </span></div></th></tr>';
                            }
                            
                            content += '</table></div></div>' + 
                            '           </div>' + 
                            '        <div class="comments" style="overflow-y:scroll;margin:auto; border: 1px solid #ddd;"></div><div align="center" style="background-color:white; width:440px;vertical-align:top;" class="starsac"><select class="starcheck" align="center" style="width:105px;height:24px"><option value="1">��</option><option value="2">�ڡ�</option>'+
                            '<option value="3">�ڡڡ�</option><option value="4">�ڡڡڡ�</option><option value="5">�ڡڡڡڡ�</option></select><input type="text" class="comment" style="width:250px;height:18px;"><input type="button" class="bnt" value="����Է�" style="width:80px;height:24px;background-color:yellow;border:0px"></div></div>' + 
                            
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
                            console.log(markers);
                            
                            /* for (var i = 0, len = markers.length; i < len; i++) {
                           	 
                            var abc = markers[i]; */

                            daum.maps.event.addListener(marker, 'click', function() {
                            	
                            	
                            	 $("area").on("click",function(){
                          		   
                            		var areatitle = $(this).attr("title");
                          		  
                            		
                                    for (var i = 0, len = markers.length; i < len; i++) {
                                   	 markerstitle2 = markers[i].getTitle();
                             		    
                             		     if(areatitle==markerstitle2){
                             		    	 
                             		    	markersposition2 = markers[i].getPosition();
                             		    	map.setCenter(markersposition2);
                                   	
                             		     }
                                   } 
                                   
                            		
                            		
                          	   });
                            	
                            	
                            	/* var aaa = selectedMarker.getPosition(); */
                            	
                            	/* var moveposition = abc.getPosition();
                            	alert(moveposition);
                            	map.setCenter(moveposition); 
 */
                                // Ŭ���� ��Ŀ�� ����, click ��Ŀ�� Ŭ���� ��Ŀ�� �ƴϸ�
                                // ��Ŀ�� �̹����� Ŭ�� �̹����� �����մϴ�
                                if (selectedMarker == null) {
                                    // Ŭ���� ��Ŀ ��ü�� null�� �ƴϸ�
                                    // Ŭ���� ��Ŀ�� �̹����� �⺻ �̹����� �����ϰ�
                                   overlay.setMap(map);
                                   marker.setClickable(false);
                                   selectedMarker=marker;
                                   console.log(selectedMarker);
                                }else{
                                   
                                   return false;
                                   
                                }
                        
               
                                $(".close").on("click",function(){
                                   overlay.setMap(null);
                                   marker.setClickable(true);
                                   
                                   selectedMarker = null;
                              
                                });
                                //////////////////////////////////////////
                                
                                 var glist = [];
                                
                                 $.ajax({//type�ʼ���
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
                                         var content0 = '<div class="goodsinfo" id="'+position.CRN+'" style="overflow-y:scroll">'+
                                         			'<table><tr><th>ǰ��</th><th>����</th><th>����</th><th>�������</th><th>�̹���</th></tr>';
                                         for (var i = 0, len = glist.length; i < len; i++) {
                                   		
                                         content0 += '<tr><th>'+glist[i].GN+'</th><th>'+glist[i].GP+"</th><th>"+glist[i].GQ
                                         +'</th><th><p name="demo" id="'+glist[i].GC+'" class="demos" attr="'+glist[i].GC+'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></th><th><div class="thth"><img src="./resources/image/picture.png" width="20px" height="20px" class="abcd" imgData="goodsimg?sellerCRN='+position.CRN+'&goodsCode='+glist[i].GC+'">'+
                                         '<span class="immm"><img src="goodsimg?sellerCRN='+position.CRN+'&goodsCode='+glist[i].GC+'" width="90px" height="70px" > </span></div></th></tr>';
                                        
                                         
                                        	 timetest(i, glist[i].GC,glist[i].DT);
                                         }
                                       
                                         content0 += '</table></div>';
                                         $(".desc").html(content0); 
                                         
                                         ///////////////////////////////////////////////////
                                         
                                             	
                                     },error:function(e){
                                     	console.log(e);
                                     
                                     }
                                     
                                    });
                                 
                                $.ajax({//type�ʼ���
                                         type : "get",   //RequestMethod Type
                                         url: "starsac", //RequestMapping value
                                         data:{
                                            sellerCRN:position.CRN
                                                                                    
                                         },
                                         
                                       success:function(data){
                                    
                                       
                                          var starsss;
                                         if(data<=1){
                                            starsss = "�ڡ١١١�";
                                         }else if(data<=2){
                                            starsss = "�ڡڡ١١�"
                                         }else if(data<=3){
                                            starsss = "�ڡڡڡ١�"
                                         }else if(data<=4){
                                            starsss = "�ڡڡڡڡ�"
                                         }else if(data<=5){
                                            starsss = "�ڡڡڡڡ�"
                                         }
                                         
                                        $(".star").html("����:"+starsss);
                                       },                             
                                       error:function(e){
                                          console.log(e);
                                       }
                                 });
                                
                                $.ajax({//type�ʼ���
                                         type : "get",   //RequestMethod Type
                                         url: "gradelist", //RequestMapping value
                                         data:{
                                            sellerCRN:position.CRN
                                                                                    
                                         },
                                         
                                       success:function(data){
                                          
                                          var htm = "<span style='font-weight:bold;text-align:center'><��ۺ���></span>";
                                             htm += '<table><tr><th>�ۼ���</th><th>���</th></tr>';
                                       
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
                                      alert("������ �Է����ּ���");
                                      return false;
                                   }
         
                                   
                                   //////////////////////////////////////
                                   var starss = $(".starcheck").val();
                                   
                             
                                     $.ajax({//type�ʼ���
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
                                          var htm = "<��ۺ���>";
                                             htm += '<table><tr><th>�ۼ���</th><th>���</th></tr>';
                                       
                                          $.each(data.gradelist,function(index,item){                                             
                                                htm += '<tr><td>'+item.buyerId+'</td><td>'+item.ment+'</td></tr>';

                                              }); 
                                          
                                             htm += '</table>';
                                              $(".comments").html(htm);
                                              
                                              var starsss;
                                              if(data.star<=1){
                                                 starsss = "�ڡ١١١�";
                                              }else if(data.star<=2){
                                                 starsss = "�ڡڡ١١�"
                                              }else if(data.star<=3){
                                                 starsss = "�ڡڡڡ١�"
                                              }else if(data.star<=4){
                                                 starsss = "�ڡڡڡڡ�"
                                              }else if(data.star<=5){
                                                 starsss = "�ڡڡڡڡ�"
                                              }
                                              
                                             $(".star").html("����:"+starsss);
                                             alert("��ϿϷ�");
                                             $(".comment").val("");
                                             
                                       },                             
                                       error:function(e){
                                          
                                       }
                                 });
                                  
                                
                                ////////////// ���� ���� ���� �������°͵� �ؾ���
                                
                                }); 
                                
                                $(".addshop").on("click",function(){
                                   ///
                              
                                    $.ajax({//type�ʼ���
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
                        //}
                            /////////////////////////////////
                        },
                        error : function(e){
                           //ajax��� ���н�   
                           console.log(e);
                        }
                     });
                            
                            
    //ajax //////////////////////////////////////////////////////////////////////////////////////
    },
                        error : function(e){
                           //ajax��� ���н�   
                           console.log(e);
                        }
                     });

                     }          
                  }         
          }else{
             alert("�ٽð˻����ּ���");

          } 
      });    
      }
   /////////////////////////////////////////////////////////////////////////////////
   
  


<!--//////////////////////////////////////////////////////////////////////////////////////  -->








        
        	
        	//���� ���� function
        	
			function client(evt){
//���� �ּ�				alert(evt);
//���� �ּ�				alert(evt.data);
				        		
				var gaek = JSON.parse(evt.data);
				console.log(gaek);
				
				var storeid = gaek.storeid;
				var goodsid = gaek.goodsid;
				
				var flag = gaek.flag;
				var times = gaek.fortimes;
				
				        		
//���� �ּ�		alert("���� : " + storeid);
//���� �ּ�		alert("ǰ�� : " + goodsid);
				
				
				
				
				
				
//----------------------------------------------------------------------                
//				alert("�׽�Ʈ �޼ҵ�1");
//				var message2 = "<img sytle='width:20px;' src='resources/img/message.png'> ";
				var message2 = "<h5>tttest<h5> ";
				//var inner = $(".messagestatus").html();
				
				var crn2 = $(".goodsinfo").attr("id");
				if(crn2==storeid) {
					$(".desc").html(goodsid);
					
					for (var i = 0, len = times.length; i < len; i++) {
						
						timetest(i,times[i].goodscodes,times[i].goodsDTs);
	
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
				
				
				
				
				
				
			}
        	
			function seller(){
				//���ñ⹹�ñ⹹�ñ� dosend;        		
				dosend();	
			}
           
			var wsUri = "ws://10.10.12.177:8889/web/echo.do";
           
			function init() {				//yc>�̰� ������ �Ǵ°�? �� �̰� ������ ����?  ->> �Ƹ� socket �ڵ鷯���� �����Ű�  ����� �����µ�..
				output = document.getElementById("output");
				websocket = new WebSocket(wsUri);									//yc>���μ����ּ��ΰ�..
				websocket.onopen = function(evt) {										
					onOpen(evt) 					//���⿡�� ���������°���..
				};
			}
           function send_message() {						//q>�߰��� evt�� �������..�� send_message(�������µ�);
				websocket.onmessage = function(evt) {
					onMessage(evt)						//��������鹹���´��� �ȶ��  pf>���� �޼����� ���� �����°Ŵ�..
				};
				websocket.onerror = function(evt) {
					onError(evt)
				};
			}
           
           
            function onOpen(evt) { //WebSocket ����						
                //writeToScreen("Connected to Endpoint!");    //���⿡ ������ evt���� ����������...
                send_message();
            }
            
            function onMessage(evt) { //�޽��� ����
               // writeToScreen("Message Received: " + evt.data);
                          	
            	client(evt);
            	
            	var message = JSON.parse(evt.data);
            	alert("message������: "+message);
            	var messagesellerCRN = message.sellerCRN;
            	alert("sellerCRN������: "+messagesellerCRN);
            	var messagefrom = message.from;
            	var messagecontent = message.message;
            	/* alert("message���� : "+messagecontent); */ 
            	var tomessage = message.to;
            	/* alert("buyerid�迭"+message.to);  */
            	
            	var buyerid = document.getElementById("buyerid").value;
           		/* alert("hidden�� : "+buyerid);
            	alert("buyerid�迭 ����: "+tomessage.length); */
            		for(var i = 0 ; i < tomessage.length ; i++){
            			if (buyerid == tomessage[i].buyerId){
            			/* console.log(tomessage[i].buyerId); */
            			/* alert(tomessage[i].buyerId); */
            				if(messagefrom == "on"){//��ǰ���
	            				$.toast(messagecontent+"<div id=\"aclick\">click</div>",{
	            						duration: 3000,
	        			          		type: 'info'
	            				 });
            				}else{
            				 	alert("list");//��������
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
		        				alert("�߿Ծ�"+sellerBEA);
		        				var adrr = sellerBEA;
		        				a(adrr,flag,sellertob);
		        			},
		        			error: function(e){
		        				alert('�Ӥ̤���');
		        			}
		        		});
		        	}); 
            }
            
            function onError(evt) {  // ���� ���� �߻�
                writeToScreen('ERROR: ' + evt.data);
            } 
  /*           function doSend(str) {
				//var message = document.getElementById("textID").value;
            	//writeToScreen("Message Sent: " + message);
            	//writeToScreen("���������� ǥ���Ϸ��� ");
            	
            	var pk = {storeid : "Ŀ�ǰ���", goodsid : "2��"};
            	
            	
            	var jsonstr = JSON.stringify(pk);
            	
            	
                websocket.send(jsonstr); // ��Ʈ�� �迭���� ������ �ǰڳ�...
                
                
                
                //websocket.close();
            } */
            function writeToScreen(message) {						//�޼����� ȭ�鿡 �����...
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
    .wrap {position: absolute;left: 0;bottom: 40px;width: 450px;height: 450px;margin-left: -150px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '����', sans-serif;line-height: 1.5;}
    .wrap .info {width: 450px;height: 450px;border-radius: 5px;border-bottom: 2px solid red;border-right: 1px solid red;overflow: hidden;background: white;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #FAED7D;border-bottom: 1px solid #ddd;font-size: 20px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;background:white;}
    .info .desc {position: relative;margin: 140px 0 0 6px;height: 135px;}
    .shopinfo {position: absolute;left: 120px;background:white;overflow: hidden;font-size: 16px;width:320px;height:132px;text-overflow: ellipsis;line-height:150%}
    .desc .goodsinfo {top: 6px;left: 5px;text-overflow: goodsinfo;width: 440px;height: 130px;border: 1px solid #ddd;color: #888;font-size: 15px;overflow-y:scroll}
    .info .img2 {position: absolute;width: 120px;height: 130px;overflow: hidden;}
    .info .img {position: absolute;top: 6px;left: 6px;width: 440px;height: 130px;border: 1px solid #ddd;color: #888;overflow: hidden;background:yellow;}
   .prd_box {position:relative;} 
   .prd_over {position:absolute; width:100%; height:50px; top:95px; bottom:0; left:0; opacity:0; background:url('/shop/data/skin/apple_tree_C/img/djds/etc/prd_over.png') 0 0 no-repeat;}    
   .thth {position:relative; display:inline-block}
   .thth span {visibility:hidden; position:absolute; margin-top:0; margin-left:-20px;}
   .thth:hover span {visibility:visible}
   .comments{width:440px; height:100px;}


</style>



<link rel="stylesheet" style type="text/css" href="./resources/css/font-awesome.css">
</style>
<link rel="stylesheet" style type="text/css" href="./resources/css/menu.css">
</style>
</head>
<body>


<div id="wrap">
    <header>
        <div class="inner relative"><div style="top:10px; height:30px; background-color: black"><a class="tob">ī��</a><br><a class="tob">����Ŀ��</a><br><a class="tob">�Ĵ�</a>
           <nav id="navigation">
                <ul id="main-menu">
                    <li class="parent">
            
                        <a href="home">��������</a>   
                  <�����˻�>
<input type="text" id="adr">
<input type="button" name="" id="btn1" value="�����˻�">

                     
                  
                        <ul class="sub-menu">

                            <li>����Ư����</li>
                            <li>��⵵</li>                           
                            <li>��õ������</li>
                            <li>�λ걤����</li>
                            <li>��걤����</li>                           
                            <li>�뱸������</li>
                            <li>����������</li>
                            <li>���ֱ�����</li>                            
                     <li>
                                <div class="parent"> ���ֵ�</div>
                                <div >
                                <ul class="sub-menu">
                                    <li>������</li>
                                    <li>���ֽ�</li>
                                   </ul>
                            </li>
                        </ul>
                    </li>
            </nav>

    </header>
    </div>
</div>
<div id="map" style="width:100%;height:700px;"></div>
<input type="hidden" id = "buyerid" value="${custid }">

<div id="sellergoods" style="width:100%;height:300px;"></div>
<input type="button" value="��" id="sibal">
</body>
</html>