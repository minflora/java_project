package com.spirita.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spirita.dao.OrderDAO;
import com.spirita.dto.MemberVO;
import com.spirita.dto.OrderVO;

public class OrderListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "mypage/orderList.jsp";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			url = "SpiritaServlet?command=login_form";
		} else {
			OrderDAO oDao = OrderDAO.getInstance();
			int oseq=Integer.parseInt(request.getParameter("oseq"));
			ArrayList<OrderVO> orderList = oDao.listOrderById(loginUser.getId(), "1", oseq);
			
			int totalPrice=0;
			for(OrderVO oVo :orderList){
				totalPrice+=oVo.getPrice()*oVo.getQuantity();
			}
			request.setAttribute("orderList", orderList);
			request.setAttribute("totalPrice", totalPrice);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}