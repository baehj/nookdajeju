package com.ch.nookdajeju.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatSocketHandler extends TextWebSocketHandler {
	// 채팅하기 위해서 연결된 Session을 저장할 map
	private Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
	
	// 연결됐을 때 : 연결된 클라리언트의 정보를 map에 저장
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.put(session.getId(), session);
	}
	
	// 연결을 해지했을 때 : 연결된 정보를 삭제
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session.getId());
	}
	
	// 메세지가 왔을 때 : 연결된 모든 클라이언트에게 메세지 전달
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Collection<WebSocketSession> sessions = users.values();
		for(WebSocketSession ws : sessions) {
			ws.sendMessage(message);
		}
	}
}