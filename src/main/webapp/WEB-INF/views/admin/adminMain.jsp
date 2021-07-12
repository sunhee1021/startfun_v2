<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스타트펀 : 관리자</title>
	
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
	
	<!-- chart -->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<style>
.pb-0 {
    padding-bottom: 3rem !important;
}
.mb-4 {
    margin-bottom: 0.5rem !important;
}
.media-body{
	margin-right : 1rem;
}
</style>
<body>

<c:set var="count" value="${requestScope.count}"></c:set> 
<c:set var="companycount" value="${requestScope.companycount}"></c:set>
<c:set var="chartInvest" value="${requestScope.chartInvest}"></c:set>
<c:set var="chartSupport" value="${requestScope.chartSupport}"></c:set>

<c:import url="/WEB-INF/views/common/header_admin.jsp" />

	<main class="content">
	
	<div class="row">
	
	<div class="col-12 col-sm-6 col-xl-4 mb-4">
			<div class="card border-0 shadow">
				<div class="card-body">
					<div class="row d-block d-xl-flex align-items-center">
						<div
							class="col-12 col-xl-5 text-xl-center mb-3 mb-xl-0 d-flex align-items-center justify-content-xl-center">
							<div class="icon-shape icon-shape-primary rounded me-4 me-sm-0">
								<svg class="icon" fill="currentColor" viewBox="0 0 20 20"
									xmlns="http://www.w3.org/2000/svg">
									<path
										d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z"></path></svg>
							</div>
							<div class="d-sm-none">
								<h2 class="h5">개인회원</h2>
								<h3 class="fw-extrabold mb-1">
								<a href="/admin/user.do">${count} 명</a>
								</h3>
							</div>
						</div>
						<div class="col-12 col-xl-7 px-xl-0">
							<div class="d-none d-sm-block">
								<h2 class="h6 fw-extrabold mb-0">개인회원</h2>
								<h3 class="fw-extrabold mb-2">
								<a href="/admin/user.do">${count} 명</a>
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-sm-6 col-xl-4 mb-4">
			<div class="card border-0 shadow">
				<div class="card-body">
					<div class="row d-block d-xl-flex align-items-center">
						<div
							class="col-12 col-xl-5 text-xl-center mb-3 mb-xl-0 d-flex align-items-center justify-content-xl-center">
							<div class="icon-shape icon-shape-primary rounded me-4 me-sm-0">
								<svg class="icon" fill="currentColor" viewBox="0 0 20 20"
									xmlns="http://www.w3.org/2000/svg">
									<path
										d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z"></path></svg>
							</div>
							<div class="d-sm-none">
								<h2 class="fw-extrabold h5">법인회원</h2>
								<h3 class="mb-1"><a href="/admin/companyUser.do">${companycount} 명</a></h3>
							</div>
						</div>
						<div class="col-12 col-xl-7 px-xl-0">
							<div class="d-none d-sm-block">
								<h2 class="h6 fw-extrabold mb-0">법인회원</h2>
								<h3 class="fw-extrabold mb-2">
								<a href="/admin/companyUser.do">${companycount} 명</a>
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-sm-6 col-xl-4 mb-4">
			<div class="card border-0 shadow">
				<div class="card-body">
					<div class="row d-block d-xl-flex align-items-center">
						<div
							class="col-12 col-xl-5 text-xl-center mb-3 mb-xl-0 d-flex align-items-center justify-content-xl-center">
							<div class="icon-shape icon-shape-tertiary rounded me-4 me-sm-0">
								<svg class="icon" fill="currentColor" viewBox="0 0 20 20"
									xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd"
										d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.707a1 1 0 00-1.414-1.414L10 9.586 8.707 8.293a1 1 0 00-1.414 0l-2 2a1 1 0 101.414 1.414L8 10.414l1.293 1.293a1 1 0 001.414 0l4-4z"
										clip-rule="evenodd"></path></svg>
							</div>
							<div class="d-sm-none">
								<h2 class="fw-extrabold h5">프로젝트</h2>
								<h3 class="mb-1">
								<a href="/admin/permitProjectList.do">${projectResult} 건</a>
								</h3>
							</div>
						</div>
						<div class="col-12 col-xl-7 px-xl-0">
							<div class="d-none d-sm-block">
								<h2 class="h6 fw-extrabold mb-0">프로젝트</h2>
								<h3 class="fw-extrabold mb-2">
								<a href="">${projectResult} 건</a>
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="row">
		<div class="col-12 col-xl-8">
			<div class="row">
				
				<div class="card bg-yellow-100 border-0 shadow">
					<div class="d-block mb-3 mb-sm-0">
					</div>
					<div class="d-flex ms-auto">
					</div>
				<div class="card-body p-2">
						<div id="container"></div>
				</div>
			</div>
			
			</div>
		</div>
		
		<div class="col-12 col-xl-4">
			<div class="col-12 px-0 mb-4">
				<div class="card border-0 shadow">
						<div class="d-block">
						</div>
					<div class="card-body p-2 mb-0">
						<div id="ex"></div>					
					</div>
				</div>
			</div>
			<div class="col-12 px-0 mb-4">
				<div class="card border-0 shadow">
				</div>
			</div>
		</div>
		</div>
		
		
		
	<div class="col-12 mb-4">
			<div class="card border-0 shadow mb-5">
						<div class="card-header">
							<div class="row align-items-center">
								<div class="col">
									<h2 class="fs-5 fw-bold mb-0">진행중인 프로젝트</h2>
								</div>
								<div class="col text-end">
									<a href="./permitProjectList.do" class="btn btn-outline-dark">All</a>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th class="border-bottom" scope="col">번호</th>
										<th class="border-bottom" scope="col">프로젝트명</th>
										<th class="border-bottom" scope="col">등록일</th>
										<th class="border-bottom" scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
										<c:forEach items="${projectList}" var="list">
											<tr>
												<td><span class="fw-normal">${list.project_no}</span></td>
												<td><span class="fw-normal">${list.project_title}</span></td>
												<td><span class="fw-normal">${list.project_regdate}</span></td>
												<td><span class="fw-normal">${list.project_status}</span></td>
											</tr>
										</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
		</div>
	</main>
