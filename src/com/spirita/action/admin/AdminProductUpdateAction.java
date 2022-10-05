package com.spirita.action.admin;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spirita.action.Action;
import com.spirita.dao.ProductDAO;
import com.spirita.dto.ProductVO;

public class AdminProductUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "SpiritaServlet?command=admin_product_list";
	    HttpSession session = request.getSession();
	    
	    int sizeLimit = 5 * 1024 * 1024;
	    String savePath = "product_images";
	    ServletContext context = session.getServletContext();
	    String uploadFilePath = context.getRealPath(savePath);
	    
	    MultipartRequest multi = new MultipartRequest(request, // 1. 요청 객체
	        uploadFilePath, // 2. 업로드될 파일이 저장될 파일 경로명
	        sizeLimit, // 3. 업로드될 파일의 최대 크기(5Mb)
	        "UTF-8", // 4. 인코딩 타입 지정
	        new DefaultFileRenamePolicy() // 5. 덮어쓰기를 방지 위한 부분
	    ); // 이 시점을 기해 파일은 이미 저장이 되었다
	    
	    ProductVO productVO = new ProductVO();
	    productVO.setPseq(Integer.parseInt(multi.getParameter("pseq")));
	    productVO.setKind(multi.getParameter("kind"));
	    productVO.setName(multi.getParameter("name"));
	    productVO.setPrice(Integer.parseInt(multi.getParameter("price")));
	    productVO.setContent(multi.getParameter("content"));
	    if(multi.getFilesystemName("image")==null){
	      productVO.setImage(multi.getParameter("nonmakeImg"));
	    }else{
	      productVO.setImage(multi.getFilesystemName("image"));
	    }
	    
	    ProductDAO productDAO = ProductDAO.getInstance();
	    productDAO.updateProduct(productVO);
	    
	    response.sendRedirect(url);
	}
}