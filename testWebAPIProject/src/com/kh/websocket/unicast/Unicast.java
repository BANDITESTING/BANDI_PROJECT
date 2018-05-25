package com.kh.websocket.unicast;

import javax.websocket.server.ServerEndpoint;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;

@ServerEndpoint("/unicast")
public class Unicast 
{
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>()); 
	
	@OnOpen
	public void onOpen(Session session){
		System.out.println(session);
		
		clients.add(session);
	}
	
	@OnMessage
	public void onMessage(String msg, Session session) throws IOException
	{
		System.out.println(msg);
		System.out.println(session);
		synchronized(clients){
			for(Session client : clients)
			{
				if(!session.equals(client))
				client.getBasicRemote().sendText(msg);
			}
		}
	}
	
	@OnError
	public void onError(Throwable e)
	{
		e.printStackTrace();
	}
	
	@OnClose
	public void onClose(Session client)
	{
		clients.remove(client);
	}

}
