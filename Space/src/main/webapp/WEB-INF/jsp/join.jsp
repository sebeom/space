<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <style type="text/css">
    #member{width:510px;margin:0 auto ;text-align: center;margin-bottom:100px;}
    #member>ul{padding-top: 50;width: auto;padding: 0;}
    #member>ul>li{padding-top: 20px;cursor: auto;}
    
    ul>li>input{width:100%;height:50px;margin-right: 5px;}
    .size{width: 80%;}
	li>p{text-align: left;}
    button{border:none;height:55px; vertical-align: middle;}
    li>button{width: auto;}
	textarea{width:100%; height:80px;resize: none;}
    p>button{width: 100%;background-color: #ffd014;}
    </style>
    
    <script type="text/javascript">
function checkfield() {
if(document.joinform.id.value==""){
	
	alert("���̵� �Է��ϼ���");
	document.joinform.id.focus();
	exit;
}
else if(document.joinform.pwd.value==""){
	
	alert("�н����带 �Է��ϼ���");
	document.joinform.pwd.focus();
}
else if(document.joinform.pwdcheck.value==""){
	
	alert("�н�����Ȯ���� �Է��ϼ���");
	document.joinform.pwdcheck.focus();
}
else if(document.joinform.name.value==""){
	
	alert("�̸��� �Է��ϼ���");
	document.joinform.name.focus();
}
else if(document.joinform.tel.value==""){
	
	alert("�ڵ�����ȣ�� �Է��ϼ���");
	document.joinform.tel.focus();

	exit;}

else if(document.joinform.email.value==""){
	
	alert("�̸����ּҸ� �Է��ϼ���");
	document.joinform.email.focus();
	exit;
}
else if(document.joinform.number.value==""){
	
	alert("������ȣ�� �Է��ϼ���");
	document.joinform.number.focus();
	exit;
}
}
    
    
    </script>
<form action="/two/main" name="joinform" method="POST">
      <div id="member">
        <h1>ȸ������</h1>

       <ul>
         <li><input class="size" type="text" name="id" id="id" placeholder="���̵�"><button type="submit">�ߺ�üũ</button></li>
         <li><input type="pwd" name="pwd" id="pwd"placeholder="��й�ȣ"></li>
         <li><input type="pwdcheck" name="pwdcheck" id="pwdcheck"placeholder="��й�ȣȮ��"></li>
         <li><input type="text" name="name" id="name" placeholder="�̸�"></li>
         <li><input type="tel" name="tel" id="tel" placeholder="�޴�����ȣ"></li>
         <li><input class="size" type="email" name="email" id="number"placeholder="�̸���"><button type="submit">������ȣ�ޱ�</button></li>
         <li><input class="size" type="number" name="number" id="number"placeholder="������ȣ�Է�"><button type="submit">������ȣ����</button></li>
         <li>
         <p>�̿��� ����<input type="checkbox"></p>
         <textarea rows="100" cols="10"  readonly="readonly" >
         �������������������������������������������������������������������������������������������������
         </textarea>   
         <li>
         <p>
          <button type="submit" value="����" onclick="">ȸ������</button>
         </p>
         </li>
       
       </ul>

       </div>
    </form>