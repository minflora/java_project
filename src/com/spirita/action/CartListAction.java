package com.spirita.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spirita.dao.CartDAO;
import com.spirita.dto.CartVO;
import com.spirita.dto.MemberVO;

public class CartListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "mypage/cartList.jsp";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if(loginUser==null) {
			url = "SpiritaServlet?command=login_form";
		} else {
			CartDAO cDao = CartDAO.getInstance();
			ArrayList<CartVO> cartList = cDao.listCart(loginUser.getId());
			
			int totalPrice = 0;
			for(CartVO cVo : cartList) {
				totalPrice += cVo.getPrice() * cVo.getQuantity();
			}
			
			request.setAttribute("cartList", cartList);
			request.setAttribute("totalPrice", totalPrice);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}