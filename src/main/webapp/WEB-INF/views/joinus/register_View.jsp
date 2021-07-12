<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>StartFun</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Favicon -->
	<link rel="shortcut icon" href="favicon.png">

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
  <section class="pt-8 pb-4">
    <div class="container mb-7">
   	  <div class="w-md-75 w-lg-50 mx-auto text-center">
           <h2 class="text-center">회원가입</h2>
          <p>가입 유형을 선택해 주세요.</p>
         </div><br>
         <div class="row">
         <div class="col-lg-3" ></div>
           <div class="col-lg-3" >
             <div class="mx-auto border">
             <div class="mx-auto text-center mb-5 mt-5">
             	<img src="${pageContext.request.contextPath}/resources/img/personimg.png" style="width: 120px; height: 120px">
             </div>
             <div class="text-center">
                <p style="font-size: 20px">개인회원<p>
             </div>
             <div class="text-center mb-5">
               <p style="font-size: 13px">프로젝트 참여 / 후원형 프로젝트 개설</p>
               <input type="button" class="btn btn-primary mb-2 mr-2 px-9" value="회원가입" onclick="location.href='/startfun/joinus/emailAuth.do'">
             </div>
             </div>
           </div> 
           <div class="col-lg-3 border" >
             <div class="mx-auto">
             <div class="mx-auto text-center mb-5 mt-5">
             	<img src="${pageContext.request.contextPath}/resources/img/officeimg.png" style="width: 120px; height: 120px">
             </div>
             <div class="text-center">
                <p style="font-size: 20px">법인회원<p>
             </div>
             <div class="text-center mb-5">
               <p style="font-size: 13px">투자형 프로젝트 개설</p>
               <input type="button" class="btn btn-primary mb-2 mr-2 px-9" value="회원가입" onclick="location.href='/startfun/joinus/companyEmailAuth.do'">
             </div>
             </div>
           </div> 
           <div class="col-lg-3" ></div>
         </div><br><br>
         <div class="text-center">
           	 <i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;이미 계정이 있으신가요?&nbsp;&nbsp;
           	 <a href="/startfun/login.do">로그인 바로가기</a>
           </div>
         </div>
  </section>
</main>
</body>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</html>