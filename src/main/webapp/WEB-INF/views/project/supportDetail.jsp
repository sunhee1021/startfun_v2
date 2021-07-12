<%--
@JSP : supportDetail.jsp 
@Date : 2021.06.10
@Author : 이보희
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
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
		
	<!-- ajax & jquery -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
	<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('.summernote').summernote({
				height: 300,
				minHeight: 300,
				maxHeight: 300
			});
			$('#notice_div').hide();
			$('#notice_edit_div').hide();
		});
	</script>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->
<c:set var="principal" value="${pageContext.request.userPrincipal.name}" />
<c:set var="detail" value="${supportDetailTop}" />
<c:set var="following_no" value="${following.following_no}" />
<c:set var="wish_no" value="${wish.wish_no}" />
<c:set var="report_no" value="${report_no.report_no}" />
<c:set var="guide" value="${guide}" />
<c:set var="dday" value="${supportDetailTop.dday}" />
<c:set var="member_email" value="${detail.memberVO.member_email}" />

<main>
	<section class="pt-11 pb-5">
      <!-- 상단 -->
      <div class="container">
        <div class="w-md-75 w-lg-60 mx-auto text-center mb-7">
        	<p><span style="color:gray; font-size: 1.1em;">${detail.projectCategoryVO.category_name}</span></p>
          	<h2>${detail.project_title}</h2>
        </div>
	
        <div class="row">
          <div class="col-md-7 mb-5">
            <div class="card border-0 shadow">
  				<div class="card-header border-0" style="height: 350px; padding: 0; overflow:hidden;">
  					<c:if test="${detail.project_video eq null || detail.project_video eq ''}">
          				<img style="width:100%; height:100%; object-fit:contain ;" src="${pageContext.request.contextPath}/upload/${detail.project_thumbnail}">
          			</c:if>
  					<c:if test="${detail.project_video ne null}">
         			   <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width: 650px; height: 350px;" data-interval="false">
						  <div class="carousel-inner" style="width: 650px; height: 350px">
						    <div class="carousel-item active">
						      <iframe width="635" height="350" src="https://www.youtube.com/embed/${detail.project_video}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						    </div>
						    <div class="carousel-item">
						      <img style="width:100%; height:100%; object-fit:contain;" src="${pageContext.request.contextPath}/upload/${detail.project_thumbnail}">
						    </div>
						  </div>
						
						  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev" style="height: 50px; top: 120px;">
						    <span aria-hidden="true">
						      <svg class="duik-icon-svg-white duik-icon-svg-2x" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg>
						    </span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next" style="height: 50px; top: 120px;">
						    <span aria-hidden="true">
						      <svg class="duik-icon-svg-white duik-icon-svg-2x" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
						    </span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
          			
          			</c:if>
                </div>
                <div class="media" style="padding: 10px;">
	            	<div class="rounded-circle mr-3" style="height: 50px; ">
	              		<img class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/upload/${detail.memberVO.member_profile}" width="50" height="50" style="margin-top: 2px; margin-left: 10px;">
	            	</div>
	            	<div class="media-body" style="margin: 7px; width: 30%; float: left;">
	            		<a class="text-dark" href="/startfun/profile/profile.do?member_email=${member_email}">${detail.memberVO.member_name}</a>
				        <small class="d-block text-muted">스타터</small>
		            </div>  
              		<div style="width:60%; float: left; text-align:right; padding-top: 5px;">
	              		<button type="button" class="btn btn-sm btn-outline-primary" id="follow" style="margin-right: 5px">
	              			팔로우&nbsp;<i class='fas fa-plus'></i>
	              		</button>
	              		<button type="button" id="liveChat" class="btn btn-sm btn-outline-primary">실시간문의하기</button>
              		</div>
         		</div>
            </div>
          </div>
   		  <div class="col-md-5 mb-5">
            <div class="card border-0">
  				<div>
					<div style="margin-bottom:7px;">모인금액</div>
					<span style="font-weight: bold; font-size: 1.5em; line-height: 1.0em;"><fmt:formatNumber value="${detail.total}" pattern="#,###"/></span> 원 모금<br>
					<div class="progress" style="margin-top:7px; margin-bottom:5px;">
				  		<div class="progress-bar bg-primary" role="progressbar" style="width: ${detail.rate}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<div style="text-align:right; margin-bottom:7px;">${detail.rate}%</div>
				</div>
				<div style="margin-bottom: 25px;">
					<div style="margin-bottom:5px;">참여인원</div>
					<span style="font-weight: bold; font-size: 1.5em; line-height: 1.0em;">${detail.sponsor_count} </span> 명 참여<br>
				</div>
				<div style="margin-bottom: 25px;">
					<div style="margin-bottom: 8px;">남은기간</div>
						<c:choose>
						    <c:when test="${detail.dday > '0'}">
						        <span style="font-weight: bold; font-size: 1.5em; line-height: 1.0em;">D-${detail.dday} </span> 일 남음
						    </c:when>
						    <c:when test="${detail.dday == '0'}">
						        <span style="font-weight: bold; font-size: 1.5em; line-height: 1.0em;">D-day</span>
						    </c:when>
						    <c:otherwise>
						        <span style="font-weight: bold; font-size: 1.5em; line-height: 1.0em;">참여마감</span>
						    </c:otherwise>
						</c:choose>
				</div>
				
				<c:if test="${detail.dday >= '0'}">
					<button class="btn btn-block btn-primary" type="button" id="joinSupport">참여하기</button>
				</c:if>
				<c:if test="${detail.dday < '0'}">
    				<button class="btn btn-block btn-primary" type="button" disabled="disabled">참여마감</button>
				</c:if>

				<div style="margin-top: 30px; display: flex; justify-content: space-between;">
					<button class="btn btn-outline-danger px-9" type="button" id="reportBtn">
					&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-exclamation-triangle">&nbsp;&nbsp;프로젝트 신고하기</i>&nbsp;&nbsp;&nbsp;&nbsp;
					</button>
					<button class="btn btn-outline-dark-soft" type="button" onclick="clip(); return false;">
					 <i class="fas fa-share-alt"></i>
					</button>
					<button class="btn btn-outline-dark-soft" type="button" id="wish">
					  <i class='far fa-heart'></i>
					</button>
				</div>
            </div>
          </div>
		</div>
		<hr><br>
      </div>
	  <!-- 상단 END-->
	  
	  <!-- 하단 -->
	  <div class="container">
		 <div class="row">
		 	<!-- 게시판 -->
		 	<div class="col-lg-8 mb-11 mb-lg-4 pr-lg-3 border shadow" style="height: auto;">
		 		<!-- 탭 -->
				<ul class="nav nav-bordered" id="demo-docs-tab" role="tablist" style="margin-top: 50px; display: flex; justify-content: space-between;">
				  <li class="nav-item" style="margin-left:80px; margin-right: 30px;">
				    <a class="nav-link active" id="tab1" data-toggle="tab" href="#demo-docs-tab-tab1-content" role="tab" 
				        aria-controls="demo-docs-tab-tab1-content" aria-selected="true">소개</a>
				  </li>
				  <li class="nav-item" style="margin-right: 20px;">
				    <a class="nav-link" id="tab2" data-toggle="tab" href="#demo-docs-tab-tab2-content" role="tab" 
				       aria-controls="demo-docs-tab-tab2-content" aria-selected="false" onclick="projectList()">공지</a>
				  </li>
				  <li class="nav-item" style="margin-right: 20px;">
				    <a class="nav-link" id="tab3" data-toggle="tab" href="#demo-docs-tab-tab3-content" role="tab" 
				       aria-controls="demo-docs-tab-tab3-content" aria-selected="false" onclick="qnaList()">QnA</a>
				  </li>
				  <li class="nav-item" style="margin-right: 80px;">
				    <a class="nav-link" id="reviewTab" data-toggle="tab" href="#demo-docs-tab-tab4-content" role="tab" 
				       aria-controls="demo-docs-tab-tab4-content" aria-selected="false">후기</a>
				  </li>
				</ul>
				<!-- 탭 End -->
				<!-- 탭 내용 -->
				<div class="tab-content" id="tabContent" style="margin: 20px">
				  <div class="tab-pane fade show active" id="demo-docs-tab-tab1-content" style="padding-top: 15px;">
				  	<div class="col-lg-12 pr-lg-3 order-lg-1" style="overflow: hidden">
				    	${detail.project_content}<br>
				    </div>
				    <br><br>
				   <div class="col-lg-12 pr-lg-3 order-lg-1">
			          <div class="tab-content" id="faqTabContent">
			            <div class="tab-pane fade show active" id="faq-purchase-content" role="tabpanel" aria-labelledby="faq-purchase">
			              <div class="accordion" id="accordionExample-001">
			                <div class="card border-bottom mb-3">
			                  <div class="card-header accordion-header d-flex align-items-center collapsed" id="headingOne-001" data-toggle="collapse" data-target="#collapseOne-001" aria-expanded="false" aria-controls="collapseOne-001" role="region">
			                    <h6 class="mb-0">리워드 배송안내</h6>
			                    <i class="fas fa-angle-down accordion-control ml-auto text-primary"></i>
			                  </div>
			                  <div id="collapseOne-001" class="collapse" aria-labelledby="headingOne-001" data-parent="#accordionExample-001" style="">
			                    <div class="card-body">${guide.delivery_guide}</div>
			                  </div>
			                </div>
			
			                <div class="card border-bottom mb-3">
			                  <div class="card-header accordion-header d-flex align-items-center collapsed" id="headingTwo-001" data-toggle="collapse" data-target="#collapseTwo-001" aria-expanded="false" aria-controls="collapseTwo-001" role="region">
			                    <h6 class="mb-0">리워드 배송 지연안내</h6>
			                    <i class="fas fa-angle-down accordion-control ml-auto text-primary"></i>
			                  </div>
			                  <div id="collapseTwo-001" class="collapse" aria-labelledby="headingTwo-001" data-parent="#accordionExample-001">
			                    <div class="card-body">${guide.delivery_delay}</div>
			                  </div>
			                </div>
			
			                <div class="card border-bottom mb-3">
			                  <div class="card-header accordion-header d-flex align-items-center collapsed" id="headingThree-001" data-toggle="collapse" data-target="#collapseThree-001" aria-expanded="false" aria-controls="collapseThree-001" role="region">
			                    <h6 class="mb-0">펀딩정책 안내</h6>
			                    <i class="fas fa-angle-down accordion-control ml-auto text-primary"></i>
			                  </div>
			                  <div id="collapseThree-001" class="collapse" aria-labelledby="headingThree-001" data-parent="#accordionExample-001">
			                    <div class="card-body">${guide.refund_policy}</div>
			                  </div>
			                </div>
		                  </div>
		                </div>
		              </div>
		            </div>
		            <br>
		            <div class="col-lg-12 pr-lg-3 order-lg-1" style="text-align: right">
			    	  <se:authorize access="hasRole('ROLE_ADMIN')">
					    프로젝트 신청 첨부파일<br>
					    <i class="fas fa-file-download"></i>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/startfun/downloadFile.do?project_file=${detail.project_file}">${detail.project_file}</a>
			  		  </se:authorize>
				    </div>
				  </div>
				  <!-- 공지사항 -->
				  <div class="tab-pane fade p-3" id="demo-docs-tab-tab2-content">
				  	<c:if test="${principal eq member_email}">
				  		<button type="button" id="addbtn" class="btn btn-sm btn-block btn-outline-primary mb-5">공지 작성</button>
				  		<div id="notice_div" class="mx-auto">
							<form name="projectForm_in">
								<table class="table table-bordered">
									<tr>
										<th scope="row" style="width:10%">제목</th>
								    	<td style="width:90%"><input type="text" name="notice_title" id="notice_title" class="form-control"></td>
									</tr>
									<tr>
										<th scope="row">내용</th>
										<td><textarea id="notice_content" name="notice_content" class="summernote form-control"></textarea></td>
								    </tr>
								</table>
								<div style="float: right;">
									<input type="hidden" id="project_no" value="${param.project_no}">
									<input type="button" class="btn btn-sm btn-primary" class="mr-1" value="등록" onclick="projectAdd()">
									<input type="button" id="notice_cancle_btn" class="btn btn-sm btn-primary" value="취소">
								</div>
							</form>
						</div>
						<div id="notice_edit_div" class="mx-auto">
							<form name="projectForm_edit_in">
								<table class="table table-bordered">
									<tr>
										<th scope="row" style="width:10%">제목</th>
								    	<td style="width:90%"><input type="text" name="notice_edit_title" id="notice_edit_title" class="form-control" value=""></td>
									</tr>
									<tr>
										<th scope="row">내용</th>
										<td><textarea name="notice_edit_content" id="notice_edit_content" class="summernote form-control"></textarea></td>
								    </tr>
								</table>
								<div style="float: right;">
									<input type="hidden" id="notice_edit_no" value="">
									<input type="button" class="btn btn-sm btn-primary" class="mr-1" value="수정" onclick="projectUpdate(this.form)">
									<input type="button" id="notice_edit_cancle_btn" class="btn btn-sm btn-primary" value="취소">
								</div>
							</form>
						</div>
				  	</c:if>
				  	<!-- ajax function -->
				  	<div id="demo-docs-tab-tab2-content-body" style="clear: both;"></div>
				  </div>
				  <!-- QnA -->
				  <div class="tab-pane fade p-3" id="demo-docs-tab-tab3-content">
				  	<form name="qna" id="qna" method="post" class="mb-10">
				  		<input type="hidden" name="qna_email" value="${pageContext.request.userPrincipal.name}" id="qna_email">
					  	<div style="width: 87%; float: left;">
					  		<textarea rows="2" cols="70" class="form-control form-pill" name="qna_content" id="qna_content" placeholder="내용을 입력해주세요."></textarea>
					  	</div>
					  	<div style="float: left;">
					  		<input type="button" class="btn btn-outline-primary" style="margin-left: 10px; margin-top: 10px;" value="등&nbsp;록" id="qnabtn" onclick="qnaAdd()">
					  	</div>
					</form>
				  	<div id="demo-docs-tab-tab3-content-body" style="clear: both;">
						<div id="reply_div"></div>
				  	</div>
				  </div>
				  <!-- 후기 -->
				  <div class="tab-pane fade p-3" id="demo-docs-tab-tab4-content">
				    스펀서 평점<br>
				    <span id="totalavg" style="font-weight:bold; font-size: 1.5em;">후기없음</span>&nbsp;&nbsp;(작성자 : <span id="review_count">0</span> 명)
				    <hr>
				  	<div style="text-align: center">
				  		<h4>&lt;체크리스트&gt;</h4>
				  		- 리워드 완성도는 어땠나요? ············································
				  		<span id="review0" style="font-weight:bold; font-size: 1.5em;">0.0</span><br><br>
				  		- 배송예정일이 잘 지켜졌나요? ···········································
				  		<span id="review1" style="font-weight:bold; font-size: 1.5em;">0.0</span><br><br>
				  		- 스타터와 연락/의사소통이 잘 됐나요? ·····································
				  		<span id="review2" style="font-weight:bold; font-size: 1.5em;">0.0</span><br><br>
				  	</div>	
				  </div>
				</div>
				<!-- 탭 내용 End-->
		 	</div>
		 	<!-- 옵션창 -->
		 	<div class="col-lg-4 mb-4 mb-lg-3 order-lg-2">
			 	<div class="js-sticky-sidebar">
					<c:forEach items="${optionList}" var="option"  varStatus="status">
					<div class="card p-2 border-1 shadow" id="option${status.index}" >
					  <div class="card-header pb-0">
						  <h4 class="h5 mb-3"><fmt:formatNumber value="${option.reward_price}" pattern="#,###"/>원</h4>
					  </div>
					  <div class="card-body" style="padding-left: 24px; padding-right: 24px; padding-bottom: 5px; padding-top: 15px">
					    <p>${option.reward_compose}</p>
						<p><span style="color:gray; font-size: 0.9em;">배송예정일 : ${option.due_date} 
						(배송료 <fmt:formatNumber value="${option.reward_charge}" pattern="#,###"/>원)</span></p>
						<span style="font-weight: bold; color:#107ef4; font-size: 1.5em;">${option.sponsor_count}</span>명 참여하였습니다.
					  </div>
					</div><br>
					</c:forEach>
				</div>
	         </div> 
	         <!-- 옵션창 End -->
 		</div>
	</div>
