<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �α��� ��ɼ���</title>
<script>
$(document).ready(function(){
	$("#login_btn").unbind("click").click(function(e){
		e.preventDefault();
		admin_login();
	});
});

function admin_login(){
	if($("#USER_ID").val().length < 1){
		alert("���̵� �Է��� �ּ���.");
	}else if($("#USER_PASSWORD").val().length <1 ){
		alert("��й�ȣ�� �Է��� �ּ���.");
	}else {
		var comSubmit = new ComSubmit("adminLogin");
		comSubmit.setUrl("<c:url value='admin/LoginTry' />");
		comSubmit.submit();
	}
}
</head>
</html>