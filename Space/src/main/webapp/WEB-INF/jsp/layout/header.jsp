<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/common/defualt-header.jspf" %>

<%

String id="�湮��";
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
    
    
#top{width: 100%;height: 100%;height: 100px; min-width: 1100px}
#menu{width: 70%;margin-left: 15%;}
.logo{width: 10%;float:left;font-size: 20px;}
.logo img{width: 130px;margin-top:10px;}
.logo img:hover{transition:all 0.3s ease-in; max-width:160px }
#msgBox{cursor:default; padding:10px; position:absolute; background: white; width: 150px;height: 300px; overflow-x:hidden;word-wrap:break-word;text-align: left;box-shadow: 0px 0px 5px 1px gray}
.msgDiv{border-bottom: 1px solid gray;}
.title{font-weight: bold;}
.content{font-size: 11px;}
.msgDate{font-size: 10px; font-weight: bold;}
.newMsg{background: red; border-radius: 5px; font-size: 5px;min-width:inherit;color: white; float: right;}
.msgBtn{cursor:pointer; font-size: 10px; font-weight: bold; float: right;margin-left: 5px;}
.read{opacity: 0.5}
/* width: 90px; margin-top:5px;   animation: rotate_image 10s linear infinite;
    transform-origin: 50% 50%;
 }

@keyframes rotate_image{ 
	100% {
    	transform: rotate(360deg);
    }
} */



