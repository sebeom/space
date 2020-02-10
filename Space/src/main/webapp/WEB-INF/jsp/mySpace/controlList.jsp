<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/common/defualt-header.jspf" %>
<style>
<%@ include file="/css/detailStyle.css" %>
<%@ include file="/css/layerPopUpStyle.css"%>
</style>
<style>
	.line{margin-bottom: 40px}
	.subline{margin:5px 0 5px 0;}
	.view{display: inline-block; border: 2px solid #000000 ;padding: 5px; width: 500px;}
	.subView{float: left;display: table; vertical-align: middle; min-height: 80px;width: 100% }
	.otherView{float: left;display: table; vertical-align: middle;
		width: 100%;text-align: left;cursor: pointer;}
	.textView.active{display: inherit;}
	.textView{display:none;}
	.price:after{content: " ��"}
	.cellView{text-align: left; vertical-align: middle; display: table-cell; width: 75%}
	.imageView{margin:auto;  max-width: 95%;max-height:80px;
				display: table-cell;vertical-align: middle;}
	.imgView{
		cursor: pointer;
		width: 300px;
		height: auto;
		padding-right: 5px;
	}			
	.modal_inner{height: 520px}
	.btn{
		cursor: pointer;
 		background: #ED891D;
  		display: inline-block;
  		padding: .3em 0.5em;
  		color: #fff;
  		border-radius: 3px;
	}
	.btn:hover,
	.btn:focus {
 	 	background: #FE9A2E;
	}
	input{font-size: 11px; height: 1em}
	table{border-collapse:collapse; border: 2px solid #000000; width:700px; text-align: center;display: inline-table; font-size: 12px;}
	a{text-decoration: none; color: black;}
	a:hover{font-weight: bold;}
	
</style>

<meta charset="EUC-KR">
<title>�� ���� ����</title>
</head>
<body>
<div style="width: 100%; text-align: center;">
	<p class="line"></p>

	<div id="resTitle" class="view" style="width: 700px; background: #FE9A2E; font-weight: bold;">
		<label id="resTitle">�� ���� ����</label>
	</div>
	<p class='line'></p>
	
	<div id="resTitle" class="view" style="width: 700px; background: #FBD46A; font-weight: bold;">
		<label id="resTitle">�� ���� ����</label>
	</div>
	<p></p>
	<div style="width: 700px;text-align: right; font-size: 11px;display: inline-block;">
		<form>
			<input id="COMP" type="radio" name="TYPE" value="COMP" checked><label for="COMP">��� �Ϸ� ���� ����</label>
			<input id="WAIT" type="radio" name="TYPE" value="WAIT" ><label for="WAIT">��� ��� ���� ����</label>
		</form>
	</div>
	
	<p></p>
	
	<table id="SPACE_LIST_TABLE" border="1">
		<colgroup>
			<col width="20%">
			<col width="*">
			<col width="10%">
			<col width="20%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">������</th>
				<th scope="col">��ϳ���</th>
				<th scope="col">�����Ȳ</th>
				<th scope="col">��������</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<p></p>
	
	<div id="SPACE_LIST_NUM"></div>
	<input type="hidden" id="SPACE_LIST_INDEX" name="SPACE_LIST_INDEX" />
	<input type="hidden" id="APPLY_LIST_INDEX" name="APPLY_LIST_INDEX" />
	
	<p class="line"></p>
	
	<div id="resTitle" class="view" style="width: 700px; background: #FBD46A; font-weight: bold;">
		<label id="resTitle">Q & A</label>
	</div>
	<p></p>
	<div style="width: 700px;text-align: right; font-size: 11px;display: inline-block;">
	<form>
		<input id="QnACOMP" type="radio" name="QnATYPE" value="QnACOMP" checked><label for="QnACOMP">�亯 �Ϸ� ����</label>
		<input id="QnAWAIT" type="radio" name="QnATYPE" value="QnAWAIT"><label for="QnAWAIT">�亯 ��� ����</label>
	</form>
	</div>
	<br>
	<table id="QNA_LIST_TABLE" border="1">
		<colgroup>
			<col width="20%">
			<col width="*">
			<col width="10%">
			<col width="15%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">������</th>
				<th scope="col">��ϳ���</th>
				<th scope="col">�����Ȳ</th>
				<th scope="col">����</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<p></p>
	<div id="QnA_LIST_NUM"></div>
	<input type="hidden" id="QnA_COMP_INDEX" name="QnA_COMP_INDEX" />
	<input type="hidden" id="QnA_WAIT_INDEX" name="QnA_WAIT_INDEX" />
	
	<p class="line"></p>
	
	<div id="resTitle" class="view" style="width: 700px; background: #FBD46A; font-weight: bold;">
		<label id="resTitle">�̿� �ı�</label>
	</div>
	<p></p>
	<table id="REPLY_LIST_TABLE" border="1">
		<colgroup>
			<col width="20%">
			<col width="*">
			<col width="20%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">������</th>
				<th scope="col">����</th>
				<th scope="col">����</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<p></p>
	<div id="REPLY_LIST_NUM"></div>
	<input type="hidden" id="REPLY_LIST_INDEX" name="REPLY_LIST_INDEX" />
	
	<!-- ============================���̾��˾�============================= -->
	<input class="modal-state" id="open-pop" type="checkbox" />
	<div class="modal">
		<label class="modal_bg" for="open-pop"></label>
		<div class="modal_inner">
			<input name="number" type="hidden" value="">
			<label class="modal_close" for="open-pop"></label>
			<h2 id="write" class="popup_title">���� �ۼ�</h2>
			<p class="popup_content" style="text-align: left;"></p>
			<div id="divPopTitle"><label>���� </label><br>
				<input type="text" id="popTitle" class="title txt" readonly="readonly">
			</div>
							
			<p class="subline"></p>
							
			<div id="divPopCnt">
				<label>���� </label><br>
				<textarea id="popCnt" rows="2" cols="10" class="content txt" readonly="readonly"></textarea>
			</div>
							
			<p class="subline"></p>
							
			<div id="divPopCmt">
				<label>�亯 ����</label><br>
				<textarea id="popCmt" rows="2" cols="10" class="content txt"></textarea>
			</div>
			<div id="divImage" style="text-align: center; display: none">
				<label>÷�� �̹���</label><br>
			</div>				
			<p class="subline"></p>
							
			<div id="divPopBtn">
				<label id="sendBtn" class="writeBtn" style="bottom: 2em;display: none;">�ۼ�</label>
			</div>
		</div>
	</div>
	
</div>

<%@ include file="/WEB-INF/common/include-body.jspf" %>
<script>
$(document).ready(function(){
	selectSpaceList(1);
	selectQnAList(1);
	selectReplyList(1);
	
	$("#COMP").click(function(){
		$("#SPACE_LIST_INDEX").val(1);
		selectSpaceList(1);
	});
	$("#WAIT").click(function(){
		$("#APPLY_LIST_INDEX").val(1);
		selectSpaceList(1);
	});
	$("#QnACOMP").click(function(){
		
		$("#QnA_COMP_INDEX").val(1);
		selectQnAList(1);
	});
	$("#QnAWAIT").click(function(){
		$("#QnA_WAIT_INDEX").val(1);
		selectQnAList(1);
	});
	$("#sendBtn").click(function(){
		if($.trim($("#popCmt").val())!=""){
			var com = new ComSubmit();
			com.setUrl("<c:url value='/mySpace/QnAcomment'/>");
			com.addParam("QNA_NUMBER",$(".modal_inner > input[name=number]").val());
			com.addParam("QNA_CMT",$("#popCmt").val());
			com.submit();
		}else{
			alert("�亯�� �޾��ּ���");
		}
	});
	
});

$(window).bind("pageshow", function (event) {
	if (event.originalEvent.persisted) {
		console.log('BFCahe�κ��� ������');
		$("#QnACOMP").attr("checked",true);
		$("#COMP").attr("checked",true);
		selectSpaceList(1);
		selectQnAList(1);
		selectReplyList(1);
		
	}else{
		console.log('���� ���� ������');
		$("#QnACOMP").attr("checked",true);
		$("#COMP").attr("checked",true);
		selectSpaceList(1);
		selectQnAList(1);
		selectReplyList(1);
	}
});

function selectSpaceList(page){
	var type = $("input[name=TYPE]:checked").val();
	console.log(""+type);
	var comAjax = new ComAjax();
	
	comAjax.setUrl("<c:url value='/mySpace/getSpaceList'/>");
	comAjax.setCallback("selectRegiListCallback");
	comAjax.addParam("PAGE_INDEX",page);
	comAjax.addParam("PAGE_ROW",3);
	comAjax.addParam("TYPE",type);
	comAjax.ajax();
}
function selectRegiListCallback(data){
	var type = $("input[name=TYPE]:checked").val();
	var body = $("#SPACE_LIST_TABLE > tbody");
	body.empty();
	var imageStr;
	var params;
	if($(data.list).length<=0){
		var str ="<tr>"+
				"<td colspan = '4'>��ȸ�� ����� �����ϴ�</td>"+
				"</tr>";
		body.append(str);
	}else{
		if(type=='WAIT'){
			params = {
					divId : "SPACE_LIST_NUM",
					pageIndex : "APPLY_LIST_INDEX",
					totalCount : data.total,
					recordCount : 3,
					eventName : "selectSpaceList"
				}
		}else{
			params = {
				divId : "SPACE_LIST_NUM",
				pageIndex : "SPACE_LIST_INDEX",
				totalCount : data.total,
				recordCount : 3,
				eventName : "selectSpaceList"
			}
		}
		
		gfn_renderPaging(params);
		

		var str="";
		if(type=='WAIT'){
			$.each(data.list, function(key,value){
			imageStr = (value.APPLY_IMG+"").split(",");
			str+="<tr>"+
			"<td><input type='hidden' name='S_ID' value='"+value.APPLY_NUM+"'>"+
			""+value.APPLY_TITLE+"</td>"+
			"<td>"+
				"<div class='subView'>"+
					"<img class='imageView' src='<c:url value='/image/"+imageStr[0]+"'/>'/>"+
					"<div class='cellView'>"+
						"����: "+value.APPLY_SIZE+"��<br>"+
						"����: "+value.APPLY_PRI+"��<br>"+
					"</div>"+
				"</div>"+
			"</td>"+
			"<td>��� �����</td>"+
			"<td class='controlView'><a href='#'>����</a>&nbsp;&nbsp;&nbsp;"+
			"<a class='deleteSpace' href='#'>����</a></td>"+
			"</tr>";
			});
		}else{
		var Regitype="��ϿϷ�";
		var holdpro = "����";
		$.each(data.list, function(key,value){
		if(value.SPACE_HOLD=='Y'){
			Regitype="��������";
			holdpro="�������";
		}else{
			Regitype="��ϿϷ�";
			holdpro = "����";
		}
			 
		imageStr = (value.SPACE_IMG+"").split(",");
		str+="<tr>"+
			"<td><input type='hidden' name='S_ID' value='"+value.SPACE_ID+"'>"+
			"<a class='titleLink' href='#'>"+value.SPACE_TITLE+"</a></td>"+
			"<td>"+
				"<div class='subView'>"+
					"<img class='imageView' src='<c:url value='/image/"+imageStr[0]+"'/>'/>"+
					"<div class='cellView'>"+
						"����: "+value.SPACE_SIZE+"��<br>"+
						"����: "+value.SPACE_PRI+"��<br>"+
					"</div>"+
				"</div>"+
			"</td>"+
			"<td>"+Regitype+"</td>"+
			"<td class='controlView'><a href='#'>����</a>&nbsp;&nbsp;&nbsp;"+
			"<a class='holdSpace' href='#'>"+holdpro+"</a>"+
			"<input type='hidden' name='HOLD' value='"+value.SPACE_HOLD+"'>&nbsp;&nbsp;&nbsp;"+
			"<a class='deleteSpace' href='#'>����</a></td>"+
		"</tr>";
		
		});
		}
		body.append(str);
		
		$(".titleLink").click(function(){
			var s_id=$(this).parent().find("input[name='S_ID']").val();
			var com = new ComSubmit();
			com.setUrl("<c:url value='/space/detailSpace'/>");
			com.addParam("SPACE_ID",s_id);
			com.submit();
		});
		$(".deleteSpace").click(function(){
			if(confirm("�����Ͻðڽ��ϱ�?")==true){
				com = new ComSubmit();
				com.setUrl("<c:url value='/mySpace/deleteSpace'/>");
				com.addParam("TYPE",type);
				com.addParam("SPACE_ID",$(this).parents("tr").find("input[name=S_ID]").val());
				com.submit();
			}
		});
		$(".holdSpace").click(function(){
			if(confirm($(this).text()+"�Ͻðڽ��ϱ�?")==true){
				com = new ComSubmit();
				com.setUrl("<c:url value='/mySpace/holdSpace'/>");
				com.addParam("HOLD",$(this).parent().find("input[name='HOLD']").val());
				com.addParam("SPACE_ID",$(this).parents("tr").find("input[name=S_ID]").val());
				com.submit();
			}
		})
	}
	
	
}

/* ============================================QNA ajax=================== */
function selectQnAList(page){
	var type = $("input[name=QnATYPE]:checked").val();
	
	var comAjax = new ComAjax();
	
	comAjax.setUrl("<c:url value='/mySpace/getQnAList'/>");
	comAjax.setCallback("selectQnAListCallback");
	comAjax.addParam("PAGE_INDEX",page);
	comAjax.addParam("PAGE_ROW",5);
	comAjax.addParam("QnATYPE",type);
	comAjax.ajax();
}
function selectQnAListCallback(data){
	var type = $("input[name=QnATYPE]:checked").val();
	var body = $("#QNA_LIST_TABLE > tbody");
	body.empty();
	var params;
	if($(data.list).length<=0){
		var str ="<tr>"+
				"<td colspan = '4'>��ȸ�� ����� �����ϴ�</td>"+
				"</tr>";
		body.append(str);
	}else{
		if(type=='QnAWAIT'){
			params = {
					divId : "QnA_LIST_NUM",
					pageIndex : "QnA_WAIT_INDEX",
					totalCount : data.total,
					recordCount : 5,
					eventName : "selectQnAList"
				}
		}else{
			params = {
				divId : "QnA_LIST_NUM",
				pageIndex : "QnA_COMP_INDEX",
				totalCount : data.total,
				recordCount : 5,
				eventName : "selectQnAList"
			}
		}
		
		gfn_renderPaging(params);
		

		var str="";
		if(type=='QnAWAIT'){
			$.each(data.list, function(key,value){
			str+="<tr>"+
			"<td><input type='hidden' name='S_ID' value='"+value.SPACE_ID+"'>"+
			"<a class='titleQnALink' href='#'>"+value.SPACE_TITLE+"</a></td>"+
			"<td>"+
				"<div class='otherView' name='qna'>"+
					"&nbsp;&nbsp;&nbsp;���� : "+value.QNA_TITLE+"<br>"+
					"<input name='QNA_TITLE' type='hidden' value='"+value.QNA_TITLE+"'>"+
					"<input name='QNA_CNT' type='hidden' value='"+value.QNA_CNT+"'>"+
					"<input name='QNA_CMT' type='hidden' value=''>"+
				"</div>"+
			"</td>"+
			"<td>�亯 �����</td>"+
			"<td><a class='writeQnA' href='#'>�亯</a>&nbsp;&nbsp;&nbsp;"+
			"<a class='deleteQnA' href='#'>����</a><input name='QNA_NUM' type='hidden' value='"+value.QNA_NUM+"'></td>"+
			"</tr>";
			});
		}else{
		$.each(data.list, function(key,value){
			str+="<tr>"+
			"<td><input type='hidden' name='S_ID' value='"+value.SPACE_ID+"'>"+
			"<a class='titleQnALink' href='#'>"+value.SPACE_TITLE+"</a></td>"+
			"<td>"+
				"<div class='otherView' name='qna'>"+
					"&nbsp;&nbsp;&nbsp;���� : "+value.QNA_TITLE+"<br>"+
					"<input name='QNA_TITLE' type='hidden' value='"+value.QNA_TITLE+"'>"+
					"<input name='QNA_CNT' type='hidden' value='"+value.QNA_CNT+"'>"+
					"<input name='QNA_CMT' type='hidden' value='"+value.QNA_CMT+"'>"+
				"</div>"+
			"</td>"+
			"<td>�亯 �Ϸ�</td>"+
			"<td><a class='deleteQnA' href='#'>����</a><input name='QNA_NUM' type='hidden' value='"+value.QNA_NUM+"'></td>"+
			"</tr>";
		});
		}
		body.append(str);
		
		$(".titleQnALink").click(function(){
			var s_id=$(this).parent().find("input[name='S_ID']").val();
			var com = new ComSubmit();
			com.setUrl("<c:url value='/space/detailSpace'/>");
			com.addParam("SPACE_ID",s_id);
			com.submit();
		});
		$(".otherView[name=qna]").click(function(){
			var type = $("input[name='QnATYPE']:checked").val();
			
			$("#open-pop").attr("checked",true);
			$(".popup_title").text("Q&A");
			$("#popTitle").val($(this).find("input[name=QNA_TITLE]").val());
			$("#popCnt").val($(this).find("input[name=QNA_CNT]").val());
			$("#popCmt").val($(this).find("input[name=QNA_CMT]").val());
			$("#divPopCmt").css("display","");
			$("#divImage").css("display","none");
			if(type=='QnACOMP'){
				$("#sendBtn").css("display","none");
				$("#popCmt").attr("readonly",true);
			}else{
				var num = $(this).parents("tr").find("input[name=QNA_NUM]").val();
				console.log(num);
				$("#sendBtn").css("display","");
				$("#popCmt").attr("readonly",false);
				$(".modal_inner > input[name=number]").val(num);
			}
			
		});
		$(".writeQnA").click(function(){
			$("#open-pop").attr("checked",true);
			$(".popup_title").text("Q&A");
			$("#popTitle").val($(this).parents("tr").find("input[name=QNA_TITLE]").val());
			$("#popCnt").val($(this).parents("tr").find("input[name=QNA_CNT]").val());
			$("#popCmt").val($(this).parents("tr").find("input[name=QNA_CMT]").val());
			$("#divPopCmt").css("display","");
			$("#divImage").css("display","none");
			var num = $(this).parents("tr").find("input[name=QNA_NUM]").val();
			console.log(num);
			$("#sendBtn").css("display","");
			$("#popCmt").attr("readonly",false);
			$(".modal_inner > input[name=number]").val(num);
		});
		$(".deleteQnA").click(function(){
			if(confirm("�����Ͻðڽ��ϱ�?")==true){
				var num=$(this).parent().find("input[name='QNA_NUM']").val();
				var com = new ComSubmit();
				com.setUrl("<c:url value='/mySpace/deleteQnA'/>");
				com.addParam("QNA_NUM",num);
				alert("�����Ǿ����ϴ�");
				com.submit();
			}
		});
	}
	
	
}
/* ==================================Reply Ajax================================== */
function selectReplyList(page){
	var comAjax = new ComAjax();
	
	comAjax.setUrl("<c:url value='/mySpace/getReplyList'/>");
	comAjax.setCallback("selectReplyListCallback");
	comAjax.addParam("PAGE_INDEX",page);
	comAjax.addParam("PAGE_ROW",5);
	comAjax.ajax();
}
function selectReplyListCallback(data){
	var body = $("#REPLY_LIST_TABLE > tbody");
	body.empty();
	var params;
	if($(data.list).length<=0){
		var str ="<tr>"+
				"<td colspan = '3'>��ȸ�� ����� �����ϴ�</td>"+
				"</tr>";
		body.append(str);
	}else{
		params = {
			divId : "REPLY_LIST_NUM",
			pageIndex : "REPLY_LIST_INDEX",
			totalCount : data.total,
			recordCount : 5,
			eventName : "selectReplyList"
		}
		gfn_renderPaging(params);
		var str="";
		var imageStr = "";
		$.each(data.list, function(key,value){
			imageStr = (value.REPLY_IMG+"").split(",");
			str+="<tr>"+
			"<td><input type='hidden' name='S_ID' value='"+value.SPACE_ID+"'>"+
			"<a class='titleReplyLink' href='#'>"+value.SPACE_TITLE+"</a></td>"+
			"<td>"+
				"<div class='otherView' name='reply'>"+
					"&nbsp;&nbsp;&nbsp;���� : "+value.REPLY_TITLE+"<br>"+
					"<input name='REPLY_TITLE' type='hidden' value='"+value.REPLY_TITLE+"'>"+
					"<input name='REPLY_CNT' type='hidden' value='"+value.REPLY_CNT+"'>"+
					"<input name='USER_ID' type='hidden' value='"+value.USER_ID+"'>";
					if(!gfn_isNull(imageStr)){
						for(var s in imageStr){
							str+=("<input type='hidden' name='imageUrl' value='<c:url value='/image/"+imageStr[s]+"'/>'/>");
						}
					}
				str+="</div>"+
			"</td>"+
			"<td><a class='deleteReply' href='#'>����</a><input name='REPLY_NUM' type='hidden' value='"+value.REPLY_NUM+"'></td>"+
			"</tr>";
		});
		
		body.append(str);
		
		$(".titleReplyLink").click(function(){
			var s_id=$(this).parent().find("input[name='S_ID']").val();
			var com = new ComSubmit();
			com.setUrl("<c:url value='/space/detailSpace'/>");
			com.addParam("SPACE_ID",s_id);
			com.submit();
		});
		$(".otherView[name=reply]").click(function(){
			var title = $(this).parents("tr").find(".titleReplyLink").text();
			var userId = $(this).find("input[name=USER_ID]").val();
			
			$("#open-pop").attr("checked",true);
			$(".popup_title").text(title+"�ۿ� �޸� "+userId+"���� �ı�");
			$("#popTitle").val($(this).find("input[name=REPLY_TITLE]").val());
			$("#popCnt").val($(this).find("input[name=REPLY_CNT]").val());
			$("#divPopCmt").css("display","none");
			$("#divImage").css("display","");
			
			$("#divImage").empty();
			$("#divImage").append("<label>÷�� �̹���</label><br>");
			
			$(this).parents("tr").find("input[name=imageUrl]").each(function(index,item){
				$("#divImage").append("<img class='imgView' src='<c:url value='/image/"+imageStr[index]+"'/>'/><br>");
			});
			
		});
		$(".deleteReply").click(function(){
			if(confirm("�����Ͻðڽ��ϱ�?")==true){
				var num=$(this).parent().find("input[name='REPLY_NUM']").val();
				var com = new ComSubmit();
				com.setUrl("<c:url value='/mySpace/deleteReply'/>");
				com.addParam("REPLY_NUM",num);
				alert("�����Ǿ����ϴ�");
				com.submit();
			}
		});
		$(".imgView").click(function(){
			var img=new Image();
			var url=$(this).attr("src");
			img.src=url;
			var img_width=img.width;
			var win_width=img.width+25;
			var img_height=img.height;
			var win=img.height+30;
			var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
			OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
		});
	}
	
	
}

</script>

</body>
</html>