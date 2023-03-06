<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/main.js"></script>
<input type="hidden" value="${pageName}" class="pageName" name="pageName">
<div class="container"> 
	<div>
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
		  <ul class="navbar-nav">
		    <li class="nav-item active">
		      학교
		    </li>
		  </ul>
		</nav>
	</div>
	<div class="row">
		<div class="col-3">
			<ul class="list-group">
				<c:forEach items="${cateList}" var="c" >
					<li class="list-group-item ${pageName==c.cate_id ? 'list-group-item-primary':'' }">
						<a href="${contextPath}/board/list/${kind}/${c.cate_id}">${c.cate_name}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
			<div class="col-9"> 
				<c:if test="${pageName eq 'event'}">
					<%@include file ="school/event.jsp" %>
				</c:if>
				<c:if test="${pageName eq 'notice'}">
					<%@include file ="school/notice.jsp" %>
				</c:if>
				<c:if test="${pageName eq 'teacherInfo'}">
					<%@include file ="school/teacher.jsp" %>
				</c:if>
				<c:if test="${pageName eq 'free'}">
					<%@include file ="school/free.jsp" %>
				</c:if>
				<c:if test="${pageName eq 'cafe'}">
					<%@include file ="school/cafe.jsp" %>
				</c:if>
				<c:if test="${pageName eq 'intro'}">
					<%@include file ="school/intro.jsp" %>
				</c:if>
				<c:if test="${pageName eq 'join'}">
					<%@include file ="viceP/join.jsp" %>
				</c:if>
				<c:if test="${pageName eq 'p_join'}">
					<%@include file ="viceP/p_join.jsp" %>
				</c:if>
			</div>
	</div>
	<ul class="pagination">

	</ul>

	
</div>


<%@ include file="../layout/footer.jsp" %>


