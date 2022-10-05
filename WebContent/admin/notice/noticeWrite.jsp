<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.jsp"%>
	<article>
	    <h2> 공지사항 </h2>

		<form name="frm" method="post" action="SpiritaServlet?command=admin_notice_write">
			<fieldset>
				<legend>공지사항</legend>
			    <label>제목</label>
			    <input type="text" name="subject"  size="77" ><br>

				<label>내용</label>
			    <textarea rows="8" cols="65" name="content"></textarea><br>
			</fieldset>

		<div class="clear"></div>
		 <div id="buttons" style="float:right">
			<input type="submit"  value="글쓰기"     class="submit"> 
			<input type="reset"   value="취소"     class="cancel">
		  </div>
		</form>
	</article>
<%@ include file="../footer.jsp" %>