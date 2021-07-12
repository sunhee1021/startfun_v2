<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>스타트펀 : 관리자 : 승인</title>
	
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
	<!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
.btn  {
    border-radius: 0.5rem;
    border-top-right-radius : 0.5rem;
	border-bottom-right-radius : 0.5rem;
}

.form-select {
    border-radius: 0.5rem;
}
.ms-3{
    margin-left: 0.5rem !important;
}

#buttonline	{
	text-align : right;
	margin-bottom : 10px;
}

.page-item:last-child .page-link{
	border-top-right-radius : 0.5rem;
	border-bottom-right-radius : 0.5rem;
}

.page-item:first-child .page-link{
	border-top-left-radius : 0.5rem;
	border-bottom-left-radius : 0.5rem;
}

.input-group:not(.has-validation) > :not(:last-child):not(.dropdown-toggle):not(.dropdown-menu), .input-group:not(.has-validation) > .dropdown-toggle:nth-last-child(n + 3) {
    border-top-right-radius: 0rem;
    border-bottom-right-radius: 0rem;
 }
</style>
</head>
<body>
	
	<c:set var="permitList" value="${permitList}" />
	<c:set var="reportCount" value="${reportCount}" />
	
	<c:import url="/WEB-INF/views/common/header_admin.jsp" />
	
	<div class="requestProject-margin"></div>
	
	<main class="content">
	<nav class="navbar navbar-top navbar-expand navbar-dashboard navbar-dark ps-0 pe-2 pb-0">
    <div class="container-fluid px-0">
      <div class="d-flex justify-content-between w-100" id="navbarSupportedContent">
        <div class="d-flex align-items-center">
    </div>
    </div>
    </div>
    </nav>
    <div class="py-4">
           <nav aria-label="breadcrumb">
               <ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
                   <li class="breadcrumb-item"><a href="#"><span class="fas fa-home"></span></a></li>
                   <li class="breadcrumb-item"><a href="permitProjectList.do">승인프로젝트</a></li>
               </ol>
           </nav>
           <div class="d-flex justify-content-between w-100 flex-wrap">
               <div class="mb-3 mb-lg-0">
                   <h1 class="h4">승인프로젝트</h1>
                   <p class="mb-0"></p>
               </div>
               <div>
					<div class="row align-items-center justify-content-between">
					<div class="input-group" align="center">
            <select id="category" name="category" class="form-select mb-0">
             <option value ="project_title" selected>프로젝트명</option>
             <option value ="project_email">개설자(이메일)</option>
         	</select>
            <input type="search" class="form-control" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" placeholder="Search" aria-label="Search" aria-describedby="basic-addon2">
            <!-- onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit}"  -->
        	<!-- <a class="input-group-text" id ="search_click" name="search_click"><span class="fas fa-search"></span></a> -->
        	<input type ="button" id ="search_click" name="search_click" value="검색" class="btn btn-dark">
        	</div>
    				</div>   
    			</div>
          </div>
      </div>
    
	<div class="card card-body shadow-sm table-wrapper table-responsive">
	
				<c:choose>
				<c:when test="${not empty permitList}">
                <table class="table table-hover">        
				<thead class="thead-light">
				
				<tr style="text-align: center; background: #B8D7FF;">
					<th width="10%">프로젝트번호</th>
					<th width="35%">프로젝트명</th>
					<th width="15%">개설자</th>
					<th width="10%">상태</th>
					<th width="10%">신고관리</th>
					<th width="10%">정산관리</th>
					<th width="10%">등록일</th>
				</tr>
				</thead>
				<tbody id="tbody">
				
				<!-- forEach()  목록 출력하기  -->
				<c:forEach var="permitList" items="${permitList}">
					<tr onmouseover="this.style.backgroundColor='#e6f1ff'" onmouseout="this.style.backgroundColor='white'">
						
						<td align="center">${permitList.project_no}</td>
						
						<c:if test="${permitList.project_type eq '후원'}">
							<c:choose>
							<c:when test="${permitList.project_title != null && fn:length(permitList.project_title) > 26}">
							<td align="left"><a href="/startfun/supportDetail.do?project_no=${permitList.project_no}" target='_blank'>
							<span class="text-info me-3">${fn:substring(permitList.project_title,0,26)}...</span></a></td>
							</c:when>
							<c:otherwise>
							<td align="left"><a href="/startfun/supportDetail.do?project_no=${permitList.project_no}" target='_blank'>
							<span class="text-info me-3">${permitList.project_title}</span></a></td>
							</c:otherwise>
							</c:choose>
						</c:if>
						
						<c:if test="${permitList.project_type eq '투자'}">
							<c:choose>
							<c:when test="${permitList.project_title != null && fn:length(permitList.project_title) > 26}">
							<td align="left"><a href="/startfun/investDetail.do?project_no=${r.project_no}" target='_blank'>
							<span class="text-info me-3">${fn:substring(permitList.project_title,0,26)}...</span></a></td>
							</c:when>
							<c:otherwise>
							<td align="left"><a href="/startfun/investDetail.do?project_no=${permitList.project_no}" target='_blank'>
							<span class="text-info me-3">${permitList.project_title}</span></a></td>
							</c:otherwise>
							</c:choose>
						</c:if>
						
						<c:choose>
							<c:when test="${permitList.project_email != null && fn:length(permitList.project_email) > 21}">
								<td align="center">${fn:substring(permitList.project_email,0,21)}...</td>
							</c:when>
							<c:otherwise>
								<td align="center">${permitList.project_email}</td>
							</c:otherwise>
						</c:choose>
						
						<td align="center">${permitList.project_status}</td>
						
						<c:choose>
						
						<c:when test="${permitList.reportCount eq '0'}">
							<td class="report" align="center"><a href="#" onclick="swal('', '신고내역이 없습니다.' ,'warning' );return false;">
							<span>${permitList.reportCount}건</span></a></td>
						</c:when>
						
						<c:otherwise>
							<td class="report" align="center"><a href="/admin/reportList.do?project_no=${permitList.project_no}
							&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}
							&category=${pageMaker.cri.category}&keyword=${pageMaker.cri.keyword}">
							<span>${permitList.reportCount}건</span></a></td>
						</c:otherwise>
						
						</c:choose>
						
						<c:choose>
						
						<c:when test="${permitList.project_status eq '진행완료'}">
							<td class="pay" align="center"><a href="${permitList.project_no}"><span>미지급</span></a></td>
						</c:when>
						
						<c:when test="${permitList.project_status eq '정산요청'}">
							<td class="pay" align="center"><a href="${permitList.project_no}"><span class="text-danger">정산요청</span></a></td>
						</c:when>
						
						<c:when test="${permitList.project_status eq '정산완료'}">
							<td class="pay" align="center"><a href="${permitList.project_no}"><span>정산완료</span></a></td>
						</c:when>
						
						<c:otherwise>
							<td align="center"><a href="#" onclick="swal('', '정산내역이 없습니다.' ,'warning' );return false;"><span>-</span></a></td>
						</c:otherwise>
						
						</c:choose>
						
						<td align="center">${permitList.project_regdate}</td>
						
					</tr>
				</c:forEach>
				<!-- forEach() 종료 -->
				
				<!-- 페이징처리 -->
				
				</tbody>
			</table>
			</c:when>
			<c:when test="${empty permitList}">
				<h5 align="center">검색 결과가 없습니다</h5>
			</c:when>
			</c:choose>
			<div class="card-footer px-3 border-0 d-flex flex-column align-items-center justify-content-between">
				<nav aria-label="Page navigation example">
				<ul class="pagination mb-0">
				
				<li class="page-item <c:if test="${not pageMaker.prev}">disabled</c:if>">
    			 <a class="page-link" href="${pageMaker.startPage-1}" aria-label="Previous">Pre</a>
					</li>
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
    			<li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}" >
    				<a class="page-link" href="${num}">${num}</a>
    			</li>
    			</c:forEach>
					<li class="page-item <c:if test="${not pageMaker.next}">disabled</c:if>">
					<a class="page-link" href="${pageMaker.endPage+1}" aria-label="Next">Next</a>
					</li>
				</ul>	
				</nav>
			</div>
			<form id ="searchForm" action="./permitProjectList.do" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
			<input type="hidden" name="category" value="${pageMaker.cri.category}" />
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}" />
			</form>
			
			<form id="pay" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
			<input type="hidden" name="category" value="${pageMaker.cri.category}" />
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}" />
			</form>
		</div>
		</main>

