<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<style type="text/css">

#memberchange{width:400px;margin:0 auto;text-align:center; margin-bottom:100px;}
#memberchange>ul{padding-top:50;width:auto;padding:0}
#memberchange>ul>li{padding-top:20px;cursor:auto}
#memberchange>ul>li>input{width:100%;height:50px;margin-right:5px}
.size{width:80%}
#memberchange>li>p{text-align:left}
#memberchange>li>button{border:none;height:55px;vertical-align:middle}
.button>li{display:inline-block}
.button>li>button{width:100%;background-color:#ffd014;}

</style>
<form action="" method="POST">
	<div id="memberchange">
		<h1>ȸ����������</h1>

		<ul>
			<li><input class="size" type="text" name="id" id=""placeholder="���̵�"></li>
			<li><input type="password" name="pw" id="" placeholder="��й�ȣ"></li>
			<li><input type="password" name="pwcheck" id=""
				placeholder="��й�ȣȮ��"></li>
			<li><input type="text" name="name" id="name" placeholder="�̸�"></li>
			<li><input type="text" name="" id="" placeholder="�޴�����ȣ"></li>
			<li><input class="size" type="email" name="" id=""placeholder="�̸���">
			<button type="submit">�������Ϲޱ�</button></li>
			<li>
				<ul class="button">
					<li><button type="submit">����</button></li>
					<li><button type="reset">���</button></li>
				</ul>




			</li>

		</ul>

	</div>
</form>