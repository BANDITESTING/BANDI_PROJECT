package com.kh.websocket.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MultiViewServlet
 */
//@WebServlet("/multiView.do")
public class MultiViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static ArrayList<String> roomList;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MultiViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		ServletContext application = request.getServletContext();
		
		roomList = (ArrayList<String>)application.getAttribute("roomList");
		
		if(roomList == null || roomList.isEmpty())
		{	roomList = new ArrayList<String>();
			
			roomList.add("room1");
			roomList.add("room2");
			roomList.add("room3");
		}
		
		application.setAttribute("roomList", roomList);
		
		if(!roomList.isEmpty())
		{
			response.sendRedirect("views/multicast.jsp");
		}else
		{
			System.out.println("Room error");
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
