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
					<h2 class="h3 text-center">참여 프로젝트</h2>
				</div>
				
				<ul class="nav nav-bordered justify-content-center" id="join-tab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="join-tab-tab1" href="/startfun/mypage/join/supportlist.do" aria-selected="true">후원</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="join-tab-tab2" href="/startfun/mypage/join/investlist.do" aria-selected="false">투자</a>
					</li>
				</ul>
				
				<div class="tab-content" id="join-tabContent">
					<div class="tab-pane fade p-3 show active" id="join-tab1-content" role="tabpanel" aria-labelledby="demo-docs-tab-tab1">
						
				<c:if test="${empty list}">
				<div class="justify-content-center text-center mb-8 mt-10 pb-10 pt-8 list-group-item">
					<span  style="color: #9a9a9b8c">
						<i class="far fa-file fa-8x"></i>
					</span>
					<br>
					<p class="mt-3">참여한 프로젝트가 없습니다.</p>
				</div>
				</c:if>
				
				
				<h5 id="success" class="ml-5">후원 성공</h5>
				<ul id="success_ul" class="list-group">
					<c:forEach items="${list}" var="n">
					<c:if test="${n.support_status eq '결제예정' or n.support_status eq '결제완료'}">
					<li class="list-group-item">
						<a href="/startfun/mypage/join/support.do?no=${n.support_no}" class="link-dark link-hover-dark bg-hover-light">
							<div class="media align-items-center">
								<div class="d-flex mr-4">
							    	<img src="${pageContext.request.contextPath}/upload/${n.project.project_thumbnail}" width="150" height="110" alt="project thumbnail">
							    </div>
							    <div class="media-body">
							    	<span class="small text-muted">no. ${n.support_no} </span><br>
							    	<p class="mb-0"><span class="text-black">${n.project.project_title}</span></p>
							    	<span class="small text-muted">후원일 - ${n.support_dt}</span><br>
							    	<span class="small text-muted">리워드 - ${n.reward.reward_compose}</span><br>
							    	<c:if test="${n.support_status eq '결제완료' and not empty n.reward.due_date}">
										<span class="small text-muted">전달예정일 - ${n.reward.due_date}</span> <br>
									</c:if>
							    	<c:if test="${n.support_status eq '결제완료' and not empty n.reward_status}">
										<span class="small text-muted">리워드상태 - ${n.reward_status}</span> <br>
									</c:if>
									<c:if test="${n.support_status eq '결제완료'}">
										<span class="small text-muted"><fmt:formatNumber value="${n.project.total}" />원 결제완료 (${n.payment_dt})</span> <br>
									</c:if>
									<c:if test="${n.support_status eq '결제예정'}">
										<span class="small text-muted"><fmt:formatNumber value="${n.project.total}" />원 결제예약 (결제예정일: ${n.payment_dt})</span>
									</c:if>
							    </div>
							    <c:if test="${n.reward_status eq '리워드완료'}">
							    <div class="ml-auto">
									<button type="button" id="review_btn" class="btn btn-sm btn-outline-primary" data-toggle="modal" data-target="#reviewModal">
										후기작성
										<input type="hidden" id="project_no" value="${n.project_no}">
										<input type="hidden" id="support_no" value="${n.support_no}">
									</button>
								</div>
								</c:if>
							</div>
						</a> 
					</li>
					</c:if>
					</c:forEach>
				</ul>
				
				<h5 id="fail" class="ml-3 mt-5">후원 실패</h5>
				<ul id="fail_ul" class="list-group">
					<c:forEach items="${list}" var="n">
					<c:if test="${n.support_status eq '결제취소'}">
					<li class="list-group-item">
						<a href="/startfun/mypage/join/support.do?no=${n.support_no}" class="link-dark link-hover-dark bg-hover-light">
							<div class="media align-items-center">
								<div class="d-flex mr-4">
							    	<img src="${pageContext.request.contextPath}/upload/${n.project.project_thumbnail}" width="150" height="110" alt="project thumbnail">
							    </div>
							    <div class="media-body">
							    	<span class="small text-muted">no. ${n.support_no} </span><br>
							    	<p class="mb-0"><span class="text-black">${n.project.project_title}</span></p>
							    	<span class="small text-muted">후원일 - ${n.support_dt}</span><br>
							    	<span class="small text-muted">리워드 - ${n.reward.reward_compose}</span><br>
									<span class="small text-muted"><fmt:formatNumber value="${n.project.total}" />원 결제 예약 취소</span>
							    </div>
							</div>
						</a>
					</li>
					</c:if>
					</c:forEach>
				</ul>
				
					</div>
				</div>				
			</div>
		</div>
	</div>
</main>
<!-- End main -->
	
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->

