<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>
<script>
function delete_product(pseq){
	if(confirm("삭제하시겠습니까?")){
		document.frm.action="SpiritaServlet?command=admin_product_delete&pseq="+pseq;
		document.frm.submit();
	}
}
</script>
<article>
<h1>상품 상세 보기</h1> 
<form name="frm" method="post">
<table id="list">
  <tr>
    <th>상품분류</th>
    <td  colspan="5">${kind}</td>
    </tr>
    <tr>
        <th align="center" >상품 명</th>
        <td colspan="5">${productVO.name}</td>
    </tr>
    
    <tr>
        <th>가격</th>
        <td width="60">${productVO.price}</td>
    </tr>
    
    <tr>
        <th>상세설명</th>
        <td colspan="5">${productVO.content}</td>
    </tr>
    
    <tr>
     <th>상품이미지</th>
     <td colspan="5" align="center">
  <!--[7] 상품 이미지를 출력하기 -->
     <img src="product_images/${productVO.image}" width="200pt">    
     </td>
    </tr>
</table>
<input class="btn" type="button" value="수정" onClick="go_mod('${tpage}','${productVO.pseq}')">
<input class="btn" type="button" value="삭제" onClick="return delete_product(${productVO.pseq})">
<input class="btn" type="button" value="목록" onClick="go_list('${tpage}')">
</form>
</article>
<%@ include file="/admin/footer.jsp"%>
</body>
</html>