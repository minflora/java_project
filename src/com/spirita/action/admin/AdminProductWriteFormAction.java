package com.spirita.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spirita.action.Action;

public class AdminProductWriteFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/product/productWrite.jsp";
	    String kindList[] = { "데코레이션", "테이블웨어", "패키지상품"};
	    request.setAttribute("kindList", kindList);
	    request.getRequestDispatcher(url).forward(request, response);
	}
}