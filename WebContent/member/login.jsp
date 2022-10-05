<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../header.jsp"%>
<meta charset="UTF-8">
<title>Spirita-로그인</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<div align="center" style="margin:20px ;padding:10px">
		<h2>로그인</h2>
		<form method="post" action="SpiritaServlet?command=login" name="frm">
			<table>
				<tr>
					<td>ID &nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" size=20 name="id" value="${id}"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" size="20" name="pwd"></td>
				</tr>
			</table>
			<input type="submit" value="로그인" onclick="return loginCheck()">
			<input type="button" value="회원가입"
				onclick="location='SpiritaServlet?command=join_form'"> <input
				type="button" value="아이디/비밀번호 찾기" onclick="go_findId()">
		</form>
	</div>
</body>
<%@ include file="../footer.jsp"%>
</html>