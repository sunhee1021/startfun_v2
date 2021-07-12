<%--
@JSP : joinsupportNext.jsp 
@Date : 2021.06.11
@Author : 이보희
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<c:set var="reward" value="${reward}" /> 

 <div class="container">
      <div class="row justify-content-center py-11" >
		<div class="col-lg-8">
		  <div class="w-md-80 w-lg-40 mx-auto text-center mb-7">
            <h2 class="h3 text-center">${reward.projectVO.project_title}</h2>
		 </div>
		 <div class="row">
        <div class="col-lg-12 mb-4 mb-lg-3 order-lg-2">
          <hr><br>
            <h5>리워드</h5>	
        	<div class="js-sticky-sidebar" style="height: 150px; background: #d3d3d336;">
        		<table class="table">
				  <tbody>
				    <tr>
				      <td scope="row" style="border-top: 0px; width: 150px;">총 결제금액</td>
				      <td style="border-top: 0px"><fmt:formatNumber value="${reward.reward_price + reward.reward_charge + param.support_add_amount}" pattern="#,###"/>원</td>
				    </tr>
				    <tr>
				      <td scope="row" style="border-top: 0px">리워드</td>
				      <td style="border-top: 0px">${reward.reward_compose}</td>
				    </tr>
				    <tr>
				      <td scope="row" style="border-top: 0px">배송예정일</td>
				      <td style="border-top: 0px">${reward.due_date}</td>
				    </tr>
				  </tbody>
				</table>
			</div>
			<br><br><hr><br>
			<div class="js-sticky-sidebar">
				<div style="float: left; width: 50%"><h5>결제방식</h5></div>	 
				<div style="float: left; width: 50%; text-align: right">카드</div>
			</div><br><br><hr><br>
        
			<h5>결제정보</h5>
			<div class="js-sticky-sidebar" style="height: 280px; background: #d3d3d336;">
				<table class="table">
				  <tbody>
				    <tr>
				      <td scope="row" style="border-top: 0px; width: 110px; padding-left: 25px; padding-top: 25px;">카드번호</td>
				      <td style="border-top: 0px; padding-bottom:0px; padding-right: 25px;">
				        <div class="row">
			      		  <div class="col-md-3 form-group mb-4">
			                <input class="form-control form-pill" type="text" style="height: 40px; text-align: center" id="card1"
			                	   maxlength=4 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			              </div>
			              <div class="col-md-3 form-group mb-4">
			                <input class="form-control form-pill" type="text" style="height: 40px; text-align: center" id="card2"
			                	   maxlength=4 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			              </div>
			              <div class="col-md-3 form-group mb-4">
			                <input class="form-control form-pill" type="text" style="height: 40px; text-align: center" id="card3"
			                	   maxlength=4 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			              </div>
			              <div class="col-md-3 form-group mb-4">
			                <input class="form-control form-pill" type="text" style="height: 40px; text-align: center" id="card4"
			                	   maxlength=4 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			              </div>
				        </div>
				      </td>
				    </tr>
				    <tr>
				      <td scope="row" style="border-top: 0px; width: 110px; padding-left: 25px;">유효기간</td>
				      <td style="border-top: 0px; padding-top:0px; padding-right: 25px;">
				      	 <div class="row">
					        <select class="custom-select form-pill" name="month" style="width: 250px; height: 46px; margin-left: 15px; margin-right: 32px;">
							  <option value="">월</option>
							  <option value="1">1월</option>
							  <option value="2">2월</option>
							  <option value="3">3월</option>
							  <option value="4">4월</option>
							  <option value="5">5월</option>
							  <option value="6">6월</option>
							  <option value="7">7월</option>
							  <option value="8">8월</option>
							  <option value="9">9월</option>
							  <option value="10">10월</option>
							  <option value="11">11월</option>
							  <option value="12">12월</option>
							</select>
							<select class="custom-select form-pill" name="year" style="width: 250px; height: 46px; ">
				            	<option value="">년</option>
				                <option value="2021">2021년</option>
				                <option value="2022">2022년</option>
				                <option value="2023">2023년</option>
				                <option value="2024">2024년</option>
				                <option value="2025">2025년</option>
				                <option value="2026">2026년</option>
				                <option value="2027">2027년</option>
				                <option value="2028">2028년</option>
				                <option value="2029">2029년</option>
				                <option value="2030">2030년</option>
				                <option value="2031">2031년</option>
				            </select>
	            		</div>
				      </td>
				    </tr>
				    <tr>
				      <td scope="row" style="border-top: 0px; width: 110px; padding-left: 25px; padding-top: 20px;">생년월일 6자리</td>
				      <td style="border-top: 0px; padding-bottom:0px; padding-right: 25px;">
				        <div class="row">
			      		  <div class="col-md-7 form-group mb-4">
			                <input class="form-control form-pill" type="text" style="height: 40px; width: 310px;" id="birth"
			                       maxlength=6 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			              </div>
			              <div class="col-md-3 form-group mb-4" style="padding-top: 5px;">
			                	ex)930723
			              </div>
				        </div>
				      </td>
				    </tr>
				     <tr>
				      <td scope="row" style="border-top: 0px; width: 160px; padding-left: 25px; padding-top: 15px;">비밀번호 앞 2자리</td>
				      <td style="border-top: 0px; padding-bottom:0px; padding-right: 25px;">
				        <div class="row">
			      		  <div class="col-md-2 form-group mb-4">
			                <input class="form-control form-pill" type="text" style="height: 40px; text-align: center" id="pwd1"
			                	   maxlength=1 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			              </div>
			              <div class="col-md-2 form-group mb-4">
			                <input class="form-control form-pill" type="text" style="height: 40px; text-align: center" id="pwd2"
			                	   maxlength=1 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			              </div>
			              <div class="col-md-2 form-group mb-4">
			                <input class="form-control form-pill" type="text" style="height: 40px; text-align: center" value="*" disabled>
			              </div>
			              <div class="col-md-2 form-group mb-4">
			                <input class="form-control form-pill" type="text" style="height: 40px; text-align: center" value="*" disabled>
			              </div>
				        </div>
				      </td>
				    </tr>
				  </tbody>
				</table>
			 </div><br><hr><br>
			<h5>리워드 수령정보</h5>
			<form action="/startfun/joinSupport.do" method="post" id="shipInfo">
				<input type="hidden" name="project_no" value="${reward.project_no}">
          		<input type="hidden" name="support_reward" value="${reward.reward_no}">
          		<input type="hidden" name="support_amount" value="${reward.reward_price}">
          		<input type="hidden" name="support_add_amount" value="${param.support_add_amount}">
			  <div class="tab-pane fade show active" id="tab-memberInfo" role="tabpanel">
			  	<div class="mb-5 mt-5 ">
					<div class="form-group mb-4">
						<label for="ship_name">받는분</label>
						<input type="text" id="ship_name" name="ship_name" class="form-control form-pill">
					</div>
					<div class="form-group mb-4">
						<label for="ship_phone">휴대폰번호</label>
						<input type="text" id="ship_phone" name="ship_phone" class="form-control form-pill"  placeholder="ex) 010-0000-0000"
						       oninput="this.value = this.value.replace(/[^0-9.-]/g, '').replace(/(\..*)\./g, '$1');">
					</div>
					<div class="form-group mb-4">
					  	<c:set var="address" value="${fn:split(ship_address,'+')}" />
					    <label for="ship_address">주소</label>
					    <input name="ship_address_zip" type="text" class="form-control form-pill" id="ship_address_zip" value="${address[0]}">
					    <input name="ship_address_detail" type="text" class="form-control form-pill" id="ship_address_detail" value="${address[1]}" placeholder="상세주소">
					    <input name="ship_address" type="hidden" id="ship_address" >
					</div>
					<div class="form-group mb-4">
						<label for="ship_memo">배송메모</label>
						<input type="text" id="ship_memo" name="ship_memo" class="form-control form-pill">
					</div>
				</div>
			  </div>
			</form>
			<br><hr><br>
			<h5>유의사항 및 약관동의</h5><br>
			<h6>스타트펀 펀딩 결제시 유의사항</h6>
			<div style="overflow:auto; width:100%; height:100px; border:1px solid #d3d3d396; padding: 15px;">
				1. 무조건 리워드(목표액에 미달하여도 진행)방식의 진행 프로젝트는 오마이컴퍼니 펀딩 철회 기준에 의거하여 프로젝트 종료일 당일에는 결제의 취소 및 환불이 불가합니다. 결제 취소 가능기간 내에 취소한 금액은 취소한 날로부터 영업일 기준 3~5일 이내로 환불이 진행됩니다.<br>
				2. 성공해야 리워드(목표액에 달성되어야 진행)방식의 진행 프로젝트는 펀딩 마감일 기준 목표액에 달성한 경우에만 등록된 카드로부터 인출이 진행됩니다. 프로젝트 종료일 1일 전까지 결제철회가 가능하며, 프로젝트 종료일 당일 및 펀딩 마감일 이후 프로젝트 성공 시 결제철회는 불가합니다.<br>
				3. 개별 서비스의 성격에 따라 회사는 별도 약관 및 이용조건에 따른 취소 및 환불 규정을 정할 수 있으며, 이 경우 개별 약관 및 이용조건 상의 취소 및 환불규정이 우선 적용됩니다. 이용안내에 규정되지 않은 취소 및 환불에 대한 사항에 대해서는 소비자 분쟁 해결 기준에 의거하여 처리됩니다.
			</div>
			<div style="text-align: right; margin-top: 5px">
				<input type="checkbox" id="check1" name="terms">
				<label for="check1">&nbsp;확인하고 동의합니다.</label>
			</div><br>
			<h6>배송 및 결제관련 제3자 정보제공 동의</h6>
			<div style="overflow:auto; width:100%; height:100px; border:1px solid #d3d3d396; padding: 15px;">
				‘참여하기’를 통한 결제 및 리워드 배송 서비스를 제공하기 위해 회원의 사전 동의 아래 제3자(프로젝트 개설자)에게 제공합니다.<br>
				개설자에게 전달되는 개인 정보는 기재된 목적 달성 후 파기에 대한 책임이 개설자에게 있으며, 파기하지 않아 생기는 문제에 대한 법적 책임은 개설자에게 있습니다.<br>
				아래 내용에 대하여 동의를 거부하실 수 있으며, 거부 시 서비스 이용이 제한됩니다.
			</div>
			<div style="text-align: right; margin-top: 5px">
				<input type="checkbox" id="check2" name="terms">
				<label for="check2">&nbsp;확인하고 동의합니다.</label><br><br>
			</div>
			<h6>책임규정</h6>
			<div style="overflow:auto; width:100%; height:100px; border:1px solid #d3d3d396; padding: 15px;">
				스타트펀은 플랫폼을 제공하는 중개자로 크라우드펀딩을 받는 당사자가 아닙니다.<br>
				리워드 제공 등에 관한 지연, 제품의 하자 등으로 인한 일체의 법적책임은 펀딩을 받는 프로젝트 개설자가 부담합니다.<br>
				하지만 스타트펀은 프로젝트 개설자와 후원자간의 원활한 의사소통을 위해 최선의 노력을 다하겠습니다.
			</div>
			<div style="text-align: right; margin-top: 5px">
				<input type="checkbox" id="check3" name="terms">
				<label for="check3">&nbsp;확인하고 동의합니다.</label>
			</div>	
			<div style="text-align: right; margin-top: 5px">
			  <input type="checkbox" id="customCheck1" name="selectall" onclick="selectAll(this)">
			  <label for="customCheck1">전체동의</label>
			</div>
			<div style="text-align: center">
	        	<button id="joinSupportBtn" class="btn btn-primary" type="button" >참여하기</button>
	        </div>
	        
		  </div>
        </div>
        </div>
      </div>
	</div>
  </main>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer --> 
