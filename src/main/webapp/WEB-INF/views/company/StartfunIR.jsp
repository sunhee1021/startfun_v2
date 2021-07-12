<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>스타트펀 | 회사 소개</title>

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
	<style type="text/css">
		#img-back {
			background-image: url('${pageContext.request.contextPath}/resources/img/startfun-bg.jpg');
			background-repeat: no-repeat;
			background-size: cover;
			height: 80vh;
			
		}
		#img-dimm {
			height: 80vh;
			background: #000;
			opacity: .7;
		}
		
		#img-text {
			position: absolute;
		    top:45%;
		    left:50%;
		    transform: translate(-50%, -50%);                                                                   
		    color: white;
		    z-index: 2;
		    text-align: center;
		}
		
		#text-lg {
			font-weight: bold;
			font-size:2.5rem;
		}
		
		#inner-1 {
			margin: 0 auto;
			margin-left: 200px;
			margin-right: 200px;
			padding-top: 100px;
			padding-bottom: 120px;
			max-width: 1000px;
			letter-spacing: -.02em;
			width: 65%;
		}
		
		#mainWapper > .mainWapper-1 {
			float: left;
			width: 500px;
			line-height: 40px;
			font-size: 32px;
			font-weight: 700;
			word-break: keep-all;
			display: block;
		}
		
		#subWapper {
			float: right;
			letter-spacing: -.02em;
		}
		
		#subWapper > .subWapper-1 {
			margin-top: 0;
			line-height: 28px;
			font-size: 17px;	
		}
		
		.well {
			clear: both;
		}
		
		#inner-2 {
			padding-top: 100px;
			padding-bottom: 100px;
		}
		
		.well > .well-inner {
			background-color: #f0f2f5;
			display: flex;
		    flex-direction: column;
		    text-align: center;
		    font-weight: 700;
		    letter-spacing: -.02em;
		    line-height: -2em;
		}
		
		
		.well > .well-inner > p {
			color: rgba(0,0,0,.84);
		}
		
		.quote {
			margin: auto;
			padding-top: 50px;
			padding-bottom: 50px;
			color: gray;
		}
		
		body {
			color: rgba(0,0,0,.84);
		}
	</style>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->
<main>
<section id="img-back">
<div id="img-dimm"></div>
	<div id="img-text">
		<h2 style="color: white; margin-inline-start: 0px; margin-inline-end: 0px;" id="text-lg">
			<spring:message code="startFUN.title" text="default text" />
			<br>
			<spring:message code="startFUN.title2" text="default text" />
		</h2>
		<p style="color: white;" id="text-sm">
			<spring:message code="startFUN.subtitle1" text="default text" />
			<br>
			<spring:message code="startFUN.subtitle2" text="default text" />
		</p>
	</div>

</section>
<section>
	<div style="float: right; margin-bottom: 20px; transform: translate(-200%, 120%);">
			<select class="custom-select" id="testBox" style="width: 120px;">
				<option>언어&nbsp;선택</option>
				<option value="ko">한국어</option>
				<option value="en">English</option>
			</select>
	</div>
	<br><br>
	<div id="inner-1">
		<div id="mainWapper">
			<h1 class="mainWapper-1">
				<spring:message code="startFUN.mainWapper-1" text="default text" />
			</h1> 
		</div>
		<div id="subWapper">
			<p class="subWapper-1">
				<spring:message code="startFUN.subWapper-1" text="default text" />
				<br>
				<spring:message code="startFUN.subWapper-2" text="default text" />
				<br>
				<spring:message code="startFUN.subWapper-3" text="default text" />
			</p>
			<p>
				<spring:message code="startFUN.subWapper-4" text="default text" />
				<br>
				<spring:message code="startFUN.subWapper-5" text="default text" />
				<br>
				<spring:message code="startFUN.subWapper-6" text="default text" />
				<br>
				<spring:message code="startFUN.subWapper-7" text="default text" />
				<br>
				<spring:message code="startFUN.subWapper-8" text="default text" />
				<br>
				<spring:message code="startFUN.subWapper-9" text="default text" />
				<br>
				<spring:message code="startFUN.subWapper-10" text="default text" />
				<br>
				<spring:message code="startFUN.subWapper-11" text="default text" />
				<br>
				<spring:message code="startFUN.subWapper-12" text="default text" />
				<br>
				<spring:message code="startFUN.subWapper-13" text="default text" />
				<br>
				<spring:message code="startFUN.subWapper-14" text="default text" />
			</p>
		</div>
	</div>
</section>
<section>
	<div class="well" id="inner-2" style="margin: auto;">
		<div style="color: black;" class="well-inner">
			<span class="quote">
				<i class="fas fa-quote-left"></i>
			</span>
			<p><spring:message code="startFUN.introduc1" arguments="첫번째" text="default text" /></p> 
			<p><spring:message code="startFUN.introduc2" arguments="두번째" text="default text" /></p>
			<p><spring:message code="startFUN.introduc3" arguments="세번째" text="default text" /></p> 
			<p><spring:message code="startFUN.introduc4" arguments="네번째" text="default text" /></p>  
			<p><spring:message code="startFUN.introduc5" arguments="다섯번째" text="default text" /></p>  
			<span class="quote">
				<i class="fas fa-quote-right"></i>
			</span>
		</div>
	</div>
</section>
</main>
	<script>
		$(document).ready(function(){
		
			$('#testBox').on('change', function(){
				var lan = $('#testBox').val();
				
				location.href='<c:url value="startfun.do?lang='+lan+'"/>';	
			});
		});
	</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</body>
</html>