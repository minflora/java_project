<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="sub_img.html"%>
 
  <article align="center" style="width:80%; margin :auto">
	<%@ include file="sub_menu.jsp" %>
  
  	<div style="padding-left:20px;">
    <h2> 공지사항 </h2>
    <form name="frm" method="post">
      <table id="cartList" style="margin:auto;">
      <tr>
        <th>번호</th> <th>제목</th> <th>등록일</th> <th>조회수</th>
      </tr>
      <c:forEach items="${noticeList}" var="noticeVO">
      <tr>
        <td> ${noticeVO.nseq} </td>
        <td> <a href="SpiritaServlet?command=notice_view&nseq=${noticeVO.nseq}"> ${noticeVO.subject} </td>
        <td> <fmt:formatDate value="${noticeVO.indate}" type="date"/></td>
        <td> ${noticeVO.count} </td>
      </tr>
      </c:forEach>
      </table>
      <div class="clear"></div>
      <div id="buttons">
      <input type="button"  value="쇼핑 계속하기" class="cancel" onclick="location.href='SpiritaServlet?command=index'">
      </div>
    </form>
    </div>
  </article>
<%@ include file="../footer.jsp" %>