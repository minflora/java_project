<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디/비밀번호 찾기</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<h2>비밀번호 찾기</h2>
		<c:if test="${pwdchk==null || pwdchk==0}">
			<form name="frm" method="post">
				<table>
					<tr>
						<td align="right"><label> 아이디</label></td>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<td align="right"><label> 이름</label></td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td align="right"><label> 전화번호(-까지입력)</label></td>
						<td><input type="text" name="phone"></td>
					</tr>
					<tr>
						<td><input type="button" value="비밀번호 찾기" onclick="findPwd()"></td>
					</tr>
				</table>
			</form>
		</c:if>
		
		<c:if test="${pwdchk==1}">
		<form method="post" name="frm">
			<c:if test="${pwd == null}">
				<br>입력된 정보와 일치하는 비밀번호가 없습니다.<br>
				<input type="button" value="다시 찾기" class="cancel" onclick="location.href='SpiritaServlet?command=find_pwd_form'">
			</c:if>
			<c:if test="${pwd != null}">
				<br>찾으시는 비밀번호는 『${pwd}』입니다.<br>
			</c:if>
		</form>
		</c:if>
	<input type="button" value="확인" class="cancel" onclick="idcheck_close()">
	<input type="button"value="아이디 찾기" class="cancel" onclick="location.href='SpiritaServlet?command=find_id_form'">
</body>
</html>