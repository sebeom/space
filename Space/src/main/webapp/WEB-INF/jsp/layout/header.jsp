<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
.nav{margin:0px;float: right;margin-left: auto; position: relative;}
.nav>li{float:left;margin-left:10px} 
.hide{position:absolute;   margin-top: 36px; right: 0; display: none;}
i{border: 1px solid;}


   </style>

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
                	<li><a href="/two/login/logout"><%=log%></a></li>
                	
                <%} %>
                	
                <li class="bar">
                
                <div>�޴�</div>
                   
                </li>
                <li class="hide">
                    <div>
                        <ul>
                            <li>${USER_ID}�� </li>
                                          <%if(id != ""){%> <li><a href="/two/member/MemberModifyForm">������������</a></li> <%} %>
                            <li><a href="#">��ü ���� ����Ʈ ����</a></li>
                            <li><a href="#">�����������</a></li>
                            <li><a href="#">���Ѱ�������</a></li>
                            <li><a href="#">��������� ��������</a></li>
                            <li><a href="#">��������</a></li>
                           
                        </ul> 
                    </div>
                </li>
            </ul>
            
        </div>

    </div>
