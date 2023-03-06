<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>
<div class="swiper mySwiper">
  <div class="swiper-wrapper">
    <div class="swiper-slide"><a href=""><img src="data:image/jpeg;base64,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"></a></div>
  </div>
  <div class="swiper-button-next"></div>
  <div class="swiper-button-prev"></div>
  <div class="swiper-pagination"></div>
</div>
<div class="container">
	<div class="row">
		<div class="col-1"></div>
		<div class="col-4">
			<table class="table table-hover">
				<thead>
			      <tr>
			        <th colspan="4">행사</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			      	<td></td>
			      	<td></td>
			      	<td></td>
			      	<td></td>
			      </tr>
			    </tbody>
			</table>		
		</div>
		<div class="col-1"></div>
		
		<div class="col-5">
			<table class="table table-hover">
				<thead>
			      <tr>
			        <th colspan="4">알림</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			      	<td></td>
			      	<td></td>
			      	<td></td>
			      	<td></td>
			      </tr>
			    </tbody>
			</table>		
		</div>
		<div class="col-1"></div>
	</div>
	
	<div class="row">
		<div class="col-1"></div>
		<div class="col-6">
			<table class="table table-hover">
				<thead>
			      <tr>
			        <th colspan="4">학교소개</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			      	<td></td>
			      </tr>
			    </tbody>
			</table>
		</div>
		<div class="col-1"></div>
		<div class="col-3">
			<table class="table table-hover">
				<thead>
			      <tr>
			        <th colspan="4">급식</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			      	<td></td>
			      	<td></td>
			      	<td></td>
			      	<td></td>
			      </tr>
			    </tbody>
			</table>		
		</div>
		<div class="col-1"></div>
	</div>
	
	<div class="row">
		<div class="col-1"></div>
		<div class="col-10">
			<table class="table table-hover">
				<thead>
			      <tr>
			        <th colspan="4">자유게시판</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			      	<td></td>
			      	<td></td>
			      	<td></td>
			      	<td></td>
			      </tr>
			    </tbody>
			</table>
		</div>
		<div class="col-1"></div>	
	</div>
	
	
</div>


<%@ include file="layout/footer.jsp" %>


<script>
var swiper = new Swiper(".mySwiper", {
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: {
      delay: 2500,
      disableOnInteraction: false,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
</script>