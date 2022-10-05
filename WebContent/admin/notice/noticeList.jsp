<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.jsp"%>
<article>
	<h2>공지사항</h2>
	<form name="frm" method="post">
		<table id="cartList">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${noticeList}" var="noticeVO">
				<tr>
					<td>${noticeVO.nseq}</td>
					<td><a href="SpiritaServlet?command=admin_notice_view&nseq=${noticeVO.nseq}"> ${noticeVO.subject} </td>
					<td><fmt:formatDate value="${noticeVO.indate}" type="date" /></td>
					<td>${noticeVO.count}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="공지사항 작성" class="cancel" onclick="location.href='SpiritaServlet?command=admin_notice_write_form'">
		</div>
	</form>
</article>
<%@ include file="../footer.jsp"%>