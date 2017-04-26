<%-- 상품수정 : 권록헌 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="./resources/js/jquery-3.1.1.js"/>"></script>












<%--20170422 박진우 박시원 웹소켓 테스트============================================= --%>
 <script type="text/javascript">
	/* 		
 			var CRN = $(".sellerCRN").val();
 			console.log(CRN); */
 			
 			
 			//내가 만든 function
      
        	function client(evt){
        		/* alert(evt);
        		alert(evt.data);
        		
        		var gaek = JSON.parse(evt.data);

        		var storeid = gaek.storeid;
        		var goodsid = gaek.goodsid;
        		
        		alert(storeid);
        		alert(goodsid); */
        	}
        	
        	
      /*   	function seller(){
        		//뭐시기뭐시기뭐시기 dosend;        		
        		doSend();
        	}
            */
            var wsUri = "ws://203.233.196.93:8888/web/echo.do";
           
            function init() {
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
            }
			function onError(evt) {  // 전송 에러 발생
				writeToScreen('ERROR: ' + evt.data);
			} 
			function doSend(str) {
				
				
				alert(str.value);
				//여기서 DB에 넣는 작업을 먼저 할까...
				
				
				
				
				
				
				
				
				
				alert('두센드 작동!');
				alert('str : ' + str);
				//var message = document.getElementById("textID").value;
				//writeToScreen("Message Sent: " + message);
				//writeToScreen("뭐보내는지 표시하려고 ");
				
				
				
				
				
				var CRN = document.getElementById("sellerCRN").value;
				/*//////////////////////////////////////////////////////////////  */
				
				var glist= []; 
                  var content2="";

                    $.ajax({//type필수임
                        type : "get",   //RequestMethod Type
                        url: "Goodslist", //RequestMapping value
                        data:{
                           sellerCRN:CRN
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

                       
                           var content = '<div class="goodsinfo" id="'+CRN+'" style="overflow-y:scroll">'+
                            '<table><tr><th>상품명</th><th>상품가격</th><th>상품개수</th><th>이미지보기</th></tr>';
                            
                            for (var i = 0, len = glist.length; i < len; i++) {
                              //  total+= glist[i].GN;
                            // 마커를 생성하고 지도위에 표시합니다
                            content += '<tr><th>'+glist[i].GN+'</th><th>'+glist[i].GP+"</th><th>"+glist[i].GQ
                            +'</th><th><div class="thth"><img src="./resources/image/picture.png" width="20px" height="20px" class="abcd" imgData="goodsimg?sellerCRN='+CRN+'&goodsCode='+glist[i].GC+'">'+
                            '<span class="immm"><img src="goodsimg?sellerCRN='+CRN+'&goodsCode='+glist[i].GC+'" width="90px" height="70px" > </span></div></th></tr>';
                            
                            alert(content + " / " + glist[i].GN + " " + glist[i].GP + " " + glist[i].GQ + " " + glist[i].GC + " " + glist[i].GC);
                            
                            }
                            
                            content += '</table></div>';
                            
                            
                        	
            				var pk = {storeid : CRN, goodsid : content};
            				var jsonstr = JSON.stringify(pk);
                            websocket.send(jsonstr); // 스트링 배열만들어서 보내면 되겠네...
                            //websocket.close();
                            
  
                            
    //ajax //////////////////////////////////////////////////////////////////////////////////////
    },
                        error : function(e){
                           //ajax통신 실패시
                           console.log(e);
                        }
                     });
				
				
				/*///////////////////////////////////////////////////////////////////  */

            }

			function dosendcontent(content){
				alert("dosendcontent(고객아이디들) : " + content.buyer_id);
				var message={};
				message.message = content.shopname;
				message.to = content.buyer_id;
				alert(JSON.stringify(message));
				websocket.send(JSON.stringify(message));
			}

			function writeToScreen(message) {						//메세지를 화면에 띄워줌...
				var pre = document.createElement("p");
				pre.style.wordWrap = "break-word";
				pre.innerHTML = message;
				                
				output.appendChild(pre);
			}
			window.addEventListener("load", init, false);
        </script>
