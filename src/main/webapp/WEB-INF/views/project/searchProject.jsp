<%--
@JSP : projectList.jsp 
@Date : 2021.06.15
@Author : 조하선
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  <main>
    <section class="pt-11 pb-5">
      <div class="container">
        <div class="w-md-75 w-lg-50 mx-auto text-center mb-7">
			<h3 class="h3 mb-3">'${pageMaker.cri.keyword}' 검색결과 : 총 ${projectCount}건</h3>
        </div>
		<ul id="category" style="list-style:none; height: 70px">
          	<li class="btn btn-outline-primary btn-pill" style="float:left; margin: 5px">전체</li>
          	<li class="btn btn-outline-primary btn-pill" style="float:left; margin: 5px">공간/리빙</li>
          	<li class="btn btn-outline-primary btn-pill" style="float:left; margin: 5px">사회이슈</li>
          	<li class="btn btn-outline-primary btn-pill" style="float:left; margin: 5px">교육/출판</li>
          	<li class="btn btn-outline-primary btn-pill" style="float:left; margin: 5px">문화예술</li>
          	<li class="btn btn-outline-primary btn-pill" style="float:left; margin: 5px">지역재생</li>
          	<li class="btn btn-outline-primary btn-pill" style="float:left; margin: 5px">푸드</li>
          	<li class="btn btn-outline-primary btn-pill" style="float:left; margin: 5px">테크</li>
          	<li class="btn btn-outline-primary btn-pill" style="float:left; margin: 5px">뷰티/패션</li>
          	<li class="btn btn-outline-primary btn-pill" style="float:left; margin: 5px">여행</li>
        </ul>
	    <div style="text-align: right; margin-top: 5px">
	    <select id="sort" class="custom-select"  style="width:200px;height:50px;" >
  			<option value="total">펀딩금액순</option>
  			<option value="project_end">마감임박순</option>
  			<option value="project_start">최신순</option>
  			<option value="sponsor_count">참여자순</option>
		</select>
	    </div><br><br>
        <div class="row">
          <!-- 노출프로젝트 -->
          <c:if test="${empty List }">
          	<div class="mx-auto col-sm-6 col-md-3 text-center mb-7 mb-5 mt-5">
          	검색결과가 없습니다.
          	</div>
          </c:if>
         <c:forEach items="${List}" var="list">
		          <div class="col-lg-3 mb-3 ">
		            <div class="card border-1 shadow">
		              <div class="card-header border-0" style="height: 200px; padding: 0; overflow:hidden;">
		             	<c:if test="${list.project_type eq '후원'}">
		    				<a href="${pageContext.request.contextPath}/startfun/supportDetail.do?project_no=${list.project_no}"> 
		    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
							</a>
						</c:if>
						<c:if test="${list.project_type eq '투자'}">
		    				<a href="${pageContext.request.contextPath}/startfun/investDetail.do?project_no=${list.project_no}"> 
		    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
							</a>
						</c:if>
		              </div>
		              <div class="card-body pt-0" style="padding: 1.0rem; min-height: 225px">
		              	<!-- 스타터 / 카테고리 -->
						<div class="col nav justify-content-between text-center py-3">
						   <div class="row">
						     <img class="img-fluid rounded-circle mr-2 ml-3" src="${pageContext.request.contextPath}/upload/${list.memberVO.member_profile}" width="25" height="25">
						       ${list.memberVO.member_name}
						   </div>
						   <div class="row">
						     <span style="font-size: 0.9em; color:gray">${list.projectCategoryVO.category_name}</span>
						   </div>
				        </div>
				        <!-- 제목 -->
					    <div class="col text-center mt-2" style="min-height: 72px">
					      <span style="font-weight: bold; font-size: 16px; min-height: 150px">${list.project_title}</span><br>
					    </div>
		              	<c:if test="${list.dday >= '0'}">
		              	<!-- 진행중인 프로젝트일 경우 -->
		              	<!-- 총액 -->
			            <div>
			              <fmt:formatNumber value="${list.total}" pattern="#,###"/>원
			              &nbsp;&nbsp;<span style="font-size:12px; color:#ff7878;">${list.rate}%</span>
			            </div>
			            <!-- 진행도그래프 -->
			            <div class="progress mt-1" style="height: 3px; background-color: #d0d0d082;">
							<div class="progress-bar" role="progressbar" style="width: ${list.rate}%; background: #ff7878;"
							     aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
							</div>
						</div>
						<!-- 남은날짜 -->
			            <div class="text-right mt-1">
							<c:choose>
								<c:when test="${list.dday > '0'}">
								   D-${list.dday}
								</c:when>
								<c:when test="${list.dday == '0'}">
								   D-day
								</c:when>
							</c:choose>
			            </div>
						</c:if>
				<c:if test="${list.dday < '0'}">
					<!-- 마감프로젝트일 경우 -->
					<div class="text-center">
						<span style="color: #ff7878">${list.sponsor_count}</span>명이 프로젝트에 참여했습니다.
		              	총 <span style="color: #ff7878"><fmt:formatNumber value="${list.total}" pattern="#,###"/></span>원 모집성공
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
    <!-- 페이징 -->
    <form id="actionForm" action="projectSearch.do" method="get">
    	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
    	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="listSort" value="${pageMaker.cri.listSort }">
		<input type="hidden" name="category" value="${pageMaker.cri.category }">
    </form>
    <nav aria-label="Page navigation example">
    	<ul class="pagination justify-content-center mb-10 mt-5">
    		<li class="page-item <c:if test="${not pageMaker.prev}">disabled</c:if>">
    			 <a class="page-link" href="${pageMaker.startPage-1 }" aria-label="Previous">
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

  </main>
  <!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script type="text/javascript">

	//form
	var actionForm = $('#actionForm');
	
	//listSort 선택 시
	$('#sort').on('change', function(e){
		console.log('sort체인지')
		actionForm.find("input[name='listSort']").val($(this).val());
		actionForm.submit();
	});
	
	//카테고리 선택 시
	$('#category li').on('click', function(e){
		console.log("카테고리체인지")
		actionForm.find("input[name='category']").val($(this).text());
		actionForm.find("input[name='pageNum']").val('1');
		actionForm.submit();
	});
	
	//페이징처리
	$(".page-item a").on('click', function(e){
		e.preventDefault();
		console.log('click')
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	//선택한 정렬로 표시
	if(${not empty pageMaker.cri.listSort || !pageMaker.cri.listSort eq ''}) {
		$('#sort').val('${pageMaker.cri.listSort}').prop('selected', true);
	} else {
		$('#sort').val('total')
	}
	
	//선택된 카테고리로 표시
	if(${not empty pageMaker.cri.category || pageMaker.cri.category eq ''}) {
		$('#category li').each(function(index, item){
			if($(this).text() == '${pageMaker.cri.category}'){
				$(this).attr('class', 'btn btn-primary btn-pill')
			}
		});
	}
</script>
</html>