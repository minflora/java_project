package com.spirita.action.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spirita.action.Action;
import com.spirita.dao.NoticeDAO;
import com.spirita.dto.NoticeVO;

public class AdminNoticeUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/notice/noticeUpdate.jsp";
		
		int nseq = Integer.parseInt(request.getParameter("nseq"));
		NoticeVO noticeVO = new NoticeVO();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeVO = noticeDAO.getNotice(nseq);
		
		request.setAttribute("noticeVO", noticeVO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}