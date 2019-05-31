<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/applylist.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<script>
	var path = "${pageContext.request.contextPath}";
	window.onload = function(){
		proList();
	}
</script>
<script src="${pageContext.request.contextPath}/resources/js/statistics&menti/trainerApply.js"></script>
<body>
	<h1>트레이너 신청 목록</h1>
	<table border="1">
	   <thead>
		<tr>
			<th>사진</th>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>신청일자</th>
			<th></th>
			<th></th>
		</tr>
		</thead>
		<tbody class="pro-list">
		<c:choose>
			<c:when test="${proList.size() > 0}">
				<c:forEach var="item" items="${proList}">
					<tr>
						<td class="upload-display">
							<c:if test="${item.upFilename != null}">
							<div class="upload-thumb-wrap">
							<img src="${pageContext.request.contextPath}/upload/${item.upFilename}">
							</div>
							</c:if>
						</td>
						<td>${item.username}</td>
						<td>${item.name}</td>
						<td>${item.sex}</td>				
						<td>${item.applyDate}</td>
						<td><button>상세보기</button></td>
						<td>
							<input name=username type="button" value="수락" onclick="grantDo();" />
							<input name=username type="button" value="거절" onclick="grantDel();" />
						</td>
						
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="7">등록된 트레이너가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
</body>
</html>