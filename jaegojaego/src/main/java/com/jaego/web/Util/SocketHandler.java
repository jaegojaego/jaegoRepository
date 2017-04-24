package com.jaego.web.Util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
 
public class SocketHandler extends TextWebSocketHandler{
 
       private final Logger logger = LogManager.getLogger(getClass());
       private List<WebSocketSession> connectedUsers;
      
       public SocketHandler (){
           this.logger.info("create SocketHandler instance!");
           connectedUsers = new ArrayList<WebSocketSession>();
     }
 
       @Override
       public void afterConnectionClosed(WebSocketSession session,
                    CloseStatus status) throws Exception {
             super.afterConnectionClosed(session, status);
 
             this.logger.info("remove session!");
             connectedUsers.remove(session);
             
             for(WebSocketSession webSocketSession : connectedUsers){
            	 if(!session.getId().equals(webSocketSession.getId())){
            		 webSocketSession.sendMessage(new TextMessage(session.getRemoteAddress().getHostName() + "퇴장했습니다."));
            	 }
             }
       }
       
       @Override
       public void afterConnectionEstablished(WebSocketSession session)
                    throws Exception {
             super.afterConnectionEstablished(session);
             connectedUsers.add(session);
             this.logger.info(session.getId() + "님이 접속 했습니다.");
             this.logger.info("연결 IP : " + session.getRemoteAddress());
       }
 
       @Override
       public void handleMessage(WebSocketSession session,
                    WebSocketMessage<?> message) throws Exception {
             super.handleMessage(session, message);
             sendMessage((String)message.getPayload());//
             this.logger.info("receive message:"+message.toString());
       }
 
       @Override
       public void handleTransportError(WebSocketSession session,
                    Throwable exception) throws Exception {
             this.logger.error(session.getId()+"님이 퇴장했습니다.");
       }
 
       @Override
       public boolean supportsPartialMessages() {
             this.logger.info("call method!");
            
             return super.supportsPartialMessages();
       }
      
       public void sendMessage (String message){
             for (WebSocketSession session: this.connectedUsers){
                    if (session.isOpen()){
                           try{
                                 session.sendMessage(new TextMessage(message));
                           }catch (Exception ignored){
                                 this.logger.error("fail to send message!", ignored);
                           }
                    }
             }
       }
}