</section>
    
    
 <!-- 신고하기 Modal -->
 <div id="reportModal" class="modal fade" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">어떤 문제가 있나요?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 신고하기 -->
	    <form action="/startfun/supportReport.do" method="post" id="reportForm">
			<input type="hidden" class="form-check-input d-none" name="project_no" value="${param.project_no}">
			<div class="form-group">
				<div class="form-check position-relative mb-2">
					<input id="report1" type="radio" name="report_code" value="1" checked>
					<label class="radio radio-xxs form-check-label ml-1" for="report1">지식재산권 침해</label>
				</div>
				<div class="form-check position-relative mb-2">
					<input id="report2" type="radio" name="report_code" value="2">
					<label class="radio radio-xxs form-check-label ml-1" for="report2">스토리내 허위사실</label>
				</div>
				<div class="form-check position-relative mb-2">
					<input id="report3" type="radio"  name="report_code" value="3">
					<label class="radio radio-xxs form-check-label ml-1" for="report3">동일 제품의 타 채널 유통</label>
				</div>
				<div class="form-check position-relative mb-2">
					<input id="report4" type="radio" name="report_code" value="4">
					<label class="radio radio-xxs form-check-label ml-1" for="report4">스타트펀 커뮤니티 정책 위반</label>
				</div>
				<div class="form-check position-relative mb-2">
					<input id="report5" type="radio" name="report_code" value="9">
					<label class="radio radio-xxs form-check-label ml-1" for="report5">기타</label>
				</div>
				<label for="report_reason">신고사유를 입력해주세요.</label><br>
				<textarea class="form-control" id="report_reason" rows="3" name="report_reason" id="report_reason"></textarea>
			</div>  
	        <div class="modal-footer">
	          <button type="reset" class="btn btn-secondary" data-dismiss="modal" id="reportcancel">취소</button>
	          <button type="button" class="btn btn-primary" id="reportOk">신고접수</button>
	        </div>
        </form>
		<!-- 신고하기 End -->
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->
</main>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer --> 
</body>

