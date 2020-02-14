<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
<head>
<%@ include file="/WEB-INF/common/include-adminHeader.jspf" %>
<style type="text/css">
#PAGE_NAVI{	float: right;
    margin-top: 40px;
    margin-right: 50%}
</style>
<meta charset="EUC-KR">
<title>�������</title>
   </head> 

	
<div>      
  
</div> 
<div>
<body>
<%@ include file="/WEB-INF/common/include-body.jspf" %>
<center><h2>���� ��û ����</h2></center>
<center>
<div style="width: 900px;">
<div class="main" style="width:900px;">
	 <div class="tbody">
			
			
	</div>
</div>
   <br/>
   </div>
   </center>
   <div>
		<center>
			<div id="PAGE_NAVI"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		</center>
  <div>
			
 
<script type="text/javascript"> 
$(document).ready(function(){
	
	fn_reqList(1);
}); 

function fn_deletereqList(){
	if(confirm("���� �Ͻðڽ��ϱ�?") == true){
		alert("���� �Ǿ����ϴ�.");
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/admin/deletereqList' />");
	comSubmit.submit();
	}else{
		return;
	}
}

/* �˻�ĭ���� ����Ű ������ ���� */
function enterkey() { 
    if (window.event.keyCode == 13) {
    	fn_reqList(1);
    }
}

function fn_reqList(pageNo){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/selectreqList' />");
	comAjax.setCallback("fn_reqListCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 10);
	comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
	comAjax.addParam("keyword", $("input[name='keyword']").val());
	 
	comAjax.ajax();
}

function fn_reqListCallback(data){
	var total = data.TOTAL;
	var body = $(".main > .tbody");
	body.empty(); 
	if(total == 0){
		var str = "<tr><td colspan='4'>��ȸ�� ����� �����ϴ�.</td></tr>"; 
		body.append(str);
	}else{
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_reqList",
			recordCount : 10
		};
		gfn_renderPaging(params);
		var str = "";
		$.each(data.list, function(key, value){
			console.log("check");
			str += ""
			+ "<div class='spacebox'>" 
			+ "<div class='box1' style='height:120px;'>" + "<img src = " + value.APPLY_IMG + "style = 'width:200px; heigth:120px;'>" +"</div>"
			+ "<div class='box2' align='left' style='height:120px;'>"
			+ "<a href = 'pensionDetail.do?idx='" + value.APPLY_TITLE + ">"
			+ "<b style='font-size:16px; color:black;'>" + value.APPLY_TITLE + "&nbsp;&nbsp;</b></a>";
			if(value.APPLY_MODIFY == "N"){
				str+="<span style='color:red'><strong>(�ű�)</strong></span>";
			}else{
				str+="<span style='color:blue'><strong>(����)</strong></span>";
			}
			str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class = 'user'>" + "<span></span>" 
			+ value.USER_ID + "/" + value.USER_NAME + "/" + value.USER_PHONE + "/" + value.USER_EMAIL + "<br/>"
			+ "<sapn class='space'>" + "<span></span>" + "���� Ư¡ : "
			+ value.APPLY_USE + "<br>"
			+ "<sapn class='address'>" + "<span></span>" + "�ּ� : "
			+ value.APPLY_POS + "<br>"
			+ "<sapn class='space'>" + "<span></span>" + "���� : "
			+ value.APPLY_PRI + "��</span>" 
			+ "</div>" 
			+ "<div class='box3' style='height:120px;'><input type='hidden' name='spaceID' value='"+value.APPLY_NUM+"'>"
			+ "<br/><input type='button' class='commit' name='commit' value='����' style='width:50pt;height:20pt'>" + "<br><br>"
			+ "<input type='button' class='delete' name='delete' value='����' style='width:50pt;height:20pt'>" 
			+ "</div>" 
			+ "</div><span style='line-height:20%;'><br/></span>"
		}); 
		body.append(str);
		$("a[name='title']").on("click", function(e){
			e.preventDefault();
			fn_noticeDetail($(this));
			
		});
		$(".commit").on("click", function(e){ 
			e.preventDefault();
			if(confirm("�����Ͻðڽ��ϱ�?") == true){
				alert("���εǾ����ϴ�.");
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/admin/insertreqList'/>");
				comSubmit.addParam("SPACE_ID",$(this).parent().find("input[name='spaceID']").val());
				comSubmit.submit();
			}else{
				alert("��ҵǾ����ϴ�.");
			}
		});
		
		$(".delete").on("click", function(e){ 
			e.preventDefault();
			fn_deletereqList();
		});
	}  
} 
</script>

</body>
</html>
