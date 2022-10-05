<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript" src="product/product.js"></script>
  <article style= "width:80%; margin:0 auto">
<nav id="sub_menu" style="float:left; margin:20px; paddding:10px;">
	<ul style="font-family:sans-serif; color: blue; font-weight:600;">
		<li style="padding:10px;"><a href="SpiritaServlet?command=category&kind=1">데코레이션</a></li>
		<li style="padding:10px;"><a href="SpiritaServlet?command=category&kind=2">테이블웨어</a></li>
		<li style="padding:10px;"><a href="SpiritaServlet?command=category&kind=3">패키지</a></li>
		<li style="padding:10px;"><a href="SpiritaServlet?command=product_list">전체상품보기</a></li>
	</ul>
</nav>
<div style="display:flex; margin:auto;">
    <h2 style="font-size:15px;"> Item</h2>
    <c:forEach items="${productKindList}"  var="productVO">
      <div id="item" style="border">
        <a href="SpiritaServlet?command=product_detail&pseq=${productVO.pseq}">
          <img style="width:200px; height:200px; margin:20px;"src="product_images/${productVO.image}" />
          <h3>${productVO.name} </h3>
          <p>${productVO.price} </p>
        </a>
      </div>
    </c:forEach>
    <div class="clear"></div>
   </div>
  </article>
<%@ include file="../footer.jsp" %>