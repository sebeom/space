<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<style>
table{border: 2px solid #000000;  font-family: serif }
th{
border-bottom:2px solid #000000;
border-right: 2px solid #000000;
 }
 td{
 border-right: 2px solid #000000;
 }

</style>
<table border="2px" width="650px" height="30px" align="center" style="border-collapse: collapse; background-color: #E0ffff;">
<th>1:1����</th>
</table>

<title>1:1����</title>
</head>
<body>

<table width="650px" height="250px" align="center" id="title">
<style>
table{ border-collapse: collapse;}
tbody tr:nth-child(2n) { background-color: #dcdcdc;	
}
</style>
<thead>
<tr>
<th>�۹�ȣ</th>
<th>����</th>
<th>�亯����</th>
<th>�ۼ���</th>
</tr>
</thead>
<tbody>

</tbody>
</table>

<div id="PAGE_NAVI"></div>
<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>

<br/>

<a href="#this" class="btn" id="write" style="float: right">�ۼ��ϱ�</a>

<%@ include file="/WEB-INF/include/include-body.jspf" %>

<script type="text/javascript">
$(document).ready(function(){
	fn_selectqnalist(1);
	
	$("#write").on("click", function(e){ // �۾���
		e.preventDefault();
		fn_Myqnawrite();
	});
	
	$("a[name='title']").on("click", function(e){ // ����
		e.preventDefault();
		fn_Myqnadetail($(this));
	});
});

function fn_Myqnawrite(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/mypage/Myqnawrite' />");
	comSubmit.submit();
}

function fn_Myqnadetail(obj){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/mypage/Myqnadetail' />");
    comSubmit.addParam("ADQNA_NUM", obj.parent().find("#ADQNA_NUM").val());
    comSubmit.submit();
}

function fn_selectqnalist(pageNo){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/mypage/selectqnalist' />");
	comAjax.setCallback("fn_selectqnalistCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 15);
	comAjax.ajax();
}
	
function fn_selectqnalistCallback(data){
	var total = data.TOTAL;
	var body = $("#title>tbody");
	body.empty();
	if(total == 0){
		var str = "<tr>" + "<td colspan='4'>��ȸ�� ����� �����ϴ�.</td>" + "</tr>";
		body.append(str);
	}
	
	else{
		var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_selectqnalist"
		};
		
		gfn_renderPaging(params);
		
		var str = "";
		$.each(data.list, function(key, value){
			str += "<tr>" + "<td>" + value.ADQNA_NUM + "</td>" + "<td class='title'>" + "<a href='#this' name='title'>" + value.ADQNA_TITLE + "</a>" + "<input type='hidden' id='ADQNA_NUM' value=" + value.ADQNA_NUM + ">" + "</td>" +  "<td>" + value.ADQNA_ANS + "</td>" + "<td>" + value.ADQNA_DATE + "</td>"+ "</tr>";
		});
		body.append(str);
		
	
	}
}	

</script>
</body>
</html>