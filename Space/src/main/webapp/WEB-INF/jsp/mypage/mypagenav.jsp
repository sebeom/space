<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<script type="text/javascript">
	$(document).ready(function() {
/* �޴��� ���콺 �÷��� �� �����ϰ�   */
		$('#mypagemenu>ul>li').hover(function() {

			$(this).toggleClass('myhover');

		}, function() {
			$(this).removeClass('myhover');

		});

		
		
	});
	/* ���������� Ŭ���ҽ� ������ �޴� ���̰� �ϱ� */
	 $(document).on('click','.mypagebar',function(){
		
		$('.mypagehide>li').slideDown('hover',function(){
			
			$(this).css({"color":"purple"})
		});

	});
</script>
<style type="text/css">
/* �޴��� */
#mypagemenubar {position:fixed;	float: left;	margin-left: 5%;	margin-top:50px;width: 150px;}
#mypagemenu>ul>li>a {display: block;}
#mypagemenu>ul {padding-left: 0;height: 300px;}
#mypagemenu>ul>li {	border: 1px solid #ccc;	width: 150px;height: 50px;text-align: center;line-height: 50px;}


/*�������޴� ���콺 �����̺�Ʈ  */
.mypagehide{padding:0}
.mypagehide>li{display: none;}
.mypagehide>li>a{text-align: center;}
.mypagehide>li>a span{height: 5px;width:0%;background: #e91e63;display:block; transition:all 0.4s ease-in;}
.mypagehide li a:hover span{font-weight: bold;width: 100%}

/* ���콺�����̺�Ʈ */
.myhover>a {background:#41dfd0;transition:all 0.2s ease-in;color:white}
.myhover{background:#41dfd0; color:white;transition:all 0.2s ease-in;}

</style>
			
				<nav id="mypagemenu">
					<ul>
						<li><a href="/two/res/resInfo">���� ������ ����</a></li>

						<li><a href="/two/mypage/myFavList">���� ���� ����</a></li>
						<li><a href="/two/myInfo/QNAList">1:1����</a></li>
						<li><a href="/two/member/MemberModifyForm">�������� ����</a></li>
						
						<li class="mypagebar">�� ���� ����
			<ul class="mypagehide">
				<li><a href="/two/mySpace/spaceForm">�� ���� ����ϱ�</a></li>
				<li><a href="/two/mySpace/SpaceControl">�� ���� �����ϱ�</a></li>
				<li><a href="/two/mySpace/ResPage">�� ���� �����Ȳ</a></li>
			</ul>
		</li>
					</ul>

				</nav>
			
