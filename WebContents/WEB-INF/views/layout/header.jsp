<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배율 고등학교</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<script src="${contextPath}/resources/js/main.js"></script>
<script> const contextPath="${contextPath}"</script>

</head>
<body>
<nav class="navbar navbar-expand-sm bg-info navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="${contextPath}"><img alt="" src="${contextPath}/resources/images/배율.png" width="50"></a>

  <!-- Links -->
  <ul class="navbar-nav">
    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        학교
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="${contextPath}/board/list/school/intro">학교 소개</a>
        <a class="dropdown-item" href="${contextPath}/board/list/school/event">행사</a>
        <a class="dropdown-item" href="${contextPath}/board/list/school/notice">알림</a>
        <a class="dropdown-item" href="${contextPath}/board/list/school/teacherInfo">교직원 소개</a>
        <a class="dropdown-item" href="${contextPath}/board/list/school/free">자유 게시판</a>
        <a class="dropdown-item" href="${contextPath}/board/list/school/cafe">급식</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        학생
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">출석</a>
        <a class="dropdown-item" href="#">시간표</a>
        <a class="dropdown-item" href="#">성적표</a>
        <a class="dropdown-item" href="#">상점</a>
        <a class="dropdown-item" href="#">일과</a>
        <a class="dropdown-item" href="#">학생 게시판</a>
        <a class="dropdown-item" href="#">학생 건의</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        교직원
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">출석</a>
        <a class="dropdown-item" href="#">시간표</a>
        <a class="dropdown-item" href="#">성적 입력</a>
        <a class="dropdown-item" href="#">시설 이용신청</a>
        <a class="dropdown-item" href="#">교사 공유 게시판</a>
        <a class="dropdown-item" href="#">휴가/비품 신청</a>
        <a class="dropdown-item" href="#">수업 신청 현황표</a>
        <a class="dropdown-item" href="#">월급</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        행정
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">비품</a>
        <a class="dropdown-item" href="#">지출</a>
        <a class="dropdown-item" href="#">행사 입력</a>
        <a class="dropdown-item" href="#">공사</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        교감
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="${contextPath}/board/list/vicep/join">인원</a>
        <a class="dropdown-item" href="#">행사 결정</a>
        <a class="dropdown-item" href="#">결제</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        교장
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">결제</a>
        <a class="dropdown-item" href="#">행사 결정</a>
        <a class="dropdown-item" href="${contextPath}/board/list/principal/p_join">인원</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        기타
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">영양사</a>
        <a class="dropdown-item" href="#">경비</a>
      </div>
    </li>
  </ul>
</nav>
<br>
  


