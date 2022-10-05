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
	<jsp:include page="header.jsp" flush="true"></jsp:include>

		<!-- main content 영역 -->
		<div class="card">
			<div class="center">
				<img src="img/main_img.png">
			<div class="centerTitle">
			 	
			</div>
		  </div>
	   </div>
		
		<!-- underbar content 영역 -->
		<div class="under" style="margin:auto; width:100%;">
			<div class="guide">
				<a href="SpiritaServlet?command=category&kind=1"><!-- <h3>데코레이션</h3> -->
					<img src="img/under1.jpg" alt="데코레이션 "></a>
			
			</div>
			<div class="guide">
				<a href="SpiritaServlet?command=category&kind=2"><!-- <h3>테이블웨어 </h3> -->
					<img src="img/under2.jpg" alt="테이블웨어 "></a>
			
			</div>
			<div class="guide">
				<a href="SpiritaServlet?command=category&kind=3"><!-- <h3>패키지</h3> -->
					<img src="img/under3.jpg" alt="패키지 "></a>
			
			</div>
			<div class="guide">
				<a href="SpiritaServlet?command=product_list"><!-- <h3>전체상품</h3> -->
					<img src="img/under4.jpg" alt="전체상품"></a>
			</div>
		</div>
	<!-- footer 영역 -->
	<%@ include file="../footer.jsp"%>
</body>
</html>