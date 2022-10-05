package com.spirita.action.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spirita.action.Action;
import com.spirita.dao.OrderDAO;
import com.spirita.dto.OrderVO;

public class AdminOrderListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/order/orderList.jsp";
	    String key = request.getParameter("key");
	    if(key==null) {
	    	key="";
	    }
	    
	    OrderDAO orderDAO = OrderDAO.getInstance();
	    ArrayList<OrderVO> orderList = orderDAO.listOrder(key);

	    request.setAttribute("orderList", orderList);

	    request.getRequestDispatcher(url).forward(request, response);
	}
}