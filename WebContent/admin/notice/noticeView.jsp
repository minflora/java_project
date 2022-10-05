<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.jsp"%>
<script>
	function notice_delete(){
		if(confirm('삭제하시겠습니까?')){
			document.frm.action="SpiritaServlet?command=admin_notice_delete";
			document.frm.submit();
		}
	}
</script>
<article>
	<h2>공지사항</h2>
	<form name="frm" method="post">
	<input type="hidden" name="nseq" value="${noticeVO.nseq}">
		<table id="notice">
			<tr>
				<th>제목</th>
				<td>${noticeVO.subject}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><fmt:formatDate value="${noticeVO.indate}" type="date" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${noticeVO.content}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${noticeVO.count}</td>
			</tr>
		</table>
		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="수정하기" class="submit" onclick="location.href='SpiritaServlet?command=admin_notice_update_form&nseq=${noticeVO.nseq}'">
			<input type="button" value="삭제하기" class="submit" onclick="return notice_delete()">
			<input type="button" value="목록보기" class="submit" onclick="location.href='SpiritaServlet?command=admin_notice_list'">
		</div>
	</form>
</article>
<%@ include file="../footer.jsp"%>