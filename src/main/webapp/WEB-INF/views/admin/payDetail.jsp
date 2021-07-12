<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>스타트펀 : 관리자 : 정산</title>
	
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
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	

<style type="text/css">
 
.mb-6 {
    margin-bottom: 2.5rem !important;
}

.badge {
    font-size: 0.85em;
    border-radius: 0.5rem;
}

</style>
</head>
<body>
	<c:set var="payDetail" value="${payDetail}" />
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
				<div>
				<c:if test="${payDetail.project_status eq '정산요청'}">
				<button id="checkbtn" class="btn btn-primary me-2">
				<span class="far fa-credit-card"></span>&nbsp정산</button>
				</c:if>
				</div></div>
					<div class="card border-gray-300 p-4 p-md-5 position-relative">
						<div class="mb-6 d-flex align-items-center justify-content-center ">
							<h3 class="h2 mb-0">정산내역서</h3>
							<span class="badge badge-xl badge-success ms-2"></span>
						</div>
						<div class="row justify-content-between mb-4 mb-md-5">
							<div class="col-sm">
								<h5>Information:</h5>
								<div>
									<ul class="list-group simple-list">
										<li
											class="list-group-item font-weight-norma border-0 ps-0 py-1">
											<span><strong>프로젝트번호.</strong></span>&nbsp&nbsp ${payDetail.project_no}</li>
									</ul>
								</div>
							</div>
							<div class="col-sm col-lg-4">
								<dl class="row text-sm-right">
									<dt class="col-6">
										<strong>등록일.</strong>
									</dt>
									<dd class="col-6">${payDetail.project_regdate}</dd>
								</dl>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
							<div class="table-responsive">
								<table class="table mb-0">
									<thead class="bg-gray-300 border-top">
										<tr>
											<th scope="row" class="border-0 text-left">프로젝트번호</th>
											<th scope="row" class="border-0">프로젝트명</th>
											<th scope="row" class="border-0">개설자</th>
											<th scope="row" class="border-0">상태</th>
										</tr>
									</thead>
									<tbody id="tbody">
										<tr>
											<td>${payDetail.project_no}</td>
											
											<c:if test="${payDetail.project_type eq '후원'}">
												<td><a href="${pageContext.request.contextPath}/startfun/supportDetail.do?project_no=${payDetail.project_no}" 
												class="text-info me-3" target='_blank'>${payDetail.project_title}</a></td>
											</c:if>
											<c:if test="${payDetail.project_type eq '투자'}">
												<td><a href="${pageContext.request.contextPath}/startfun/investDetail.do?project_no=${payDetail.project_no}" 
												class="text-info me-3" target='_blank'>${payDetail.project_title}</a>
											</c:if>
											
											<td>${payDetail.project_email}</td>
											
											<c:choose>
												<c:when test="${payDetail.project_status eq '정산요청'}">
												<td id="status"><span class="badge badge-lg bg-danger">${payDetail.project_status}</span></td>
												</c:when>
												<c:when test="${payDetail.project_status eq '정산완료'}">
												<td id="status"><span class="badge badge-lg bg-info">${payDetail.project_status}</span></td>
												</c:when>
												<c:otherwise>
												<td id="status"><span class="badge badge-lg bg-primary">${payDetail.project_status}</span></td>
												</c:otherwise>
											</c:choose>
										</tr>
									</tbody>
								</table>
							</div>							
							<div class="d-flex justify-content-end text-right mb-4 py-4 border-bottom">
									<div class="mt-4">
										<table class="table table-clear">
											<tbody id="paychange">
												<tr>
													<td class="left"><strong>총 후원/투자금</strong></td>
													<td class="right"><fmt:formatNumber value="${payDetail.total}" />원</td>
												</tr>
												<tr>
													<td class="left"><strong>수수료(VAT포함)</strong></td>
													<td class="right"><fmt:formatNumber value="${payDetail.comm}" />원</td>
												</tr>
												<tr>
													<td class="left"><strong>지급금액</strong></td>
													<td class="right"><fmt:formatNumber value="${payDetail.firstPay}" />원</td>
												</tr>
												<tr>
													<td class="left"><strong>잔금</strong></td>
													<td class="right"><strong><fmt:formatNumber value="${payDetail.balance}" />원</strong></td>
												</tr>
											</tbody>
										</table>
											<form id="actionForm"  method="get">
											<input type="hidden" id="projectNo" name="projectNo" value="${payDetail.project_no}">
											<input type="hidden" name="pageNum" value="${cri.pageNum}" />
											<input type="hidden" name="amount" value="${cri.amount}" />
											<input type="hidden" name="keyword" value="${cri.keyword}" />
											<input type="hidden" name="category" value="${cri.category}" />
			
											</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>
		
