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
.logo{width: 10%;float:left;font-size: 20px;margin-top:20px}
.nav{talign-items: center;ext-align:center; margin:0px;float: right; position: relative;}
.nav>li{width:150px;height:50px;float:left;display:flex ;align-items:center;} 
.nav>li>a{width: 100%;text-align: center;} 
.nav>li>a:hover{transition:all 0.3s ease-in;border-left:8px solid #ffaa28; }

/*�޴� ��� */
.bar{text-align: center;}
.hide{position: fixed;top:calc(10%);left: calc(100% - 380px);display: none;padding: 0; background-color: white;border-radius: 10px}
.hide>li{ cursor:pointer; height:50px;display:flex; align-items: center;position: relative;}

.hide>li:hover{transition:all 0.4s ease-in;border-bottom:10px solid #9400d3;background-color:50%}
.hide>li:hover:last-child{border-radius: 10px;}
.hide>li>a{display:block;width: 100%; text-align: center;line-height: 50px;}
.hide>li>a:hover{transition:all 0.4s ease-in;}
 /*�޴� ����� ������  */
 #x{display: inline-block;width: 100%}
.bar1, .bar2, .bar3 {
  width:calc(50%/3);
  height: 5px;
  background-color: #333;
  margin: 6px 0;

} 
   </style>
<script type="text/javascript">
function logout() {
	if(confirm("�α׾ƿ��Ͻðڽ��ϱ�?")==true){
		alert("�α׾ƿ��Ǿ����ϴ�.");
	}else{
		return false;
	}
}
$(document).on('click','.bar',function(){
	
	$('.hide').slideDown();
	console.log("click");

}); 


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
                	<a href="/two/login/logout" onclick="return logout();"><%=log%></a></li>
                	
                <%} %>
                	
                <li class="bar" onclick="">
                <div id="x">
                <div class="bar1"></div>
                <div class="bar2"></div>
                <div class="bar3"></div></div>
                	<ul class="hide">
                            <li>${USER_ID}��<span></span> </li>
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
