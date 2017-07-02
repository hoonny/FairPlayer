package com.my.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

public class GetHttpSessionForWebSocket extends ServerEndpointConfig.Configurator {

	
	@Override
		public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response ){
		HttpSession httpSession = (HttpSession)request.getHttpSession();
		config.getUserProperties().put(HttpSession.class.getName(), httpSession);
	}
}
