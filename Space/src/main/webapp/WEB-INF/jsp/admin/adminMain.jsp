<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<script type="text/javascript">
function memberList(){
	location.href="memberList"
}
function reqList(){
	location.href="reqList"
}
function spaceList(){
	location.href="spaceList"
}
function memberResList(){
	location.href="memberResList"
}
function QNAList(){
	location.href="QNAList"
}
function noticeList(){
	location.href="noticeList"
}
</script>
<head>
<meta charset="EUC-KR">
<title>������ ���� ���</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body >
<h1 align="center">������ ȭ��</h1>
<table class="adminMain" border="1" align="center" width="900" height="40" bgcolor="#999999">
<tr>
<td align="center"><a href="javascript:memberList()">ȸ�� ���</td>
<td align="center"><a href="javascript:reqList()">���� ��û ����</td>
<td align="center"><a href="javascript:spaceList()">��ϵ� ���� �Խ���</td>
<td align="center"><a href="javascript:memberResList()">���� ����</td>
<td align="center"><a href="javascript:QNAList()">1:1���� �Խ���</td>
<td align="center"><a href="javascript:noticeList()">�������� ����</td>
</tr>
</table>

</body>
</html>