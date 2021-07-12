<%--
@JSP : openproject.jsp 
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
	
	<style type="text/css">
		.lovely {
			background-color: #ff7878;
			color: #fff;
		}
	</style>
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
					<h2 class="h3 text-center">개설 프로젝트</h2>
				</div>
				<c:if test="${empty list}">
				<div class="justify-content-center text-center mb-8 mt-10 pb-10 pt-8 list-group-item">
					<span  style="color: #9a9a9b8c">
						<i class="far fa-file fa-8x"></i>
					</span>
					<br>
					<p class="mt-3">작성한 프로젝트가 없습니다.</p>
				</div>
				</c:if>
				
				<ul class="list-group">
					<c:forEach items="${list}" var="n">
					<c:set value="${n.project_status}" var="status" />
					<li class="list-group-item">
						<c:if test="${status eq '진행중' || status eq '진행완료' || status eq '정산요청' || status eq '정산완료'}">
						<a href="/startfun/supportDetail.do?project_no=${n.project_no}" class="link-dark link-hover-dark bg-hover-light">
						</c:if>
						<c:if test="${status eq '임시저장' || status eq '접수' || status eq '승인'}">
						<a class="link-dark link-hover-dark bg-hover-light">
						</c:if>
						<c:if test="${status eq '신고'}">
						<a class="link-dark link-hover-dark bg-hover-light" id="report_status">
						</c:if>
							<div class="media align-items-center">
								<div class="d-flex mr-4">
							    	<img class="shadow mt-1" src="${pageContext.request.contextPath}/upload/${n.project_thumbnail}" width="150" height="110" alt="project thumbnail">
							    </div>
							    <div class="media-body">
							    	<p class="mb-0"><span class="text-black">${n.project_title}</span> <span class="badge lovely mr-1 ml-1">${n.project_status}</span></p>
							    	<span class="small text-muted"><i class="far fa-calendar-alt mr-2"></i> ${n.project_start} ~ ${n.project_end}</span><br>
							    	<span class="small text-muted"><i class="fas fa-pen mr-2"></i>${n.project_regdate}</span>
							    </div>
								<div class="ml-auto">
								<c:if test="${status eq '진행중' || status eq '진행완료' || status eq '정산요청' || status eq '정산완료'}">
									<se:authorize access="hasRole('ROLE_COMPANY')">
										<button type="button" onclick="window.open('/startfun/mypage/sponsor/investlist.do?no=${n.project_no}')" class="btn btn-sm btn-outline-primary">스펀서관리</button>
									</se:authorize>
									<se:authorize access="hasRole('ROLE_USER')">
										<button type="button" onclick="window.open('/startfun/mypage/sponsor/supportlist.do?no=${n.project_no}')" class="btn btn-sm btn-outline-primary">스펀서관리</button>
									</se:authorize>
								</c:if>
								<c:if test="${status eq '진행완료' && n.project_type eq '후원'}">
									<button type="button" onclick="window.open('/startfun/mypage/requestcal.do?no=${n.project_no}')" class="btn btn-sm btn-outline-primary">정산요청</button>
								</c:if>
								<c:if test="${status eq '임시저장' || status eq '접수'}">
									<se:authorize access="hasRole('ROLE_USER')">
									<button type="button" onclick="window.open('/startfun/project/supportProjectEdit.do?project_no=${n.project_no}')" class="btn btn-sm btn-outline-primary">수정</button>
									</se:authorize>
									<se:authorize access="hasRole('ROLE_COMPANY')">
									<button type="button" onclick="window.open('/startfun/project/investProjectEdit.do?project_no=${n.project_no}')" class="btn btn-sm btn-outline-primary">수정</button>
									</se:authorize>
									<button type="button" id="del_btn" class="btn btn-sm btn-outline-primary">
										삭제
										<input type="hidden" value="${n.project_no}" id="project_no">
									</button>
								</c:if>
								</div>
							</div>
						</a>
					</li>
					</c:forEach>
				</ul>
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
	
	//프로젝트 삭제
	$(document).on("click", "#del_btn", function(e){
		
		e.preventDefault();
		e.stopPropagation();
		
		let project_no = $(this).find('#project_no').val();
		
		swal({
			  text: "정말로 삭제하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  swal({
                      text: "삭제가 완료되었습니다.",
                      button: false,
                      timer: 1500
                 });            
			    location.replace('/startfun/mypage/projectdelete.do?no='+project_no);
			  }
		});
		
	});
	
	$('#report_status').click(function(){
		swal({
			icon:'warning',
            text: "신고 누적으로 인해 관리자에 의해 차단되었습니다.\n신고 관련 문의사항은 관리자(weis62021@gmail.com)로 연락 부탁드립니다."
       }); 

	});

	</script>
</html>