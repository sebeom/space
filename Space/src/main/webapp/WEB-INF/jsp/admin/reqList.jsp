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
	.box2 {float:left;width:45%;} 
	.box3 {float:left;width:35%;}
	  
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
<td align="center"><a href="javascript:spaceList()">��ϵ� ���� �����Խ���</td>
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
			<h2><b>���� ��û �����Խ���</b><br/></h2><hr/><br/>
		</div>
			<c:choose>  
				<c:when test = "${fn:length(list) > 0}"> 
					<c:forEach var = "row" items = "${list}">
						
						<div class="box1">  
							<img src = "${row.APPLY_IMG}" style = "width:200px; height:120px;" onerror = "this.src='http://placehold.it/200x120';">
						</div>
						<div class="box2" style = "line-height:140%; ">  
							<a href = "pensionDetail.do?idx=${row.APPLY_TITLE}"><b style = "font-size:16px; color:black;">${row.APPLY_TITLE}</b></a> 
							<c:if test = "${row.APPLY_MODIFY == 'N' }">
								<span style="color:red"><strong>(�ű�)</strong></span>
								</c:if> 
								<c:if test = "${row.APPLY_MODIFY == 'Y' }">
								<span style="color:blue"><strong>(����)</strong></span>
								</c:if>
								 
							<sapn class ="user">
								<span></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${row.USER_ID} / ${row.USER_NAME} / ${row.USER_PHONE} / ${row.USER_EMAIL}
							
							<br><br/>
							<span class = "space"> 
								<span></span>����Ư¡ : ${row.APPLY_USE}<br>
							<span class = "address">
								<span></span>�ּ� : ${row.APPLY_POS}<br>
							<span class = "price"> 
								<span></span> ���� : ${row.APPLY_PRI}
							</span>
					
								<br/><br/> 
							</div>
							<div class="box3" style = "line-height:140%; ">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="button" name="commit" value="����" style="width:50pt;height:20pt">
							<br><br> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" name="delete" value="����" style="width:50pt;height:20pt">
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
