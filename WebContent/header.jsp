<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/ex1.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script/script.js"></script>
</head>
<body>
	<!-- header 영역 -->
	<div class="header_menu">
		<div class="header">
			<ul class="topbar">
			<c:choose>
				<c:when test="${empty loginUser.id}">
					<li>
						<input type="button" value="LOGIN" onclick="location.href='SpiritaServlet?command=login_form'" class="w3-button w3-round w3-light-grey">
						<input type="button" value="MYPAGE" onclick="location.href='SpiritaServlet?command=login_form'" class="w3-button w3-round w3-light-grey">
						<input type="button" value="CART" onclick="location.href='SpiritaServlet?command=login_form'" class="w3-button w3-round w3-light-grey">
						<input type="button" value="ADMIN" onclick="location.href='SpiritaServlet?command=admin_login_form'" class="w3-button w3-round w3-light-grey">
					</li>
					<!-- <li><input type="button" value="HOME" onclick="location.href='SpiritaServlet?command=index'"></li> -->
				</c:when>
				<c:otherwise>
					<li>	'${loginUser.id}'님 환영합니다 ^^*  &nbsp;
						<input type="button" value="LOGOUT" onclick="location.href='SpiritaServlet?command=logout'" class="w3-button w3-round w3-padding-small w3-dark-grey">
						<input type="button" value="MYPAGE" onclick="location.href='SpiritaServlet?command=mypage'" class="w3-button w3-round w3-padding-small w3-dark-grey" >
						<input type="button" value="CART" onclick="location.href='SpiritaServlet?command=cart_list'" class="w3-button w3-round w3-padding-small w3-dark-grey">
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>

	<div id="logo">
		<a href="SpiritaServlet?command=index"><img src="img/logo.png"></a>
	</div>

	<!-- navigator 영역 -->
	<div class="row">
		
		<div class="nav">

			<ul>
				<li><a href="reserv_intro.jsp">ABOUT</a></li>

				<li><a href="SpiritaServlet?command=product_list">STORE</a></li>

				<li><a href="SpiritaServlet?command=notice_list">NOTICE</a></li>

				<li><a href="SpiritaServlet?command=qna_list">Q&A</a></li>
			</ul>
		</div>
	</div>

	</div>
</body>
</html>