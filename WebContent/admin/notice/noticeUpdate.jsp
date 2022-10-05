<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.jsp"%>
<script>
	function notice_update(){
		if(confirm("수정하시겠습니까?")){
			document.frm.action="SpiritaServlet?command=admin_notice_update";
			document.frm.submit();
		}
	}
</script>
<article>
	<h2>공지사항</h2>
	<form name="frm" method="post">
	<input type="hidden" name="nseq" value="${noticeVO.nseq}">
		<fieldset>
			<legend>공지사항</legend>
			<label>제목</label> <input type="text" name="subject" size="77" value="${noticeVO.subject}"><br>
			
			<label>내용</label>
			<textarea rows="8" cols="65" name="content">${noticeVO.content}</textarea>
			<br>
		</fieldset>
		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="submit" value="수정" class="submit" onclick="return notice_update()">
			<input type="reset" value="취소" class="cancel">
		</div>
	</form>
</article>
<%@ include file="../footer.jsp"%>