<!-- e.preventDefault(); -->		
<script type="text/javascript">
$(document).ready(function(){
	
	$("#checkbtn").on("click",function(){
		swal({
	           text: "정산하시겠습니까?",
	           icon: "warning",
	           buttons: true,
	           dangerMode: true,
	         })
	         .then((willDelete) => {
	           if (willDelete) {
	        	   
	        	   fn_status();
			       document.getElementById("checkbtn").setAttribute('type','hidden');
		           
			       swal({
	                     text: "정산이 완료되었습니다.",
	                     button: false,
	                     timer: 1500
	                });              
	           }
	      });
 	});
});

function fn_status(){
	
	let projectNo = "<c:out value='${payDetail.project_no}'/>";
	
	console.log(projectNo);
		
	$.ajax({
		
		url:"/updatePayment.do",
		type:'POST',
		async : false,
		cache : false,
		//contentType : "application/json; charset=UTF-8",
		dataType : 'text',
        data: {"project_no" : projectNo},
		success : function(data){
			
			data = JSON.parse(data);
			
			$('#tbody').empty();
			
			var start=$('#tbody');
    		start +='<tr>'	
   			start +='<td>'+data.project_no+'</td>'
   			
   			if(data.project_type == "후원"){
   				start +='<td><a href="../supportDetail.do?project_no=data.project_no" class="text-info me-3" target="_blank">'+data.project_title+'</a></td>'
					
   			}else if(data.project_type == "투자"){
   				start +='<td><a href="../investDetail.do?project_no=data.project_no" class="text-info me-3" target="_blank">'+data.project_title+'</a>'+'</td>'+'</tr>'
   			}
   			start +='<td>'+data.project_email+'</td>'

   			if(data.project_status == "정산요청"){
   				start +='<td id="status"><span class="badge badge-lg bg-danger">'+data.project_status+'</span></td>'
   			}else if(data.project_status == "정산완료"){
   				start +='<td id="status"><span class="badge badge-lg bg-info">'+data.project_status+'</span></td>'
   			}else{
   				start +='<td id="status"><span class="badge badge-lg bg-primary">'+data.project_status+'</span></td>'
   			}
   			
   			$('#tbody').append(start);
   			
   			$('#paychange').empty();
   			
   			var start=$('#paychange');
   			
				start +='<tr><td class="left"><strong>총 후원/투자금</strong></td>'
	   			start +='<td class="right">'+((data.total).toLocaleString()+"원")+'</td></tr>'
	   			
	   			start +='<tr><td class="left"><strong>수수료(VAT포함)</strong></td>'
	   			start +='<td class="right">'+((data.comm).toLocaleString()+"원")+'</td></tr>'

			 if(data.project_status == "정산요청"){
   				start +='<tr><td class="left"><strong>'+"지급금액"+'</strong></td>'
 				start +='<td id="firstPay" class="right">'+((data.firstPay).toLocaleString()+"원")+'</td></tr>'
 				start +='<tr><td class="left"><strong>잔금</strong></td>'
 				start +='<td id="balance" class="right">'+((data.balance).toLocaleString()+"원")+'</td></tr>'
   			
   			}else if(data.project_status == "정산완료"){
   				start +='<tr><td class="left"><strong>'+"지급금액"+'</strong></td>'
  	 			start +='<td id="firstPay" class="right">'+((data.lastPay).toLocaleString()+"원")+'</td></tr>'
  	 			start +='<tr><td class="left"><strong>'+"잔금"+'</strong></td>'
  	 			start +='<td id="balance" class="right">'+"0원"+'</td></tr>'
   			
   			}else if(data.project_status == "진행완료"){
   				start +='<tr><td class="left"><strong>'+"지급금액"+'</strong></td>'
   	 			start +='<td id="firstPay" class="right">'+"0원"+'</td></tr>'
   	 			start +='<tr><td class="left"><strong>'+"잔금"+'</strong></td>'
   	 			start +='<td id="balance" class="right">'+((data.lastPay).toLocaleString()+"원")+'</td></tr>'
   			}
   			
			$('#paychange').append(start);
			
			$("#checkbtn").hide();
			
		},
           error: function(xhr, status, error) {
         		 console.log(xhr,status,error);
         }
	});
}

$(function(){
	
	let form = $("#actionForm");
	
	$("#listbtn").on("click", function(e){
		form.find("#projectNo").remove();
		form.attr("action","./permitProjectList.do");
		form.submit();
	});
});

</script>		

</body>
</html>