<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-adminHeader.jspf" %>
<meta charset="EUC-KR">
<script>
	$(document).ready(function(){
		$('h1').click(function(){
			$(this).next().toggle('slow', function(){
			});
		});
	});
</script>

<title>1:1 ���� ����Ʈ</title>
</head>
<body>
	<h1>1:1 ���� ����open&close</h1>
	<div>
		<h1>�̰���  �����ڸ�</h1>
		<p>�̰��� �亯�ڸ�</p>
	</div>
	<h1>2��° ����</h1>
	<div>
		<h1>��������  �����ڸ�</h1>
		<p>�亯�亯 �亯�ڸ�</p>
	</div>
</body>
</html>