<!-- 후기쓰기 Modal -->
 <div id="reviewModal" class="modal fade" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">체크리스트</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 체크리스트 -->
		<div class="form-check position-relative mb-2">
			<br>
			- 리워드의 완성도는 어땠나요?<br>
			<input id="review1_5" type="radio" name="review1" value="5" checked><label for="review1_5">&nbsp;매우만족</label>&nbsp;&nbsp;&nbsp;
			<input id="review1_4" type="radio" name="review1" value="4"><label for="review1_4">&nbsp;만족</label>&nbsp;&nbsp;&nbsp;
			<input id="review1_3" type="radio" name="review1" value="3"><label for="review1_3">&nbsp;보통</label>&nbsp;&nbsp;&nbsp;
			<input id="review1_2" type="radio" name="review1" value="2"><label for="review1_2">&nbsp;불만족</label>&nbsp;&nbsp;&nbsp;
			<input id="review1_1" type="radio" name="review1" value="1"><label for="review1_1">&nbsp;매우불만족</label>
		</div><br>
		<div class="form-check position-relative mb-2">
			- 배송 예정일이 잘 지켜졌나요?<br>
			<input id="review2_5" type="radio" name="review2" value="5" checked><label for="review2_5">&nbsp;매우만족</label>&nbsp;&nbsp;&nbsp;
			<input id="review2_4" type="radio" name="review2" value="4"><label for="review2_4">&nbsp;만족</label>&nbsp;&nbsp;&nbsp;
			<input id="review2_3" type="radio" name="review2" value="3"><label for="review2_3">&nbsp;보통</label>&nbsp;&nbsp;&nbsp;
			<input id="review2_2" type="radio" name="review2" value="2"><label for="review2_2">&nbsp;불만족</label>&nbsp;&nbsp;&nbsp;
			<input id="review2_1" type="radio" name="review2" value="1"><label for="review2_1">&nbsp;매우불만족</label>
		</div><br>
		<div class="form-check position-relative mb-2">
			- 스타터와 연락/의사소통이 잘 됐나요?<br>
			<input id="review3_5" type="radio" name="review3" value="5" checked><label for="review3_5">&nbsp;매우만족</label>&nbsp;&nbsp;&nbsp;
			<input id="review3_4" type="radio" name="review3" value="4"><label for="review3_4">&nbsp;만족</label>&nbsp;&nbsp;&nbsp;
			<input id="review3_3" type="radio" name="review3" value="3"><label for="review3_3">&nbsp;보통</label>&nbsp;&nbsp;&nbsp;
			<input id="review3_2" type="radio" name="review3" value="2"><label for="review3_2">&nbsp;불만족</label>&nbsp;&nbsp;&nbsp;
			<input id="review3_1" type="radio" name="review3" value="1"><label for="review3_1">&nbsp;매우불만족</label>
		</div>
		<div class="modal-footer">
			<button type="reset" class="btn btn-secondary" data-dismiss="modal" id="reviewcancle">취소</button>
         	<button id="reportSubmit" class="btn btn-primary">작성완료</button>
        </div>
		<!-- 체크리스트 End -->
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->

</body>

	<script type="text/javascript">
		$(function (){
			let success_ul = $('#success_ul').find('li');
			if(success_ul.length == 0) {
				$('#success').hide();
			}
			
			let fail_ul = $('#fail_ul').find('li');
			if(fail_ul.length == 0) {
				$('#fail').hide();
			}
			
		});
		
		//후기작성
		var scoreArr = [];
		var Selected1;
		var Selected2;
		var Selected3
		$(function(){
			Selected1 = $("input[name='review1']:checked").val();  
			Selected2 = $("input[name='review2']:checked").val();
			Selected3 = $("input[name='review3']:checked").val();
			
			scoreArr.push(Selected1);
			scoreArr.push(Selected2);
			scoreArr.push(Selected3);
		});

		$("input[name='review1']:radio").change(function () {
			var Selected1 = $("input[name='review1']:checked").val();  
			scoreArr[0] = Selected1;
		});

		$("input[name='review2']:radio").change(function () {
			var Selected2 = $("input[name='review2']:checked").val();  
			scoreArr[1] = Selected2;
		});

		$("input[name='review3']:radio").change(function () {
			var Selected3 = $("input[name='review3']:checked").val();  
			scoreArr[2] = Selected3;
		});
		
		let project_no = "";
		let support_no = "";
		
		$(document).on("click", "#review_btn", function(e){
			e.preventDefault();
			e.stopPropagation();
			
			project_no = $(this).find('#project_no').val();
			support_no = $(this).find('#support_no').val();
			
		});
		//후기작성 완료
		$('#reportSubmit').click(function(){
			
			var jsonparam = {
			        "project_no": project_no,
			        "scoreArr" : scoreArr,
			        "support_no" : support_no
			};
			
			$.ajax(
				   {
		         	type : "post",
					url  : "/startfun/writeReviewDone.do",
					dataType : "json",
					data : jsonparam,
		            async: false,
		            success : function(data){ 
		            	
		            	$('#reviewModal').modal('hide');
		            	
						if(data.result > 0) {
							swal({
	                              text: "후기작성을 완료하였습니다.",
	                              button: false,
	                              timer: 1500
	                         }); 

		                }else {
		                	swal({
								icon:'warning',
		                        text: "후기작성을 실패하였습니다."
		                   }); 

		                }
		            } 
		   		});
		});

		//후기쓰기 취소시 작성내용 초기화
		$('#reviewcancle').click(function(){
			$('input[name="review1"]').removeAttr('checked');
			$('input[name="review2"]').removeAttr('checked');
			$('input[name="review3"]').removeAttr('checked');
			$('input[name="review1"]')[0].checked = true;
			$('input[name="review2"]')[0].checked = true;
			$('input[name="review3"]')[0].checked = true;
		});
	</script>
</html>