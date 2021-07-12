<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<meta charset="UTF-8">
	<title>스타트펀 : 관리자 : 신고</title>
	
	<!-- Favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon_a.png">
	
	<!-- Fontawesome -->
	<link type="text/css" href="${pageContext.request.contextPath}/resources/admin/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
	<link type="text/css" href="${pageContext.request.contextPath}/resources/admin/vendor/notyf/notyf.min.css" rel="stylesheet">
	<link type="text/css" href="${pageContext.request.contextPath}/resources/admin/css/volt.css" rel="stylesheet">
	<!-- Core -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/@popperjs/core/dist/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Vendor JS -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/onscreen/dist/on-screen.umd.min.js"></script>
	<!-- Slider -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/nouislider/distribute/nouislider.min.js"></script>
	<!-- Smooth scroll -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
	<!-- Charts -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/chartist/dist/chartist.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<!-- Datepicker -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>
	<!-- Moment JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
	<!-- Vanilla JS Datepicker -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>
	<!-- Notyf -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/notyf/notyf.min.js"></script>
	<!-- Simplebar -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/simplebar/dist/simplebar.min.js"></script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Volt JS -->
	<script src="${pageContext.request.contextPath}/resources/admin/assets/js/volt.js"></script>	
	<!-- SweetAlert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
</head>

<style>

body {
	background-color: #F3F4F6;
}
.card {
    position: relative;
    margin-bottom: 0.5rem;
}
</style>
<body>
	<c:set var="reportList" value="${reportList}" />
	<c:import url="/WEB-INF/views/common/header_admin.jsp" />
	
	<main>
	<section class="section section-lg pt-5 bg-gray-200">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-lg-10">
				<div class="d-flex flex-column flex-lg-row align-items-center justify-content-between mb-4">
				<a class="mb-3 mb-lg-0">
				<span class="icon icon-xs">
				<span class="fas fa-chevron-left me-2"></span></span><span id="listbtn">Back</span></a> 
				<div id="update">
				<c:if test="${reportList[0].project_status ne '신고'}">
				<button id="reportbtn" class="btn btn-danger me-2">
				<span class="fas fa-times-circle me-2"></span>&nbsp신고</button>
				</c:if>
				<c:if test="${reportList[0].project_status eq '신고'}">
				<span class="fas fa-check me-2"></span>&nbsp처리완료
				</c:if>
				</div></div>
					<div class="card border-gray-300 p-4 p-md-5 position-relative">
	<c:forEach var="reportList" items="${reportList}">
	<div class="card card-body bg-white border-gray-300 p-0 p-md-4">
	<div class="card-body p-md-0">
		<ul class="list-group list-group-flush">
			<li class="list-group-item border-bottom rounded-0 py-4"><div
					class="row d-block d-md-flex align-items-center">
					<div class="col-auto">
						<div class="icon icon-lg me-md-5 fw-50">
							<span class="fas fa-user"></span>
						</div>
					</div>
					<div class="col ms-md-n5 my-4 my-md-0">
						<div id=reportEmail" class="small"><span class="text-dark fw-bold">
						신고자 : </span>${reportList.report_email}</div>
						<div id="reportRegdate" class="small"><span class="text-dark fw-bold">
						등록일 : </span>${reportList.report_regdate}</div>
						<div id="reportCode" class="small"><span class="text-dark fw-bold">
						신고유형 : </span>${reportList.report_category}</div>
					</div>
					<div class="col-auto">
						<button class="btn btn-outline-gray">신고번호 : ${reportList.report_no}</button>
						<button class="btn btn-outline-gray"><span id="project_no">프로젝트번호 : ${reportList.project_no}</span></button>
						<input type="hidden" name="projectNo" value="${reportList.project_no}" />
					</div>
				</div>
			</li>
		</ul>
		<div class="card-header bg-white border-0">
		<div class="row d-block d-md-flex align-items-center">
			<div class="col">
				<p class="small">
					${reportList.report_reason}
				</p>
		</div>
	</div>
	</div>
</div>
</div>
</c:forEach>
<!-- 페이징처리 -->
			<form id="actionForm"  method="get">
			<input type="hidden" name="pageNum" value="${cri.pageNum}" />
			<input type="hidden" name="amount" value="${cri.amount}" />
			<input type="hidden" name="keyword" value="${cri.keyword}" />
			<input type="hidden" name="category" value="${cri.category}" />
			</form>
			
			<form id="updateReport"  method="get">
			<input type="hidden" name="pageNum" value="${cri.pageNum}" />
			<input type="hidden" name="amount" value="${cri.amount}" />
			<input type="hidden" name="keyword" value="${cri.keyword}" />
			<input type="hidden" name="category" value="${cri.category}" />
			</form>
			</div>
			</div>
			</div>
			</div>
			</section>
</main>
<script>

$(function(){
	
	let form = $("#actionForm");
	
	$("#listbtn").on("click", function(e){
		form.find("#pageNum").remove();
		form.attr("action","./permitProjectList.do");
		form.submit();
	});
});

$(function(){
	$("#reportbtn").on("click", function(e){
		
		changeStatus();
		
	});
});

function changeStatus(){
	swal({
        text: "신고처리하시겠습니까?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {

			 	let projectNo = $("input[name='projectNo']").val();
				let pageNum = $("input[name='pageNum']").val();
				let amount = $("input[name='amount']").val();
					
				console.log(projectNo);
				console.log(pageNum);
				console.log(amount);
				
					$.ajax({
						
						url   : "/updateReport.do",
						type  : "POST",
						async : false,
						cache : false,
						//contentType : "application/json; charset=UTF-8",
				        data: {"project_no" : projectNo, "pageNum" : pageNum , "amount" : amount},
				        
						success : function(data){
							
							let pageNum = $("input[name='pageNum']").val();
							let amount = $("input[name='amount']").val();
							   swal({
		                           text: "신고처리되었습니다.",
		                           button: false,
		                           timer: 1500
		                      });    
									 
							$("#reportbtn").hide();
							
						}
				        ,
				        error : function(xhr, status, error) {
				         		 console.log(xhr,status,error);
				         }
					});
					
				
		 }else{
			 return false;
		} 
	});
}

</script>		
</body>
</html>