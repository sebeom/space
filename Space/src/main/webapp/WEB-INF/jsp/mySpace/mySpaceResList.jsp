<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/common/fullcalendar-header.jspf" %>
<%@ include file="/WEB-INF/common/defualt-header.jspf" %>
<meta charset="EUC-KR">
<title>�� ���� ���� ��Ȳ</title>
<style>
	.line{margin-bottom: 40px}
	.subline{margin:5px 0 5px 0; border: 0.5px solid #000000;}
	.view{display: inline-block; border: 2px solid #000000 ;padding: 5px; width: 500px;}
	.subView{float: left;display: table; vertical-align: middle; min-height: 150px;width: 100% }
	.textView.active{display: inherit;}
	.textView{display:none;}
	.price:after{content: " ��"}
	.cellView{text-align: left; vertical-align: middle; display: table-cell; width: 60%}
	.imageView{margin:auto;  max-width: 95%;max-height:150px; cursor:pointer;
				display: table-cell;vertical-align: middle;}
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
	
</style>
</head>
<body>

<c:if test="${!empty DATE_LIST}">
	<div class="resDiv">	
	<c:forEach var="list" items="${DATE_LIST}">
			<input name="res_date" type="hidden" value="${list.RDATE}">
	</c:forEach>
	</div>
</c:if>

<div style="width: 100%; text-align: center;">
	<p class="line"></p>

	<div id="resTitle" class="view" style="width: 700px; background: #FE9A2E; font-weight: bold;">
		<label id="resTitle">�� ���� ���� ��Ȳ</label>
	</div>
	<p class='line'></p>
	
	<div style="display: inline-block;width: 700px;">
		<div id="calendar" style="width: 100%;"></div>
	</div>
	
	<p class="line"></p>
	
	<div id="resDisplayView"></div>
</div>

<%@ include file="/WEB-INF/common/include-body.jspf" %>

<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var event = new Array();
			setCalEvent(event);
			var calendar = new FullCalendar.Calendar(calendarEl, {
				plugins: ['interaction','dayGrid' ],
				header: {
				left: 'today',
				center: 'title',
				right: 'prev,next'
				},
				events: event,
				columnHeaderText: function(date) {
						switch (date.getDay()){
						case 0: return '��';
						case 1: return '��';
						case 2: return 'ȭ';
						case 3: return '��';
						case 4: return '��';
						case 5: return '��';
						case 6: return '��';
						}
				},
				selectable:true,
				select:function(info){
					var comAjax = new ComAjax();
					
					var end = new Date(info.endStr);
					var dom = end.getDate();
					end.setDate(dom-1);
					end = $.datepicker.formatDate('yy-mm-dd',end);
					
					comAjax.setUrl("<c:url value='/mySpace/ResList'/>");
					comAjax.setCallback("selectResListCallback");
					comAjax.addParam("START",info.startStr);
					comAjax.addParam("END",end);
					comAjax.ajax();
				},
				locale : 'ko',
				titleFormat: {month: 'short', year: 'numeric'},
				monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'] ,
				monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
				buttonText: {today: '����', month: '��', week: '��', day: '��' , prev : '����', next:'����'}
			});

			calendar.render();
			$("#calBtn").click(function(){
				if($("#RES_TIME").length >0){
					var events = calendar.getEvents();
					var form = $("#activeRes")[0];
					$(form).append($("<input type='hidden' name = 'SPACE_ID' value='"+$('#spaceId').val()+"'>"));
					form.action = "<c:url value='/res/resPay'/>";
					form.submit();
				}else{
					alert("���� Ȯ�� �� Ŭ�����ּ���");
				}
			});
		});
	function selectResListCallback(data){
		var body = $("#resDisplayView");
		body.empty();
		var imageStr;
		if($(data.list).length<=0){
			var str ="<dl>"+
					"<dd colspan = '4'>��ȸ�� ����� �����ϴ�</dd>"+
					"</dl>";
			body.append(str);
		}else{
			var date;
			var str="";
			$.each(data.list, function(key,value){
				console.log(value.SPACE_ID);
			imageStr = (value.SPACE_IMG+"").split(",");
			date=$.datepicker.formatDate('yy-mm-dd', new Date(value.RES_APPLY_DATE));
			
			str+="<div class='view'>"+
			"<div class='subView'>"+
			"<img class='imageView' src='<c:url value='/image/"+imageStr[0]+"'/>'/>"+
			"<input type='hidden' name='SPACE_ID' value='"+value.SPACE_ID+"'>"+
			"<div class='cellView' style='font-size: 11px;'>"+
				"<label>���� ����</label>"+
				"<p class='subline'></p>"+
				"��û�� :<label class='inText'>"+date+"</label><br>"+
				"������ :<label class='inText'>"+value.SPACE_TITLE+"</label><br>"+
				"<p class='subline'></p>"+
				"<label>������ ����</label>"+
				"<p class='subline'></p>"+
				"�̸� :<label class='inText'>"+value.RES_NAME+"</label><br>"+
				"����ó :<label class='inText'>"+value.USER_PHONE+"</label><br>"+
				"�̸��� :<label class='inText'>"+value.RES_EMAIL+"</label><br>"+
			"</div></div></div>"+
			"<p></p>";
			
			});
			body.append(str);
			
			$(".imageView").click(function(){
				com = new ComSubmit();
				com.setUrl("<c:url value='/space/detailSpace'/>");
				com.addParam("SPACE_ID",$(this).parent().find("input[name='SPACE_ID']").val());
				com.submit();
			});
		}
		
		
	}
	function setCalEvent(event){
		var title;
		var time;
		$("input[name='res_date']").each(function(index, item){
			titles = $(item).val();
			event.push({
				start: titles,
				end:titles,
				backgroundColor: '#f7e600',
				allDay:true,
				rendering: 'background'
			});
		});
	}
	function getDayOfWeek(data){
		if(data == 'SUN') return '0';
		if(data == 'MON') return '1';
		if(data == 'TUE') return '2';
		if(data == 'WED') return '3';
		if(data == 'THU') return '4';
		if(data == 'FRI') return '5';
		if(data == 'SAT') return '6';
	}
	function comparisonDate(date){
		var now = new Date();
		if(date.getFullYear() < now.getFullYear()){
			return false;
		}else if(date.getFullYear() > now.getFullYear()){return true;}
		if(date.getMonth() < now.getMonth()){
			return false;
		}else if(date.getMonth() >now.getMonth()){return true;}
		if(date.getDate() > now.getDate()){
			return true;
		}
		return false;
	}
	function check(info){
		$(info).css("backgroundColor", '#f89b00');
	    $(info).css("borderColor",'#e78a00');
	    $(info).css("color","#f7e600");
    	$(info).removeClass('INACTIVE');
    	$(info).addClass('ACTIVE');
	}
	function unCheck(info){
		$(info).css("backgroundColor", '#f7e600');
		$(info).css("borderColor", '#e6d500');
	    $(info).css("color","#c56a00");
    	$(info).removeClass('ACTIVE');
    	$(info).addClass('INACTIVE');
    	/* info.el.style.borderColor = '#e6d500'; */
	}
	</script>
</body>
</html>