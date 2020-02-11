<%@ page language="java" contentType="text/html; charset=euc-kr"
pageEncoding="euc-kr"%>
<%@ page session = "true" %>
<% 
String userId;
if(session.getAttribute("USER_ID") != null){
	userId = (String)session.getAttribute("USER_ID");
	request.setAttribute("USER_ID", userId);
}

%>
<%@ include file="/WEB-INF/common/calendar-header.jspf" %>

<style>
	.infoImage:hover{cursor: pointer; outline: black;}
	.favBtn:hover{cursor: pointer; outline: black;}
	/*����â  */
	#t{margin-left:calc(50% - 250px);margin-top:30px;border-radius: 10px;background-color:#bdbdbd1c}

select {
	 height:30px ;border:0
}
input{height: 30px;border:0}
#searchBtn{background-color:#F44336;border:0;color:white}
</style>
</head>

<div id="mainform" style="text-align:center; width: 100%;" >
<c:if test="${!empty USER_ID}">
	<input id="userId" type="hidden" value="${USER_ID}">
</c:if>
<table id="t" width="500px" height ="200px" 
	style=" border-spacing: 2px; border-collapse: separate;">
<tr>
<td>
<div style="float:left;  width: 50%;">
<label style="font-weight: bold; ">����</label><br>
<select id="use" name="purpose" style="width: 80%">
<option value="����ȸ">����ȸ</option>
<option value="��Ʃ���">��Ʃ���</option>
<option value="���̳���">���̳���</option>
<option value="�ܼ�Ʈ">�ܼ�Ʈ</option>
<option value="��Ƽ��">��Ƽ��</option>
<option value="��Ÿ">��Ÿ</option>
</select>
</div>

<div style="float:left;   width: 50%;">
<label style="font-weight: bold;">����</label><br>
<select id="pos" name="area" style="width: 80%">
<option value="����">����</option>
<option value="��⵵">��⵵</option>
</select>
</div>
</td>
</tr>
<tr>
<td>

<div id="maincontent" style="width: 50%; float:left;">
<label style="font-weight: bold;">�Ⱓ</label><br>
<input type="text" id="startDate" 
readonly="readonly" value="${START_DATE}" size="10">
<input type="text" id="endDate" 
readonly="readonly" value="${END_DATE}" size="10">
</div>

<div style="float:left;   width: 50% ;">	
<label style="font-weight: bold;">����</label><br>
<select id="size" name="land" style="width: 80%">
<option value="50">~50m��</option>
<option value="100">~100m��</option>
<option value="150">~150m��</option>
<option value="200">~200m��</option>
<option value="250">~250m��</option>
<option value="300">~300m��</option>
</select>
</div>
</td>

<tr>
<td colspan="2">
<div style="text-align:center; width: 100%">
<div style="display: inline-block; align-self: center">
<input id="searchTitle" type="text" placeholder="#���� ������, #��� ����ȸ" style="width: 400px; height: 20px">
<button id="searchBtn" style="font-size: 15px;" >�˻�</button>
</div>
</div>