.nav{talign-items: center;ext-align:center; margin:0px;float: right; position: relative;margin-top:20px}
.nav>li:not(.msgBoxBtn){width:150px;height:50px;float:left;display:flex ;align-items:center;} 
.nav>li>a{width: 100%;text-align: center;} 
.nav>li>a:hover{transition:all 0.3s ease-in;border-left:8px solid #ffaa28; }

.msgBoxBtn{width:30px;height:50px;float:left;display:flex ;align-items:center;} 


/*�޴� ��� */
.bar{text-align: center;}
.hide{border:5px solid #ffd01;position: fixed;top:calc(10%);left: calc(100% - 380px);display: none;padding: 0;border-radius: 10px;border:5px solid; border-color:#ffd014;}
.hide>li{background-color:white; cursor:pointer; height:50px;display:flex; align-items: center;position: relative;}
.hide>li>a{display:block;width: 100%; text-align: center;line-height: 50px;}
.hide>li>a:hover{transition:all 0.3s ease-in;background-color: gray;background-color:#41dfd0;color:white;border-bottom:10px solid #ffaa28}
.hide>li:last-child a:hover{border-bottom:5px solid #ffaa28}
 /*�޴� ����� ������  */
 #x{display: inline-block;width: 100%;text-align: center;padding-left: 50%}
.bar1, .bar2, .bar3 {
  width:30px;
  height: 5px;
  background-color: #333;
  margin: 6px 0;

} 

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
	
	$('.hide').slideToggle();
	console.log("click");

}); 


</script>
 <div id="top" >
        <div id="menu">
        
            <div class="logo">
            
           <a href="/two/main" target="_self"><img src="<c:url value='/image/gongan.png'/>"/>
           <!-- <img src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9IjUxMnB4IiB2aWV3Qm94PSItNCAwIDQ3MiA0NzIuMTE3NTgiIHdpZHRoPSI1MTJweCI+PHBhdGggZD0ibTM3MS40NjA5MzggNDM2LjExNzE4OGMtNTMuNjAxNTYzIDAtMTM2LjEyMTA5NC00NS42ODc1LTIxMi44MDA3ODItMTIyLjM5ODQzOC0xMDEuNTAzOTA2LTEwMS41MDM5MDYtMTQ4LjcwMzEyNS0yMTMuMzI4MTI1LTEwNy40NzI2NTYtMjU0LjU2MjUgMjAuNjI1LTIwLjY0MDYyNSA1OS4wODIwMzEtMjAgMTA4LjI1IDEuNjk5MjE5IDQ2LjgyNDIxOSAyMC42OTUzMTIgOTguNzgxMjUgNTguMjUzOTA2IDE0Ni4zMDQ2ODggMTA1Ljc3MzQzNyAxMDEuNTExNzE4IDEwMS40ODgyODIgMTQ4LjcxODc1IDIxMy4zMjAzMTMgMTA3LjQ3NjU2MiAyNTQuNTcwMzEzLTExLjMyODEyNSAxMC40MTAxNTYtMjYuMzk0NTMxIDE1Ljc5Mjk2OS00MS43NTc4MTIgMTQuOTE3OTY5em0tMjc4LjI4OTA2My0zNzZjLTExLjIwMzEyNS0uNzczNDM4LTIyLjI1IDIuOTcyNjU2LTMwLjY3MTg3NSAxMC4zOTg0MzctMTUuNDA2MjUgMTUuNDEwMTU2LTEzLjU5NzY1NiA0OC4zODY3MTkgNS4wMjM0MzggOTAuNDcyNjU2IDE5LjkwNjI1IDQ1LjA1ODU5NCA1Ni4yOTY4NzQgOTUuMjk2ODc1IDEwMi40NTcwMzEgMTQxLjQ1NzAzMSA0Ni4xNjAxNTYgNDYuMTYwMTU3IDk2LjM5MDYyNSA4Mi40NzI2NTcgMTQxLjQ1NzAzMSAxMDIuNDEwMTU3IDQyLjA4NTkzOCAxOC42MDU0NjkgNzUuMDU0Njg4IDIwLjQyMTg3NSA5MC40NzI2NTYgNS4wMzEyNSAxNS40MTQwNjMtMTUuMzk0NTMxIDEzLjU5NzY1Ni00OC4zODY3MTktNS4wMjczNDQtOTAuNDgwNDY5LTE5Ljg5NDUzMS00NS4wNjY0MDYtNTYuMjkyOTY4LTk1LjI4OTA2Mi0xMDIuNDUzMTI0LTE0MS40NTcwMzEtNDYuMTYwMTU3LTQ2LjE2Nzk2OS05Ni40MDIzNDQtODIuNTUwNzgxLTE0MS40NDE0MDctMTAyLjQ1NzAzMS0xOC43MDcwMzEtOS4wODU5MzgtMzkuMDQ2ODc1LTE0LjMxMjUtNTkuODE2NDA2LTE1LjM3NXptMCAwIiBmaWxsPSIjZmJkNjk5Ii8+PHBhdGggZD0ibTgxLjk4ODI4MSAzMzguMTQwNjI1Yy0xMi44MDA3ODEgMC0xNy40ODA0NjktNC4zMjgxMjUtMTkuODk0NTMxLTguOTQxNDA2LTQuMzIwMzEyLTguMjUtMy43MzA0NjktMjEuOTUzMTI1IDM5LjQ4MDQ2OS01NS4wOTc2NTcgMzUuNDA2MjUtMjYuMTQ0NTMxIDcyLjg5MDYyNS00OS4zNDM3NSAxMTIuMDg1OTM3LTY5LjM2NzE4NyAxNy40MTc5NjktOS4xMTMyODEgMTcwLjY2NDA2My04OC4wMzkwNjMgMTg4LjY2NDA2My01My42MDE1NjMgMTguMDA3ODEyIDM0LjQ3MjY1Ny0xMzQuMTM2NzE5IDExNS4zODI4MTMtMTUxLjU3NDIxOSAxMjQuNDgwNDY5LTM4LjgwMDc4MSAyMC43ODEyNS03OS4yMzQzNzUgMzguMzU5Mzc1LTEyMC44OTg0MzggNTIuNTUwNzgxLTE1LjM4MjgxMiA1LjY0MDYyNi0zMS41MDc4MTIgOS00Ny44NjMyODEgOS45NzY1NjN6bS01LjM2NzE4Ny0xNi41NDI5NjljMTEuMDIzNDM3IDQuMzUxNTYzIDczLjI1MzkwNi0xMS4yNTc4MTIgMTY2LjcxMDkzNy02MC4xNjAxNTZzMTQxLjc1MzkwNy05MS4xMDU0NjkgMTQ0LjQ2NDg0NC0xMDIuNjg3NWMtMTEuMTEzMjgxLTQuMzUxNTYyLTczLjI4OTA2MyAxMS4yNjE3MTktMTY2LjcxODc1IDYwLjE2MDE1Ni05My40MzM1OTQgNDguODk0NTMyLTE0MS43NTM5MDYgOTEuMTAxNTYzLTE0NC40NTcwMzEgMTAyLjY4NzV6bTMxMi0xNjIuMzk4NDM3IiBmaWxsPSIjYzBmNWY5Ii8+PHBhdGggZD0ibTgwLjEzMjgxMiAzNjMuMjYxNzE5Yy0yMi42NjQwNjIgMC0zOS4zNzUtNS44MDg1OTQtNDYuMzk4NDM3LTE5LjE5OTIxOS0yMS42NzU3ODEtNDEuNDY0ODQ0IDY4Ljg1NTQ2OS0xMTcuMzM1OTM4IDE2NS4wODU5MzctMTY3LjY3OTY4OCA5Ni4yMzA0NjktNTAuMzQzNzUgMjEwLjE2Nzk2OS04MS40OTYwOTMgMjMxLjg1NTQ2OS00MC4wNzQyMTggMjEuNjc5Njg4IDQxLjQ0OTIxOC02OC44Nzg5MDYgMTE3LjMxMjUtMTY1LjA4NTkzNyAxNjcuNjQ4NDM3LTY1LjA0Mjk2OSAzNC4wMzkwNjMtMTM4LjIwMzEyNSA1OS4zMDQ2ODgtMTg1LjQ1NzAzMiA1OS4zMDQ2ODh6bTMwNC41NDI5NjktMjMwLjUxOTUzMWMtMzcuNTk3NjU2IDAtMTAzLjQyOTY4NyAxOC41NTg1OTMtMTc4LjM5ODQzNyA1Ny44MTY0MDYtMTA4LjYzMjgxMyA1Ni44MzIwMzEtMTcwLjY0MDYyNSAxMjIuNTg5ODQ0LTE1OC4zNjcxODggMTQ2LjA1NDY4NyAxMi4yNjk1MzIgMjMuNDY0ODQ0IDEwMS42NTYyNSAxMCAyMTAuMjUzOTA2LTQ2LjgyNDIxOSAxMDguNjAxNTYzLTU2LjgyNDIxOCAxNzAuNjAxNTYzLTEyMi41NzQyMTggMTU4LjMzNTkzOC0xNDYuMDU0Njg3LTMuODA4NTk0LTcuMjU3ODEzLTE0Ljk4NDM3NS0xMC45OTIxODctMzEuODI0MjE5LTEwLjk5MjE4N3ptMCAwIiBmaWxsPSIjZGJkYmRiIi8+PHBhdGggZD0ibTgyLjUxNTYyNSAzOTEuMDc4MTI1Yy0zNy45MTc5NjkgMC02NS43OTI5NjktMTAuNTI3MzQ0LTc3LjEzNjcxOS0zMi4yMDcwMzEtMjcuMDMxMjUtNTEuNjc5Njg4IDUxLjQxNzk2OS0xNDQuMjg5MDYzIDE3OC42MDkzNzUtMjEwLjgzOTg0NCAxMjcuMTkxNDA3LTY2LjU1NDY4OCAyNDgtNzguMjM0Mzc1IDI3NS4wMzEyNS0yNi41NTQ2ODggMjcuMDMxMjUgNTEuNjc5Njg4LTUxLjQwNjI1IDE0NC4yODkwNjMtMTc4LjU5NzY1NiAyMTAuODM5ODQ0LTczLjgzMjAzMSAzOC42MzI4MTMtMTQ1LjQ3MjY1NiA1OC43NjE3MTktMTk3LjkwNjI1IDU4Ljc2MTcxOXptLTYyLjk2MDkzNy0zOS42MzI4MTNjMTkuNzE0ODQzIDM3LjY2NDA2MyAxMjYuMjM0Mzc0IDMzLjI2NTYyNiAyNTMuNDMzNTkzLTMzLjI5Njg3NCAxMjcuMTk5MjE5LTY2LjU1ODU5NCAxOTEuNTU4NTk0LTE1MS41ODk4NDQgMTcxLjg2MzI4MS0xODkuMjMwNDY5LTE5LjY5NTMxMi0zNy42NDA2MjUtMTI2LjI2MTcxOC0zMy4yODEyNS0yNTMuNDY0ODQzIDMzLjI4OTA2Mi0xMjcuMTk5MjE5IDY2LjU2NjQwNy0xOTEuNTM1MTU3IDE1MS41ODIwMzEtMTcxLjgzMjAzMSAxODkuMjM4Mjgxem0wIDAiIGZpbGw9IiM2Y2JhZTUiLz48cGF0aCBkPSJtMzc2LjE4NzUgMjQwLjEwOTM3NWMwIDc5LjUyNzM0NC02NC40Njg3NSAxNDQtMTQ0IDE0NC03OS41MjczNDQgMC0xNDQtNjQuNDcyNjU2LTE0NC0xNDRzNjQuNDcyNjU2LTE0NCAxNDQtMTQ0Yzc5LjUzMTI1IDAgMTQ0IDY0LjQ3MjY1NiAxNDQgMTQ0em0wIDAiIGZpbGw9IiMzZWQzYzUiLz48cGF0aCBkPSJtMzM1Ljc3MzQzOCAxNjUuMzQ3NjU2Yy0xNS4xNzE4NzYtMjkuMDU4NTk0LTM5Ljg0NzY1Ny01Mi4wMzkwNjItNjkuOTE0MDYzLTY1LjEwMTU2Mi03Mi41MzUxNTYtMTcuNTYyNS0xNDYuNDU3MDMxIDIzLjI1MzkwNi0xNzAuMjM0Mzc1IDkzLjk5NjA5NC0yMy43ODEyNSA3MC43MzgyODEgMTAuNDc2NTYyIDE0Ny45MjE4NzQgNzguODkwNjI1IDE3Ny43MzgyODEgNTQuOTEwMTU2IDEzLjMwNDY4NyAxMTIuNTE5NTMxLTYuNzYxNzE5IDE0Ny4yNzczNDQtNTEuMzAwNzgxIDM0Ljc1NzgxMi00NC41MzkwNjMgNDAuMjI2NTYyLTEwNS4zMDA3ODIgMTMuOTgwNDY5LTE1NS4zMzIwMzJ6bTAgMCIgZmlsbD0iIzQxZGZkMCIvPjxwYXRoIGQ9Im0yMTAuNjgzNTk0IDIyMS4xOTkyMTljMCAxMS4wNDI5NjktOC45NTMxMjUgMjAtMjAgMjAtMTEuMDQyOTY5IDAtMjAtOC45NTcwMzEtMjAtMjAgMC0xMS4wNDY4NzUgOC45NTcwMzEtMjAgMjAtMjAgMTEuMDQ2ODc1IDAgMjAgOC45NTMxMjUgMjAgMjB6bTAgMCIgZmlsbD0iIzM3YmJhZSIvPjxwYXRoIGQ9Im0yMDguNDA2MjUgMjExLjkyNTc4MWMtNS4xMjEwOTQtOS43ODUxNTYtMTcuMjA3MDMxLTEzLjU3MDMxMi0yNi45OTIxODgtOC40NDkyMTktLjEyMTA5My4wNjY0MDctLjIxMDkzNy4xNTIzNDQtLjMyMDMxMi4yMTg3NS00LjE1NjI1IDcuNzMwNDY5LTIuNzgxMjUgMTcuMjY5NTMyIDMuMzg2NzE5IDIzLjUxNTYyNiA2LjE2Nzk2OSA2LjI1IDE1LjY5MTQwNiA3Ljc0MjE4NyAyMy40NzY1NjIgMy42ODM1OTMuMTIxMDk0LS4wNjY0MDYuMjE0ODQ0LS4xNTIzNDMuMzI4MTI1LS4yMTg3NSAzLjE0ODQzOC01LjgzOTg0MyAzLjE5NTMxMy0xMi44NjcxODcuMTIxMDk0LTE4Ljc1em0wIDAiIGZpbGw9IiMzOWMzYjYiLz48cGF0aCBkPSJtMzAwLjQ5MjE4OCAyODAuMzU5Mzc1YzExLjE2NDA2Mi0xMC4zNzEwOTQgMjMuNTE1NjI0LTE5LjM4MjgxMyAzNi44MDA3ODEtMjYuODUxNTYzbDM4LjU4OTg0My0yMC4wNTQ2ODdjLS44Mzk4NDMtMTguMTc5Njg3LTUuMTQwNjI0LTM2LjAzMTI1LTEyLjY3MTg3NC01Mi41OTc2NTZsLTcuNjU2MjUtMTQuNjI1LTUwLjIzODI4MiAyNi4xMjg5MDZjLTEzLjI4NTE1NiA3LjQ1NzAzMS0yNS42MzY3MTggMTYuNDY4NzUtMzYuODAwNzgxIDI2LjgzOTg0NGwtOS41OTc2NTYgOC44Nzg5MDZjLTI2LjQ0OTIxOSAyNC41NDI5NjktNTkuMjUgNDEuMTc1NzgxLTk0LjY3OTY4OCA0OC0xOC40MjU3ODEgMy41NzAzMTMtMzYuMjMwNDY5IDkuODEyNS01Mi44NTE1NjIgMTguNTI3MzQ0bC0xMC4wMDc4MTMgNS4yMzgyODEgNy4yMDMxMjUgMTMuNzE0ODQ0YzkuNDY0ODQ0IDE2LjAxMTcxOCAyMS45NjQ4NDQgMzAuMDI3MzQ0IDM2Ljc5Njg3NSA0MS4yNTM5MDYgMTYuMDY2NDA2LTguMTk1MzEyIDMzLjIwMzEyNS0xNC4xMDE1NjIgNTAuOTA2MjUtMTcuNTQyOTY5IDM1LjQyNTc4Mi02LjgzMjAzMSA2OC4yMzA0NjktMjMuNDYwOTM3IDk0LjY3OTY4OC00OHptMCAwIiBmaWxsPSIjMzRiMmE2Ii8+PHBhdGggZD0ibTMzOS45MjU3ODEgMTc0LjM2NzE4OC0zNC42MDkzNzUgMTcuOTkyMTg3Yy0xMy4yODUxNTYgNy40NTcwMzEtMjUuNjM2NzE4IDE2LjQ2ODc1LTM2LjgwMDc4MSAyNi44Mzk4NDRsLTkuNTk3NjU2IDguODc4OTA2Yy0yNi40NDkyMTkgMjQuNTQyOTY5LTU5LjI1IDQxLjE3NTc4MS05NC42Nzk2ODggNDgtMTguNDI1NzgxIDMuNTcwMzEzLTM2LjIzMDQ2OSA5LjgxMjUtNTIuODUxNTYyIDE4LjUyNzM0NGwtMTAuMDA3ODEzIDUuMjM4MjgxIDcuMjAzMTI1IDEzLjcxNDg0NGM5LjQ2NDg0NCAxNi4wMTE3MTggMjEuOTY0ODQ0IDMwLjAyNzM0NCAzNi43OTY4NzUgNDEuMjUzOTA2IDE2LjA2NjQwNi04LjE5NTMxMiAzMy4yMDMxMjUtMTQuMTAxNTYyIDUwLjkwNjI1LTE3LjU0Mjk2OSAzNS40MjU3ODItNi44MzIwMzEgNjguMjMwNDY5LTIzLjQ2MDkzNyA5NC42Nzk2ODgtNDhsOS41NTg1OTQtOC44Nzg5MDZjMTEuMTY0MDYyLTEwLjM3MTA5NCAyMy41MTk1MzEtMTkuMzgyODEzIDM2LjgwMDc4MS0yNi44NDc2NTZsMTQuMTIxMDkzLTcuMzM1OTM4YzIuNDE3OTY5LTI0LjUzOTA2Mi0xLjU1MDc4MS00OS4yODkwNjItMTEuNTE5NTMxLTcxLjgzOTg0M3ptMCAwIiBmaWxsPSIjMzljM2I2Ii8+PHBhdGggZD0ibTMxNi41NjY0MDYgMTIzLjU3NDIxOWMtMTguNzA3MDMxLTEzLjUxMTcxOS00MC4zNzg5MDYtMjIuMzM5ODQ0LTYzLjIwMzEyNS0yNS43NTM5MDctMTkuNjI1IDcuNjc1NzgyLTM4LjQ3NjU2MiAxNy4yMDMxMjYtNTYuMjkyOTY5IDI4LjQ1NzAzMmwtMjkuODY3MTg3IDE4Ljk0NTMxMmMtMTQuODk4NDM3IDkuNDUzMTI1LTMwLjUzMTI1IDE3LjY5OTIxOS00Ni43NSAyNC42NTYyNWwtMTcuNzY5NTMxIDcuNjIxMDk0Yy05LjcwNzAzMiAyMC4wNzQyMTktMTQuNjM2NzE5IDQyLjEyMTA5NC0xNC4zOTg0MzggNjQuNDE3OTY5IDEyLjYyODkwNi03LjYyMTA5NCAyNC4zNDM3NS0xNi42Njc5NjkgMzQuOTEwMTU2LTI2Ljk2MDkzOCAyNS44MTY0MDctMjUuMjEwOTM3IDU4LjE4NzUtNDIuNjcxODc1IDkzLjQzMzU5NC01MC4zOTg0MzdsMTIuNzUtMi44MDA3ODJjMTQuODkwNjI1LTMuMjYxNzE4IDI5LjM0Mzc1LTguMjgxMjUgNDMuMDUwNzgyLTE0Ljk1MzEyNHptMCAwIiBmaWxsPSIjMzRiMmE2Ii8+PHBhdGggZD0ibTI2Ni4xOTUzMTIgMTAwLjQwNjI1LTIuMTA5Mzc0LS41MTE3MTljLTIuOTQxNDA3LS42NjQwNjItNS44OTA2MjYtMS4yNDIxODctOC44NTU0NjktMS43MzgyODEtLjY0MDYyNS0uMTAxNTYyLTEuMjU3ODEzLS4yMzgyODEtMS44OTg0MzgtLjMzNTkzOC0xOS42MTcxODcgNy42NzU3ODItMzguNDU3MDMxIDE3LjIwMzEyNi01Ni4yNjE3MTkgMjguNDU3MDMybC0yOS44NjcxODcgMTguOTQ1MzEyYy0xNC44OTg0MzcgOS40NTMxMjUtMzAuNTMxMjUgMTcuNjk5MjE5LTQ2Ljc1IDI0LjY1NjI1bC0xNy43Njk1MzEgNy42MjEwOTRjLTUuOTIxODc1IDEyLjI4NTE1Ni0xMC4wODIwMzIgMjUuMzQ3NjU2LTEyLjM1MTU2MyAzOC43OTI5NjlsLS4yMzgyODEgMS40OTYwOTNjLS44MDA3ODEgNC45ODgyODItMS4zMzIwMzEgMTAuMDE5NTMyLTEuNjAxNTYyIDE1LjA2NjQwNyAwIC4yODUxNTYgMCAuNTc0MjE5LS4wNDY4NzYuODU1NDY5LS4xMjg5MDYgMi43MjY1NjItLjE4MzU5MyA1LjQ2MDkzNy0uMTQ0NTMxIDguMTk5MjE4IDEyLjYyODkwNy03LjYyMTA5NCAyNC4zNDM3NS0xNi42Njc5NjggMzQuOTEwMTU3LTI2Ljk2MDkzNyAyNS44MTY0MDYtMjUuMjEwOTM4IDU4LjE4NzUtNDIuNjcxODc1IDkzLjQzMzU5My01MC4zOTg0MzhsMTIuNzUzOTA3LTIuODAwNzgxYzE0Ljg5MDYyNC0zLjI2MTcxOSAyOS4zMzk4NDMtOC4yODEyNSA0My4wNDY4NzQtMTQuOTUzMTI1bDM1LjMxMjUtMTguNTk3NjU2Yy0xMi4xMzI4MTItMTEuNjEzMjgxLTI2LjE5NTMxMi0yMS4wMTk1MzEtNDEuNTYyNS0yNy43OTI5Njl6bTAgMCIgZmlsbD0iIzM5YzNiNiIvPjxwYXRoIGQ9Im0zNTkuODM1OTM4IDMwNi41ODk4NDQtOC4zMDQ2ODggMi43MTg3NWMtMjMuNDE0MDYyIDcuNjkxNDA2LTQ1Ljc4OTA2MiAxOC4yNTM5MDYtNjYuNjA1NDY5IDMxLjQ0OTIxOGwtMTguNTI3MzQzIDExLjc1Yy0xOS4xMjEwOTQgMTIuMDgyMDMyLTM5LjYyODkwNyAyMS44MDg1OTQtNjEuMDgyMDMyIDI4Ljk2ODc1IDEyLjMyMDMxMyAyLjM3MTA5NCAyNC45MDIzNDQgMy4xMjEwOTQgMzcuNDE3OTY5IDIuMjI2NTYzIDExLjEwMTU2My01LjIyMjY1NiAyMS44NzUtMTEuMTI1IDMyLjI0NjA5NC0xNy42Nzk2ODdsMTguNTExNzE5LTExLjc0NjA5NGMxNi41LTEwLjQxMDE1NiAzNC4wMzUxNTYtMTkuMDgyMDMyIDUyLjMyMDMxMi0yNS44Nzg5MDYgNS4zMjQyMTktNi44MzIwMzIgMTAuMDE1NjI1LTE0LjEzMjgxMyAxNC4wMjM0MzgtMjEuODA4NTk0em0wIDAiIGZpbGw9IiMzNGIyYTYiLz48cGF0aCBkPSJtMjc0Ljk0OTIxOSAzNTkuNzAzMTI1YzE3Ljk0NTMxMi05LjM5NDUzMSAzMy42OTUzMTItMjIuNDgwNDY5IDQ2LjIxNDg0My0zOC40MDIzNDQtMTIuNTE1NjI0IDUuNjUyMzQ0LTI0LjYyMTA5MyAxMi4xNjQwNjMtMzYuMjM4MjgxIDE5LjQ4ODI4MWwtMTguNTI3MzQzIDExLjc1MzkwN2MtMTQuMTE3MTg4IDguOTE3OTY5LTI5LjAwNzgxMyAxNi41NDI5NjktNDQuNDk2MDk0IDIyLjc3MzQzNyAxOC41MzEyNS0xLjY5MTQwNiAzNi41NTA3ODEtNi45OTYwOTQgNTMuMDQ2ODc1LTE1LjYxMzI4MXptMCAwIiBmaWxsPSIjMzljM2I2Ii8+PHBhdGggZD0ibTcyLjE4NzUgNTYuMTE3MTg4YzAgMTMuMjUzOTA2LTEwLjc0MjE4OCAyNC0yNCAyNC0xMy4yNTM5MDYgMC0yNC0xMC43NDYwOTQtMjQtMjQgMC0xMy4yNTM5MDcgMTAuNzQ2MDk0LTI0IDI0LTI0IDEzLjI1NzgxMiAwIDI0IDEwLjc0NjA5MyAyNCAyNHptMCAwIiBmaWxsPSIjZWVhYzNkIi8+PHBhdGggZD0ibTQ4LjE4NzUgMzIuMTE3MTg4Yy00LjM5MDYyNS4wMTU2MjQtOC42OTUzMTIgMS4yNS0xMi40Mjk2ODggMy41NTg1OTMtNS44MzIwMzEgOS40MjE4NzUtNC40MTQwNjIgMjEuNjE3MTg4IDMuNDIxODc2IDI5LjQ1MzEyNSA3LjgzMjAzMSA3LjgzMjAzMiAyMC4wMjczNDMgOS4yNSAyOS40NDkyMTggMy40MjE4NzUgNC41NTg1OTQtNy4zODY3MTkgNC43NS0xNi42NjQwNjIuNTAzOTA2LTI0LjIzNDM3NS00LjI0NjA5My03LjU3MDMxMi0xMi4yNjU2MjQtMTIuMjM4MjgxLTIwLjk0NTMxMi0xMi4xOTkyMTh6bTAgMCIgZmlsbD0iI2ZmYjg0MSIvPjxwYXRoIGQ9Im00NDguMTg3NSA0MDguMTE3MTg4YzAgMTcuNjcxODc0LTE0LjMyNDIxOSAzMi0zMiAzMi0xNy42NzE4NzUgMC0zMi0xNC4zMjgxMjYtMzItMzIgMC0xNy42NzE4NzYgMTQuMzI4MTI1LTMyIDMyLTMyIDE3LjY3NTc4MSAwIDMyIDE0LjMyODEyNCAzMiAzMnptMCAwIiBmaWxsPSIjZTg4NjIzIi8+PHBhdGggZD0ibTQxNi4xODc1IDM3Ni4xMTcxODhjLTYuNTI3MzQ0IDAtMTIuODk4NDM4IDIuMDA3ODEyLTE4LjI0NjA5NCA1Ljc1MzkwNi04Ljg3MTA5NCAxMi42OTkyMTgtNy4zNTU0NjggMjkuOTM3NSAzLjYwMTU2MyA0MC44OTA2MjVzMjguMTk1MzEyIDEyLjQ2ODc1IDQwLjg5NDUzMSAzLjU5NzY1NmM2LjgyMDMxMi05Ljc3MzQzNyA3LjYzNjcxOS0yMi41MjM0MzcgMi4xMTcxODgtMzMuMDg1OTM3LTUuNTE1NjI2LTEwLjU1ODU5NC0xNi40NTMxMjYtMTcuMTcxODc2LTI4LjM2NzE4OC0xNy4xNTYyNXptMCAwIiBmaWxsPSIjZmQ5MjI2Ii8+PHBhdGggZD0ibTIyNi40MzM1OTQgMTUuOTk2MDk0LjI1LTE1Ljk5NjA5NCAxNS45OTYwOTQuMjUtLjI1IDE1Ljk5NjA5NHptMCAwIiBmaWxsPSIjZmJlZGJmIi8+PHBhdGggZD0ibTI1OC40MzM1OTQgNDcuOTk2MDk0LjI1LTE1Ljk5NjA5NCAxNS45OTYwOTQuMjUtLjI1IDE1Ljk5NjA5NHptMCAwIiBmaWxsPSIjZmJkNjk5Ii8+PHBhdGggZD0ibTE5NC40MzM1OTQgNDcuOTk2MDk0LjI1LTE1Ljk5NjA5NCAxNS45OTYwOTQuMjUtLjI0NjA5NCAxNS45OTYwOTR6bTAgMCIgZmlsbD0iI2ZiZWRiZiIvPjxwYXRoIGQ9Im0xNzYuMTg3NSA0MzIuMTE3MTg4aDE2djE2aC0xNnptMCAwIiBmaWxsPSIjZmJkNjk5Ii8+PHBhdGggZD0ibTIxNi4xODc1IDQ1My42Njc5NjloMTZ2MTguNDQ5MjE5aC0xNnptMCAwIiBmaWxsPSIjZmJlZGJmIi8+PHBhdGggZD0ibTI2NC4xODc1IDQyOS42Njc5NjloMTZ2MTguNDQ5MjE5aC0xNnptMCAwIiBmaWxsPSIjZmJlZGJmIi8+PHBhdGggZD0ibTk4Ljk4ODI4MSAzMzYuMTE3MTg4Yy00LjExMzI4MS0uMDA3ODEzLTcuNTUwNzgxLTMuMTMyODEzLTcuOTQ1MzEyLTcuMjI2NTYzLS4zOTg0MzgtNC4wOTM3NSAyLjM3NS03LjgyNDIxOSA2LjQxMDE1Ni04LjYyMTA5NCAzMy4wMTU2MjUtNi40ODgyODEgODguOTAyMzQ0LTI5LjAzMTI1IDE0NS44Nzg5MDYtNTguODQ3NjU2IDU2Ljc0NjA5NC0yOS43MDMxMjUgMTA3LjA0Njg3NS02Mi42ODc1IDEzMS4yOTY4NzUtODYuMTA1NDY5IDMuMTc5Njg4LTMuMDY2NDA2IDguMjQ2MDk0LTIuOTcyNjU2IDExLjMxMjUuMjEwOTM4IDMuMDY2NDA2IDMuMTc5Njg3IDIuOTcyNjU2IDguMjQyMTg3LS4yMDcwMzEgMTEuMzA4NTk0LTI1LjYwMTU2MyAyNC44MDA3ODEtNzYuMDk3NjU2IDU3Ljk0NTMxMi0xMzQuOTg0Mzc1IDg4LjgwMDc4MS01OS4xMTMyODEgMzAuOTQ1MzEyLTExNS4yNzM0MzggNTMuNTExNzE5LTE1MC4yMTg3NSA2MC4zNjcxODctLjUwNzgxMi4wODk4NDQtMS4wMjczNDQuMTI4OTA2LTEuNTQyOTY5LjExMzI4MnptMCAwIiBmaWxsPSIjYzBmNWY5Ii8+PHBhdGggZD0ibTI3NS43MzQzNzUgNDA0LjI4NTE1NmMtMS40MDYyNSAwLTIuNzg5MDYzLS4zNzUtNC0xLjA4NTkzNy00MC42MjUtMjQuNDYwOTM4LTc4LjAxMTcxOS01My45MjU3ODEtMTExLjI4OTA2My04Ny43MDcwMzEtMzQuNzY1NjI0LTM0LjE4MzU5NC02NC45MjU3ODEtNzIuNzUzOTA3LTg5LjcyMjY1Ni0xMTQuNzM0Mzc2LTIuMTk1MzEyLTMuODM1OTM3LS44NjMyODEtOC43MjY1NjIgMi45NzI2NTYtMTAuOTI1NzgxIDMuODM5ODQ0LTIuMTk1MzEyIDguNzMwNDY5LS44NjMyODEgMTAuOTI1NzgyIDIuOTcyNjU3IDI0LjA3ODEyNSA0MC43NTc4MTIgNTMuMzcxMDk0IDc4LjE5OTIxOCA4Ny4xMzY3MTggMTExLjM3NSAzMi4yODkwNjMgMzIuODEyNSA2OC41NzQyMTkgNjEuNDMzNTkzIDEwOCA4NS4yMDMxMjQgMy4xMTcxODggMS44MjQyMTkgNC42MjUgNS41MTE3MTkgMy42NzU3ODIgOS0uOTQ1MzEzIDMuNDg4MjgyLTQuMTEzMjgyIDUuOTA2MjUtNy43MjY1NjMgNS45MDIzNDR6bTAgMCIgZmlsbD0iI2ZiZDY5OSIvPjxwYXRoIGQ9Im0xMzYuOTg4MjgxIDM4NS4wMTE3MTljLTQuMDkzNzUtLjAxNTYyNS03LjUxNTYyNS0zLjEyMTA5NC03LjkyOTY4Ny03LjE5NTMxMy0uNDEwMTU2LTQuMDc0MjE4IDIuMzIwMzEyLTcuODAwNzgxIDYuMzI4MTI1LTguNjM2NzE4IDQ3Ljk4ODI4MS0xMC42Mjg5MDcgOTQuMjg5MDYyLTI3Ljc5Njg3NiAxMzcuNjAxNTYyLTUxLjAzMTI1IDQ0LjAxOTUzMS0yMi40NTMxMjYgODQuNzE4NzUtNTAuODk0NTMyIDEyMC45Mzc1LTg0LjUxMTcxOSAzLjIwNzAzMS0yLjkyOTY4OCA4LjE2Nzk2OS0yLjc2NTYyNSAxMS4xNzE4NzUuMzcxMDkzIDMuMDA3ODEzIDMuMTQwNjI2IDIuOTU3MDMyIDguMTA1NDY5LS4xMDkzNzUgMTEuMTgzNTk0LTM3LjMwMDc4MSAzNC42NTIzNDQtNzkuMjIyNjU2IDYzLjk3MjY1Ni0xMjQuNTY2NDA2IDg3LjEyNS00NC42NDQ1MzEgMjMuOTMzNTk0LTkyLjM3MTA5NCA0MS42MTMyODItMTQxLjgzMjAzMSA1Mi41MzkwNjMtLjUyNzM0NC4xMDE1NjItMS4wNjI1LjE1NjI1LTEuNjAxNTYzLjE1NjI1em0wIDAiIGZpbGw9IiM2Y2JhZTUiLz48cGF0aCBkPSJtMTE3Ljg1MTU2MiAzNTkuMDg1OTM4Yy00LjEwOTM3NC0uMDExNzE5LTcuNTQyOTY4LTMuMTQwNjI2LTcuOTM3NS03LjIzNDM3Ni0uMzk0NTMxLTQuMDg5ODQzIDIuMzc1LTcuODE2NDA2IDYuNDEwMTU3LTguNjEzMjgxIDQ5LjUxMTcxOS0xMS4yMTg3NSA5Ny4yMzgyODEtMjkuMjAzMTI1IDE0MS44Mzk4NDMtNTMuNDQ5MjE5IDQ2LjU4MjAzMi0yMy40NDE0MDYgODkuNTg5ODQ0LTUzLjQwMjM0MyAxMjcuNzE4NzUtODguOTc2NTYyIDMuMTQ4NDM4LTIuOTU3MDMxIDguMDc4MTI2LTIuODc4OTA2IDExLjEzMjgxMy4xNzU3ODEgMy4wNTQ2ODcgMy4wNTA3ODEgMy4xMzY3MTkgNy45ODA0NjkuMTc5Njg3IDExLjEyODkwNy0zOS4yMDMxMjQgMzYuODA4NTkzLTgzLjUzNTE1NiA2Ny43NDIxODctMTMxLjYwNTQ2OCA5MS44Mzk4NDMtNDUuOTc2NTYzIDI0Ljk2MDkzOC05NS4xNzE4NzUgNDMuNDYwOTM4LTE0Ni4yMDMxMjUgNTQuOTg0Mzc1LS41MDM5MDcuMDkzNzUtMS4wMTk1MzEuMTQ0NTMyLTEuNTM1MTU3LjE0NDUzMnptMCAwIiBmaWxsPSIjZGJkYmRiIi8+PC9zdmc+Cg==" /> --></a></div>
            <ul class="nav">
                <li><a href="/two/res/resInfo">����Ȯ��</a></li>
                
                <!-- �α��������� ������������ư ��Ÿ�����ϱ� -->
               <%if(!id.equals("�湮��")){%> 
               		<li>
                		<a id="myPageBtn" href="/two/member/MemberModifyForm">����������</a>
               		 </li>
               <%} %>
                <li class="log" >
                
                <!--�α��ξ��������  �α��ι�ư -->
                <%if(id.equals("�湮��")){%>
                	<a href="/two/login/loginForm"><%=log%></a></li>
               		
                	
                	
                <!-- �α���������� �α׾ƿ���ư���� ����-->
                <%}else{%>
                	<a href="/two/login/logout" onclick="return logout();"><%=log%></a></li>
                	<li class="msgBoxBtn">
                		<input type="hidden" id="MSG_INDEX" value="0"/>
                		<input type="hidden" id="MSG_ROW" value="5"/>
                		<img id="button" src="/two/image/Message.png" style="width: 20px"/>
                		<div id="newMsgDiv" style="min-width: 15px"></div>
	                	<div id="msgBox" hidden="true">
	                	</div>
               		 </li>
                	
                <%} %>
                	
                <li class="bar" onclick="">
                <div id="x">
                <div class="bar1"></div>
                <div class="bar2"></div>
                <div class="bar3"></div></div>
                	<ul class="hide">
                        <li><%=id %>��<span></span> </li>
                        <%if(!id.equals("�湮��")){%> 
                        <li><a href="/two/member/MemberModifyForm">������������</a></li> <%} %>
                        <li><a href="/two/res/resInfo">�����������</a></li>
                        <li><a href="/two/mypage/myFavList">���Ѱ�������</a></li>
                        <li><a href="/two/mySpace/SpaceControl">��������� ��������</a></li>
                        <li><a href="/two/etc/noticeList">��������</a></li>
                    </ul> 
                </li>
                
            </ul>
            
        </div>

    </div>
<script>
$(document).ready(function(){
	if($("#myPageBtn").length>0){
	$("#msgBox").offset({top:$(".msgBoxBtn").outerHeight(true)});
	console.log($(".msgBoxBtn").outerHeight(true));
	
	$("#button").click(function(){ 
		if($(document).find(".Activity").length==0){
			$(this).addClass("Activity");
			$(this).attr("src","/two/image/Message_Active.png");
			$("#msgBox").attr("hidden",false);
			$("#MSG_INDEX").val(1);
			getMessageList(0,0);
		}else{
			$(this).removeClass("Activity");
			$(this).attr("src","/two/image/Message.png");
			$("#msgBox").attr("hidden",true);
			$("#msgBox").empty(); 
		}
	});
	
	$("#msgBox").on("mousewheel",function(e){
		var index = $("#MSG_INDEX").val();
		var wheel=e.originalEvent.wheelDelta;
		if($("#msgBox").scrollTop()+$("#msgBox").innerHeight() >=$("#msgBox")[0].scrollHeight){
			var row = $("#MSG_ROW").val();
			var total = $("#MSG_TOTAL_COUNT").val();
			if((index*row)<total){
				$("#MSG_INDEX").val(Number(index)+1);
				getMessageList(0,0);
			}
		}
	});
	
	newMessageCheck();
	}
});
function newMessageCheck(){
	$.ajax({
		url:"<c:url value='/space/getNewMsgCount'/>",
		type:"POST",
		data : null,
		async : false,
		success : function(data, status){
			if (typeof (newMessageCount) == "function") {
				newMessageCount(data);
			} else {
				eval(newMessageCount + "(data);");
			}
		}
	});
}
function getMessageList(i, r){
	var index;
	var row;
	
	console.log("getMEssageList("+i+","+r+")");
	if(Number(i)>0 && Number(r)>0){
		index=i;
		row=r;
	}else{
		index = $("#MSG_INDEX").val();
		row = $("#MSG_ROW").val();
	}
	
	var data = "PAGE_INDEX="+index+"&PAGE_ROW="+row;
	$.ajax({
		url:"<c:url value='/space/getMessageList'/>",
		type:"POST",
		data : data,
		async : false,
		success : function(data, status){
			if (typeof (createMsgBox) == "function") {
				createMsgBox(data);
			} else {
				eval(createMsgBox + "(data);");
			}
		}
	});
}
function newMessageCount(data){
	$("#newMsgDiv").empty();
	if(data.count > 0){
		$("#newMsgDiv").append("<label class='newMsg'>"+data.count+"</label>");
	}
}
function createMsgBox(data){
	var list = data.list;
	var str = "";
	var className;
	list.forEach(function(item,index,arr){
		if(item.READ_CHECK=='Y') className = 'msgDiv read';
		else className = 'msgDiv';
		var msgDate = $.datepicker.formatDate("yy.mm.dd",new Date(item.M_DATE));
		
		str+="<div class='"+className+"'><input type='hidden' name='M_ID' value='"+item.M_ID+"'/>"+
		"<div><label class='title'>"+item.M_TITLE+"</label><label name='msgDel' class='msgBtn'>����</label><label name='msgOk' class='msgBtn'>Ȯ��</label></div><br>"+
		"<label class='content'>"+item.M_CONTENT+"</label><br>"+
		"<label class='msgDate'>"+msgDate+"</label><br>"+
		"</div>";
	});
	
	$("#msgBox").append(str);
	
	$("label[name='msgOk']").click(function(){
		$.ajax({
			url:"<c:url value='/space/updateMsgRead' />",
			type:"POST",
			data : "M_ID="+$(this).parents(".msgDiv").find("input[name=M_ID]").val(),
			async:false,
			success:function(data,status){
				$("input[value='"+data.ID+"']").parents(".msgDiv").addClass("read");
				newMessageCheck();
			}
		});
	});
	
	$("label[name='msgDel']").click(function(){
		
		$.ajax({
			url:"<c:url value='/space/deleteMsg' />",
			type:"POST",
			data : "M_ID="+$(this).parents(".msgDiv").find("input[name=M_ID]").val(),
			async:false,
			success:function(data,status){
				var index = $("#MSG_INDEX").val();
				var row = index * $("#MSG_ROW").val();
				
				$("input[value='"+data.ID+"']").parents(".msgDiv").addClass("read");
				$("#msgBox").empty();
				getMessageList(1,row);
				newMessageCheck();
			}
		});
	});
	
	if($("#MSG_TOTAL_COUNT").length > 0){
		$("#MSG_TOTAL_COUNT").val(data.TOTAL);
	}else{
		$("body").append("<input type='hidden' id='MSG_TOTAL_COUNT' value='"+data.TOTAL+"'/>");
	}
}
</script>