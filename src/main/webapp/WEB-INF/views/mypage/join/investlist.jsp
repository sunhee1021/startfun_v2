<%--
@JSP : investlist.jsp 
@Date : 2021.06.10
@Author : 정수빈
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<div class="row justify-content-center py-11">
			<div class="col-lg-9">
				<div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
					<h2 class="h3 text-center">참여 프로젝트</h2>
				</div>

				<ul class="nav nav-bordered justify-content-center" id="join-tab" role="tablist">
					<li class="nav-item">
						<a class="nav-link" id="join-tab-tab1" href="/startfun/mypage/join/supportlist.do" aria-selected="false">후원</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" id="join-tab-tab2" href="/startfun/mypage/join/investlist.do" aria-selected="true">투자</a>
					</li>
				</ul>
				
				<div class="tab-content" id="join-tabContent">
					<div class="tab-pane fade p-3 show active" id="join-tab1-content" role="tabpanel" aria-labelledby="demo-docs-tab-tab1">
									
				<c:if test="${empty list}">
				<div class="justify-content-center text-center mb-8 mt-10 pb-10 pt-8 list-group-item">
					<span  style="color: #9a9a9b8c">
						<i class="far fa-file fa-8x"></i>
					</span>
					<br>
					<p class="mt-3">참여한 프로젝트가 없습니다.</p>
				</div>
				</c:if>

				<h5 id="success" class="ml-3 mt-5">투자 성공</h5>
				<ul id="success_ul" class="list-group">
					<c:forEach items="${list}" var="n">
					<c:if test="${n.invest_status eq '결제완료'}">
					<li class="list-group-item">
						<a href="/startfun/mypage/join/invest.do?no=${n.invest_no}" class="link-dark link-hover-dark bg-hover-light">
							<div class="media align-items-center">
								<div class="d-flex mr-4">
							    	<img src="${pageContext.request.contextPath}/upload/${n.project.project_thumbnail}" width="150" height="110" alt="project thumbnail">
							    </div>
							    <div class="media-body">
							    	<span class="small text-muted">no. ${n.invest_no}</span><br>
							    	<p class="mb-0"><span class="text-black">${n.project.project_title}</span></p>
							    	<span class="small text-muted">투자일 - ${n.invest_dt}</span><br>
							    	<span class="small text-muted">투자금액 - <fmt:formatNumber value="${n.invest_amount}" />원</span><br>
							    	<span class="small text-muted">결제상태 - ${n.invest_status}</span><br>
							    	<c:if test="${empty n.invest_bond}">
										<span class="small text-muted">채권증서 - 등록예정</span> <br>
									</c:if>
							    	<c:if test="${not empty n.invest_bond}">
										<span class="small text-muted">채권증서 - ${n.invest_bond}</span> <br>
									</c:if>
							    </div>
							</div>
						</a>
					</li>
					</c:if>
					</c:forEach>
				</ul>
				
				<h5 id="fail" class="ml-3 mt-5">투자 실패</h5>
				<ul id="fail_ul" class="list-group">
					<c:forEach items="${list}" var="n">
					<c:if test="${n.invest_status eq '환불'}">
					<li class="list-group-item">
						<a href="/startfun/mypage/join/invest.do?no=${n.invest_no}" class="link-dark link-hover-dark bg-hover-light">
							<div class="media align-items-center">
								<div class="d-flex mr-4">
							    	<img src="${pageContext.request.contextPath}/upload/${n.project.project_thumbnail}" width="150" height="110" alt="project thumbnail">
							    </div>
							    <div class="media-body">
							    	<span class="small text-muted">no. ${n.invest_no}</span><br>
							    	<p class="mb-0"><span class="text-black">${n.project.project_title}</span></p>
							    	<span class="small text-muted">투자일 - ${n.invest_dt}</span><br>
							    	<span class="small text-muted">투자금액 - <fmt:formatNumber value="${n.invest_amount}" />원</span><br>
							    	<span class="small text-muted">결제상태 - ${n.invest_status}</span><br>
							    	<c:if test="${empty n.invest_bond}">
										<span class="small text-muted">채권증서 - 미등록</span> <br>
									</c:if>
							    	<c:if test="${not empty n.invest_bond}">
										<span class="small text-muted">채권증서 - ${n.invest_bond}</span> <br>
									</c:if>
							    </div>
							</div>
						</a>
					</li>
					</c:if>
					</c:forEach>
				</ul>
				
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

	<script type="text/javascript">
		$(function (){
			
			let success_ul = $('#success_ul').find('li');
			if(success_ul.length == 0) {
				$('#success').hide();
			}
			
			let fail_ul = $('#fail_ul').find('li');
			if(fail_ul.length == 0) {
				$('#fail').hide();
			}
		});
	</script>
</html>