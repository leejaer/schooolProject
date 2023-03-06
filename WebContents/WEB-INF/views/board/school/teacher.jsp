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
	<p class="bg-primary text-white center">교사정보</p>
	<div class="my-3 ">
		<form action="${contextPath}/board/list/school/teacherInfo/" method="get" class="form-inline searchForm">	
			<div><a href="" type="button" class="btn btn-primary">교직원</a>
			<a href="" type="button" class="btn btn-primary">행정</a>
			<a href="" type="button" class="btn btn-primary">기타</a></div>
		</form>
		<form action="${contextPath}/board/list/school/teacherInfo/" method="get" class="form-inline searchForm">			
			<select class="form-control mr-2 category">
			 	<option value="">학년</option>
		 	 	<option value="1">1</option>
		 	 	<option value="2">2</option>
		 	 	<option value="3">3</option>
			 </select>
			<select class="form-control mr-2 category">
			 	<option value="" >반</option>
		 	 	<option value="1">1</option>
		 	 	<option value="2">2</option>
		 	 	<option value="3">3</option>
		 	 	<option value="4">4</option>
		 	 	<option value="5">5</option>
		 	 	<option value="6">6</option>
			 </select>
		 	<div class="form-group mr-2">
				<input type="search" class="form-control" name="keyword" value="${cri.keyword}">
			</div>
			<div class="form-group mr-2">
			 	<input type="hidden" value="${kind}" name="kind">
			 	<input type="hidden" value="${pageName}" name="pageName">
			 	<button class="btn btn-primary btnnn">검색</button>
			</div>>
			 <div class="form-group">
			 	<a href="${contextPath}/board/list/school/teacherInfo"  class="btn btn-primary">새로고침</a>
			 </div>
		</form>

	</div>
	<table class="table">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		<c:forEach items="${board}" var="b">
			<tr>
				<td>${b.sno}</td>
				<td>${b.title}</td>
				<td>${b.content }</td>
				<td>${b.writer }</td>
				<td>${b.writeDate }</td>
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