<%--
@JSP : supportlist.jsp 
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
				<div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
					<h2 class="h3 text-center">스펀서 리스트</h2>
				</div>
				
				<form action="/startfun/mypage/sponsorstatus.do">
				
				<div class="col-sm-7 float-right mb-5">
				<button type="button" onclick="location.href='/startfun/mypage/sponsor/sponsorexcel.do?no=${param.no}'" class="btn btn-sm btn-secondary float-right" data-toggle="tooltip" data-placement="top" title="스펀서리스트를 엑셀파일로 다운로드">
					엑셀다운
				</button>
				<button id="submit" class="btn btn-sm btn-outline-primary mr-2 float-right">상태변경</button>
				<select id="status" name="reward_status" class="custom-select custom-select-sm col-sm-4 mr-2 float-right">
					<option value="제작중">제작중</option>
					<option value="배송예정">배송예정</option>
					<option value="리워드완료">리워드완료</option>
				</select>
			
				</div>
				
				<table class="table">
				  <thead>
				    <tr>
				      <th class="font-weight-bold border-top-0 py-2"><input type="checkbox" name="selectall" value="selectall" onclick="selectAll(this)"></th>
				      <th class="font-weight-bold border-top-0 py-2">후원번호</th>
				      <th class="font-weight-bold border-top-0 py-2">이메일</th>
				      <th class="font-weight-bold border-top-0 py-2">금액</th>
				      <th class="font-weight-bold border-top-0 py-2">참여일</th>
				      <th class="font-weight-bold border-top-0 py-2">결제상태</th>
				      <th class="font-weight-bold border-top-0 py-2">리워드상태</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${list}" var="n">
				    <tr>
				      <td class="py-3">
				      	<input type="checkbox" name="support_no" value="${n.support_no}" onclick="checkSelectAll()" />
				      	<input type="hidden" name="project_no" value="${n.project_no}" />
				      </td>
				      <td class="py-3" onClick = "location.href='/startfun/mypage/sponsor/support.do?no=${n.support_no}'" style="cursor:pointer">${n.support_no}</td>
				      <td class="py-3" onClick = "location.href='/startfun/mypage/sponsor/support.do?no=${n.support_no}'" style="cursor:pointer">${n.sponsor_email}</td>
				      <td class="py-3"><fmt:formatNumber value="${n.total}" />원</td>
				      <td class="py-3">${n.support_dt}</td>
				      <c:if test="${n.support_status eq '결제예정'}">
				      <td class="py-3"><span class="badge badge-primary">${n.support_status}</span></td>
				      </c:if>
				      <c:if test="${n.support_status eq '결제완료'}">
				      <td class="py-3"><span class="badge badge-primary">${n.support_status}</span></td>
				      </c:if>
				      <c:if test="${n.support_status eq '결제취소'}">
				      <td class="py-3"><span class="badge badge-danger">${n.support_status}</span></td>
				      </c:if>
				      <td class="py-3">${n.reward_status}</td>
				    </tr>
				  </c:forEach>
				  </tbody>
				</table>
				</form>
				
				<!-- 페이징 -->
			    <form id="actionForm" method="get">
			    	<input type="hidden" name="no" value="${param.no}" />
			  		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			   		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			    </form>
				<nav aria-label="Page navigation example">
			    	<ul class="pagination justify-content-center mb-5 mt-8">
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
	</div>
</main>
<!-- End main -->
	
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
			
			$("#actionForm").attr("action","/startfun/mypage/sponsor/supportlist.do").submit();
		});
		
		/* 리워드 상태 변경 */
		$(function (){
			$(document).on('click', '#submit', function(){
				
				if($("input:checkbox[name=support_no]:checked").length == 0){
					swal({
						icon:'warning',
                        text: "선택된 후원이 없습니다."
                   }); 

					return false;
				}else if($("input:checkbox[name=support_no]:checked").length == 1){
					swal({
						icon:'warning',
                        text: "하나이상 선택해주세요."
                   }); 

					return false;
				}
			})
			
		});
		
		/* 후원 체크박스 */
		function checkSelectAll() {
			//전체 체크박스
			const checkboxes = document.querySelectorAll('input[name="support_no"]');
			//선택된 체크박스
			const checked = document.querySelectorAll('input[name="support_no"]:checked');
			//select all 체크박스
			const selectAll = document.querySelector('input[name="selectall"]');
			
			if(checkboxes.length === checked.length) {
				selectAll.checked = true;
			}else {
				selectAll.checked = false;
			}
		}
		
		function selectAll(selectAll) {
			const checkboxes = document.getElementsByName('support_no');
			
			checkboxes.forEach((checkbox) => {
				checkbox.checked = selectAll.checked
			})
		}
		
	</script>
</html>