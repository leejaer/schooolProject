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
			 	<input type="hidden" value="${kind}" name="kind">
			 	<input type="hidden" value="${pageName}" name="pageName">
			 	<button class="btn btn-primary btnnn">검색</button>
			</div>
			<div class="form-group">
			 	<a href="${contextPath}/board/list/vicep/join" type="button" class="btn btn-primary">새로고침</a>
			</div>
		</form>
	</div>
	<table class="table">
		<tr>
			<td>번호</td>
			<td>직업</td>
			<td>이름</td>
			<td>전화번호</td>
			<td>등록일</td>
			<td>상태</td>
			<td>결제</td>
		</tr>
		<c:forEach items="${list}" var="l">
			<form action="${contextPath}/approval/write" method="post">
				<tr>
					<td>
					<input type="hidden" value="${l.pno}" name="no">
					<input type="hidden" value="${kind}" name="k">
					<input type="hidden" value="${pageName}" name="p">
					<input type="hidden" value="vicep" name="progress">
					<input type="hidden" value="교감승인" name="state">
					${l.pno}
					</td>
					
					<td><a href="">${l.kind}</a>
					</td>
					<td><input type="hidden" value="${pageName}" name="kind">${l.pname}</td>
					<td>${l.tel}</td>
					<td>${l.joinDate}</td>
					<td>
						<c:if test="${l.kind == '교사'}">
				 			<select class="form-control mr-2 category" name="content">
							 	<option value="전학">전근</option>
								<option value="휴직">휴직</option>
								<option value="해고">해고</option>	
					 		</select>
				 		</c:if>
						<c:if test="${l.kind eq '학생'}">
				 			<select class="form-control mr-2 category" name="content">
							 	<option value="전학">전학</option>
								<option value="정학">정학</option>
								<option value="퇴학">퇴학</option>	
					 		</select>
				 		</c:if>
				 	</td>
					<td><button class="form-control">결정</button></td>
				</tr>
			</form>
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
	<a href="${contextPath}/people/write/vicep/${pageName}">입력</a>
</body>
</html>