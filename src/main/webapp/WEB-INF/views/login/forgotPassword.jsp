<%--
@JSP : serchId.jsp 
@Date : 2021.06.24
@Author : 이보희
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
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

<!-- main -->
<main>
	<div class="container">
		<div class="justify-content-center py-11">
			<div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
		    	<h2 class="text-center">비밀번호 찾기</h2>
		    </div>
			<div class="col-lg-5 mx-auto">
			<div class="card">
			
			<div class="mx-auto col-sm-11 text-center mb-1 mt-5">
	          	<p>가입정보로 확인</p>
				<span style="font-size: 12px; color: gray">* 스타트펀 가입 시 사용하신 이메일을 입력하시면 <br>새 비밀번호를 생성할 수 있는 링크를 보내드립니다.</span>
	        </div>
			
			<form id="forgotPasswordForm" action="/startfun/forgotpassword.do" method="post">
				<div class="row mt-4 justify-content-center">
	          		<div class="form-group col-md-10 ">
	          			<input type="text" name="member_email" id="member_email" class="form-control form-pill-login" placeholder="이메일 입력">
	          		</div>
	          		<div class="form-group col-md-10 "> 
	          		<small id="phoneCheck"></small>
	          		</div>
							
				</div>
				
				<div class="mx-auto col-sm-11 text-center mb-5 mb-5">
	          		<button id="forgotPasswordBtn" type="submit" class="btn btn-sm btn-block btn-primary"> 확인 </button>
	          	</div>
	          	
	          	<div class="mx-auto col-sm-11 text-center mb-5 mt-5">
	          		<hr>
	          		<a href="/startfun/searchId.do" class="mr-3">혹시 아이디를 잊으셨나요?</a>
	          		<!-- <a href="/startfun/login.do" class="mr-3">로그인</a>
	          		<a href="/startfun/joinus/join.do">회원가입</a>  -->
	          	</div>
			  </form>
			</div>
		  </div>
		</div>
	</div>
</main>
<!-- End main -->

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</body>
<script type="text/javascript">

</script>
</html>