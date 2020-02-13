<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/common/defualt-header.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
<%@ include file="/css/cardPopUpStyle.css"%>
</style>
<style>
.btn {
	margin-top:3em;
	display: inline-block;
	background: #FE9A2E;
	border-radius: 5px;
	padding: 10px 15px 10px 15px;
	top: 10em;
}

.btn:hover, .btn:focus {
	background: #cf7e27;
	cursor: pointer;
}

.line {
	margin-bottom: 40px
}

.subline {
	margin-bottom: 20px
}

.view {
	display: inline-block;
	border: 2px solid #000000;
	padding: 5px;
	width: 700px;
}

.subView {
	height: inherit;
	float: left;
}

.textView.active {
	display: inherit;
}

.textView {
	display: none;
}

.price:after {
	content: " ��"
}
</style>
<title>���� �Ϸ�</title>
</head>
<body>
<div style="width: 100%; text-align: center;">
	<p class="line"></p>

	<div id="resTitle" class="view" style="background: #FE9A2E; font-weight: bold;">
		<label>���� ����</label>
	</div>
	<p class="line"></p>
	
	
	
	<div id="resPayInfo" class="view" style="height: 150px;">
		<div class="subView" style="width: 30%; line-height: 150px; border-right:2px solid #999999 ">
		<label style="vertical-align: middle;">��������</label>
		</div>
		<div class="subView" style="width: 60%; display: table; margin-left: 2em">
		<div style="text-align: left; vertical-align: middle; display: table-cell; height: inherit;">
			<c:if test="${TYPE eq 'none'}">
			<label>�Ա� ����: ���� ���� 123-456-7897</label>
			<p></p>
			<label>������: ����</label>
			<p></p>
			<label>�Աݱ���:${PAY_DATE} ���� �Ա����ּ���</label>
			<p></p>
			<label>���� �ݾ�: ${PRI}</label>
			</c:if>
			<c:if test="${TYPE ne 'none'}">
			<c:set var="number" value="${fn:split(TYPE,'/')}"/>
			<label>��� ī��: ${number[0]}</label>
			<label id="num">${number[1]}</label>
			<p></p>
			<label class="price">���� �ݾ�: ${PRI}</label>
			<p></p>
			<label>�̿��� �ּż� �����մϴ�</label>
			</c:if>
		</div>
		</div>
	</div>
	
	<div>
		<label id="goMain" class="btn" style="margin-right: 1em">��������</label>
		<label id="myResList" class="btn">�� ���� Ȯ���ϱ�</label> 
	</div>
</div>

<script>
$(document).ready(function(){
	changeNumber();
	
	$("#goMain").click(function(){
		location.href="<c:url value='/main'/>";
	});
	$("#myResList").click(function(){
		location.href="<c:url value='/res/resInfo'/>";
	});
	
});

function changeNumber(){
	var number = $("#num").text();
	var card = "";
	console.log($("#num").text());
	for(var i=0;i<number.length;i++){
		if(i%4==0 && i!=0){
			card+="-";
		}
		if(i>=4 && i<=11){
			card=card+'*';
		}else{
			card=card+number.charAt(i);
		}
		
		console.log(number.charAt(i));
	}
	console.log(card);
	$("#num").text(card);
}
</script>

</body>
</html>