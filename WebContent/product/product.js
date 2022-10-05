function go_cart() {
  if (document.frm.quantity.value == "") {
    alert("수량을 입력하여 주세요.");
    document.frm.quantity.focus();
  } else {
    document.frm.action = "SpiritaServlet?command=cart_insert";
    document.frm.submit();
  }
}

function go_cart_delete() {
  var count = 0;
  for ( var i = 0; i < document.frm.cseq.length; i++) {
    if (document.frm.cseq[i].checked == true) {
      count++;
    }
  }
  if (count == 0) {
    alert("삭제할 항목을 선택해 주세요.");

  } else {
    document.frm.action = "SpiritaServlet?command=cart_delete";
    document.frm.submit();
  }
}

function go_product_list(){
	document.frm.action = "SpiritaServlet?command=product_list";
	document.frm.submit();
}

function go_order_insert() {
  document.frm.action = "SpiritaServlet?command=order_insert";
  document.frm.submit();
}

function go_order_delete() {
  var count = 0;
  for ( var i = 0; i < document.frm.oseq.length; i++) {
    if (document.frm.oseq[i].checked == true) {
      count++;
    }
  }
  if (count == 0) {
    alert("삭제할 항목을 선택해 주세요.");

  } else {
    document.frm.action = "SpiritaServlet?command=order_delete";
    document.frm.submit();
  }
}

function go_order() {
  document.frm.action = "SpiritaServlet?command=mypage";
  document.frm.submit();
}





/*admin에서 가져옴*/


function NumFormat(t) // 원 단위, 찍어주기
{
	s = t.value;
	s = s.replace(/\D/g, '');
	l = s.length - 3;
	while (l > 0) {
		s = s.substr(0, l) + ',' + s.substr(l);
		l -= 3;
	}
	t.value = s;
	return t;
}

// 폼에 입력이 올바른지 판단한다.
// productWrite.jsp에서 사용한다.
function go_save()
{
	var theForm = document.frm;
	
	if (theForm.kind.value == '') {
		alert('상품분류를 선택하세요.');
		theForm.kind.focus();
	} else if (theForm.name.value == '') {
		alert('상품명을 입력하세요.');
		theForm.name.focus();
	} else if (theForm.price.value == '') {
		alert('판매가를 입력하세요.');
		theForm.price.focus();
	} else if (theForm.content.value == '') {
		alert('상품상세를 입력하세요.');
		theForm.content.focus();
	} else if (theForm.image.value == '') {
		alert('상품이미지들 입력하세요.');
		theForm.image.focus();
	} else {
		theForm.encoding = "multipart/form-data";
		theForm.price.value = removeComma(theForm.price);

		// productWrite.jsp 폼 페이지에서 입력받은 값을
		// 디비에 추가하기 위한 페이지인 product_save.jsp로 이동하되
		// 입력받은 상품 코드를 쿼리 스트링 형태로 전달한다.
		// 상품 코드로 폴더를 만들어 거기에 이미지 파일을 업로드한다.
		theForm.action = "SpiritaServlet?command=product_write";
		theForm.submit();
	}
}

function removeComma(input) // ,을 빼고 값을 다시 넣어준다.
{
	return input.value.replace(/,/gi, "");
}
// productWrite.jsp에서 사용한다. 상품 리스트로 이동한다.
function go_mov()
{
	var theForm = document.frm;
	theForm.action = "SpiritaServlet?command=product_list";
	theForm.submit();
}
//productList.jsp

function go_search() {
	var theForm = document.frm;
	theForm.action =  "SpiritaServlet?command=product_list";
	theForm.submit();
}

function go_total() {
	var theForm = document.frm;
	theForm.key.value = "";
	theForm.action =  "SpiritaServlet?command=product_list";
	theForm.submit();
}

function go_detail(tpage, pseq) {
	var theForm = document.frm;
	// 상품 상세 보기 페이지에서 다시 상품 리스트로 돌아왔을 경우 현재 페이지로
	// 돌아올 수 있도록 하기 위해서 현재 페이지 번호를 쿼리 스트링으로 넘겨준다.
	theForm.action =  "SpiritaServlet?command=product_detail&pseq="+pseq;
	theForm.submit();
}

function go_wrt() {
	var theForm = document.frm;
	theForm.action = "SpiritaServlet?command=product_write_form";
	theForm.submit();
}
// **************** productDetail.jsp
function go_list(tpage) {
	var theForm = document.frm;
	//상품 리스트로 이동하되 현재 페이지를 쿼리 스트링으로 넘긴다.
	theForm.action = "SpiritaServlet?command=product_list&tpage=" + tpage;
	theForm.submit();
}
// **************** productDetail.jsp
function go_mod(tpage, pseq) {
	var theForm = document.frm;
	//현재 페이지를 쿼리 스트링으로 넘긴다.
	theForm.action = "SpiritaServlet?command=product_update_form&tpage=" + 
		              tpage+"&pseq="+pseq;
	theForm.submit();
}

function go_mod_save(tpage, pseq) {
	var theForm = document.frm;

	if (theForm.kind.value == '') {
		alert('상품분류를 선택하세요');
		theForm.kind.focus();
	} else if (theForm.name.value == '') {
		alert('상품명을 입력하세요');
		theForm.name.focus();
	}  else if (theForm.price.value == '') {
		alert('판매가를 입력하세요');
		theForm.price.focus();
	} else if (theForm.content.value == '') {
		alert('상품상세를 입력하세요');
		theForm.content.focus();
	} else {
		if (confirm('수정하시겠습니까?')) {
			// [1] 상품을 삭제하지 않는 대신 사용하지 않음을 products 테이블의 useyn 컬럼에 1을 채워 넣기 위해서
			// useyns hidden 태그에 1을 지정한다.
			if (theForm.useyn.checked == true) {
				theForm.useyn.value = "y";
			}
			if(theForm.bestyn.checked == true) {
				theForm.bestyn.value = "y";
			}
			theForm.encoding = "multipart/form-data";
			// theForm.seq.value=seq;
			theForm.price.value = removeComma(theForm.price);
			// [2] products 테이블의 상품 정보를 수정하는 처리를 하는 product_modsave.jsp 페이지로
			// 이동하되 상품 코드를 전달해준다. 상품코드로 폴더를 생성해서 그곳에 이미지 파일을 업로드하기 때문이다.			
			theForm.action = "SpiritaServlet?command=product_update";
			theForm.submit();
		}
	}
}

function go_mod_mov(tpage, pseq) {
	var theForm = document.frm;
	theForm.action = 'SpiritaServlet?command=product_detail&tpage=' + tpage + "&pseq=" + pseq;
	theForm.submit();
}
