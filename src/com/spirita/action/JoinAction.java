package com.spirita.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spirita.dao.MemberDAO;
import com.spirita.dto.MemberVO;

public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/member/login.jsp";
		
		MemberVO mVo = new MemberVO();
		
		mVo.setId(request.getParameter("id"));
		mVo.setPwd(request.getParameter("pwd"));
		mVo.setName(request.getParameter("name"));
		mVo.setEmail(request.getParameter("email"));
		mVo.setZipcode(request.getParameter("zipcode"));
		mVo.setAddress(request.getParameter("address"));
		mVo.setPhone(request.getParameter("phone"));
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.insertMember(mVo);
		
		if(result==1) {
			url = "/member/join_success.jsp";
		}else {
			url = "/member/join_fail.jsp";	
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}