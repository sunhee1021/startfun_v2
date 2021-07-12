<%--
@JSP : wish.jsp 
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
					<h2 class="h3 text-center">관심 프로젝트</h2>
				</div>
				<c:if test="${empty list}">
				<div class="justify-content-center text-center mb-8 mt-10 pb-10 pt-8 list-group-item">
					<span  style="color: #9a9a9b8c">
						<i class="far fa-file fa-8x"></i>
					</span>
					<br>
					<p class="mt-3">관심프로젝트로 등록한 프로젝트가 없습니다.</p>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	<section class="pt-0 pb-10">
    	<div class="container">
        <div class="row">
          <!-- 노출프로젝트 -->
         <c:forEach items="${list}" var="n">
          <!-- 카드섹션 -->
          <div class="col-lg-3 mb-3">
          	<!-- 카드시작 -->
            <div class="card border-1 shadow">
              <!-- 카드 헤더 - 사진 -->
              <div class="card-header border-0" style="height: 200px; padding: 0; overflow:hidden;">
				<c:if test="${n.project.project_type eq '후원' and n.project.project_status eq '승인'}">
    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${n.project.project_thumbnail}">
				</c:if>
             	<c:if test="${n.project.project_type eq '후원'}">
    				<a href="/startfun/supportDetail.do?project_no=${n.project_no}"> 
    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${n.project.project_thumbnail}">
					</a>
				</c:if>
				<c:if test="${n.project.project_type eq '투자'}">
    				<a href="/startfun/investDetail.do?project_no=${n.project_no}"> 
    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${n.project.project_thumbnail}">
					</a>
				</c:if>
              </div>
              <!-- 카드 바디 -->
              <div class="card-body pt-0" style="padding: 1.0rem; min-height: 225px;">
              	<!-- 스타터 / 카테고리 -->
              	<div class="col nav justify-content-between text-center py-3">
              		 <div class="row">
	              		 <img class="img-fluid rounded-circle mr-2 ml-3" src="${pageContext.request.contextPath}/upload/${n.member.member_profile}" width="25" height="25">
		             	 <c:if test="${n.project.project_type eq '후원'}">
		             	 ${n.member.member_name}
		             	 </c:if>
		             	 <c:if test="${n.project.project_type eq '투자'}">
		             	 ${n.member.member_company}
		             	 </c:if>
	            	</div>
              		<div class="row">
              			<span style="font-size: 0.9em; color:gray">${n.project_category.category_name}</span>
              		</div>
              	</div>
              	<!-- 제목 -->
              	<div class="col text-center mt-2" style="min-height: 72px">
          		 	<span style="font-weight: bold; font-size: 1.1em;">${n.project.project_title}</span>
              	</div>
              	<!-- 진행상황 -->
              	<c:if test="${n.project.project_type eq '후원' and n.project.project_status eq '승인'}">
              		<div class="col text-center" >
						<small class='text-primary project-start'>
							${fn:substring(n.project.project_start, 0, 4) }년
							${fn:substring(n.project.project_start, 5, 7) }월
							${fn:substring(n.project.project_start, 8, 11) }일 오픈예정
						</small>
					</div>
					<!-- 관심 프로젝트 추가 -->
					<div class="col text-center border-1 mt-3 mb-2">
						<input type="hidden" name="commingsoonProject" value="${n.project_no }">
					    <button name="wishBtn" type="button" class="w-100 btn btn-sm btn-danger">
					     	<i class="fas fa-heart mr-2"></i>관심 프로젝트
					    </button>
					</div>	
              	</c:if>
              	<c:if test="${n.project.dday >= '0' and n.project.project_status ne '승인'}">
              		<!-- 진행중인 프로젝트일 경우 -->
	              	<div>
	              		<c:if test="${n.project.project_type eq '후원'}">
	              			<fmt:formatNumber value="${n.support_total}" pattern="#,###"/>원
	              			 &nbsp;&nbsp;<span style="font-size:12px; color:#ff7878;">${n.support_rate}%</span>
		              	</c:if>
		              	<c:if test="${n.project.project_type eq '투자'}">
		              		<fmt:formatNumber value="${n.invest_total}" pattern="#,###"/>원
		              		 &nbsp;&nbsp;<span style="font-size:12px; color:#ff7878;">${n.invest_rate}%</span>
		              	</c:if>
	              	</div>
	              	<div class="progress mt-1" style="height: 3px; background-color: #d0d0d082;">
	              		<c:if test="${n.project.project_type eq '후원'}">
						<div class="progress-bar" role="progressbar" style="width: ${n.support_rate}%; background: #ff7878;" 
							 aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
						</c:if>
	              		<c:if test="${n.project.project_type eq '투자'}">
						<div class="progress-bar" role="progressbar" style="width: ${n.invest_rate}%; background: #ff7878;" 
							 aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
						</c:if>						
					</div>
					<!-- 남은날짜 -->
	                <div class="text-right mt-1">
						<c:choose>
						    <c:when test="${n.project.dday > '0'}">
						        D-${n.project.dday}
						    </c:when>
						    <c:when test="${n.project.dday == '0'}">
						        D-day
						    </c:when>
						</c:choose>
	              	</div>
				</c:if>
				<c:if test="${n.project.dday < '0'}">
					<!-- 마감프로젝트일 경우 -->
					<div style="text-align: center; margin-top: 20px;">
					<c:if test="${n.project.project_type eq '후원'}">
						<span style="color: #ff7878">${n.support_sponsor_count}</span>명이 프로젝트에 참여했습니다.
		              	총 <span style="color: #ff7878"><fmt:formatNumber value="${n.support_total}" pattern="#,###"/></span>원 모집성공
	              	</c:if>
					<c:if test="${n.project.project_type eq '투자'}">
						<span style="color: #ff7878">${n.invest_sponsor_count}</span>명이 프로젝트에 참여했습니다.
		              	총 <span style="color: #ff7878"><fmt:formatNumber value="${n.invest_total}" pattern="#,###"/></span>원 모집성공
	              	</c:if>
	              	</div>
				</c:if>
              	
              </div>
            </div>
          </div>
          </c:forEach>
          <!-- 노출프로젝트 END-->
		</div>
      </div>
    </section>
        	
