<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<p class="bg-primary text-white center">입학 / 입사</p>
	<div class="my-3">
		<form action="${contextPath}/board/list/school/join/" method="get" class="form-inline searchForm">
		<select class="form-control mr-2 category">
		 	<option value="" >인원</option>
		 		</select>
		 			<input type="hidden" name="category" value="${pageName}">
		 			<select class="form-control mr-2 category" name="type">
					 	<option value="T" ${cri.type == 'S' ? 'selected':''}>학생</option>
						<option value="C" ${cri.type == 'TE' ? 'selected':''}>교사</option>
						<option value="W" ${cri.type == 'N' ? 'selected':''}>영양사</option>	
						<option value="W" ${cri.type == 'SA' ? 'selected':''}>경비</option>	
						<option value="W" ${cri.type == 'V' ? 'selected':''}>교감</option>	
						<option value="W" ${cri.type == 'P' ? 'selected':''}>교장</option>	
						<option value="W" ${cri.type == 'A' ? 'selected':''}>행정</option>	
			 	</select>
		 	<div class="form-group mr-2">
				<input type="search" class="form-control" name="keyword" value="${cri.keyword}">
			</div>
			<div class="form-group mr-2">
			 	<input type="hidden" value="${kind}" name="k">
			 	<input type="hidden" value="${pageName}" name="p">
			 	<button class="btn btn-primary btnnn">검색</button>
			</div>
			<div class="form-group">
			 	<a href="${contextPath}/board/list/principal/p_join" type="button" class="btn btn-primary">새로고침</a>
			</div>
		</form>
	</div>
	<table class="table">
		<tr>
			<td>번호</td>
			<td>상태</td>
			<td>내용</td>
			<td>결제</td>
		</tr>
		<c:forEach items="${list}" var="l">
			<tr>
				<td>${l.ano}</td>
				<td>${l.state}</td>
				<td>${l.content}</td>
				<td>
				<form action="${contextPath}/approval/ok" method="post">
					<input type="hidden" value="${kind}" name="k">
			 		<input type="hidden" value="${pageName}" name="p">
					<input type="hidden" value="${l.ano}" name="ano">
					<input type="hidden" value="${l.no}" name="no">
					<button>승인</button>
				</form>
				<form action="${contextPath}/approval/deny" method="post">
					<input type="hidden" value="${kind}" name="k">
				 	<input type="hidden" value="${pageName}" name="p">
					<input type="hidden" value="${l.ano}" name="ano">
					<input type="hidden" value="반려" name="state">
					<button>반려</button>
				</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<ul class="pagination">
		<c:if test="${p.prev}">
			<li class="page-item">
				<a class="page-link" href="${p.startPage-1}">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${p.startPage }" end="${p.endPage}" var="pageNum">
			<li class="page-item ${cri.page == pageNum ? 'active':''}">
				<a class="page-link" href="${pageNum}">${pageNum}</a>
			</li>		
		</c:forEach>
		<c:if test="${p.next}">
			<li class="page-item">
				<a class="page-link" href="${p.endPage+1 }">다음</a>
			</li>		
		</c:if>
	</ul>
</body>
</html>