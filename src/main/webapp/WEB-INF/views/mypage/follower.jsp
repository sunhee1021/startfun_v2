<%--
@JSP : follower.jsp 
@Date : 2021.06.10
@Author : 정수빈
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>    
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
		<div class="row justify-content-center py-11">
			<div class="col-lg-9">
				<div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
					<h2 class="h3 text-center">팔로우</h2>
				</div>

				<ul class="nav nav-bordered justify-content-center" id="follow-tab" role="tablist">
					<li class="nav-item">
						<a class="nav-link"id="follow-tab-tab1" href="/startfun/mypage/following.do" aria-selected="false">팔로잉</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" id="follow-tab-tab2" data-toggle="tab" href="#follower-tab2-content" role="tab" aria-controls="follower-tab2-content" aria-selected="false">팔로워</a>
					</li>
				</ul>
				<div class="tab-content mt-5" id="follow-tabContent">
					<div class="tab-pane fade p-3 show active" id="following-tab1-content" role="tabpanel" aria-labelledby="demo-docs-tab-tab1">
						<ul class="list-group">
							<c:forEach items="${list}" var="n">
								<li class="list-group-item">
								<a href="#" class="link-dark link-hover-dark bg-hover-light">
									<div class="media align-items-center">
										<div class="d-flex mr-3">
											<img class="rounded-circle shadow mt-1" src="${pageContext.request.contextPath}/upload/${n.member.member_profile}" width="40" height="40" alt="profile">
										</div>
										<div class="media-body">
											<p class="mb-0">
												<span class="text-black">${n.member.member_name}</span>
											</p>
										</div>
									</div>
									</a>
								</li>
							</c:forEach>
						</ul>
						<c:if test="${empty list}">
						<div class="justify-content-center text-center mb-8 mt-6">
							<span  style="color: #9a9a9b8c">
								<i class="fas fa-user-friends fa-8x"></i>
							</span>
							<br>
							나를 팔로우하는 사용자가 없습니다.
						</div>
						</c:if>
					</div>
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

</html>