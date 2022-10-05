package com.spirita.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spirita.dao.NoticeDAO;
import com.spirita.dto.MemberVO;
import com.spirita.dto.NoticeVO;

public class NoticeListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "notice/noticeList.jsp";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			url = "SpiritaServlet?command=login_form";
		} else {
			NoticeDAO noticeDAO = NoticeDAO.getInstance();
			ArrayList<NoticeVO> noticeList = noticeDAO.listAllNotice();
			request.setAttribute("noticeList", noticeList);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}