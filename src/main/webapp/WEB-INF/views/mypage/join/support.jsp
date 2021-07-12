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
						<a href="/startfun/supportDetail.do?project_no=${support.project_no}" class="link-dark link-hover-dark bg-hover-light">
							<div class="media align-items-center">
								<div class="d-flex mr-4">
									<img src="${pageContext.request.contextPath}/upload/${support.project.project_thumbnail}" width="150" height="110" alt="project thumbnail">
								</div>
								<div class="media-body">
									<span class="small text-muted">${support.project_category.category_name}</span><br>
									<p class="mb-0"><span class="text-black">${support.project.project_title}</span></p>
									<span class="small text-muted">
										<c:if test="${support.dday gt '0'}">
											${support.dday}일 남음 <br>
										</c:if>
										${support.project.project_start} ~ ${support.project.project_end} 
									</span>
								</div>
							</div>
						</a>
					</li>
				</ul>
			
				<h5 class="ml-3 mt-7">후원 정보</h5>
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
					</tbody>
				</table>
				
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
								${support.reward_status}
								<input type="hidden" id="reward_status" value="${support.reward_status}">
								<c:if test="${support.reward.due_date != null}">
								(전달예정일 : ${support.reward.due_date})
								</c:if>
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
							<td><fmt:formatNumber value="${support.total}" />원</td>
						</tr>
						<tr>
							<th class="ml-4">결제상태</th>
							<td>
								${support.payment_dt} ${support.support_status}
								<input type="hidden" id="support_status" value="${support.support_status}">
							</td>
						</tr>
					</tbody>
				</table>
				
				<form action="${pageContext.request.contextPath}/mypage/sponsorstatus.do">
				<input type="hidden" name="support_no" id="support_no" value="${support.support_no}" />
				<input type="hidden" name="project_no" id="project_no" value="${support.project_no}" />
				<h5 class="ml-3 mt-7" style="display:inline-block">배송 정보</h5> <input type="button" id="ship_btn" class="btn btn-sm btn-outline-primary float-right mb-2 mt-6" data-toggle="modal" data-target="#exampleModal" value="배송지 수정" >
				<table class="list-group-item">
					<tbody>
						<tr>
							<th class="ml-4">받는사람</th>
							<td id="ship_name_info">${support.ship_name}</td>
						</tr>
						<tr>
							<th class="ml-4">연락처</th>
							<td id="ship_phone_info">${support.ship_phone}</td>
						</tr>
						<tr>
							<th class="ml-4">주소</th>
							<c:set var="ship_address" value="${support.ship_address}" />
							<td id="ship_address_info">${fn:replace(ship_address, '+', ' ')}</td>
						</tr>
						<tr>
							<th class="ml-4">메모</th>
							<td id="ship_memo_info">${support.ship_memo}</td>
						</tr>
					</tbody>
				</table>
				</form>
				
				<div class="justify-content-center mx-auto col-sm-6 text-center mb-7 mb-5 mt-5">
					<button type="button" id="support_cancel_btn" onclick="location.href='/startfun/mypage/join/supportcancel.do?no=${support.support_no}'" class="btn btn-outline-primary col-sm-3">후원취소</button>
					<button type="button" onclick="location.href='/startfun/mypage/join/supportlist.do'" class="btn btn-primary col-sm-3">목록</button>
				</div>

			</div>
		</div>
	</div>
</main>
<!-- End main -->
	
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->

<!-- Modal -->
<div id="exampleModal" class="modal fade" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">배송지 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
			  <div class="form-group">
			    <label for="ship_name">받는 사람</label>
			    <input name="ship_name" type="text" class="form-control form-pill" id="ship_name" value="${support.ship_name}">
			  </div>
			  <div class="form-group">
			    <label for="ship_phone">연락처</label>
			    <input name="ship_phone" type="text" class="form-control form-pill" id="ship_phone" value="${support.ship_phone}">
			  </div>
			  <div class="form-group">
			  	<c:set var="address" value="${fn:split(ship_address,'+')}" />
			    <label for="ship_address">주소</label>
			    <input name="ship_address_zip" type="text" class="form-control form-pill" id="ship_address_zip" value="${address[0]}">
			    <input name="ship_address_detail" type="text" class="form-control form-pill mt-1" id="ship_address_detail" value="${address[1]}" placeholder="상세주소">
			    <input name="ship_address" type="hidden" id="ship_address" value="${support.ship_address}">
			  </div>
			  <div class="form-group">
			    <label for="ship_memo">배송메모</label>
			    <input name="ship_memo" type="text" class="form-control form-pill" id="ship_memo" value="${support.ship_memo}" placeholder="부재시 문앞에 놔주세요">
			  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button id="modify_btn" type="button" class="btn btn-primary">수정</button>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->

