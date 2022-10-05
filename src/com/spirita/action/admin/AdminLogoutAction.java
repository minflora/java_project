package com.spirita.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spirita.action.Action;

public class AdminLogoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="SpiritaServlet?command=index";

		HttpSession session=request.getSession(false);
		if(session!=null){
			session.invalidate();
			request.setAttribute("message", "");
		}    

		request.getRequestDispatcher(url).forward(request, response);  
	}
}