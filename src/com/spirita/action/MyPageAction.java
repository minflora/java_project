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

public class MyPageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "mypage/mypage.jsp";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			url = "SpiritaServlet?command=login_form";
		} else {
			OrderDAO oDao = OrderDAO.getInstance();
			ArrayList<Integer> oseqList = oDao.selectSeqOrderIng(loginUser.getId());
			
			ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
			
			for(int oseq : oseqList) {
				ArrayList<OrderVO> orderListIng = oDao.listOrderById(loginUser.getId(), "1", oseq);
				
				OrderVO oVo = orderListIng.get(0);
				oVo.setPname(oVo.getPname() + " 외" + (orderListIng.size()-1) + "건");
				
				int totalPrice = 0;
				for (OrderVO oVo2 : orderListIng) {
					totalPrice += oVo2.getPrice() * oVo2.getQuantity();
				}
				oVo.setPrice(totalPrice);
				orderList.add(oVo);
			}
			request.setAttribute("title", "진행 중인 주문 내역");
			request.setAttribute("orderList", orderList);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}