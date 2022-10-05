<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>   
  <article align="center" style="width:80%; margin :auto">
  <div style="padding-right:20px";>
      <h2> 1:1 고객 게시판 </h2>
      <h3> 고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>    

    <form name="frm" method="post">
    <table id="notice" style="margin:auto;">

      <tr>
              <th>제목</th>
              <td>${qnaVO.subject}</td> 

      </tr>

      <tr>
        <th>등록일</th>

        <td> <fmt:formatDate value="${qnaVO.indate}" type="date"/></td>

      </tr>

      <tr>
        <th>질문내용</th>
        <td>${qnaVO.content} 
      </tr>
      <tr>
        <th>답변 내용</th>
        <td>${qnaVO.reply}  
      </tr>

    </table>

    <div class="clear"></div>
     <div id="buttons">
      <input type="button"  value="목록보기"     class="submit"  onclick="location.href='SpiritaServlet?command=qna_list'"> 
      <input type="button"  value="쇼핑 계속하기"  class="cancel"  onclick="location.href='SpiritaServlet?command=index'">  
      </div>
    </form>
    </div>
  </article>
<%@ include file="../footer.jsp" %>