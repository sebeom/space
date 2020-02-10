<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
<head>
<style type="text/css">
	a:link { color: #414958; }
	a:visited { color: #4E5869; }
	a:hover, a:active, a:focus { text-decoration: none; }
	
	.content{position:absolute; left:50%; top:50%;}
	.box1 {float:left;width:250px;}
	.box2 {float:left;width:55%;} 
	.box3 {float:left;width:25%;} 
	  
</style>
<meta charset="EUC-KR">
<title>�������</title>


<script type="text/javascript"> 
function memberList(){
	location.href="memberList"
}
function reqList(){
	location.href="reqList"
}46260204194303
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

   </head>

<body>


<div class="main">
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
<br/>
<br/><br/>

<div class="container">
		<div class = "col-md-3"></div>
	
		<div class="page-header">
			<h2><b>������ �������</b><br/></h2><hr/><br/>
		</div>
			<c:choose>  
				<c:when test = "${fn:length(list) > 0}">
					<c:forEach var = "row" items = "${list}">
						<div class="box1"> 
							<img src = "${row.SPACE_IMG}" style = "width:200px; height:120px;" onerror = "this.src='http://placehold.it/200x120';">
						</div>
						<div class="box2" style = "line-height:140%; "> 
							<a href = "pensionDetail.do?idx=${row.SPACE_TITLE}"><b style = "font-size:16px; color:black;">${row.SPACE_TITLE}</b></a><br><br/>
							<span class = "space">
								<span></span>����Ư¡ : ${row.SPACE_USE} /
							<span class = "address">
								<span></span>�ּ� : ${row.SPACE_POS}<br>
							<span class = "date">
								<span></span> �����Ͻ� : ${row.RES_APPLY_DATE}<br>
							</span>
							<span class = "price"> 
								<span></span> ���� : ${row.SPACE_PRI}
							</span>
								<br/><br/> 
							</div>
							<div class="box3" style = "line-height:140%; ">
							������ : ${row.RES_NAME}<br>
							${row.USER_ID} / ${row.RES_NAME} <br>
							��ȭ��ȣ : ${row.USER_PHONE}<br> 
							�̸��� : ${row.RES_EMAIL }<br><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" name="delete" value="�������">
							<br><br/><br/><br>
							
							</div>
							<br/><br/><br>
							
						
						</div>
						
					</c:forEach> 
				</c:when> 
				<c:otherwise>
					����� ������ �������� �ʽ��ϴ�.
				</c:otherwise>
			</c:choose>
	</div>
	<br/>
   <br/>
   <br/>
</body>
</html>
