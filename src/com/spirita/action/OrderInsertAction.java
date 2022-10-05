package com.spirita.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spirita.dao.CartDAO;
import com.spirita.dao.OrderDAO;
import com.spirita.dto.CartVO;
import com.spirita.dto.MemberVO;

public class OrderInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "SpiritaServlet?command=order_list";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "SpiritaServlet?command=login_form";
		} else {
			CartDAO cDao = CartDAO.getInstance();
			ArrayList<CartVO> cartList = cDao.listCart(loginUser.getId());
			
			OrderDAO oDao = OrderDAO.getInstance();
			
			int maxOseq=oDao.insertOrder(cartList, loginUser.getId());
			url = "SpiritaServlet?command=order_list&oseq="+maxOseq;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}