</body>

<!-- iamport -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 카카오 우편 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
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

function checkSelectAll() {
    //전체 체크박스
    const checkboxes = document.querySelectorAll('input[name="terms"]');
    //선택된 체크박스
    const checked = document.querySelectorAll('input[name="terms"]:checked');
    //select all 체크박스
    const selectAll = document.querySelector('input[name="selectall"]');
    
    if(checkboxes.length === checked.length) {
       selectAll.checked = true;
    }else {
       selectAll.checked = false;
    }
 }
 
 //체크박스 전체선택
 function selectAll(selectAll) {
    const checkboxes = document.getElementsByName('terms');
    
    checkboxes.forEach((checkbox) => {
       checkbox.checked = selectAll.checked
    })
 }
 
//결제하기

$('#joinSupportBtn').click(function(){

	//카드번호 4자리
	for(var i=1; i <=4; i++){
	      var card = $("#card"+i).val();
	      var regExp2 = /^\d{4}$/;
	      if (!regExp2.test(card)) {
	  		swal({
   			  text: "카드번호를 정확히 입력하세요.",
   			  icon: "warning"
   			});
	  		return false;
	  	}
	}
	if (!$("[name=month] > option:selected").val() || !$("[name=year] > option:selected").val()) {
		swal({
 			  text: "카드 유효기간을 선택하세요.",
 			  icon: "warning"
 		});
		return false;
	} 
	//생년월일 6자리 
	var birth = $('#birth').val();
	var regExp2 = /^\d{6}$/;
	if (!regExp2.test(birth)) {
		swal({
			  text: "생년월일 6자리를 입력하세요.",
			  icon: "warning"
		});
		$('#birth').focus();
		return false;
	}
	if ($('#pwd1').val() == "" || $('#pwd2').val() == "") {
		swal({
			  text: "카드 비밀번호를 입력하세요.",
			  icon: "warning"
		});
		return false;
	}
    if ($('#ship_name').val() == "") {
		swal({
			  text: "받는 사람을 입력하세요.",
			  icon: "warning"
		});
		$('#ship_name').focus();
		return false;
	}
	//핸드폰번호 형식
	var phonenum = $('#ship_phone').val();
	var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
	if (!regExp.test(phonenum)) {
		swal({
			  text: "핸드폰번호를 형식에 맞게 입력해주세요.",
			  icon: "warning"
		});
		return false;
	}
	if ($('#ship_address_zip').val() == "" || $('#ship_address').val() == "") {
		swal({
			  text: "주소를 입력하세요.",
			  icon: "warning"
		});
		return false;
	}
	if ($('#ship_address_detail').val() == "") {
		swal({
			  text: "상세주소를 입력하세요.",
			  icon: "warning"
		});
		$('#ship_address_detail').focus();
		return false;
	}
 	//약관동의 체크여부 확인	 
  	if($("input:checkbox[name=terms]:checked").length < 3) {
  		swal({
			  text: "모든 약관을 확인하고 동의하세요.",
			  icon: "warning"
		});
 		return false;
  	}
  	
  	$('#shipInfo').submit();
  	 	
 });
</script>
</html>