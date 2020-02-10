<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/common/include-adminHeader.jspf" %>
<meta charset="EUC-KR">
<title>������ �������� �󼼺���</title>
</head>
<body>
<br/> 
	<form id="frm">
	<table class="notice_detail" align="center" width="800" >
		<colgroup>
			<col width="7%" />
			<col width="70%" />
			<col width="8%" />
			<col width="15%" />
		</colgroup>
		<thead>
				<tr>
					<th scope="col">�۹�ȣ</th>
					<th scope="col">��  ��</th>
					<th scope="col">��ȸ��</th>
					<th scope="col">�ۼ���</th>
				</tr>
			</thead>
		<tbody>
			<tr>
				<td align="center">${map.NTC_NUM}</td>
				<td align="center">${map.NTC_TITLE}</td>
				<td align="center">${map.NTC_HIT}</td>
				<td align="center">${map.NTC_DATE}</td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<p><td colspan="4" height="200" style="padding-left:50px;">${fn:replace(map.NTC_CONTENT, cn, br)}</td></p>
			</tr>
		</tbody>
	</table>
	</form>
	<br/>
	<center>
	<a href="#this" class="btn" id="modify">�����ϱ�</a>
	<a href="#this" class="btn" id="list">�������</a>
	</center>
	
	<%@ include file="/WEB-INF/common/include-adminBody.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ 
				e.preventDefault();
				fn_noticeList();
			});
			
			$("#modify").on("click", function(e){ 
				e.preventDefault();
				fn_noticeModifyForm();
			});
		});
		
		function fn_noticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/noticeList' />");
			comSubmit.submit();
		}
		
		function fn_noticeModifyForm(){
			var ntc_num = "${map.NTC_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/noticeModifyForm' />");
			comSubmit.addParam("NTC_NUM", ntc_num);
			comSubmit.submit();
		}
	
	</script>
		

</body>
</html>