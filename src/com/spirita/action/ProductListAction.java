package com.spirita.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spirita.dao.ProductDAO;
import com.spirita.dto.ProductVO;

public class ProductListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "product/productList.jsp";
	    
	    String key=request.getParameter("key");
	    String tpage=request.getParameter("tpage");
	    if(key==null){
	     key="";
	    }
	    if(tpage== null){
	      tpage="1"; //현재 페이지 (default 1)                        
	    }else if(tpage.equals("")){
	       tpage="1";  
	    }
	    request.setAttribute("key", key);
	    request.setAttribute("tpage",tpage);
	    
	    ProductDAO productDAO=ProductDAO.getInstance();
	    ArrayList<ProductVO> productList=productDAO.listProduct(Integer.parseInt(tpage), key);
	    
	    String paging=productDAO.pageNumber(Integer.parseInt(tpage), key);
	    
	    request.setAttribute("productList",productList);
	    int n=productList.size();
	    request.setAttribute("productListSize",n);
	    request.setAttribute("paging", paging);
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	}
}