<!-- JS Implementing Plugins -->
<script src="${pageContext.request.contextPath}/resources/vendor/sticky-sidebar/dist/sticky-sidebar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sticky-sidebar.js"></script>

<script type="text/javascript">
$(function(){
	//스타터본인 페이지일 경우
	var principal = '${principal}';
	var starter = '${detail.memberVO.member_email}';
	
	 if(principal == starter){
		 $('#follow').attr("disabled", "disabled");
		 $('#wish').attr("disabled", "disabled");
		 $('#reportBtn').attr("disabled", "disabled");
		 $('#joinSupport').attr("disabled", "disabled");
		 $('#liveChat').attr("disabled", "disabled");
	 }
	
	//팔로우, 관심설정, 신고프로젝트 내역확인
	var following_no = '${following_no}';
	var wish_no = '${wish_no}';
	var report_no = '${report_no}';
		
	if(following_no > 0) {
		$("#follow").html("팔로잉&nbsp;<i class='fas fa-check'></i>");
	}
	
	if(wish_no > 0) {
		$('#wish').html("<i class='fas fa-heart'style='color: #fb5e51'></i>");
	}
	
	if(report_no > 0) {
		$('#reportBtn').html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='fas fa-exclamation-circle'>&nbsp;&nbsp;신고한 프로젝트</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		$('#reportBtn').attr("disabled", "disabled");
	}
});


