<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<%@ include file="/WEB-INF/include/include-header.jspf" %>

<title>1:1���� �۾���</title>

<style>
#frm{width: 100%; margin-left:calc(50% - 350px); }

</style>


<form id="frm">
<table border="2px" width="700px" height="30px" align="center" style="border-collapse: collapse;">
<th>1 : 1 ����</th>
</table>
<table class="qna_view">
<select name="qnaOpt" style="padding: .3em; ">
<option value="">���������� �����ϼ���.</option>
<option value="��������">��������</option>
<option value="�����Ű�">�����Ű�</option>
<option value="����������û">����������û</option>
</select>

<tr>
<th scope="row">����</th>
<td><input type="text" id="ADQNA_TITLE" name="ADQNA_TITLE" class="wdp_90"></input></td>
</tr>
<tr>
<td colspan="2" class="qna_text">
<textarea rows="20" cols="100" title="����" id="ADQNA_CNT" name="ADQNA_CNT"></textarea>
</td>
</tr>
</table>

<a href="#this" class="btn" id="write">Ȯ��</a>
<a href="#this" class="btn" id="list">���</a>
</form>

<%@ include file="/WEB-INF/include/include-body.jspf" %>

<script type="text/javascript">
$(document).ready(function(){
	$("#list").on("click", function(e){
		e.preventDefault();
		fn_Myqnalist();
	});
});

function fn_Myqnalist(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/mypage/Myqnalist' />");
	comSubmit.submit();
}

$(document).ready(function(){
	$("#list").on("click", function(e){
		e.preventDefault();
		fn_Myqnalist();
	});
	
	$("#write").on("click", function(e){
		e.preventDefault();
		fn_Myqnawrite();
	});
});

function fn_Myqnalist(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/myInfo/QNAList' />");
	comSubmit.submit();
}

function fn_Myqnawrite(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/myInfo/QNAList' />");
	comSubmit.submit();
}
</script>
