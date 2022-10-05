package com.spirita.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spirita.dao.MemberDAO;

public class FindIdAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/findid.jsp";
		int idchk = 1;
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		String id = memberDAO.findId(name, phone);
		
		request.setAttribute("id", id);
		request.setAttribute("idchk", idchk);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}