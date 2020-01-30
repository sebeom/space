<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<head>
<%@ include file="/WEB-INF/include/include-adminHeader.jspf" %>
<meta charset="EUC-KR">
<title>회원 목록 리스트</title>
</head>
<body>
	<h2 align="center">회원 목록 리스트</h2>
	<table class="member_list" align="center" width="80%">
		<colgroup>
			<col width="20%"/>
			<col width="15%"/>
			<col width="20%"/>
			<col width="30%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">전화번호</th>
				<th scope="col">이메일</th>
				<th scope="col">가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.IDX }</td>
							<td class="title">
								<a href="#this" name="title">${row.TITLE }</a>
								<input type="hidden" id="IDX" value="${row.IDX}">
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="80%">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br/>
	
</body>
</html>