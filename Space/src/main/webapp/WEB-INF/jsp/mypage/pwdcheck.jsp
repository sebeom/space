<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style type="text/css">

/* �����Һκ� */
h1{	margin-bottom:30px;}
#mypageform {width: 100%;}
/* ����������й�ȣ�Է¶� */
#pwdcheck {	width: 400px;margin: 0 auto;text-align: center;border: 1px solid #ccc;}
.pwdchecktable {margin: 10px;padding-left: 0;padding-bottom: 20px;}
.pwdchecktable>li {	list-style: none;text-align: center;}
.pwdchecktable>ul>li>a {	float: right}
.pwdchecktable>li>p {	padding-right: 0;}
.pwdchecktable>li>input {width: 100%;height: 50px;border: 1px solid #e0e0e0;}
h5 {margin-top: 10px;}
button {width: 100%;height: 50px;background-color: #ffd014;	display: block;	border: none;margin-top: 10px;font-size: 20px;}
</style>

<script type="text/javascript">
function fwdcheck() {
	if($("#user_password").val()==""){
		alert("��й�ȣ�� �Է����ּ���");
		$("#user_password").focus();
		return false;
	}
	
	
	return true;
}


</script>


<form action="/two/member/MemberModifyForm" id=pwdcheckfrm onsubmit="return fwdcheck();" method="post">
		<div id="mypageform">
		
			<h1>������������</h1>

						<!-- �н�����Ȯ��-->

			<div id="pwdcheck">
				<h5>������ �������������� ���ؼ�<br> ���� ������� 
				��й�ȣ�� �Է����ּ���</h5>
				<ul class="pwdchecktable">

					<li><input type="password" name="USER_PASSWORD" id="USER_PASSWORD"
						placeholder="��й�ȣ"></li>

					<li>
						<button type="submit">Ȯ��</button>

					</li>
					

				</ul>
		
			</div>



		</div>
	</form>
