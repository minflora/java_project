<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<head>
<script type="text/javascript" src="product/product.js"></script>
</head>

<article style="width:80%; margin:auto;" >
<nav id="sub_menu" style="float:left; margin:20px; paddding:10px; margin-right:50px">
	<ul style="font-family:sans-serif; color: blue; font-weight:600;">
		<li style="padding:10px;"><a href="SpiritaServlet?command=category&kind=1">데코레이션</a></li>
		<li style="padding:10px;"><a href="SpiritaServlet?command=category&kind=2">테이블웨어</a></li>
		<li style="padding:10px;"><a href="SpiritaServlet?command=category&kind=3">패키지</a></li>
		<li style="padding:10px;"><a href="SpiritaServlet?command=product_list">전체상품보기</a></li>
	</ul>
</nav>
<div style="padding-right:20px; margin:auto;">
	<h1 style="font-size:20px; margin:10px;">상품리스트</h1>
	<form name="frm" method="post">
		<table>
			<tr>
				<td>상품명 <input type="text" name="key">
					<input type="button" name="btn_search" value="검색" onClick="go_search()">
					<input type="button" name="btn_total" value="전체보기 " onClick="go_total()"></td>
			</tr>
		</table>
		<table id="productList">
			<tr>
				<th>번호</th>
				<th>상품명</th>
				<th>가격</th>
				<th>등록일</th>
			</tr>
			<c:choose>
				<c:when test="${productListSize<=0}">
					<tr>
						<td width="100%" colspan="7" align="center" height="23">등록된 상품이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${productList}" var="productVO">
						<tr>
							<td height="23" align="center">${productVO.pseq}</td>
							<td style="text-align: left; padding-left: 50px; padding-right: 0px;">
								<a href="SpiritaServlet?command=product_detail&pseq=${productVO.pseq}"> ${productVO.name} </a>
							</td>
							<td><fmt:formatNumber value="${productVO.price}" /></td>
							<td><fmt:formatDate value="${productVO.indate}" /></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6" style="text-align: center;">${paging}</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</form>
	</div>
</article>
<%@ include file="../footer.jsp"%>
</body>
</html>