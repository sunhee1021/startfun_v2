<%--
@JSP : invest.jsp 
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
	
	<style type="text/css">
		th { padding: 5px 30px 5px 0px; }
		td { padding: 0px 5px; }
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
				<h5 class="ml-3">투자자 정보</h5>
				<table class="list-group-item">
					<tbody>
						<tr>
							<th class="ml-4">투자 번호</th>
							<td>${invest.invest_no}</td>
						</tr>
						<tr>
							<th class="ml-4">투자 날짜</th>
							<td>${invest.invest_dt}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${invest.sponsor_email}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${invest.member.member_name}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${invest.member.member_phone}</td>
						</tr>
					</tbody>
				</table>
				
				<form action="/startfun/mypage/sponsor/uploadbond.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="invest_no" value="${invest.invest_no}" />
				<h5 class="ml-3 mt-7">결제 정보</h5>
				<table class="list-group-item">
					<tbody>
						<tr>
							<th class="ml-4">결제수단</th>
							<td>카드결제</td>
						</tr>
						<tr>
							<th class="ml-4">결제금액</th>
							<td><fmt:formatNumber value="${invest.invest_amount}" />원</td>
						</tr>
						<tr>
							<th class="ml-4">결제상태</th>
							<td>${invest.invest_status}</td>
						</tr>
					</tbody>
				</table>
				
				<h5 class="ml-3 mt-7">채권 증서</h5>
				<table class="list-group-item align-self-center">
					<tbody class="align-self-center">
						<tr class="align-self-center">
							<th class="ml-4">채권</th>
							<td >
								<c:if test="${empty invest.invest_bond}">
									<input type="file" name="bond_file" id="bond_file">
								</c:if>
								<c:if test="${not empty invest.invest_bond}">
									<span id="bond_file_tx">${invest.invest_bond}</span>
									<input type="file" name="bond_file" id="bond_file" style="display:none"> &nbsp;
									<label for="bond_file" class="btn btn-sm btn-outline-primary mb-0">파일수정</label>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				
				<div class="justify-content-center mx-auto col-sm-6 text-center mb-7 mb-5 mt-5">
					<button type="button" onclick="location.href='/startfun/mypage/sponsor/investlist.do?no=${invest.project_no}'" class="btn btn-outline-primary col-sm-3">목록</button>
					<button id="submit" class="btn btn-primary col-sm-3">저장</button>
				</div>
				</form>
				
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
	
		//채권 증서 변경
		$('#bond_file').change(function(e){
			var fileValue = $("#bond_file").val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명

			$('#bond_file_tx').text(fileName);
		});
		
		//파일 올리고 저장
		$(function (){

			$(document).on('click', '#submit', function(){
				
				if($('#bond_file').val() == "" || !$('#bond_file').val()){
					swal({
						icon:'warning',
                        text: "파일을 선택해주세요."
                   }); 

					return false;
				}
				
			});
			
		});
	</script>
</html>