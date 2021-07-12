<%--
@JSP : support.jsp 
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
		th { padding-right : 30px; padding-bottom : 10px; }
		td { padding-bottom : 10px; }
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
			
				<h5 class="ml-3">후원자 정보</h5>
				<table class="list-group-item">
					<tbody>
						<tr>
							<th class="ml-4">후원 번호</th>
							<td>${support.support_no}</td>
						</tr>
						<tr>
							<th class="ml-4">후원 날짜</th>
							<td>${support.support_dt}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${support.sponsor_email}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${support.member.member_name}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${support.member.member_phone}</td>
						</tr>
					</tbody>
				</table>
				
				<form action="/startfun/mypage/sponsorstatus.do">
				<input type="hidden" name="support_no" value="${support.support_no}" />
				<input type="hidden" name="project_no" value="${support.project_no}" />
				<h5 class="ml-3 mt-7">리워드 정보</h5>
				<table class="list-group-item">
					<tbody>
						<tr>
							<th class="ml-4">리워드구성</th>
							<td>${support.reward.reward_compose}</td>
						</tr>
						<tr>
							<th class="ml-4">리워드구성</th>
							<td><fmt:formatNumber value="${support.support_amount}" />원</td>
						</tr>
						<tr>
							<th class="ml-4">배송비</th>
							<c:if test="${support.reward.reward_charge != null}">
								<td><fmt:formatNumber value="${support.reward.reward_charge}" />원</td>
							</c:if>
							<c:if test="${support.reward.reward_charge == null}">
								<td>0원</td>
							</c:if>
						</tr>
						<tr>
							<th class="ml-4">추가후원금액</th>
							<c:if test="${not empty support.support_add_amount}">
								<td><fmt:formatNumber value="${support.support_add_amount}" />원</td>
							</c:if>
							<c:if test="${empty support.support_add_amount}">
								<td>0원</td>
							</c:if>
						</tr>
						<tr>
							<th class="ml-4">상태</th>
							<td>
								${support.reward.due_date}
								<select id="status" name="reward_status">
									<option value="제작중" ${support.reward_status == '제작중' ? 'selected' : '' }>제작중</option>
									<option value="배송예정" ${support.reward_status == '배송예정' ? 'selected' : '' }>배송예정</option>
									<option value="리워드완료" ${support.reward_status == '리워드완료' ? 'selected' : '' }>리워드완료</option>
								</select>
							</td>
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
							<td><fmt:formatNumber value="${support.project.total}" />원</td>
						</tr>
						<tr>
							<th class="ml-4">결제상태</th>
							<td>${support.payment_dt} ${support.support_status}</td>
						</tr>
					</tbody>
				</table>
				
				<h5 class="ml-3 mt-7">배송 정보</h5>
				<table class="list-group-item">
					<tbody>
						<tr>
							<th class="ml-4">받는사람</th>
							<td>${support.ship_name}</td>
						</tr>
						<tr>
							<th class="ml-4">연락처</th>
							<td>${support.ship_phone}</td>
						</tr>
						<tr>
							<th class="ml-4">주소</th>
							<c:set var="ship_address" value="${support.ship_address}" />
							<td>${fn:replace(ship_address, '+', ' ')}</td>
						</tr>
						<tr>
							<th class="ml-4">메모</th>
							<td>${support.ship_memo}</td>
						</tr>
					</tbody>
				</table>
				
				<div class="justify-content-center mx-auto col-sm-6 text-center mb-7 mb-5 mt-5">
					<button type="button" onclick="location.href='/startfun/mypage/sponsor/supportlist.do?no=${support.project_no}'" class="btn btn-outline-primary col-sm-3">목록</button>
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
		$(function (){
			/* status 변경 됐는지 확인 */
			let before = $('#status option:selected').text();
			let after = $('#status option:selected').text();
			
			$('#status').change(function(){
				after = $(this).val();
			});
	
			/* 저장 여부 확인  */
			$(document).on('click', '#submit', function(){
				
				if(before != after) {
						return true;
				}else {
					swal({
						icon:'warning',
                        text: "변경된 값이 없습니다."
                   }); 

					return false;
				}
			});
			
		});
		
	</script>
</html>