</body>
	
	<!-- 카카오 우편 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript">
		
		/* 부트스트랩 제공 모달 팝업 */
		$('#myModal').on('shown.bs.modal', function () {
			$('#myInput').trigger('focus');
		});
		
		let reward_status = $('#reward_status').val();
		let support_status = $('#support_status').val();
		console.log(reward_status);
		/* 배송지 수정하기 버튼 비활성화 */
		if(reward_status == '배송예정' || reward_status == '리워드완료' || support_status == '결제취소') {
			$('#ship_btn').prop('disabled', true);
		}
		
		/* 후원취소 버튼 비활성화 */
		if(support_status == '결제완료' || support_status == '결제취소'){
			$('#support_cancel_btn').hide();
		}
		
		/* 연락처 유효성 검사 */
		$(function() {
			$('#ship_phone').keyup(function() {
				var phonenum = $('#ship_phone').val();
				var regExp = /^\d{3}-\d{3,4}-\d{4}$/;

				if (regExp.test(phonenum)) {
					$('#phoneCheck').text('');

				} else if (!regExp.test(phonenum)) {
					$('#phoneCheck').css('color', 'red');
					$('#phoneCheck').text("올바른 전화번호 형식으로 입력(-포함)");
				}

			})
		})

		/* 모달 수정하기 버튼 클릭 시 function 실행 */
		$('#modify_btn').on("click", function() {

			if ($('#ship_name').val() == "") {
				swal({
					icon:'warning',
                    text: "받는사람을 입력하세요."
               }); 
				return false;
			}
			if ($('#ship_phone').val() == "") {
				swal({
					icon:'warning',
                    text: "연락처를 입력하세요."
               }); 
				return false;
			}
			if ($('#ship_address_zip').val() == "") {
				swal({
					icon:'warning',
                    text: "주소를 입력하세요."
               }); 
				return false;
			}
			if ($('#ship_address_detail').val() == "") {
				swal({
					icon:'warning',
                    text: "상세주소를 입력하세요."
               }); 
				return false;
			}
			if ($('#ship_address').val() == "") {
				swal({
					icon:'warning',
                    text: "주소를 입력하세요."
               }); 
				return false;
			}
			
			var phonenum = $('#ship_phone').val();
			var regExp = /^\d{3}-\d{3,4}-\d{4}$/;

			if (!regExp.test(phonenum)) {
				swal({
					icon:'warning',
                    text: "올바른 전화번호 형식으로 입력(-포함)하세요."
               }); 
				return false;
			}

			fn_modifyShipInfo();
			fn_getShipInfo();
		});

		/* 수정하기 비동기 */
		function fn_modifyShipInfo() {

			let paramData = JSON.stringify({
				"ship_name" : $('#ship_name').val(),
				"ship_phone" : $('#ship_phone').val(),
				"ship_address" : $('#ship_address').val(),
				"ship_memo" : $('#ship_memo').val(),
				"support_no" : $('#support_no').val()
			});

			$.ajax({
				url : "/startfun/modifyship.do",
				data : paramData,
				type : 'POST',
				async : false,
				cache : false,
				dataType : "text",
				contentType : "application/json; charset=utf-8",
				success : function(data, status) {
					console.log("status:" + status + "," + "data:" + data);
					$('#exampleModal').modal('hide');
					swal({
                        text: "수정이 완료되었습니다.",
                        button: false,
                        timer: 1500
                   }); 

				},
				error : function(request, status, error) {
					console.log("code : " + request.statusText
							+ "\r\nmessage : " + request.responseText);
				}
			});
		}

		/* 수정하고 노출하는 비동기 */
		function fn_getShipInfo() {

			$.ajax({
				url : "/startfun/shipinfo.do",
				data : {
					support_no : $('#support_no').val()
				},
				type : 'POST',
				async : false,
				cache : false,
				success : function(data) {
					console.log(data);
					//input value 변경
					$('#ship_name').val(data.ship_name);
					$('#ship_phone').val(data.ship_phone);
					$('#ship_address').val(data.ship_address);
					$('#ship_memo').val(data.ship_memo);

					//div 정보 변경
					$('#ship_name_info').html(data.ship_name);
					$('#ship_phone_info').html(data.ship_phone);
					$('#ship_address_info').html(
							data.ship_address.replace('+', ' '));
					$('#ship_memo_info').html(data.ship_memo);
				},
				error : function(request, status, error) {
					console.log("code : " + request.statusText
							+ "\r\nmessage : " + request.responseText);
				}
			});
		}

		/* 주소찾기 카카오 API */
		$("#ship_address_zip").on("click", function() {

					new daum.Postcode({
						oncomplete : function(data) {
							var fullAddr = '';
							var extraAddr = '';

							if (data.userSelectedType === 'R') {
								fullAddr = data.roadAddress;
							} else {
								fullAddr = data.jibunAddress;
							}
							if (data.userSelectedType === 'R') {
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}
							$('#ship_address_zip').val(fullAddr);
							$('#ship_address_detail').focus();
						}
					}).open();
				});

		/* 주소 합치기 (zip주소 + 상세주소) */
		$('#ship_address_detail').focusout(function() {
					$('#ship_address').val(
							$('#ship_address_zip').val() + "+"+ $('#ship_address_detail').val());
					console.log($('#ship_address').val());
		});
	</script>
</html>