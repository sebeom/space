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
<form action="/two/main" method="POST">
      <div id="member">
        <h1>ȸ������</h1>

       <ul>
         <li><input class="size" type="text" name="id" id="" placeholder="���̵�"><button type="submit">�ߺ�üũ</button></li>
         <li><input type="password" name="pw" id=""placeholder="��й�ȣ"></li>
         <li><input type="password" name="pwcheck" id=""placeholder="��й�ȣȮ��"></li>
         <li><input type="text" name="name" id="name" placeholder="�̸�"></li>
         <li><input type="text" name="" id="" placeholder="�޴�����ȣ"></li>
         <li><input class="size" type="email" name="" id=""placeholder="�̸���"><button type="submit">������ȣ�ޱ�</button></li>
         <li><input class="size" type="text" name="" id=""placeholder="������ȣ�Է�"><button type="submit">������ȣ����</button></li>
         <li>
         <p>�̿��� ����<input type="checkbox"></p>
         <textarea rows="100" cols="10"  readonly="readonly" >
         �������������������������������������������������������������������������������������������������
         </textarea>   
         <li>
         <p>
          <button type="submit">ȸ������</button>
         </p>
         </li>
       
       </ul>

       </div>
    </form>