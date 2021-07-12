<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<style type="text/css">
		h3, h5 {
			display: inline-block;
			margin-bottom: 0px;
			margin-right: 1%;
		}
		.follow_txt {
			font-weight: 300;
		}
	</style>
</head>
<body>
<c:set var="principal" value="${pageContext.request.userPrincipal.name}" />

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->
	<main>
		<section class="pt-11 pb-10">
			<div class="container" style="width: 80%;">
			<%-- <c:set var="list" value="${list}"></c:set> --%>
			<input type="hidden" id="member_email" value="${member.member_email}">
			<input type="hidden" id="member_name" value="${member.member_name}">
				<div>
		    		<img src="${pageContext.request.contextPath}/upload/${member.member_profile}" class="rounded-circle mt-1 mr-4" width="120" height="120" style="float: left; position: relative;">
		    	</div>
	    		<br>
		    	<div class="media-body" style="float:both; position:relative;">
		    		<h3>${member.member_name}</h3>
				</div>
				<div class="media-body" style="width:75%; float:left; position:relative;">
		    		<h5 class="follow_txt">팔로잉</h5><h5>${followerCt}</h5><h5 class="follow_txt">&#183;</h5><h5 class="follow_txt">팔로워</h5><h5>${followingCt}</h5>
		    		<h5 class="follow_txt">&#183;</h5><span class="small text-muted">가입 ${member.member_regdate}</span>
				</div>
				<c:if test="${principal ne member.member_email }">
				<div class="media-body" style="float:left; position:relative;">
	              	<button type="button" class="btn btn-sm btn-outline-primary" id="follow">
	              			팔로우&nbsp;<i class='fas fa-plus'></i>
	              	</button>
	              	<c:set var="following_no" value="${following.following_no}" />
              	</div>
              	</c:if>
				<br><br><br><br>
				<div>
					<ul id="tabs1" class="nav nav-tabs mb-3" role="tablist">
					  <li class="nav-item">
					    <a class="nav-link active" href="#tabs1-tab1" role="tab" aria-selected="true"
					       aria-controls="tabs1-tab1" data-toggle="tab">소&nbsp;개
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#tabs1-tab2" role="tab" aria-selected="false"
					       aria-controls="tabs1-tab2" data-toggle="tab">개설&nbsp;프로젝트
					    </a>
					  </li>
					</ul>
					<div id="tabsContent1" class="card-body tab-content p-0 pt-5 mb-10">
					  <div class="tab-pane fade show active" id="tabs1-tab1" role="tabpanel">
					    	<!-- 소개 글 -->
					    	${member.member_introduce}
					  </div>
					
					  <div class="tab-pane fade" id="tabs1-tab2" role="tabpanel">
				    	<!-- 개설 프로젝트 -->
				    	<c:set var="projectlist" value="${projectlist}"></c:set>
				    	<div class="row" id="row">
				    		<c:forEach items="${projectlist}" var="list">
				    			<div class="col-lg-3 mb-3">
						            <div class="card border-1 shadow">
						              <div class="card-header border-0" style="height: 200px; padding: 0; overflow:hidden;">
						             	<c:if test="${list.project_type eq '후원'}">
						    				<a href="/startfun/supportDetail.do?project_no=${list.project_no}"> 
						    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
											</a>
										</c:if>
										<c:if test="${list.project_type eq '투자'}">
						    				<a href="/startfun/investDetail.do?project_no=${list.project_no}"> 
						    					<img style="width:100%; height:100%; object-fit:cover;" src="${pageContext.request.contextPath}/upload/${list.project_thumbnail}">
											</a>
										</c:if>
						              </div>
						              <div class="card-body pt-0" style="padding: 15px; height: 225px">
						              	<!-- 스타터 / 카테고리 -->
										<div class="col nav justify-content-between text-center py-3">
										   <div class="row">
						              		    <img class="img-fluid rounded-circle mr-2 ml-3" src="${pageContext.request.contextPath}/upload/${list.memberVO.member_profile}" width="25" height="25">
						              			<c:if test="${list.project_type eq '후원'}">
						              			${list.memberVO.member_name}
						              			</c:if>
						              			<c:if test="${list.project_type eq '투자'}">
						              			${list.memberVO.member_company}
						              			</c:if>						              			
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
					</div>
				</div>
			</div>
		</section>
	</main>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</body>

<script type="text/javascript">
$(function(){
	//팔로우, 관심설정, 신고프로젝트 내역확인
	var following_no = '${following_no}';
	if(following_no > 0) {
		$("#follow").html("팔로잉&nbsp;<i class='fas fa-check'></i>");
	}
});
//팔로우
$('#follow').click(function(){
	
	var principal = '${principal}';
	if(principal=="") {
		swal({
	           text: "로그인 페이지로 이동하시겠습니까?",
	           buttons: true,
	           dangerMode: true,
	         })
	         .then((willDelete) => {
	           if (willDelete) {
	              location.href = "/startfun/login.do";
	           }
	      });
	}else {	
	
		$.ajax({
			type : "post",
			url  : "addFollow.do",
			data : {member_email : $('#member_email').val()},
	        async: false,
	        success : function(data){ 
                    
                    if(data.result == 'success') { //팔로우
                    	swal({
                            text: "성공적으로 팔로우 하였습니다.",
                            button: false,
                            timer: 1500
                       }); 

                    	$("#follow").html("팔로잉&nbsp;<i class='fas fa-check'></i>");

                    }else { //팔로우취소
                    	swal({
                            text: "팔로우를 취소합니다.",
                            button: false,
                            timer: 1500
                       }); 

                    	$("#follow").html("팔로우&nbsp;<i class='fas fa-plus'></i>");
                    }
            } 
   		});
	}
});

</script>
</html>