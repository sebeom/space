<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<head>
<%@ include file="/WEB-INF/include/include-adminHeader.jspf" %>
<meta charset="EUC-KR">
<title>���� ��û ���� ����Ʈ</title>
</head>
<body>
	<h2 align="center">���� ��û ����</h2>
	<table class="member_list" align="center" width="80%">
		<colgroup>
			<col width="20%"/>
			<col width="15%"/>
			<col width="20%"/>
			<col width="30%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">�׽�Ʈ��</th>
				<th scope="col">�׽�Ʈ��</th>
				<th scope="col">�׽�Ʈ��</th>
				<th scope="col">�׽�Ʈ��</th>
				<th scope="col">�׽�Ʈ��</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.IDX }</td>
							<td class="title">
								<a href="#this" name="title">${row.TITLE }</a>
								<input type="hidden" id="IDX" value="${row.IDX}">
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="80%">��ȸ�� ����� �����ϴ�.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br/>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#write").on("click", function(e) {
				e.preventDefault();
				fn_openBoardWrite();
			});
			
			$("a[name='title']").on("click", function(e){ 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});
		
	</script>
</body>
</html>