<%--
@JSP : notice.jsp 
@Date : 2021.06.
@Author : 임나영
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- common JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	function noticeSearch(){
		let keyword = $('#keyword').val();

		if(keyword == ""){
			swal({
				icon:'warning',
                text: "검색어를 입력해주세요."
           }); 

			$('#keyword').focus();
			return false;
		}else {
			location.href="noticeSearch.do?keyword="+keyword;
		}
	}
	</script>
	<style type="text/css">
		#searchbtn {
			border-top-right-radius: 15px; 
			border-bottom-right-radius: 15px;
			margin-top: -3px;
			margin-left: -15px;
		}
		
		#keyword {
			border-top-left-radius: 15px; 
			border-bottom-left-radius: 15px;
		}
	</style>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->

<main>
	<section class="pt-11 pb-10">
		<div class="container">
			<div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
            	<h2 class="text-center">공지사항</h2>
            </div>
			<div style="float: right;">
				<form action="noticeSearch.do" name="search" id="search" method="get">
					<div>
						<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" placeholder="제목으로 검색" style="width: 200px; display: inline;">
						<input type="button" class="btn btn-sm btn-primary" value="검색" id="searchbtn" name="searchbtn" onclick="noticeSearch();">
					</div>
				</form>
			</div>
			<div class="row justify-content-center" style="clear: both;">
				<table class="table mt-8 mb-8 w-100">
					<thead style="text-align: center;">
						<tr>
							<th scope="col" class="border-top-0 py-2" style="width: 15%">번호</th>
							<th scope="col" class="border-top-0 py-2" style="width: 60%">제목</th>
							<th scope="col" class="border-top-0 py-2" style="width: 15%">등록일</th>	
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list}">
							<tr>
								<td class="text-center" colspan="7">
									<br>검색된 결과가 없습니다.
									<br>
									<small>검색어의 철자가 맞는지 확인해 보세요.</small>
								</td>
							</tr>
						</c:if>
						<!-- forEach()  목록 출력하기  -->
						<c:forEach var="list" items="${list}">
							<tr>
								<td align="center" class="py-3"><c:out value="${list.notice_no}"></c:out></td>
								<td align="center" name="notice_title" class="py-3">
									<a href="/startfun/notice/noticeDetail.do?notice_no=${list.notice_no}" class="text-dark"> <!-- &cp=${cpage}&ps=${pagesize} -->
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
								<td align="center" class="py-3"><c:out value="${list.notice_regdate}"></c:out></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 페이징 -->
			    <form id="actionForm" method="get">
			  		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			   		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			   		<input type="hidden" name="keyword" value="${param.keyword }">
			    </form>
				<nav aria-label="Page navigation example w-100">
			    	<ul class="pagination justify-content-center mb-5">
			    		<li class="page-item <c:if test="${not pageMaker.prev}">disabled</c:if>">
			    			 <a class="page-link" href="${pageMaker.startPage-1}" aria-label="Previous">
			        			<svg class="duik-icon-svg-1x" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg>
			      			</a>
			    		</li>
			    		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			    			<li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}" >
			    				<a class="page-link" href="${num }">${num }</a>
			    			</li>
			    		</c:forEach>
						<li class="page-item <c:if test="${not pageMaker.next}">disabled</c:if>">
							<a class="page-link" href="${pageMaker.endPage +1 }" aria-label="Next">
						       <svg class="duik-icon-svg-1x" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
						    </a>
						</li>
			    	</ul>
			    </nav>
			</div>
		</div>
	</section>
</main>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</body>
	<script type="text/javascript">
		
		let actionForm = $('#actionForm');
		
		//페이징처리
		$(".page-item a").on('click', function(e){
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			
			$("#actionForm").attr("action","/startfun/notice/notice.do").submit();
		});
		
		
	</script>
</html>