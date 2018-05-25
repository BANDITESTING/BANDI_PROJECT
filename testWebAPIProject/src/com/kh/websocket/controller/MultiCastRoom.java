package com.kh.websocket.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MultiCastRoom
 */
@WebServlet("/multiChatRoom.do")
public class MultiCastRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MultiCastRoom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String room = request.getParameter("chatRoom");
		
		HttpSession session = request.getSession();
		session.setAttribute("chat_id", request.getParameter("chat_id"));
		
		ServletContext application = request.getServletContext();
		
		@SuppressWarnings("unchecked")
		ArrayList<String> roomList = (ArrayList<String>)application.getAttribute("roomList");
		
		if(room.equals("newRoom"))
		{
			room = request.getParameter("roomName");
			
			roomList.add(room);
			
			application.setAttribute("roomList", roomList);
		}
		
		if(!roomList.isEmpty())
		{
			request.setAttribute("room", room);
			request.getRequestDispatcher("views/chatRoom.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
