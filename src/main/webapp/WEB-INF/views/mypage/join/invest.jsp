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

	<!-- Google Fonts -->
	<link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600" rel="stylesheet">

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/fontawesome-all.min.css">

	<!-- CSS font -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notosanskr.css">
	<!-- CSS Template -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css">
	<!-- CSS Demo -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/demo.css">
		
	<!-- common JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<style type="text/css">
		th { padding-right : 30px; padding-bottom : 10px; }
		td { padding-bottom : 10px; }
	</style>
</head>
<body>
<c:set var="merchant_uid" value="${invest.merchant_uid}" />

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->

<!-- main -->
<main>
	<div class="container">
		<div class="row justify-content-center py-11">
			<div class="col-lg-9">

				<ul class="list-group">
					<li class="list-group-item">
						<a href="/startfun/investDetail.do?project_no=${invest.project_no}" class="link-dark link-hover-dark bg-hover-light">
							<div class="media align-items-center">
								<div class="d-flex mr-4">
									<img src="${pageContext.request.contextPath}/upload/${invest.project.project_thumbnail}" width="150" height="110" alt="project thumbnail">
								</div>
								<div class="media-body">
									<span class="small text-muted">${invest.project_category.category_name}</span><br>
									<p class="mb-0"><span class="text-black">${invest.project.project_title}</span></p>
									<span class="small text-muted">
										<c:if test="${invest.project.dday gt '0'}">
											${invest.project.dday}일 남음 <br>
										</c:if>
										${invest.project.project_start} ~ ${invest.project.project_end} 
									</span>
								</div>
							</div>
						</a>
					</li>
				</ul>

				<h5 class="ml-3 mt-7">투자 정보</h5>
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
					</tbody>
				</table>
				
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
						
				<h5 class="ml-3 mt-7">채권 정보</h5>
				<table class="list-group-item">
					<tbody>
						<tr>
							<th class="ml-4">채권증서</th>
							<td>
							<c:if test="${empty invest.invest_bond}">
								미등록
							</c:if> 
							<c:if test="${not empty invest.invest_bond}">
								<a href="/startfun/mypage/join/downloadbond.do?invest_bond=${invest.invest_bond}">${invest.invest_bond}</a>
							</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="justify-content-center mx-auto col-sm-6 text-center mb-7 mb-5 mt-5">
					<input type="hidden" name="invest_no" value="${invest.invest_no}" />
					<c:if test="${invest.invest_status eq '결제완료'}">
						<button type="button" id="invest_cancel_btn" onclick="location.href='/startfun/mypage/join/investcancel.do?no=${invest.invest_no}'" class="btn btn-outline-primary col-sm-3">투자취소</button>
					</c:if>
					<button type="button" onclick="location.href='/startfun/mypage/join/investlist.do'" class="btn btn-primary col-sm-3">목록</button>
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
	
	<!-- iamport -->
<!-- 	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
	<script type="text/javascript">
		$( document ).ready(function() {
			//가맹점 식별코드
			IMP.init('imp27592092');
		});
		let merchant_uid = '${merchant_uid}';
		console.log(merchant_uid);
			
	    function cancelPay() {
	        jQuery.ajax({
	          "url": "http://www.myservice.com/payments/cancel",
	          "type": "POST",
	          "contentType": "application/json",
	          "data": JSON.stringify({
	            "merchant_uid": merchant_uid, // 주문번호
	            "cancel_request_amount": 100, // 환불금액
	            "reason": "테스트 결제 환불" // 환불사유
	          }),
	          "dataType": "json"
	          }).done(function(result) { // 환불 성공시 로직 
	            alert("환불 성공");
	          }).fail(function(error) { // 환불 실패시 로직
	            alert("환불 실패");
	          });
	      }
	</script> -->
</html>