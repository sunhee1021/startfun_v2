<%--
@JSP : adminNotice.jsp 
@Date : 2021.06.
@Author : 임나영
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>스타트펀 : 관리자 : 신청</title>
	
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
	<!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		
		function delBtn(notice_no){
			console.log(notice_no);
		      swal({
		           text: '글을 삭제하시겠습니까?',
		           icon: "warning",
		           buttons: true,
		           dangerMode: true
		         })
		         .then((willDelete) => {
		           if (willDelete) {
		        	   swal({
                           text: "삭제가 완료되었습니다.",
                           button: false,
                           timer: 1500
                      }); 
		             location.href = "/admin/notice/noticeDel.do?notice_no="+notice_no;
		           }
		      });

		 }
		
		let actionForm = $('#actionForm');
		
		//페이징처리
		$(".page-item a").on('click', function(e){
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			
			$("#actionForm").attr("action","/admin/notice/adminNotice.do").submit();
		});
		
		function enterkey(){
			var keyword = $('#keyword').val();
			
			 if (window.event.keyCode == 13){
				 if(keyword.trim() == ""){
					 swal({
							icon:'warning',
	                        text: "제목을 입력하세요."
	                   }); 
						$('#keyword').focus();
						return false;
					}else{
						document.search.submit();
					}
			 }
		}
		
	</script>	
</head>
<body>
<c:import url="/WEB-INF/views/common/header_admin.jsp" />

<!-- START NAV BAR -->
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
<!-- NAV BAR END -->
    
<div class="py-4">
	<nav aria-label="breadcrumb">
         <ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
             <li class="breadcrumb-item"><a href="#"><span class="fas fa-home"></span></a></li>
             <li class="breadcrumb-item"><a href="/admin/notice/adminNotice.do">공지사항 관리</a></li>
         </ol>
     </nav>
      <div class="mb-3 mb-lg-0">
          <h1 class="h4">공지사항 관리</h1>
          <p class="mb-0"></p>
      </div>
	<div style="padding-bottom: 15px; float: right; margin: 0 auto;">
		<form action="adminNoticeSearch.do" name="search" id="search" method="get">
			<div>
				<input type="text" class="form-control form-pill" name="keyword" id="keyword" onkeyup="enterkey();" placeholder="제목으로 검색" style="margin: auto;">
			</div>
		</form>
	</div>
	<br>
	<div class="card card-body shadow-sm table-wrapper table-responsive" style="clear: both; text-align: center;">
	    <table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th scope="col">글 번호</th>
					<th scope="col">제 목</th>
					<th scope="col">날 짜</th>
					<th scope="col">수 정</th>
					<th scope="col">삭 제</th>
				</tr>
			</thead>
			<tbody>
				<!-- forEach()  목록 출력하기  -->
				<c:forEach var="list" items="${list}">
					<tr>
						<td align="center" id="notice_no"><c:out value="${list.notice_no}"></c:out></td>
						<td align="center" name="notice_title">
							<a href="/startfun/notice/noticeDetail.do?notice_no=${list.notice_no}" target="_blank">
								<c:choose>
									<c:when test="${list.notice_title != null && fn:length(list.notice_title) > 20}">
										${fn:substring(list.notice_title,0,20)}...
									</c:when>
									<c:otherwise>
										${list.notice_title}
									</c:otherwise>
								</c:choose>
							</a>
						</td>
						<td align="center"><c:out value="${list.notice_regdate}"></c:out></td>
						<td><a href="/admin/notice/noticeEdit.do?notice_no=${list.notice_no}" style="color: gray;">수정</a></td>
						<td><span style="color: red;"><a onclick="delBtn(${list.notice_no})">삭제</a></span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징처리 -->
		<form id="actionForm" method="get">
	  		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	   		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	   		<input type="hidden" name="keyword" value="${param.keyword }">
	    </form>
		<div class="card-footer px-3 border-0 d-flex flex-column align-items-center justify-content-between"  style="position: relative;">
			<nav aria-label="Page navigation example">
			<ul class="pagination mb-0" id="pagination">
			
			<li class="page-item <c:if test="${not pageMaker.prev}">disabled</c:if>">
	  			 <a class="page-link" href="${pageMaker.startPage-1}" aria-label="Previous">
	  			 	<svg class="duik-icon-svg-1x" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg>
	  			 </a>
			</li>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	  			<li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}" >
	  				<a class="page-link" href="${num}">${num}</a>
	  			</li>
	  			</c:forEach>
			<li class="page-item <c:if test="${not pageMaker.next}">disabled</c:if>">
				<a class="page-link" style="border-top-right-radius: 15px; border-bottom-right-radius: 15px;" href="${pageMaker.endPage +1 }" aria-label="Next">
			       <svg class="duik-icon-svg-1x" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
			    </a>
			</li>
			<div style="position: absolute; top: 0;  right: 0; padding-top: 20px;">
				<button class="btn btn-primary" style="padding-top: 7px; padding-bottom: 7px;" type="button" onclick="location.href='/admin/notice/noticeAdd.do'">글 작성</button>
	   		</div>
			</ul>	
			</nav>
		</div>
	</div>
</div>
</main>
</body>
</html>