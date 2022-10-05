<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 </title>
<link rel="stylesheet" type="text/css" href="../css/ex1.css">
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
<div class="outwrap" align="center"style="width:80%;" >
<div class="inwrap" >

	<form action="SpiritaServlet?command=join" method="post" name="frm">
		<table class="join_frm">
			<tr>
				<th colspan="2" align="center"><h1>회원 가입</h1><span>'*' 표시 항목은 필수 입력 항목입니다.</span>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="20">*</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name=id size="20" id="id">* 
				<input type="hidden" name="reid" size="20">
				<input type="button" id="re_check" value="중복확인" onclick="idCheck()" class="w3-button w3-round w3-padding-small w3-dark-grey"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" size="20">*</td>
			</tr>
			<tr >
				<td>비밀번호 확인</td>
				<td><input type="password" name="pwd_check" size="20">*</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" size="20" value=""></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" size="20" value="">*</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="zipcode" size="20" value=""></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" size="20" value="">*</td>
			</tr>
			<tr>
				<td colspan="2">${message}</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="확인" onclick="return joinCheck()" class="w3-button w3-round w3-green">
						&nbsp;&nbsp;&nbsp;
					<input type="button" value="취소" onclick="history.back(-1);" class="w3-button w3-round w3-dark-grey">
				</td>
			</tr>
		</table>
	</form>
	<input type="button" id="go_findid" value="아이디/비밀번호 찾기" onclick="go_findId()" class="w3-button w3-round w3-padding-small w3-dark-grey">
</div>
</div>
</body>
</html>
<%@ include file="../footer.jsp" %>
