<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<%@ include file="sub_img.html"%> 

	<article align="center" style="width:80%; margin :auto">
	<%@ include file="sub_menu.jsp" %>
	<div style="padding-right:20px;">
	    <h2> 1:1 고객 게시판 </h2>
	    <h3> 고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>    

		<form name="frm" method="post" action="SpiritaServlet?command=qna_write">
			<fieldset>
				<legend>QNA</legend>		
			    <label>제목</label>
			    <input type="text" name="subject"  size="77" ><br>

				<label>내용</label>
			    <textarea rows="8" cols="65" name="content"></textarea><br>
			</fieldset>

		<div class="clear"></div>
		 <div id="buttons">
			<input type="submit"  value="글쓰기"     class="submit"> 
			<input type="reset"   value="취소"     class="cancel">
			<input type="button"  value="쇼핑 계속하기"  class="submit"  onclick="location.href='SpiritaServlet?command=index'">	
		  </div>
		</form>
		</div>
	</article>
<%@ include file="../footer.jsp" %>