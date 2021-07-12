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
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->
<main>
	<section class="pt-11 pb-10">
		<div class="container">
			<div style="float: right;">
				<form action="noticeSearch.do" name="search" id="search" method="get">
					<div>
						<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" placeholder="제목으로 검색" style="width: 200px; display: inline;">
						<input type="button" class="btn btn-sm btn-primary" value="검색" id="searchbtn" name="searchbtn" onclick="noticeSearch();">
					</div>
				</form>
			</div>
			<br>
			<div class="row">      
				<table class="table" style="width: 90%; margin: auto;">
					<thead style="text-align: center;">
						<tr>
							<th scope="col" class="font-weight-bold border-top-0 py-2">글&emsp;번호</th>
							<th scope="col" class="font-weight-bold border-top-0 py-2">제&emsp;&emsp;목</th>
							<th scope="col" class="font-weight-bold border-top-0 py-2">날&emsp;&emsp;짜</th>	
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty search}">
							<tr>
								<td>
									<br>검색된 결과가 없습니다.
									<br>
									<small>검색어의 철자가 맞는기 확인해 보세요.</small>
								</td>
							</tr>
						</c:if>
						<!-- forEach()  목록 출력하기  -->
						<c:forEach var="list" items="${list}">
							<tr>
								<td align="center" class="py-3"><c:out value="${list.notice_no}"></c:out></td>
								<td align="center" name="notice_title" class="py-3">
									<a href="noticeDetail.do?notice_no=${list.notice_no}"> <!-- &cp=${cpage}&ps=${pagesize} -->
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
			</div>
		</div>
	</section>
</main>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</body>
</html>