//공유하기 URL복사
function clip(){
	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	swal({
		  text: "URL이 복사되었습니다.",
		  button: false,
		  timer: 1500
	});
}


//후기평점
$('#reviewTab').click(function(){
	$.ajax(
 		   {
	         	type : "post",
				url  : "supportReview.do",
				data : {project_no : ${param.project_no}},
	            async: false,
	            success : function(data){ 
					var sum = 0;
					
					$.each(data,function(index,obj){
						
						sum = sum + obj.review_avg;
						
						var name = 'review' + index;
						
						$('#'+name).empty();
						$('#'+name).append(
							obj.review_avg.toFixed(1)
						);
						
						$('#review_count').empty();
						$('#review_count').append(
							obj.review_count		
						)
					});
					
						var avg = Math.round(((sum/3) + Number.EPSILON) * 100) / 100; 
						
						$('#totalavg').empty();
						$('#totalavg').append(
							avg = avg.toFixed(1)	
						)
	            } 
    		});
});


//신고하기 클릭시 로그인여부
$('#reportBtn').click(function(){
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
		$('#reportModal').modal('show');
	}
	
});


//신고하기 취소시 작성내용 초기화
$('#reportcancel').click(function(){
	$('#report_reason').val("");
	$('input[name="report_code"]').removeAttr('checked');
	$('input[name="report_code"]')[0].checked = true;
});


