<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
  <article align="center" style="width:80%; margin :auto">
  <div style="padding-right:20px;">
    <h2> My Page(${title}) </h2>
    <form name="frm" method="post">
      <table id="cartList" style="margin:auto;">
      <tr>
        <th>주문일자</th> <th>주문번호</th> <th>상품명</th> <th>결제 금액</th> <th>주문 상세</th>
      </tr>
      <c:forEach items="${orderList}" var="orderVO">
      <tr>
        <td> <fmt:formatDate value="${orderVO.indate}" type="date"/></td>
        <td> ${orderVO.oseq} </td>
        <td> ${orderVO.pname} </td>
        <td> <fmt:formatNumber value="${orderVO.price}"/> </td>
        <td> <a href="SpiritaServlet?command=order_detail&oseq=${orderVO.oseq}"> 조회 </a></td>
      </tr>
      </c:forEach>
      </table>
      <div class="clear"></div>
      <div id="buttons" style="text-align:center">
       <input type="button" value="쇼핑 계속하기"  class="cancel"  onclick="location.href='SpiritaServlet?command=index'">
      </div>
    </form>
    </div>
  </article>
<%@ include file="../footer.jsp"%>