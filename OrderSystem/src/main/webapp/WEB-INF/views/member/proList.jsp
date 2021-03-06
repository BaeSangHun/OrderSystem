<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trainer Approval</title>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/applylist.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<script>
	var username = "${username}";
	var path = "${pageContext.request.contextPath}";
	window.onload = function(){
		proList();
	}
</script>
<script src="${pageContext.request.contextPath}/resources/js/statistics&menti/trainerApply.js"></script>
<style>
</style>
<jsp:include page="../gnb/head.jsp" flush="true" />
<body>
	<div id="wrapper">
	<h1>트레이너 신청 목록</h1>
	<table border="0">
	   <thead>
		<tr id="table_name">
			<td>사진</td>
			<td>신청일자</td>
			<td>아이디</td>
			<td>이름</td>
			<td>성별</td>
			<td colspan="3"></td>
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
							<img src="${pageContext.request.contextPath}/upload/${item.upFilename}" onError="javascript:this.src='/kopo/resources/images/icon/default-profile-icon.jpg'" class="psa">
 							</div> 
							</c:if>
 						</td>
						<td>
						<fmt:formatDate value="${item.applyDate}" pattern="yyyy-MM-dd" />
						</td>
						<td>${item.username}</td>
						<td>${item.name}</td>
						<td>${item.sex}</td>	
						<td><button class="info">상세보기</button></td>
 						<td>
							<input class="accept" name=username type="button" value="수락" onclick="grantDo();" />
						</td>
 						<td>
							<input class="reject" name=username type="button" value="거절" onclick="grantDel();" />
						</td>
						
						
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
 				<tr> 
 					<td colspan="7" class="nolist">신청된 트레이너가 없습니다.</td>
 				</tr>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
</div>
</body>
</html>