</td>
</tr>
</table>
		<div style="width: 700px; display: inline-block;">
			<form id="radioForm" style="text-align: right;">
				<input type="radio" name="SEARCH_TYPE" value="read">�α�� <input
					type="radio" name="SEARCH_TYPE" value="new" checked="checked">�ֽż�
				<input type="radio" name="SEARCH_TYPE" value="pri">���ݳ�����
			</form>
		</div>
		<p>
		<div style="width: 800px; display: inline-block;">
			<table style="width: 800px;">
			<colgroup>
				<col width="35%">
				<col width="35%">
				<col width="35%">
			</colgroup>
			<c:if test="${empty SPACE_LIST}">
					�˻��� ����Ʈ�� �����ϴ�.
				</c:if>
				<c:forEach var="space" items="${SPACE_LIST}" varStatus="st">
					<c:set var="thumbnail" value="${fn:split(space.SPACE_IMG,',')[0]}"></c:set>
					<c:if test="${st.index % 3 == 0 }">
						<tr valign="top" style="width: inherit">
					</c:if>
					<td>
						<div id="info" class="spaceInfo" style="width: inherit;">
							<dl>
								<img class="infoImage" src="<c:url value='/image/${thumbnail}'/>" style="max-width: 270px;">
								<input type="hidden" id="spaceID" value="${space.SPACE_ID}">
							</dl>
							<dl>
								<div style="float:left; width: 80%; text-align:left;">
									${space.SPACE_ID}<br>
									${space.SPACE_TITLE}<br>
									${space.SPACE_USE} <br>	 ${space.SPACE_POS }<br>
									${space.SPACE_PRI}
								</div>
								<div class="favBtn" style="float:left; width: 20%">
								<%-- <c:set var="favImage" value="��"/>
								<c:forEach var="favID" items="${FAVORI_LIST}">
									<c:if test="${space.SPACE_ID eq favID}">
										<c:set var="favImage" value="��"/>
									</c:if>
								</c:forEach>
								${favImage} --%>
								</div>
							</dl>
						</div>
					</td>
					<c:if test="${st.index % 3 eq 2 or st.last}">
						<c:if test="${st.last}">
							<c:forEach var="i" begin="1" end="${3-(st.count mod 3 )}" step="1">
								<td></td>
							</c:forEach>
						</c:if>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
</div>
<%@ include file="/WEB-INF/common/include-body.jspf" %>
	<script type="text/javascript">
	$(document).ready(function(){
		fn_updateFavSpace();
		fn_setradioButton('${SEARCH_TYPE}');
		$("#searchBtn").on("click",function(e){
			console.log("Ȯ��");
			e.preventDefault();
			fn_searchSpaceList($(this));
		});
		$(".infoImage").on("click",function(e){
			e.preventDefault();
			
			fn_openSpaceDetail($(this));
		});
		$(".favBtn").on("click",function(e){
			e.preventDefault();
			var val = $(this).parents("div").find("#spaceID").val();
			var data = "SPACE_ID="+val; 
			$.ajax({
				url : "<c:url value='/space/updateFavori' />",
				type : "POST",
				data : data,
				async : false,
				success : function(data, status){
						if (typeof (fn_updateFavSpace) == "function") {
							fn_updateFavSpace(data);
						} else {
							eval(fn_updateFavSpace + "(data);");
						}
					}
				});
			});
		});
		$("input[name='SEARCH_TYPE']").change(function(){
			fn_sortSpaceList();
		});
		function fn_setradioButton(type){
			if(type !=null){
				$("#radioForm").find("input[value='"+type+"']").prop('checked',true);
			}
		}
		function fn_sortSpaceList() {
			var comSubmit = new ComSubmit();
			comSubmit.addParam("SEARCH_TYPE", $("input[name='SEARCH_TYPE']:checked").val());
			comSubmit.submit();
		}
		function fn_searchSpaceList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/space/SearchList'/>");
			comSubmit.addParam("START_DATE", $("#startDate").val());
			comSubmit.addParam("END_DATE", $("#endDate").val());
			comSubmit.addParam("SEARCH_TYPE", $("input[name='SEARCH_TYPE']:checked").val());
			comSubmit.addParam("TITLE", $("#searchTitle").val());
			comSubmit.addParam("USE", $("#use option:selected").val());
			comSubmit.addParam("POS", $("#pos option:selected").val());
			comSubmit.addParam("SIZE", $("#size option:selected").val());

			comSubmit.submit();
		}
		function fn_openSpaceDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/space/detailSpace'/>");
			comSubmit.addParam("SPACE_ID", obj.parent().find("#spaceID").val());
			comSubmit.submit(); 
		}
		function fn_updateFavSpace(data) {
			$(".favBtn").html("��");
			var info;
			var list;
			if(data == null){
				/* if(${!empty FAVORI_LIST}){
					data = {favList : ${FAVORI_LIST}};
				} */
			}
			if(data != null && !gfn_isNull($("#userId").val())){
				list=data.favList;
				list.forEach(function(item,index,arr){
				info = $(".spaceInfo").find("input[value="+item+"]");
				info.closest("div").find(".favBtn").html("��");
			});
			}
		}
	</script>
<!-- include file -->
