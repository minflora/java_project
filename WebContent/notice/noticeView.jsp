<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<article align="center" style="width:80%; margin :auto">
<div style="padding-right:20px";>
	<h2>공지사항</h2>
	<form name="frm" method="post">
		<table id="notice" style="margin:auto;">
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
			<input type="button" value="목록보기" class="submit" onclick="location.href='SpiritaServlet?command=notice_list'">
			<input type="button" value="쇼핑 계속하기" class="cancel" onclick="location.href='SpiritaServlet?command=index'">
		</div>
	</form>
	</div>
</article>
<%@ include file="../footer.jsp"%>