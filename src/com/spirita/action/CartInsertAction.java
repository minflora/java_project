package com.spirita.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spirita.dao.CartDAO;
import com.spirita.dto.CartVO;
import com.spirita.dto.MemberVO;

public class CartInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "SpiritaServlet?command=cart_list";
	    
	    HttpSession session = request.getSession();
	    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	    if (loginUser == null) {
	      url = "SpiritaServlet?command=login_form";
	    } else {
	      CartVO cVo = new CartVO();
	      cVo.setId(loginUser.getId());
	      cVo.setPseq(Integer.parseInt(request.getParameter("pseq")));
	      cVo.setQuantity(Integer.parseInt(request
	          .getParameter("quantity")));

	      CartDAO cDao = CartDAO.getInstance();
	      cDao.insertCart(cVo);
	    }
	    response.sendRedirect(url);
	}
}