<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<META HTTP-EQUIV="Content-type" CONTENT="text/html;charset=UTF-8">
<script type="text/javascript" src="product/product.js"></script>
<article style="width:80%; margin:auto;" >
<nav id="sub_menu" style="float:left; margin:20px; paddding:10px;">
	<ul style="font-family:sans-serif; color: blue; font-weight:600;">
		<li style="padding:10px;"><a href="SpiritaServlet?command=category&kind=1">데코레이션</a></li>
		<li style="padding:10px;"><a href="SpiritaServlet?command=category&kind=2">테이블웨어</a></li>
		<li style="padding:10px;"><a href="SpiritaServlet?command=category&kind=3">패키지</a></li>
		<li style="padding:10px;"><a href="SpiritaServlet?command=product_list">전체상품보기</a></li>
	</ul>
</nav>
<div style="padding-right:20px;">
    <h1> Item </h1>
    <div id="itemdetail" style="width:80%; margin:auto;">
      <form method="post" name="frm">
        <fieldset>
          <legend> Item detail Info</legend>
          <a href="SpiritaServlet?command=product_detail&pseq=${productVO.pseq}">         
            <span style="float: left;">
              <img style="width:300px;height:300px;" src="product_images/${productVO.image}"  />
            </span>
            <h2> ${productVO.name} </h2>
          </a>
          <label> 가 격 : ${productVO.price} 원 </label><br>
          <label> 수 량 : </label>
          <input  type="text"      name="quantity"  size="2"      value="1"><br>
          <input  type="hidden"    name="pseq"       value="${productVO.pseq}"><br>
          <label> 상품설명 : ${productVO.content}</label>
        </fieldset>
        <div class="clear"></div>
        <div id="buttons" style="text-align:right; margin:10px">
          <input type="button" value="장바구니에 담기" class="submit" onclick="go_cart()"> 
          <input type="reset"  value="취소" class="cancel" onclick="go_product_list()">
        </div>
      </form> 
     </div> 
    </div>
  </article>
<%@ include file="../footer.jsp" %>    