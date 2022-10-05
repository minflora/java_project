function loginCheck(){
	
	if(document.frm.id.value.length==0 || document.frm.id.value==""){
		alert("아이디를 입력하세요");
		frm.id.focus();
		return false;
	}
	if(document.frm.pwd.value=="" || document.frm.pwd.value.length==0){
		alert("암호는 반드시 입력해야 합니다.");
		frm.pwd.focus();
		return false;
	}
	return true;
}

function idCheck(){
	if(document.frm.id.value=="" || document.frm.id.value.length==0){
		alert('아이디를 입력하세요.');
		document.frm.id.focus();
		return;
	}
	var url ="SpiritaServlet?command=id_check_form&id="+document.frm.id.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");  
}

function go_findId(){
	var url ="SpiritaServlet?command=find_id_form";
	window.open(url, "win", "toolbar=no, menubar=no, scrollbars=yes, width=450, height=250");
}

function findId(){
	if(document.frm.name.value==""){
		alert("이름을 입력하세요.");
		document.frm.name.focus();
		return false;
	}
	if(document.frm.phone.value ==""){
		alert("전화번호를 입력하세요.");
		document.frm.phone.focus();
		return false;
	}
	document.frm.action="SpiritaServlet?command=find_id";
	document.frm.submit();
}

function findPwd(){
	if(document.frm.id.value==""){
		alert("아이디를 입력하세요.");
		document.frm.id.focus();
		return false;
	}
	if(document.frm.name.value==""){
		alert("이름을 입력하세요.");
		document.frm.name.focus();
		return false;
	}
	if(document.frm.phone.value==""){
		alert("전화번호를 입력하세요.");
		document.frm.phone.focus();
		return false;
	}
	document.frm.action="SpiritaServlet?command=find_pwd";
	document.frm.submit();
}

function idok(id) {
	opener.frm.id.value = document.frm.id.value;
	opener.frm.reid.value = document.frm.id.value;
	self.close();
}

function idcheck_close(){
	window.close();
}

function joinCheck() {
	if (document.frm.name.value.length==0 || document.frm.name.value=="") {
		alert("이름을 입력하세요.");
		frm.name.focus();
		return false;
	}
	if (document.frm.id.value.length==0 || document.frm.id.value=="") {
		alert("아이디를 입력하세요.");
		frm.id.focus();
		return false;
	}
	if (document.frm.id.value.length > 15 || document.frm.id.value.length < 2) {
		alert("아이디는 2자 이상 14자 이하이어야 합니다.");
		frm.id.focus();
		return false;
	}
	if (document.frm.pwd.value=="" || document.frm.pwd.value.length==0) {
		alert("비밀번호를 입력하세요.");
		frm.pwd.focus();
		return false;
	}
	if (document.frm.pwd.value.length > 15 || document.frm.pwd.value.length < 6) {
		alert("비밀번호는 6자 이상 14자리 이하이어야 합니다.");
		frm.pwd.focus();
		return false;
	}
	if (document.frm.pwd.value != document.frm.pwd_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		frm.pwd.focus();
		return false;
	}
	if (document.frm.phone.value.length==0 || document.frm.phone.value=="") {
		alert("전화번호를 입력하세요.");
		frm.phone.focus();
		return false;
	}
	if (document.frm.address.value.length==0 || document.frm.address.value=="") {
		alert("주소를 입력하세요.");
		frm.address.focus();
		return false;
	}
	if (document.frm.email.value.length==0 || document.frm.email.value==""){
		alert("이메일을 입력하세요.");
		frm.email.focus();
		return false;
	}
	if (document.frm.reid.value.length == 0) {
		alert("아이디 중복확인을 해주세요.");
		frm.id.focus();
		return false;
	}
	return true;
}




/* Demo purposes only */
/*$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);*/