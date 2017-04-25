<%-- 상품등록 : 권록헌헌헌 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="./resources/js/jquery-3.1.1.js"/>"></script>

<title>상품수정</title>
<script>
function beforeSubmit() {
	//상품이름 입력여부 검사
   
	var goodsName=document.getElementById('goodsName').value;
	var goodsPrice=document.getElementById('goodsPrice');
	var goodsQuantity=document.getElementById('goodsQuantity');
	var goodsInfo=document.getElementById('goodsInfo').value;

	if(goodsName==""){
		alert("상품이름을 입력하지 않았습니다.");
		return false;
	} else if(goodsPrice.value==''){
		alert("상품 가격을 입력하지 않았습니다.");
		return false;
	} else if(isNaN(goodsPrice.value)){
		alert("상품가격에 숫자아닌값이 있습니다 확인해주세요");
		return false;
	} else if(goodsQuantity.value==''){
		alert("상품수량을 입력하지 않았습니다.");
		return false;
	} else if(isNaN(goodsQuantity.value)){
		alert("상품수량에 숫자아닌값이 있습니다 확인해주세요");
		return false;
	} else if(goodsInfo==""){
		alert("상품설명을 입력하지 않았습니다.");
		return false;
	}
		return true;
	}

function resizeImg(img, height, width) {
	alert("d");
	img.height = height;
	img.width = width;
}
   
</script>
</head>
<body>































<%--------------------------------------------------------------------------------%>
<%--20170422 박진우 박시원 웹소켓 테스트============================================= --%>
 <script type="text/javascript">
/*        	function client(evt){

        	}
        	
        	function seller(){        		
        		doSend();
        	}
           
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
				send_message();
			}
            
			function onMessage(evt) { //메시지 수신
				client(evt);
            }
			function onError(evt) {  // 전송 에러 발생
				writeToScreen('ERROR: ' + evt.data);
			} 
			function doSend(str) {
				
				
				var CRN = document.getElementById("sellerCRN").value;
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
                            // 마커를 생성하고 지도위에 표시합니다
                            content += '<tr><th>'+glist[i].GN+'</th><th>'+glist[i].GP+"</th><th>"+glist[i].GQ
                            +'</th><th><div class="thth"><img src="./resources/image/picture.png" width="20px" height="20px" class="abcd" imgData="goodsimg?sellerCRN='+CRN+'&goodsCode='+glist[i].GC+'">'+
                            '<span class="immm"><img src="goodsimg?sellerCRN='+CRN+'&goodsCode='+glist[i].GC+'" width="90px" height="70px" > </span></div></th></tr>';
                            }
                            
                            content += '</table></div>';
                            
                            
                        	
            				var pk = {storeid : CRN, goodsid : content};
            				var jsonstr = JSON.stringify(pk);
                            websocket.send(jsonstr);
                        },
                        error : function(e){
                           //ajax통신 실패시
                           console.log(e);
                        }
                     });
	            }
			
			function dosendcontent(content){
				alert("dosendcontent(고객아이디들) : " + content.buyer_id);
				var message={};
				message.message = content.shopname;
				message.to = content.buyer_id;
				alert(JSON.stringify(message));
				websocket.send(JSON.stringify(message));
			}
			
			function writeToScreen(message) {		//메세지를 화면에 띄워줌...
				var pre = document.createElement("p");
				pre.style.wordWrap = "break-word";
				pre.innerHTML = message;
				                
				output.appendChild(pre);
			}
			window.addEventListener("load", init, false);*/
        </script>
<%--=========================================================================== --%>
<%--------------------------------------------------------------------------------%>






























<form action="rgoodsinsert" method="post" enctype="multipart/form-data" onsubmit="return beforeSubmit();">
	<div id="salesTable">
		<div id="salesContent">
			<p id="status"></p>
			<div id="holder"></div>
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
						img.height=200;
						img.width=250;
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
			<br> 상품이름 <input type="text" id="goodsName" name="goodsName">
			<br> 상품가격 <input type="text" id="goodsPrice" name="goodsPrice">
			<br> 상품수량 <input type="text" id="goodsQuantity" name="goodsQuantity"> 
			<br> 상품설명 <input type="text" id="goodsInfo" name="goodsInfo"> 
			<input type="hidden" id="goodsCode">
			<input type="hidden" id="goodsDateOfUpload">
			<input type="hidden" id="goodsDateOfUpdate">
			<input type="hidden" id="goodsStatus" value="off">
			<br> <input type="submit"  value="등록">
            <!-- <a HREF="javascript:sendIt()">[등록]</a> -->
		</div>
	</div>
</form>

</body>
</html>