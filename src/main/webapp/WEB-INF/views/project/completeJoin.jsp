<%--
@JSP : completeJoin.jsp 
@Date : 2021.06.18
@Author : 이보희
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>StartFun</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">

	<!--  Meta tags -->
	<meta name="keywords" content="documentation template, help desk, open source, free template, freebies, bootstrap 4, bootstrap4">
	<meta name="description" content="Docs UI Kit is beautiful Open Source Bootstrap 4 UI Kit under MIT license. The UI Kit comes with 10 beautiful complete and functional pages including lots of reusable and customizable UI Blocks. Every component crafted with love to speed up your workflow.">

	<!-- Schema.org -->
	<meta itemprop="name" content="Documentation Help Desk by Htmlstream">
	<meta itemprop="description" content="Docs UI Kit is beautiful Open Source Bootstrap 4 UI Kit under MIT license. The UI Kit comes with 10 beautiful complete and functional pages including lots of reusable and customizable UI Blocks. Every component crafted with love to speed up your workflow.">
	<meta itemprop="image" content="docs-ui-kit-thumbnail.jpg">

	<!-- Open Graph -->
	<meta property="og:title" content="Documentation Help Desk by Htmlstream">
	<meta property="og:type" content="article">
	<meta property="og:url" content="https://htmlstream.com/preview/docs-ui-kit/index.html">
	<meta property="og:image" content="docs-ui-kit-thumbnail.jpg">
	<meta property="og:description" content="Docs UI Kit is beautiful Open Source Bootstrap 4 UI Kit under MIT license. The UI Kit comes with 10 beautiful complete and functional pages including lots of reusable and customizable UI Blocks. Every component crafted with love to speed up your workflow.">
	<meta property="og:site_name" content="Htmlstream">

	<!-- CSS font -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notosanskr.css">
	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/fontawesome-all.min.css">
	<!-- CSS Template -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css">
	<!-- CSS Demo -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/demo.css">
		
	<!-- common JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->
 
<main>
  <!-- Promo Section -->
  <section class="duik-promo bg-primary text-center" style="height: 300px;">
    <div class="container duik-promo-container">
      <div class="d-flex justify-content-center position-relative mh-35rem py-11">
        <div class="align-self-center w-md-75">

        </div>
      </div>
    </div>

    <!-- SVG BG -->
    <svg class="position-absolute bottom-0 left-0" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 1920 323" enable-background="new 0 0 1920 323" xml:space="preserve">
      <polygon fill="#ffffff" style="fill-opacity: .05;" points="-0.5,322.5 -0.5,121.5 658.3,212.3 "></polygon>
      <polygon fill="#ffffff" style="fill-opacity: .1;" points="-2,323 1920,323 1920,-1 "></polygon>
    </svg>
    <!-- End SVG BG -->
  </section>
  <!-- End Promo Section -->

  <!-- Icon Blocks -->
  <div class="container z-index-2 position-relative">
    <section class="duik-icon-block duik-icon-block--pull2top rounded">
      <div class="row no-gutters">
        <div class="col-md border-bottom border-md-bottom-0 shadow">
          <div class="duik-icon-block__item" style="padding-bottom: 30px;">
            <div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
            <c:set var="type" value="${type}" />
            <c:if test="${type eq 'support'}">
          		<h2 class="h3 text-center">성공적으로 리워드펀딩을 완료하였습니다!</h2>
          		<p>참여내역은 마이페이지에서 확인해주세요.</p><br><br><br><br>
            	<a class="btn btn-outline-primary" href="/startfun/mypage/join/supportlist.do">참여 프로젝트</a>
          	</c:if>
			<c:if test="${type eq 'invest'}">
				<h2 class="h3 text-center">성공적으로 투자펀딩을 완료하였습니다!</h2>
          		<p>투자내역은 마이페이지에서 확인해주세요.</p><br><br>
          		<a class="btn btn-outline-primary" href="/startfun/mypage/join/investlist.do">투자 프로젝트</a>
			</c:if>
          </div>
        </div>
	  </div>
    </div>
  </section><br><br><br><br><br>
</div>
</main>
  
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->  
</body>
</html>