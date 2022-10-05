<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
  <article align="center" style="width:80%; margin :auto">
  <div style="padding-right:20px";>
      <h2> Order List </h2>
      <form name="frm" method="post">
        <table id="cartList" style="margin:auto;">
       <tr>
        <th>상품명</th> <th>수 량</th><th>가 격</th> <th>주문일</th> <th> 진행 상태 </th>
       </tr>
       <c:forEach items="${orderList}" var="orderVO">
       <tr>
        <td>
            <a href="SpiritaServlet?command=product_detail&pseq=${orderVO.pseq}">
              <h3> ${orderVO.pname} </h3>
          </a>
        </td>
        <td> ${orderVO.quantity} </td>
        <td> <fmt:formatNumber value="${orderVO.price*orderVO.quantity}"/> </td>      
        <td> <fmt:formatDate value="${orderVO.indate}" type="date"/></td>
        <td> 처리 진행 중 </td>
       </tr>
       </c:forEach>
       <tr>
         <th colspan="2"> 총 액 </th>
         <th colspan="2"> <fmt:formatNumber value="${totalPrice}"/><br></th>
         <th> 주문 처리가 완료되었습니다. </th>
       </tr>
      </table>
      
      <div class="clear"></div>
      <div id="buttons">
       <input type="button" value="쇼핑 계속하기" class="cancel" onclick="location.href='SpiritaServlet?command=index'">
      </div>
    </form>
    </div>
  </article>
<%@ include file="../footer.jsp" %>