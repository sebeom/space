<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<style type="text/css">

#memberchange{width:400px;margin:0 auto;text-align:center; margin-bottom:100px;}
#memberchange>ul{padding-top:50;width:auto;padding:0}
#memberchange>ul>li{padding-top:20px;cursor:auto;font-size:20px; color:#9c27b0}

#memberchange>ul>li>input{width:100%;height:50px;margin-right:5px}
.size{width:80%}
#memberchange>li>p{text-align:left}
#memberchange>li button{border:none;height:55px;vertical-align:middle}
.button{width: 100%;left:0;padding: 0;float:left}
.button>li{display:inline-block;width: calc(90%/2);height: 50px}
.button>li>button{width:100%;background-color:#ffd014; border: none;height:100%}
::placeholder{color:black; font-size:20px}


.out{margin-top:10px}
.out:hover {
	color: red;
}
</style>

<script>
//��й�ȣ Ȯ��
function check(){
	
	if($("#USER_PASSWORD").val()=='${MemberInfo.USER_PASSWORD}'){
		 
		 alert("���� ��й�ȣ�� �����ϴ�. �ٸ� ��й�ȣ�� �Է����ּ���");
		 $("USER_PASSWORD").focus();
		 return false;
	 }
	else if($('#USER_PASSWORD').val()!=$('#pwdcheck').val()){
		
		alert("��й�ȣ�� ��ġ�����ʽ��ϴ�.");
		$("pwdcheck").focus();
		return false;
	}
	else{
		alert("�����Ǿ����ϴ�.");
		return true;
	}
	
}
 
function outcheck() {
	if(confirm("Ż���Ͻðڽ��ϱ�?")==true){
		
		alert("Ż�𼺰�");
		
	}else{
		alert("Ż�����");
		return false;
		
	}
	
}	


</script>
<form action="/two/member/memberModify" method="POST" onsubmit="return check();">
	<div id="memberchange">
		<h1>ȸ����������</h1>

		<ul>
			<li>���̵� : ${USER_ID}</li>
			<li><input type="password" name="USER_PASSWORD" id="USER_PASSWORD" placeholder="������ ��й�ȣ�� �Է����ּ���" ></li>
			<li><input type="password" name="pwdcheck" id="pwdcheck"placeholder="��й�ȣȮ��"></li>
			<li>�̸�: ${MemberInfo.USER_NAME}</li>
			<li><input type="tel" name="USER_PHONE" id="USER_PHONE" value="${MemberInfo.USER_PHONE}"></li>
			<li><input class="size" type="email" name="USER_EMAIL" id="USER_EMAIL" value="${MemberInfo.USER_EMAIL}">
			
			<li>
				<ul class="button">
					<li><button type="submit">����</button></li>
					<li><button type="reset">���</button></li>
				</ul>

			</li>

		</ul>
			<a class="out" href="/two/member/memberDelete" onclick="return outcheck();" id="delect">���� Ż���ϱ�</a>
	</div>
</form>