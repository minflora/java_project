function writeCheck(){
	if(frm.title.value.length==0){
		alert("제목을 입력해주세요");
		frm.title.focus();
		return false;
	}
	if(frm.content.value.length==0){
		alert("내용을 입력해주세요");
		frm.content.focus();
		return false;
	}
	return true;
}

function deleteCheck(){
	var con=confirm("정말 삭제하시겠습니까?");
	if(con==true){return true;}
	else if(con==false)return false;
}

function logoutCheck(){
	var con=confirm("로그아웃하시겠습니까");
	if(con==true){
		location.href='NoticeServlet?command=notice_logout';
		}
	else if(con==false)
	  location.href='NoticeServlet?command=notice_list';
}

function cartCheck(){
	
}