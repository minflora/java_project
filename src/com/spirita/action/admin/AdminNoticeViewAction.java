package com.spirita.action.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spirita.action.Action;
import com.spirita.dao.NoticeDAO;
import com.spirita.dto.NoticeVO;

public class AdminNoticeViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/notice/noticeView.jsp";
		
		int nseq = Integer.parseInt(request.getParameter("nseq"));
		NoticeDAO noticeDao = NoticeDAO.getInstance();
		NoticeVO noticeVO = noticeDao.getNotice(nseq);
		request.setAttribute("noticeVO", noticeVO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}