<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script src="http://code.jquery.com/jquery-1.7.js"></script>
<%

String id="";
String log;

if(session.getAttribute("USER_ID")!=null){
	id=(String)session.getAttribute("USER_ID");
	request.setAttribute("USER_ID", id);
	log="�α׾ƿ�";
	
}else{
	log="�α���";
}
%>

   <style type="text/css">

    /* header */
    
#top{border-bottom:1px solid;width: 100%;height: 100%;height: 80px;margin-top:15px}
#menu{width: 70%;margin-left: 15%;}
.logo{width: 10%;float:left;font-size: 20px;}
.nav{margin:0px;float: right;margin-left: auto; position: relative;bord;}
.nav>li{float:left;display:inline-block;} 
.nav>li:not(:last-child){ margin-left:30px;}
/*�޴� ��� */
.hide{padding-left:0;right: 20px;position:absolute;margin:0 auto;}
.hide>li{border:1px solid;width:150xp; height:80px;box-sizing: border-box;border:1px solid}
.hide>li>a{display: block;width: 100%;text-align: center
   </style>
<script type="text/javascript">
function logout() {
	if(confirm("�α׾ƿ��Ͻðڽ��ϱ�?")==true){
		alert("�α׾ƿ��Ǿ����ϴ�.");
	}else{
		return false;
	}
}

</script>
 <div id="top" >
        <div id="menu">
            <div class="logo"><a href="/two/main">����</a></div>
            <ul class="nav">
                <li><a href="#">����Ȯ��</a></li>
                
                <!-- �α��������� ������������ư ��Ÿ�����ϱ� -->
               <%if(id != ""){%> 
               		<li>
                		<a href="/two/member/MemberModifyForm">����������</a>
               		 </li>
               <%} %>
                <li class="log" >
                
                <!--�α��ξ��������  �α��ι�ư -->
                <%if(id == ""){%>
                	<a href="/two/login/loginForm"><%=log%></a></li>
                	
                	
                <!-- �α���������� �α׾ƿ���ư���� ����-->
                <%}else{%>
                	<li><a href="/two/login/logout" onclick="return logout();"><%=log%></a></li>
                	
                <%} %>
                	
                <li class="bar">�޴�
                	<ul class="hide">
                            <li>${USER_ID}�� </li>
                             <%if(id != ""){%> 
                             <li><a href="/two/member/MemberModifyForm">������������</a></li> <%} %>
                            <li><a href="#">��ü ���� ����Ʈ ����</a></li>
                            <li><a href="#">�����������</a></li>
                            <li><a href="#">���Ѱ�������</a></li>
                            <li><a href="#">��������� ��������</a></li>
                            <li><a href="#">��������</a></li>
                           
                        </ul> 
                </li>
                
            </ul>
            
        </div>

    </div>
