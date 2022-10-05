package com.spirita.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spirita.action.Action;
import com.spirita.dao.NoticeDAO;
import com.spirita.dto.NoticeVO;

public class AdminNoticeWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "SpiritaServlet?command=admin_notice_list";

			NoticeVO noticeVO = new NoticeVO();
			noticeVO.setSubject(request.getParameter("subject"));
			noticeVO.setContent(request.getParameter("content"));      
			NoticeDAO noticeDAO = NoticeDAO.getInstance();
			noticeDAO.insertnotice(noticeVO);

		response.sendRedirect(url);
	}
}