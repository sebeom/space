<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/common/defualt-header.jspf" %>

<style>
<%@ include file="/css/cardPopUpStyle.css"%>
</style>

<style>
	.line{margin-bottom: 40px}
	.subline{margin-bottom: 20px}
	.view{display: inline-block; border: 2px solid #000000 ;padding: 5px }
	.subView{height: inherit;float: left;}
	.textView.active{display: inherit;}
	.textView{display:none;}
	.price:after{content: " ��"}
	input{font-size: 11px; height: 1em}
	.infoText{font-size: 11px; height: 1em}
	
</style>

<meta charset="EUC-KR">
<title>���� �ϱ�</title>
</head>
<body>
<input type="hidden" id="spaceId" value="${SPACE_INFO.SPACE_ID}">
<div style="width: 100%; text-align: center;">
	<p class="line"></p>

	<div id="resTitle" class="view" style="width: 700px; background: #FE9A2E; font-weight: bold;">
		<label >���� ����</label>
	</div>
	
	<p class="line"></p>
	
	<div id="resInfoView" class="view" style="width: 700px">
		<div id="resNumber" style="font-size: 8px;text-align: left; margin-bottom: 5px;">�����ȣ : <label id="resNum">${RES_NUM}</label></div>
		<div id="resInfo" style="height: 150px">
			<c:set var="image" value="${fn:split(SPACE_INFO.SPACE_IMG,',')[0]}"/>
			<div id="infoImage" class="subView">
				<img src="<c:url value='/image/${image}'/>" style="height: inherit;"/>
			</div>
			<div id="infoText" class="subView" style="margin-left:20px; display: table;  vertical-align: middle;">
				<div style="text-align: left; vertical-align: middle; display: table-cell;">
				<c:set var="time" value="${fn:split(RES_TIME,'-')}"/>
				<c:set var="spacePos" value="${fn:split(SPACE_INFO.SPACE_POS,'/')}"/>
				<label>${SPACE_INFO.SPACE_TITLE}(${spacePos[0]} ${spacePos[1]})</label>
				<p></p>
				<label id="resDate">${time[0]}�� ${time[1]}�� ${time[2]}��</label>
				<p></p>
				<label>${SPACE_INFO.SPACE_SIZE }�� / ${SPACE_INFO.SPACE_PERSON }��</label>
				</div>
			</div>
			<div id="userText" class="subView" style="padding-left:20px; width : 25%; float: right; 
			border-left: 1px solid #999999; height: 150px">
				<div class="subView" style="width:100%; display: table;  vertical-align: middle;">
					<div style="text-align: left; vertical-align: middle; display: table-cell; font-size: 11px; height: inherit;">
						<label>������ ����</label>
						<p></p>
						<label style="margin-bottom: 2px">�̸� :</label><label class="inText" for="inputName">${USER_INFO.USER_NAME}</label><input id="inputName" class="textView" type="text" size="8"/><br>
						<label style="margin-bottom: 2px">����ó :</label><label class="inText" for="inputTel">${USER_INFO.USER_PHONE}</label><input id="inputTel" class="textView" type="text" size="12"/><br>
						<label style="margin-bottom: 2px">�̸��� :</label><label class="inText" for="inputEmail">${USER_INFO.USER_EMAIL}</label><input id="inputEmail" class="textView" type="text" size="12"/><br>
						<p></p>
						<button id="modify_Btn" name="modify" style="bottom: 2em; right: 2em;float: right;">������ ���� ����</button>
					</div>
				</div>
				<div>
				</div>
			</div>
		</div>
	</div>
	<p class="subline"></p>
	<div id="priView" class="view" style="width: 700px;">
		<div style="width: 10%;text-align: center; border-right: 1px solid #999999;float: left;">
			<label>����</label>
		</div>
		<div style="width: 70%; text-align: right; float: right; padding-right: 20px">
			<label class="price"><fmt:formatNumber value="${RES_PRI}" pattern="#,###"/></label>
		</div>
		<div></div>
	</div>
	<p></p>
	<div id="otherView" style="width: 700px; display: inline-block; font-size: 12px">
		<div><input id="confirm" type="checkbox"><label for="confirm">�� ������ �������� Ȯ�� �� �������� ����</label></div>
		
		<p class="line"></p>
		
		<div style="text-align: left">
			<label>���� ����</label><br>
			<p></p>
			<form>
				<input id="0001"type="radio" name="PAY_TYPE" value="card" checked="checked"><label for="0001" style="margin-right: 10px">�ſ�ī��</label>
				<input id="0002"type="radio" name="PAY_TYPE" value="none"><label for="0002">�������Ա�</label><br>
			</form>
			<p></p>
			<div id="cardView" style="display: inline-block;">
				<label class="writeBtn" for="open-pop">ī�� ���� �Է�</label>
			</div>
			<div id="cashView" style="display: none; ">
				<label>������ �Ա��� ���ѳ��� �̷����� ������ ��ҵ˴ϴ�</label>
			</div>
		</div>
		<p class="line"></p>
		<div><button id="result" style="width: 200px; bottom: 0em">�����ϱ�</button></div>
	</div>
	
	
	<input class="modal-state" id="open-pop" type="checkbox" />
	<div class="modal">
		<label class="modal_bg" for="open-pop"></label>
		<div class="modal_inner">
			<label class="modal_close" for="open-pop"></label>
			<div id="payTitle" style="text-align: center;">
				<label style="font-size: 30px; font-weight: bold;">ī�� ����</label>
			</div>
			<div class="cardView" style="text-align: left;">
				<div style="background: #aaa; padding-bottom: 1em">
					<label class="price" style="font-weight: bold; font-size: 20px">
						<fmt:formatNumber value="${RES_PRI}" pattern="#,###"/>
					</label>
				</div>
				
				<div>
				<select id="selCard" style="width: 160px;">
						<option value="1">����ī��</option>
						<option value="2">�Ｚī��</option>
						<option value="3">�Ե�ī��</option>
						<option value="4">����ī��</option>
						<option value="5">����ī��</option>
						<option value="6">�ϳ�ī��</option>
						<option value="7">�츮ī��</option>
						<option value="8">����ī��</option>
				</select>
				</div>
				
				<div style="text-align: left; max-width: initial;">
					<label style="font-size: 12px; font-weight: bold;">ī�� ��ȣ</label><br>
					<input type="text" class="cardNumber" onkeyup="inputNum(this);"maxlength="4"> 
					<input type="password" class="cardNumber" onkeyup="inputNum(this);" maxlength="4"> 
					<input type="password" class="cardNumber" onkeyup="inputNum(this);" maxlength="4"> 
					<input type="text" class="cardNumber" maxlength="4">
				</div>

				
			</div>
			<div class="btnView">
				<label class="ok" style="margin-right: 2em">Ȯ��</label>
				<label class="cancel" for="open-pop">���</label>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/common/include-body.jspf" %>
</div>

<script>
$(document).ready(function(){
	$("#modify_Btn").click(function(){
		buttonName = $(this).attr("name");
		$("input.textView").each(function(){
			if(buttonName == "modify"){
				$(this).addClass("active");
				id=$(this).attr("id");
				text = $("label[for='"+id+"']").text();
				$("label[for='"+id+"']").css("display","none");
				$(this).attr("value",text);
			}
			else if(buttonName == "submit"){
				$(this).removeClass("active");
				id=$(this).attr("id");
				text = $(this).attr("value");
				$("label[for='"+id+"']").css("display","");
				$("label[for='"+id+"']").text(text);
			}
		});
		if(buttonName == "modify"){
			$(this).attr("name","submit");
			$(this).text("Ȯ��");
		}
		else if(buttonName == "submit"){
			$(this).attr("name","modify");
			$(this).text("������ ���� ����");
		}
	});
	$("#result").click(function(){
		if($("#confirm:checked").length==0){
			alert("���� üũ �� �ٽ� �õ� �ϼ���");
			return;
		}
		if(!isTextCheck($(".inText"))){
			return;
		}
		else if(!sendCheckNumber() && $("#0001").is(":checked")){ 
			alert("ī�������� �ùٸ��� �ʽ��ϴ�");
			return;
		}
		var payType;
		if($("#0001").is(":checked")){
			payType = $("#selCard option:selected").text()+"/"+createCardNumber();
		}else{
			payType = "none";
		}
		
	 	var com = new ComSubmit();
		com.setUrl("<c:url value='/res/insertresInfo'/>");
		com.addParam("PHONE",$("label[for='inputTel']").text());
		com.addParam("EMAIL",$("label[for='inputEmail']").text());
		com.addParam("NAME",$("label[for='inputName']").text());
		com.addParam("SPACE_ID",$("#spaceId").val());
		com.addParam("RES_NUM",$("#resNum").text());
		com.addParam("RES_APPLY_DATE",$("#resDate").text());
		com.addParam("RES_REQ",payType);
		com.addParam("RES_PRI",'${RES_PRI}');
		
		com.submit();
	});
	$("#0001").click(function(){
		$("#cardView").css("display","");
		$("#cashView").css("display","none");
	});
	$("#0002").click(function(){
		$("#cashView").css("display","");
		$("#cardView").css("display","none");
	});
	$(".ok").click(function(){
		if(sendCheckNumber()){
			$("#open-pop").attr("checked",false);
		}else{
			alert("ī�������� �ùٸ��� �ʽ��ϴ�");
		}
	});
});
function isTextCheck(obj){
	var is = true;
	obj.each(function(){
		if($.trim($(this).text())==""){
			alert("�Էµ��� ���� ������ �ֽ��ϴ�");
			is= false;
			return;
		}
	});
	return is;
}
function inputNum(obj){
	if(isFinite(obj.value)==false){
		alert("���ڸ� �Է��ϼ���");
		obj.value="";
		return false;
	}
	var max = $(obj).attr("maxlength");
	if(obj.value.length >= max){
		obj.nextElementSibling.focus();
	}
}
function sendCheckNumber(){
	var is = true;
	$(".cardNumber").each(function(){
		if($(this).val().length!=4){
			is = false;
		}
	});
	return is;
}
function createCardNumber(){
	var number="";
	$(".cardNumber").each(function(){
		console.log($(this).val());
		number+=$(this).val();
	});
	return number;
}
</script>
</body>
</html>