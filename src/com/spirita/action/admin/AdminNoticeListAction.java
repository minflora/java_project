package com.spirita.action.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spirita.action.Action;
import com.spirita.dao.NoticeDAO;
import com.spirita.dto.NoticeVO;

public class AdminNoticeListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/notice/noticeList.jsp";
		
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		ArrayList<NoticeVO> noticeList = noticeDAO.listAllNotice();
		request.setAttribute("noticeList", noticeList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}