<%--=========================================================================== --%>








<script type="text/javascript">
 jQuery(document).ready(function() {
	
    jQuery("#salesUpload").change(function() {
        if(jQuery("#displayDiv").css("display") != "none") {
        	jQuery("#displayDiv").css("display", "none");
        }
        
        else {

            jQuery("#displayDiv").css("display", "none"); 
        }
    });
});

 function resizeImg(img, height, width) {
	    img.height = height;
	    img.width = width;
	}

</script>
</head>
<body>

<form action="rgoodsupdate" method="post" enctype="multipart/form-data">
	
		<div id="salesTable">
			<div id="salesContent">
			 <p id="status"></p>
			 <div id="holder" ></div>
			 <div id="displayDiv">
				<c:if test ="${goods.goodsOimage !=null}">
	
						<img  alt="" src="download?goodsCode=${goods.goodsCode}" height="200" width="250">
						
				</c:if>
			</div> 
			
						<input type="file" name="upload" size="100" id="salesUpload" onload="resizeImg(img, 200, 100)">
				 <script>											
				
					var upload = document.getElementsByTagName('input')[0], 
					holder = document.getElementById('holder'), 
					state = document.getElementById('status');

					if (typeof window.FileReader === 'undefined') {
						state.className = 'fail';
					} else {
						state.className = 'success';
						state.innerHTML = '이미지';
					}
					
					upload.onchange = function(e) {
						e.preventDefault();
						var file = upload.files[0], reader = new FileReader();
						reader.onload = function(event) {
							var img = new Image();
							img.src = event.target.result;
							// note: no onload required since we've got the dataurl...I think! :)
							if (img.width > 260) { // holder width
								img.width = 260;
							}
							holder.innerHTML = '';
							holder.appendChild(img);
						};
						reader.readAsDataURL(file);

						return false;
					};
				</script> 
				<br> 상품이름 <input type="text" id="goodsName" name="goodsName" value="${goods.goodsName}">
				<br> 상품가격 <input type="text" id="goodsPrice" name="goodsPrice" value="${goods.goodsPrice}">
				<br> 상품수량 <input type="text" id="goodsQuantity" name="goodsQuantity" value="${goods.goodsQuantity}"> 
				<br> 상품 설명 <textarea cols="20" rows="10" name="goodsInfo" id="goodsInfo">${goods.goodsInfo}</textarea>
				<input type="hidden" name="goodsCode" value="${goods.goodsCode}">
				<input type="hidden" name="goodsDateOfUpload" value="${goods.goodsDateOfUpload}">
				<input type="hidden" id="goodsDateOfUpdate">
				<input type="hidden" name="goodsStatus" value="${goods.goodsStatus}">
				<br> <input type="submit" value="등록" onclick="doSend()">
				<!-- <a HREF="javascript:sendIt()">[등록]</a> -->
			
			</div>
		</div>
	
	
	
	
	
	sellerCRN : ${sessionScope.sellerCRN}
	<input type="hidden" id="sellerCRN" value="${sessionScope.sellerCRN}">





	</form>




























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
<script src="./resources/bootstrap/vendor/underscore/underscore-min.js"></script>
<script src="./resources/bootstrap/vendor/backbone/backbone.js"></script>
<script src="./resources/bootstrap/vendor/backbone.paginator/lib/backbone.paginator.min.js"></script>
<script src="./resources/bootstrap/vendor/backgrid/lib/backgrid.js"></script>
<script src="./resources/bootstrap/vendor/backgrid-paginator/backgrid-paginator.js"></script>
<%--<script src="./resources/bootstrap/vendor/datatables/media/js/jquery.dataTables.js"></script>--%>
<script src="./resources/bootstrap/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>

<!-- page specific js -->
<%--<script src="./resources/bootstrap/js/tables-dynamic.js"></script>--%>
</body>
</html>