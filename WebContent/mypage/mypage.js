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

  if (document.frm.cseq.length == undefined) {
    if (document.frm.cseq.checked == true) {
      count++;
    }
  }

  for ( var i = 0; i < document.frm.cseq.length; i++) {
    alert("" + document.frm.cseq[i].checked);
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

function go_order_insert() {
  document.frm.action = "SpiritaServlet?command=order_insert";
  document.frm.submit();
}

function go_order_delete() {
  var count = 0;

  if (document.frm.oseq.length == undefined) {
    if (document.frm.oseq.checked == true) {
      count++;
    }
  }

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