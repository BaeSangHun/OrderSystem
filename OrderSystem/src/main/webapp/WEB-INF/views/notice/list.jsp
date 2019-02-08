<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<script>
	function fn_formSubmit(page) {
		
		if(page == undefined){
			document.getElementById('page').value = 1;
			document.getElementById('form1').submit();
		}else{
			document.getElementById('page').value = page;
			document.getElementById('form1').submit();	
		}
		
	}
</script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>아이디</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${list.size() > 0}">
				<tbody>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.noticeId}</td>
							<td><a href="view?nid=${item.noticeId}">${item.noticeTitle}</a></td>
							<td>${item.id}</td>
							<td>${item.noticeViews}</td>
							<td><fmt:formatDate value="${item.noticeDate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</c:when>
			<c:otherwise>
				<p>등록 된 공지사항이 없습니다.</p>
			</c:otherwise>
		</c:choose>

	</table>

	<div>
			<c:if test="${SearchVO.totalPage>1}">
				<c:if test="${SearchVO.page>1}">
					<a href="javascript:fn_formSubmit(1);">처음</a>
					<a href="javascript:fn_formSubmit(${SearchVO.page-1});">이전</a>
				</c:if>

				<c:forEach var="i" begin="${SearchVO.pageStart}"
					end="${SearchVO.pageEnd}" step="1">
					<c:choose>
						<c:when test="${i eq SearchVO.page}">
							<c:out value="${i}" />
						</c:when>
						<c:otherwise>
							<a href="javascript:fn_formSubmit(${i});"><c:out value="${i}" /></a>
						</c:otherwise>
					</c:choose>
					<c:if test="${not status.last}">|</c:if>
				</c:forEach>

				<c:if test="${SearchVO.totalPage > SearchVO.page}">
					<a href="javascript:fn_formSubmit(${SearchVO.page+1});">다음</a>
					<a href="javascript:fn_formSubmit(${SearchVO.totalPage});">마지막</a>
				</c:if>
				

			</c:if>
		</div>



	<form id="form1" name="form1" method="post">
		<%-- 		<jsp:include page="../gnb/paging.jsp" flush="true" /> --%>
		<input type="hidden" name="page" id="page" value="" />
			<div>
			<input type="checkbox" name="searchType" value="notice_title"
				<c:if test="${fn:indexOf(SearchVO.searchType, 'notice_title')!=-1}">checked="checked"</c:if> />
			<label class="chkselect" for="searchType1">제목</label> <input
				type="checkbox" name="searchType" value="notice_contents"
				<c:if test="${fn:indexOf(SearchVO.searchType, 'notice_contents')!=-1}">checked="checked"</c:if> />
			<label class="chkselect" for="searchType2">내용</label> <input
				type="text" name="searchKeyword"
				value='<c:out value="${SearchVO.searchKeyword}"/>'
				onkeydown="if(event.keyCode == 13) {fn_formSubmit();}"> <input
				name="btn_search" value="검색" class="btn_sch" type="button"
				onclick="fn_formSubmit();" />

		</div>
	</form>
	<a href="add?nid=0">글쓰기</a>
</body>
</html>