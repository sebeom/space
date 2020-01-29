<%@ page language="java" contentType="text/html; charset=euc-kr"
pageEncoding="euc-kr"%>
<script>
var loadMenu = function(u, callback){
	$.ajax({
		url: u,
		method: 'GET',
		success: function(data){
			callback(data);
		}
	});
};

var loadLogin = function(data){
	$("section").empty();
	$("section").html(data);
};
var loadJoin = function(data){
	$("section").empty();
	$("section").html(data);
};

$(function(){
	var $menuArr = $("#coreTopMenu>span>a");
	$menuArr.click(function(event){
		var url = $(this).attr('href');
		switch(url){
		case '${contextPath}/user/login.jsp':
			loadMenu(url, loadLogin);
		break;
		case '${contextPath}/user/join.jsp':
			loadMenu(url, loadJoin);
		break;
		};
		return false;
	});
});
</script>

<div>
<ul id="coreTopMenu">
<span><a href='${contextPath}/user/reserveCheck.jsp'><font color="black">����Ȯ��</font></a></span>&nbsp;&nbsp;
<span><a href='${contextpath}/user/myPage.jsp'><font color="black">����������</font></a></span>&nbsp;&nbsp;
<span><a href='${contextpath}/user/login.jsp'><font color="black">�α���</font></a></span>
</ul>

<ul id="coreBottomMenu">
<span><a href='${contextPath}/user/lower.jsp'><font color="black">�̿���</font></a></span>&nbsp;&nbsp;
<span><a href='${contextPath}/user/privacy.jsp'><font color="black">��������ó����ħ</font></a></span>&nbsp;&nbsp;
<span><a href='${contextPath}/user/operation.jsp'><font color="black">���å</font></a></span>&nbsp;&nbsp;
<span><a href='${contextPath}/user/help.jsp'><font color="black">������</font></a></span>
</ul>
</div>


<select id="purpose" name="purpose" multiple size="3" required autofocus>
<option value="������">������</option>
<option value="��Ʃ���">��Ʃ���</option>
<option value="���̳���">���̳���</option>
<option value="���͵��">���͵��</option>
<option value="��ƼȦ">��ƼȦ</option>
<option value="��Ÿ">��Ÿ</option>
</select>

<select id="area" name="area" multiple size="3" required autofocus>
<option value="����">����</option>
<option value="��⵵">��⵵</option>
</select>

<!-- �Ⱓ -->

<select id="land" name="land" multiple size="3" required autofocus>
<option value="~50m��">~50m��</option>
<option value="~100m��">~100m��</option>
<option value="~150m��">~150m��</option>
<option value="~200m��">~200m��</option>
<option value="~250m��">~250m��</option>
<option value="~300m��">~300m��</option>
</select>

<!-- include file -->