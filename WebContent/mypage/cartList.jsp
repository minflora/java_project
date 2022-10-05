<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
<script type="text/javascript" src="mypage/mypage.js"></script>
</head>
<article align="center" style="width:80%; margin :auto">
<div style="padding-right:20px";>
    <form name="frm" method="post">
    <c:choose>
    <c:when test= "${cartList.size() == 0}">
      <h3 style="color: red;text-align: center;"> 장바구니가 비었습니다. </h3>
    </c:when>
    <c:otherwise>
      <table id="cartList" style="margin:auto;">
        <tr>
          <th>상품명</th><th>수 량</th><th>가 격</th><th>주문일</th><th>삭 제</th>
        </tr>
        
        <c:forEach items="${cartList}"  var="cartVO">
        <tr>
          <td>
            <a href="SpiritaServlet?command=product_detail&pseq=${cartVO.pseq}">
              <h3> ${cartVO.pname} </h3>
            </a>
          </td>
          <td> ${cartVO.quantity} </td>
          <td>
            <fmt:formatNumber value="${cartVO.price*cartVO.quantity}"/>
          </td>
          <td> <fmt:formatDate value="${cartVO.indate}" type="date"/></td>
          <td> <input style ="align:center"type="checkbox" name="cseq" value= "${cartVO.cseq}">
          </td>
        </tr>
        </c:forEach>
        
        <tr>
          <th colspan="2"> 총 액 </th>
          <th colspan="2">
            <fmt:formatNumber value="${totalPrice}"/><br>
          </th>
          <th><a href="#" onclick="go_cart_delete()"><h3>장바구니에서 삭제</h3></a></th>
        </tr>
      </table>
    </c:otherwise>
    </c:choose>
    
    <div id="buttons">
      <input type="button" value="쇼핑 계속하기" class="cancel" onclick="location.href='SpiritaServlet?command=index'">
      <c:if test= "${cartList.size() != 0}">
      <input type="button" value="주문하기"  class="submit" onclick="go_order_insert()">
      </c:if>
     </div>
    </form>
    </div>
  </article>
<%@ include file="../footer.jsp" %>