<script>
$(function(){

	$('#search_click').on("click",function(){
	
	let keyword = $('#keyword').val();
	
	if(keyword == ""){
		swal({
				icon:'warning',
                text: "검색어를 입력해주세요."
              }); 
		return;
	}else{
		searchPage();
	}
});
	
});


function checkReport(){
	swal({
		icon:'warning',
        text: "신고내역이 없습니다."
      }); 
}

function checkPayment(){
	swal({
		icon:'warning',
        text: "정산내역이 없습니다."
      }); 
}

$(function(){

	let actionForm = $("#searchForm");
	
	$(".page-item a").on("click",function(e){
	e.preventDefault();
	
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();

	});
});

$(function(){

	let pay = $("#pay");
	
	$(".pay a").on("click",function(e){
		e.preventDefault();
		
		pay.append("<input type='hidden' name='project_no' value='"+$(this).attr("href")+"'>");
		pay.attr("action","./payDetail.do");
		pay.submit();
	});
});

function searchPage(){

	let actionForm = $("#searchForm");
	
	let category = $(".input-group select").val();
    let keyword = $(".input-group input[name='keyword']").val();

	actionForm.find("input[name='category']").val(category);
	actionForm.find("input[name='keyword']").val(keyword);
	actionForm.find("input[name='pageNum']").val('1');
	actionForm.find("input[name='amount']").val();
	actionForm.submit();
	
}
</script>
</body>
</html>