</main>
<!-- End main -->
	
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</body>
	<script type="text/javascript">
		$(document).ready(function(){
			
			//관심 프로젝트 로드
			if(${not empty wishList}){ //관심 프로젝트가 있으면 실행
				$('input[name=commingsoonProject]').each(function(index, item){	//오픈예정프로젝트 태그들
					<c:forEach items="${wishList}" var="list">
						if($(item).val()===String(${list.project_no})){
							$(this).next().attr('class', 'w-100 btn btn-sm btn-danger');
							$(this).next().html('<i class="fas fa-heart mr-2"></i>관심 프로젝트');
						}
					</c:forEach>
				});
			}
			
			//관심 프로젝트 추가 버튼 클릭
			$('button[name=wishBtn]').on('click', function(){

				var resultString = '';
				$.ajax(
						{
							type : "post",
							url : "/startfun/wishProject.do",
							data : {project_no : $(this).prev().val()},
							async: false,
							success : function(data){ 
				                if(data.result == 'success') { //관심설정
				                	console.log('관심설정')
				                	resultString = 'success';
				                	location.href='/startfun/mypage/wish.do';
				                }else if(data.result == 'cancell') { //관심설정취소
				                	console.log('관심설정취소')
				                	resultString = 'cancell';
				                	location.href='/startfun/mypage/wish.do';
			                	}
			            	} 
						}	
					);

				if(resultString=='cancell'){
					$(this).attr('class', 'w-100 btn btn-sm btn-outline-danger');
					$(this).html('<i class="far fa-heart mr-2"></i>관심 프로젝트 추가');
				}else if(resultString=='success'){
					$(this).attr('class', 'w-100 btn btn-sm btn-danger');
					$(this).html('<i class="fas fa-heart mr-2"></i>관심 프로젝트');
				}
			});
		});
	</script>
</html>