<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<script type="text/javascript">
	$(document).ready(function() {

		$('#mypagemenu>ul>li>a').hover(function() {

			$(this).addClass('hover');

		}, function() {
			$(this).removeClass('hover');

		})

	})
</script>
<style type="text/css">
/* �޴��� */
#mypagemenubar {
position:fixed;
	float: left;
	margin-left: 5%;
	margin-top:50px;
	
	width: 150px;
}

#mypagemenu>ul>li>a {
	display: block;
}

#mypagemenu>ul {
	padding-left: 0;
	height: 300px;
}

#mypagemenu>ul>li {
	border: 1px solid #ccc;
	width: 150px;
	height: 50px;
	text-align: center;
	line-height: 50px;
}


/* �̺�Ʈ */
.hover {
	background-color: blueviolet;
	color: white;
}



</style>
			
				<nav id="mypagemenu">
					<ul>
						<li><a href="">���� ������ ����</a></li>

						<li><a href="">���� ���� ����</a></li>
						<li><a href="">1:1����</a></li>
						<li><a href="/two/member/MemberPwdCheck">�������� ����</a></li>
						<li><a href=""></a></li>
						<li><a href="">�� ���� ����</a></li>
					</ul>

				</nav>
			
