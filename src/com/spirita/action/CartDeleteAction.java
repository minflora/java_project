package com.spirita.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spirita.dao.CartDAO;

public class CartDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "SpiritaServlet?command=cart_list";
	    
	    String[] cseqArr = request.getParameterValues("cseq");
	    
	    for(String cseq:cseqArr){
	      System.out.println(cseq);
	      CartDAO cDao = CartDAO.getInstance();
	      cDao.deleteCart(Integer.parseInt(cseq));
	    }
	    request.getRequestDispatcher(url).forward(request, response);
	}
}