</body>
			<script type="text/javascript">
                        $(document).ready(function(){
                    	   callAjax();
                    	   
                    	   function callAjax(){
                    		   $.ajax({
                    			   url:'/admin/chart.do',
                    			   type:'POST',
                    	
								success : function(data) {
								let xCategory = [];
								let userData = [];	
								$.each(data,function(index,obj) {
									xCategory.push(obj.project_regdate);
									console.log("x="+ xCategory);
									userData.push(obj.pc);
									console.log("data="+ userData);
									console.log(data);
									Highcharts.chart('container',
										{title : {text : ''},
										yAxis : {
											title : {
												text : '프로젝트 수'}
										},
											xAxis : {
												categories : xCategory
												},
										    legend : {
										    	layout : 'vertical',
										    	align : 'right',
										    	verticalAlign : 'middle'
										    	},
										    	series : [ {
										    	name : '프로젝트',
										    	data : userData
										    	} ],
										    	responsive : {
										    	rules : [ {
										    		condition : {
										    			maxWidth : 500
										    			},
										    			chartOptions : {
										    				legend : {
										    					layout : 'horizontal',
										    					align : 'center',
										    					verticalAlign : 'bottom'
										    					}}
										    			} ]
										    	}
										    	})
										    	})
										    	}
                    			   })
                    			   }
                    	   })
                    	   </script> 
                    	  
                    	   <script type="text/javascript">
                    	  
                    	   Highcharts.chart('ex', {

                    		   chart: {
                    		     styledMode: true
                    		   },

                    		   title: {
                    		     text: '프로젝트 현황'
                    		   },
                    		   series: [{
                    		     type: 'pie',
                    		     allowPointSelect: true,
                    		     keys: ['name', 'y', 'selected', 'sliced'],
                    		     data: [
                    		       ['투자형',${chartInvest}, false],
                    		       ['후원형',${chartSupport}, false]
                    		     ],
                    		     showInLegend: true
                    		   }]
                    		 });
                    	   </script>
</html>