//신고접수
$('#reportOk').click(function(){
	if($('#report_reason').val().length==0) {
		swal({
			icon:'warning',
            text: "신고사유를 입력해주세요."
       }); 

		$('#report_reason').focus();
		return false;
	}else {
		$('#reportForm').submit();
		swal({
			  text: "신고접수를 완료하였습니다.",
			  button: false,
			  timer: 1500
		});
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
		$.ajax(
			   {
				type : "post",
				url  : "follow.do",
				data : {project_no : ${param.project_no}},
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

//관심프로젝트
$('#wish').click(function(){
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
		$.ajax(
			   {
				type : "post",
				url  : "wishProject.do",
				data : {project_no : ${param.project_no}},
		        async: false,
		        success : function(data){ 
		        	
		                if(data.result == 'success') { //관심설정
		                	swal({
			          			  text: "관심프로젝트를 등록합니다.",
			          			  button: false,
			        	          timer: 1500
			          		});
							$('#wish').html("<i class='fas fa-heart'style='color: #fb5e51'></i>");

		                }else { //관심설정취소
		                	swal({
		                		  text: "관심프로젝트를 취소합니다.",
			        	          button: false,
			        	          timer: 1500
			          			});
		                	$('#wish').html("<i class='far fa-heart' style='color: gray'></i>");	                
	                	}
	            } 
	   		});
	}
});


//참여하기
$('#joinSupport').click(function(){
	var principal = '${principal}';
	var project_no = ${param.project_no};
	
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
		$.ajax(
			   {
				type : "post",
				url  : "memberType.do",
				data : {member_email : principal},
		        async: false,
		        success : function(data){ 
	                    
	                   if(data == '법인') {
	                	   swal({
		             			  text: "후원하기는 개인회원만 가능합니다.",
		             			  icon: "warning"
		             			});
	                   }else {
	                	   location.href = "/startfun/joinSupport.do?project_no="+project_no;
	                   }
	            } 
	   		});
	}
});

//하단옵션창에서 옵션선택시
$("body").on("click", "[id^=option]", function(event) {
	var dday = '${dday}';
	var principal = '${principal}';
	var starter = '${detail.memberVO.member_email}';
	
	if(dday < 0 || principal == starter) {
		return false;
	}else {
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
			var selected = (this.id);
			location.href = "/startfun/joinSupport.do?project_no="+${param.project_no}+"&selected="+selected;
		}
	}
 });
 
///////////////////////////////////////////////////////////////////////

//프로젝트 공지글 목록
function projectList(){
	$.ajax({
		url: 'project/projectNotice.do',
		type: 'get',
		dataType: 'json',
		data: {
			'project_no' : ${param.project_no}
		},
		success: function(data){
			$('#demo-docs-tab-tab2-content-body').empty();
			
			if(data.length == 0){
				$('#demo-docs-tab-tab2-content-body').append('<div class="mt-10 mb-10 text-center">등록된 공지글이 없습니다</div>');
			}else{
				$.each(data, function(index,item){
					$('#demo-docs-tab-tab2-content-body').append(
							'<div id="addlist"><form method="post"><h5>'+ item.notice_title +'</h5><span class="small text-muted">'+ item.notice_regdate +'</span>'
							+'<input type="hidden" id="notice_no" value="'+item.notice_no+'">'
							+'<c:if test="${pageContext.request.userPrincipal.name eq member_email}">'
							+'<div style="float: right;">'
							+'<input type="button" id="editbtn" value="수정" class="btn btn-sm btn-outline-dark-soft px-1 py-1 mr-1">'
							+'<input type="button" onclick="projectDel(this.form)" value="삭제" class="btn btn-sm btn-outline-dark-soft px-1 py-1">'	
				  			+'</div>'
							+'</c:if>'
							+'<hr><div>'+ item.notice_content +'</div><hr>'
							+'</form></div><br>'		
					);
				})
			}
		},
		error: function(){
			alert('공지글 목록을 불러올 수 없습니다.');
			console.log(project_no);
		}
	})//ajax : end
}//프로젝트 공지글 목록 : end

//등록 폼 보이기
function fn_notice_show(){
	$('#notice_div').toggle();
	$('#demo-docs-tab-tab2-content-body').toggle();
}
//프로젝트 공지글 등록(view)
$('#addbtn').click(function(){
	fn_notice_show();
});
$('#notice_cancle_btn').click(function(){
	fn_notice_show();
});

//프로젝트 공지글 등록(처리)
function projectAdd(){
	let list = document.projectForm_in;
	let notice_title = list.notice_title.value;
	let notice_content = list.notice_content.value;
	let project_no = ${param.project_no};

	if(notice_title == ""){
		swal({
			icon:'warning',
            text: "제목을 입력해주세요."
       }); 

		$('#notice_title').focus();
		return false;
	}
	if(notice_content == ""){
		swal({
			icon:'warning',
            text: "내용을 입력해주세요."
       }); 

		$('#notice_content').focus();
		return false;
	}
	
	$.ajax({
		url: '/startfun/project/projectNoticeAdd.do',
		type: 'post',
		dataType: 'json',
		data: {
			'notice_title' : notice_title,
			'notice_content' : notice_content,
			'project_no' : project_no
		},
		success: function(data){
			if(data > 0){
				projectList();
				fn_notice_show();
			}
		},
		error: function(){
			alert('공지 등록에 실패하였습니다.');
		}
	});//ajax : end
}//프로젝트 공지글 등록 : end

//프로젝트 공지글 삭제
function projectDel(form){
	var notice_no = form.notice_no.value;
	
	$.ajax({
		type: 'post',
		url: 'project/projectNoticeDel.do',
		data: {
			'notice_no' : notice_no
		},
		success: function(data){
			if(data > 0){
				projectList();
			}
		},
		error: function(){
			alert('공지글 삭제 실패');
		}
	});//ajax : end
}//프로젝트 공지글 삭제 : end

//프로젝트 공지글 수정(view)
$(document).on("click", "#editbtn", function(){
	$('#addbtn').hide();
	$('#notice_edit_div').toggle();
	$('#demo-docs-tab-tab2-content-body').toggle();
	projectEdit(this.form);
});
$('#notice_edit_cancle_btn').click(function(){
	$('#addbtn').show();
	$('#notice_edit_div').toggle();
	$('#demo-docs-tab-tab2-content-body').toggle();
});
function projectEdit(form){
	
	var notice_no = form.notice_no.value;
	
	$.ajax({
		url: 'project/projectNoticeDetail.do',
		type: 'post',
		data: {
			'notice_no' : notice_no
		},
		success: function(data){
			$('#notice_edit_title').val(data.notice_title);
			$('#notice_edit_content').summernote('code', data.notice_content);
			$('#notice_edit_no').val(notice_no);
		},
		error: function(){
			alert('수정 내용 불러오기 실패');
		}
	});//ajax : end
}//프로젝트 공지글 수정(view) : end

//프로젝트 공지글 수정(처리)
function projectUpdate(form){
	var notice_no = form.notice_edit_no.value;
	var notice_title = form.notice_edit_title.value;
	var notice_content = $('#notice_edit_content').val();
	
	$.ajax({
		url: 'project/projectNoticeUp.do',
		type: 'post',
		data:{
			'notice_no' : notice_no,
			'notice_title' : notice_title,
			'notice_content' : notice_content
		},
		success: function(data){
			if(data > 0){
				$('#notice_edit_div').hide();
				projectList();
				$('#demo-docs-tab-tab2-content-body').toggle();
			}
		},
		error: function(){
			alert('수정 처리 실패');
		}
	});//ajax : end
}//프로젝트 공지글 수정(처리) : end

///////////////////////////////////////////////////////////////////////

//qna 로그인 확인
$('#qna').click(function(){
	if('${principal}' == "") {
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
	}
});

//프로젝트 qna 목록
function qnaList(){
	$.ajax({
		url: 'qnaList.do',
		type: 'get',
		dataType: 'json',
		data: {
			'project_no' : ${param.project_no}
		},
		success: function(data){
			$('#reply_div').empty();
			
			if(data.length == 0){
				//$('#reply_div').append('<div class="text-center mt-10"><i class="far fa-grin-wink"></i>궁금한 점이 있다면 질문을 남겨주세요!</div>');
			}else{
				$.each(data, function(index,item){
					$('#reply_div').append(
							'<br><div id="qna_no'+item.qna_no+'">'
							+'<form method="post" id="qna" name="qna">'
							+item.qna_email+'<span class="small text-muted ml-3">'+item.qna_regdate+'</span>'
							+'<input type="hidden" id="qna_no" value="'+item.qna_no+'" class="reply_no">'
							+'<input type="hidden" id="qna_email" value="'+item.qna_email+'">'
							+'<div id="btn_div'+item.qna_no+'" class="col-sm-3 float-right">'
							+'<se:authorize access="hasRole(\'ROLE_ADMIN\')">'
							+'<input type="button" value="삭제" onclick="qnaDel(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right">'
							+'<input type="button" value="수정" onclick="qnaEdit(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right mr-1">'
							+'</se:authorize>'
							+'<c:if test="${pageContext.request.userPrincipal.name eq member_email}">'
							+'<input type="button" value="답글" onclick="qnaReply(this.form)" id="reply_btn'+item.qna_no+'" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right ml-1">'
							+'</c:if></div><br><br>'+item.qna_content
					);
							
					if(item.qna_reply == null){
						$('#reply_div').append('</form><div id="qna_reply'+item.qna_no+'"></div></div><hr>');
					}
					if(item.qna_reply != null){
						$('#reply_btn'+item.qna_no).hide();
						$('#reply_div').append(
								'<br><div id="qna_reply'+item.qna_no+'" class="bg-light py-4">'
								+'<form method="post" name="qna_reply" id="qna_reply">'
								+'<input type="hidden" id="qna_no" name="qna_no" value="'+item.qna_no+'">'
								+'<i class="fas fa-reply fa-rotate-180 text-dark-soft ml-3"></i>'
								+'<span class="ml-2">스타터</span>'+'<span class="small text-muted ml-3">'+item.qna_regdate+'</span>'
								+'<c:if test="${pageContext.request.userPrincipal.name eq member_email}">'
								+'<input type="button" value="삭제" onclick="reReplyDel(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right mr-2">'
								+'<input type="button" value="수정" onclick="reReplyEdit(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right mr-1">'
					  			+'</c:if>'
					  			+'<se:authorize access="hasRole(\'ROLE_ADMIN\')">'
								+'<input type="button" value="삭제" onclick="reReplyDel(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right mr-2">'
								+'<input type="button" value="수정" onclick="reReplyEdit(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right mr-1">'
					  			+'</se:authorize>'
								+'<br><br>'
								+'&emsp;&emsp;'+item.qna_reply+'</div>'
								+'</form></form></div><hr>'
						);
					}
					if('${principal}' == item.qna_email){
						$('#btn_div'+item.qna_no).append(
							'<input type="button" value="삭제" onclick="qnaDel(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right">'
							+'<input type="button" value="수정" onclick="qnaEdit(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right mr-1">'
						);
					}
				})//each : end
			}
		},
		error: function(){
			alert('목록을 불러 올 수 없습니다.');
		}
	});//ajax : end
}//프로젝트 qna 목록 : end

//프로젝트 qna 대댓글 등록(view)
function qnaReply(form){
	var qna_no = form.qna_no.value;
	
	$('#qna_reply'+qna_no).empty();
	
	$('#qna_reply'+qna_no).append('<form method="post" name="qna_reply" id="qna_reply">'
			+'<i class="fas fa-reply fa-rotate-180 text-dark-soft ml-3"></i>'
			+'<span class="ml-2">스타터</span>'
			+'<input type="button" value="취소" onclick="qnaList()" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right">'
			+'<input type="button" value="등록" onclick="replyAdd(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right mr-1">'
			+'<br>&emsp;&emsp;<textarea rows="2" cols="70" class="form-control form-pill" name="reply_content" id="reply_content" placeholder="내용을 입력해주세요."></textarea>'
			+'<input type="hidden" id="qna_no" value="' +qna_no +'" class="reply_no">'
			+'</form>'
	);

}//프로젝트 qna 대댓글 등록(view) : end
	
//프로젝트 qna 대댓글 등록(처리)
function replyAdd(form){
	var qna_reply = form.reply_content.value;
	var qna_no = form.qna_no.value;
	
	if(qna_reply == ""){
		swal({
            icon: 'warning',
            text: '내용을 입력해주세요.'
        });
		return false;
	}
	
	$.ajax({
		url: 'insertReReply.do',
		type: 'post',
		data: {
			'qna_no' : qna_no,
			'qna_reply' : qna_reply
		},
		success: function(data){
			if(data > 0){
				qnaList();
			}
		},
		error: function(){
			swal({
	            icon: 'warning',
	            text: '대댓글 등록이 불가합니다.'
	        });
		}
	});//ajax : end
}//프로젝트 qna 대댓글 등록(처리) : end

//프로젝트 qna 대댓글 삭제
function reReplyDel(form){
	console.log(form);
	$.ajax({
		url: 'deleteReReply.do',
		type: 'post',
		data: {
			'qna_no' : form.qna_no.value
		},
		success: function(data){
			if(data == 'ok'){
				qnaList();
			}
			if(data == 'fail'){
				swal({
					icon:'warning',
                    text: "답글삭제에 실패했습니다."
               }); 

				qnaList();
			}
		},
		error: function(){
			alert('대댓글 삭제 불가');
		}
	});//ajax : end
}//프로젝트 qna 대댓글 삭제 : end

//프로젝트 qna 대댓글 수정(view)
function reReplyEdit(form){
	console.log(form);
	var qna_no = form.qna_no.value;
	
	$.ajax({
		url: 'editQna.do',
		type: 'post',
		data: {
			'qna_no' : qna_no
		},
		success: function(data){
			$('#qna_reply'+qna_no).empty();
			
			$('#qna_reply'+qna_no).append('<form method="post" name="qna_reply" id="qna_reply">'
					+'<i class="fas fa-reply fa-rotate-180 text-dark-soft ml-3"></i>'
					+'<span class="ml-2">스타터</span>'+'<span class="small text-muted ml-3">'+data.qna_regdate+'</span>'
					+'<input type="button" value="취소" onclick="qnaList()" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right">'
					+'<input type="button" value="수정" onclick="reReplyUpdate(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right mr-1">'
					+'<br>&emsp;&emsp;<textarea rows="2" cols="70" class="form-control form-pill" name="reply_content" id="reply_content" placeholder="내용을 입력해주세요.">'+data.qna_reply+'</textarea>'
					+'<input type="hidden" id="qna_no" value="' +qna_no +'" class="reply_no"></form>'
			);
		},
		error: function(){
			alert('댓글 수정값을 가져올 수 없습니다.');
		}
	});//ajax : end
}//프로젝트 qna 대댓글 수정(view) : end

//프로젝트 qna 대댓글 수정(처리)
function reReplyUpdate(form){
	console.log(form);
	var qna_no = form.qna_no.value;
	var qna_reply = form.reply_content.value;
	
	$.ajax({
		url: 'insertReReply.do',
		type: 'post',
		data: {
			'qna_no' : qna_no,
			'qna_reply' : qna_reply
		},
		success: function(data){
			if(data > 0){
				qnaList();
			}
		},
		error : function(){
			alert('수정 처리 실패');
		}
	});//ajax : end
}

//프로젝트 qna 등록
function qnaAdd(){
	var list = document.qna;
	var qna_email = $('#qna_email').val();//list.qna_email.value;
	var qna_content = $('#qna_content').val();//list.qna_content.value;
	var project_no = ${param.project_no};
	
	if(qna_content == ""){
		swal({
            icon: 'warning',
            text: '내용을 입력해주세요.'
        });
		return false;
	}
	
	$.ajax({
		url: 'insertQna.do',
		type: 'post',
		data: {
			'qna_email' : qna_email,
			'qna_content' : qna_content,
			'project_no' : project_no
		},
		success: function(data){
			if(data > 0){
				qnaList();
				$('#qna_content').val("");
			}
		},
		error: function(){
			alert('등록에 실패했습니다.');
		}
	});//ajax : end
}//프로젝트 qna 등록 : end

//프로젝트 qna 삭제
function qnaDel(form){
	var qna_no = form.qna_no.value;
	
	$.ajax({
		url: 'deleteQna.do',
		type: 'post',
		data: {
			'qna_no' : qna_no
		},
		success: function(data){
			if(data > 0){
				qnaList();
			}
		},
		error: function(){
			alert('삭제에 실패했습니다.');
		}
	});//ajax : end
}//프로젝트 qna 삭제 : end

//프로젝트 qna 수정(view)
function qnaEdit(form){
	var qna_no = form.qna_no.value;
	console.log(qna_no);
	
	$.ajax({
		url: 'editQna.do',
		type: 'post',
		data: {
			'qna_no' : qna_no
		},
		success: function(data){
			
			var htmls = '<div id="qna_no'+data.qna_no+'"><form method="post">'
					+data.qna_email+'<span class="small text-muted ml-3">'+data.qna_regdate+'</span>'
					+'<input type="hidden" id="qna_no" value="' +data.qna_no +'" class="reply_no">'
					+'<input type="button" value="취소" onclick="qnaList()" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right">'
					+'<input type="button" value="수정" onclick="updateQna(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right mr-1">'
					+'<br><br><textarea rows="2" cols="70" class="form-control form-pill" name="editQna" id="editQna">'+data.qna_content+'</textarea></form></div>';
					
					$('#qna_no'+qna_no).replaceWith(htmls);
		},
		error: function(){
			alert('수정 값을 불러오지 못함');
		}
	});//ajax : end
}//프로젝트 qna 수정(view) : end

//프로젝트 qna 수정(처리)
function updateQna(form){
	var qna_no = form.qna_no.value;
	var qna_content = form.editQna.value;
	
	$.ajax({
		url: 'updateQna.do',
		type: 'post',
		data: {
			'qna_no' : qna_no,
			'qna_content' : qna_content
		},
		success: function(data){
			if(data > 0){
				qnaList();
			}
		},
		error : function(){
			alert('수정 처리 실패');
		}
	});//ajax : end
}

//실시간 채팅
function openChat(url){
	window.open(url, '실시간 상담하기', 'width=400, height=600');
}
//실시간 채팅 클릭 시 팝업창 생성
$('#liveChat').click(function(){
	
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
	} else {
	
		 $.ajax({
	      url:'/startfun/createChat.do',	// 채팅방이 있는지 확인하고 없으면 만들어주는 메서드
	      type: 'GET',
	      data:{
	     	 "master_email" : "${detail.memberVO.member_email}",
	     	 "project_no" : "${param.project_no}"
	      },
	      success:function(data){	// 방 번호를 가져온다
	     	 console.log(data)
	          if(data == 'fail') {	// 에러
	         	 return;
	          } else {
	         	openChat('/startfun/liveChat.do?room_id='+data)
	          }
	      }
	  });
	 
	}
});


</script>
</html>