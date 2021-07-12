<%--
@JSP : joinInvest.jsp 
@Date : 2021.06.13
@Author : 이보희
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<c:set var="investInfo" value="${investInfo}" />
<c:set var="invest_limit" value="${investInfo.investVO.invest_limit}" />
<c:set var="project_title" value="${investInfo.project_title}" />

<div class="container">
  <div class="row justify-content-center py-11" >
    <div class="col-lg-8">
	  <div class="w-md-80 w-lg-40 mx-auto text-center mb-7">
           <h2 class="h3 text-center">${investInfo.project_title}</h2>
      </div>
      <div class="row">
        <div class="col-lg-12 mb-4 mb-lg-3 order-lg-2">
          <hr><br>
            <h5>투자내용</h5>	
        	<div class="js-sticky-sidebar" style="height: 190px; background: #d3d3d352;">
        		<table class="table">
				  <tbody>
				    <tr>
				      <th scope="row" style="border-top: 0px; width: 150px;">업체명</th>
				      <td style="border-top: 0px">${investInfo.memberVO.member_company}</td>
				    </tr>
				    <tr>
				      <th scope="row" style="border-top: 0px">투자종목</th>
				      <td style="border-top: 0px">채권</td>
				    </tr>
				    <tr>
				      <th scope="row" style="border-top: 0px">투자마감일</th>
				      <td style="border-top: 0px">${investInfo.project_end}</td>
				    </tr>
				    <tr>
				      <th scope="row" style="border-top: 0px">입고예정일</th>
				      <td style="border-top: 0px">${investInfo.investVO.deposit_date}</td>
				    </tr>
				  </tbody>
				</table>
			</div><br><br><hr><br>
			<div class="js-sticky-sidebar">
				<div style="float: left; width: 50%"><h5>목표금액</h5></div>	 
				<div style="float: left; width: 50%; text-align: right"><fmt:formatNumber value="${investInfo.project_goal}" pattern="#,###"/>원</div>
			</div><br><br><hr><br>
			<div class="js-sticky-sidebar" style="float: clear;" >
				<div style="float: left; width: 70%"><h5>투자한도<span style="color:#808080b0; font-size: 0.7em;">&nbsp;&nbsp;(연간발행한도 10,000,000원 / 동일발행인한도 5,000,000원)</span></h5></div>	 
				<div style="float: left; width: 30%; text-align: right">
					<c:if test="${investInfo.investVO.invest_limit ge 5000000}">
						<input type="hidden" id="limit" value="5000000">
						<span style="color: #107ef4; font-weight: bold; font-size: 1em;">5,000,000</span>원	
					</c:if>
					<c:if test="${investInfo.investVO.invest_limit lt 5000000}">
						<input type="hidden" id="limit" value="${investInfo.investVO.invest_limit}">
						<span style="color: #107ef4; font-weight: bold; font-size: 1em;"><fmt:formatNumber value="${investInfo.investVO.invest_limit}" pattern="#,###"/></span>원
					</c:if>
					
				</div>
			</div><br><br><hr><br>
			<div class="js-sticky-sidebar">
				<div style="float: left; width: 50%">최소투자금액</div>	 
				<div style="float: left; width: 50%; text-align: right"><fmt:formatNumber value="${investInfo.investVO.min_amount}" pattern="#,###"/>원</div><br><br>
				<div style="float: left; width: 30%"><h5>투자금액</h5></div>	 
				<div style="float: left; width: 70%; text-align: right">
				<form action="/startfun/joinInvest.do" method="post">
					<input type="hidden" name="project_no" value="${param.project_no}">
					<input type="text" id="invest_amount" name="invest_amount" readonly style="text-align: right; border: 0px; font-size:23px;">원&nbsp;&nbsp;&nbsp;
					<input type=hidden id="min_amount" value="${investInfo.investVO.min_amount}">
				
					<input type="button" id="plus" value=" + "> 
					<input type="text" id="quantity"  value="1" size="1" onchange="change();" readonly style="text-align: center">
					<input type="button" id="minus" value=" - ">
				</form>
				</div>
			</div><br><br><hr>
			<div class="custom-control custom-checkbox" style="text-align: right; height: 50px; padding-top: 10px;">
			  <input type="checkbox" class="custom-control-input" id="customCheck1" name="selectall" onclick="selectAll(this)">
			  <label class="custom-control-label" for="customCheck1">전체동의</label>
			</div>
			<div class="custom-control custom-checkbox" style="height: 100px;">
				<div style="float: left; width: 30%">
					<input type="checkbox" class="custom-control-input" id="customCheck2" name="terms">
			  		<label class="custom-control-label" for="customCheck2">투자위험의 주지 및 고지</label>
		  		</div>	 
				<div style="float: left; width: 70%; text-align: right; height: 35px;">
			  		<a data-toggle="modal" data-target="#termsModal1"><span style="color:#05a7e2; text-align: right">자세히 보기</span></a>
				</div>
				<div style="float: left; width: 50%">
					<input type="checkbox" class="custom-control-input" id="customCheck3" name="terms">
			  		<label class="custom-control-label" for="customCheck3">서비스 이용 약관 동의</label>
		  		</div>	 
				<div style="float: left; width: 50%; text-align: right; height: 35px;">
			  		<a data-toggle="modal" data-target="#termsModal2"><span style="color:#05a7e2;">자세히 보기</span></a>
				</div>
				<div style="float: left; width: 50%">
					 <input type="checkbox" class="custom-control-input" id="customCheck4" name="terms">
			  		 <label class="custom-control-label" for="customCheck4">개인정보처리방침 동의</label>
		  		</div>	 
				<div style="float: left; width: 50%; text-align: right; height: 35px;">
			  		<a data-toggle="modal" data-target="#termsModal3"><span style="color:#05a7e2;">자세히 보기</span></a>
				</div>
				<br><br><br><br><br><hr><br>
				<div style="text-align: center; height: 100px">
					<button class="btn btn-primary" type="button" id="paymentBtn">결제하기</button>
				</div>
			</div><br><br><br><br><br>
	    </div>
	  </div>
    </div>
  </div>
</div>

<!-- 약관1 Modal -->
<div class="modal fade" id="termsModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle">투자위험의 주지 및 고지</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <p style=font-size:2px;>
        본 투자위험고지서는 [자본시장과 금융투자업에 관한 법률(이하 “자본시장법”)] 제117조의7 제4항에 의거하여 주식회사 스타트펀(이하 ‘(주)스타트펀’)가 인터넷 홈페이지를 통하여 온라인소액투자중개하는 금융투자상품에 대한 투자에 따르는 위험을 귀하가 사전에 충분히 인지할 수 있도록 귀하에게 교부하는 것입니다.
	  </p>	
		<hr>
		<p style=font-size:2px;>
		<br>1. 귀하가 청약하고자 하는 금융투자상품은 자본시장법에 따른 “증권”에 해당하므로 원본손실의 위험성이 있습니다. 또한 발행인이 제시한 예상수익이나, 귀하가 기대하는 수익의 일부 또는 전부를 얻지 못할 수 있습니다.
		<br><br>2. 귀하는 ㈜스타트펀의 홈페이지에 게재(정정)된 모집되는 증권의 발행조건, 발행인의 재무상태가 기재된 서류 및 사업계획서의 내용, 증권의 취득에 따른 투자위험요소 등 모집게재사항을 충분히 확인하고, 청약의 주문 시 ㈜스타트펀가 별도로 정한 방법에 의하여 통지한 투자 위험 등의 내용에 대하여 주의 깊게 확인하여야 합니다.
		<br><br>3. ㈜스타트펀는 자본시장법 제117조의11에 따라, 투자자 보호를 위하여 투자 중개에 앞서 발행인 및 그 증권에 관한 주요 정보의 사실 여부를 확인합니다. 다만, 게재된 투자모집정보에 관한 사항은 게재정보의 최신성 유지를 위해 수정 혹은 삭제 및 추가될 수 있습니다. 변경사항에 대해서는 당사의 홈페이지에 공지하며, 청약기간의 말일로부터 7일 이내에 수정 혹은 삭제 및 추가사항이 있을 경우에는 투자자가 변경된 정보를 토대로 충분한 의사판단을 할 수 있도록 해당일로부터 7일 후로 청약기간을 연장합니다. 따라서 투자자는 자신이 이미 청약을 완료하였다고 하더라도 모집이 종료되기 전까지는 당사의 홈페이지를 통해 모집정보에 대한 지속적인 확인을 해야 합니다.
		<br><br>4. 모집성공 후 “예탁”되어지는 증권의 경우, 귀하의 증권계좌번호와 계좌유효성이 반드시 확인되어야 합니다. 증권계좌번호와 계좌유효성이 확인되어지지 않은 청약자는 모집성공 이후라도 청약이 취소될 수 있습니다. 투자 완료 후 홈페이지의 ‘마이페이지 – 참여프로젝트 - 증권형’ 페이지로 가면 자신의 투자 내역을 확인할 수 있으며, 증권계좌 정보의 수정이 가능합니다.
		<br><br>5. 청약의 철회(취소)는 청약기간 중에만 가능(청약기간 종료일 이후에는 청약의 철회 불가)하며, 청약기간의 종료 시 모집금액이 발행인이 목표한 모집예정금액의 80%에 미달하는 경우 모집실패로 간주하여 증권의 발행은 취소됩니다.
		<br><br>6. 청약의 철회(취소) 시 청약금은 환불됩니다. 청약을 위해 실시간 계좌이체를 한 동일 계좌로 환불처리 되며, 청약 당일의 취소는 이체수수료를 포함하여 환불되며 당일 취소가 아닐 경우에는 이체수수료를 제외한 청약금만 환불받게 됩니다.
		<br><br>7. 모집의 성공 후 발행되는 모든 증권은 비상장 증권이므로 한국거래소 상장을 목적으로 하는 것이 아니며, 증권의 환금성에 큰 제약이 있을 수 있습니다. 귀하는 이로 인해 투자금액에 대한 일부 또는 전부를 회수할 수 없는 위험이 있음을 이해하여야 합니다.
		<br><br>8. 귀하는 크라우드펀딩을 통해 발행된 증권이 자본시장법 제117조의10 제7항에 따라, 전문투자자에 대한 매도 등 예외적인 경우를 제외하고는 원칙적으로 6개월간 전매가 제한된다는 점을 이해하여야 합니다.
		<br><br>9. 귀하는 아래의 사항에 대해서도 내용을 확인하여야 합니다.
		<br>- ㈜스타트펀는 온라인소액증권 청약과 관련하여 투자자로부터 별도의 수수료를 징수하지 않습니다. 결제 시 발생하는 이체수수료는 해당 출금은행에서 징수하는 것이며 결제 금액에 따라 변동될 수 있습니다.
		<br>- 발행인이 증권의 발행조건과 관련하여 조기상환조건을 설정하거나, 전환조건을 설정한 경우에는 이에 대한 구체적인 내용을 (주)스타트펀 홈페이지를 통해 반드시 확인하여야 합니다.
		<br>- (주)스타트펀는 자본시장법상에 따른 “온라인소액투자중개업자”이며, 온라인소액증권발행인과 온라인소액투자중개계약을 체결하여 위 발행인이 발행하는 증권에 대한 청약거래를 중개하는 역할만 수행하며, 직접 증권을 발행하거나 주금을 납입받지 않습니다.
		<br>- (주)스타트펀는 크라우드펀딩을 통한 자금모집을 중개하는 온라인소액투자중개업자로서 거래의 당사자가 아니며, 투자로 인한 손실을 보전하지 않습니다.
		<br>- 청약의 우대 차별 사유 : (주)스타트펀는 발행인의 요청에 따라 법적으로 설정가능한 범위 내에서 합리적이고 명확한 기준(선착순, 청약금액순, 전문투자자순 등)에 따라 투자자의 자격 등을 제한할 수 있습니다. 이 경우 귀하는 위 기준과 조건에 따라 청약거래에 있어 차별을 받게 될 수 있습니다.
		<br><br>10. 정부의 방침에 따라 크라우드펀딩 제도의 변경이 있을 수 있습니다. 귀하는 자본시장법 등 관련법규에 근거하여 투자자의 권리에 대해 제한 및 변경이 있는 경우 이를 준수하여야 합니다.
		<br>위 사항들은 ㈜스타트펀를 통한 온라인소액증권 청약의 제도∙위험 및 청약의 주문 거래와 관련하여 귀하가 알아야 할 사항을 간략하게 서술한 것으로 거래와 관련하여 발생될 수 있는 모든 위험과 중요 사항을 전부 기술한 것은 아닙니다. 따라서 상세한 내용은 자본시장법상의 관계법규를 통하여 확인하시기 바랍니다
     	</p>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->

<!-- 약관2 Modal -->
<div class="modal fade" id="termsModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle">서비스 이용 약관 동의</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <p style=font-size:2px;>
		제 1 조 목적<br>
		이 약관은 주식회사 스타트펀(이하 "회사"라 한다)와 회사가 제공하는 증권형 크라우드펀딩 관련 서비스를 이용하려는 회원(이하 “회원”이라 한다)간의 서비스 이용에 관한 권리의무 관련 사항을 정함을 목적으로 한다.<br><br>
		제 2 조 용어의 정의<br>
		이 약관에서 사용하는 용어의 정의는 아래와 같다.<br>
		- 서비스 : 회원이 전자적 시스템에 접속하여 청약거래 등을 할 수 있게 회사가 이 약관에 따라 제공하는 제반 서비스를 말한다.<br>
		- 발행인 : 회사와의 온라인소액투자중개계약을 체결하여 온라인소액투자중개의 방법으로 증권을 발행하려는 자를 말한다.<br>
		- 청약의 주문 : 회원이 발행인이 발행하는 증권을 배정받기 위하여 이 약관에 따른 방법으로 청약의 의사표시를 하는 것을 말한다.<br>
		- 청약의 철회 : 회원이 청약의 주문 후 청약기간 내에 청약의 의사표시를 철회하는 것을 말한다.<br>
		- 청약모집률 : 발행인이 목표한 모집예정금액을 기준으로 청약의 접수가 완료된 모집금액이 차지하는 비율을 말한다.<br>
		- 청약증거금관리기관 : 회원이 입금한 청약증거금을 자본시장과 금융투자업에 관한 법률(이하 “자본시장법”)에 따라 예치하여 보관하는 증권금융 또는 은행 등의 기관을 말한다.<br>
		- 중앙기록관리기관: 회사로부터 발행인과 투자자에 대한 정보를 제공받아 관리하는 기관인 한국예탁결제원을 말한다.<br>
		- 증권형 크라우드 펀딩 : 자본시장법에 따라 온라인소액투자중개업자를 통하여 발행인이 발행하는 채무증권, 지분증권, 투자계약증권에 관한 모집 또는 사모에 관한 중개행위를 말한다.<br>
		- 계좌관리기관 : 고객계좌를 관리하는 자로서 주식 · 사채 등의 전자등록에 관한 법률 제2조 제7호에서 정하는 자를 말한다.<br><br>
		제3조 서비스 등의 제공<br>
		- 회사는 이 약관에 따라 아래와 같은 서비스를 제공한다.<br>
		1. 청약서비스 : 청약회원 및 청약의 주문 정보 등에 대한 조회, 투자한도 조회, 청약의 주문 접수, 청약 가능 여부 통지, 청약결과 및 배정내역 통지 등<br>
		2. 제1호 서비스 제공을 위해 필요하거나 이에 부수하는 서비스<br>
		- 제1항의 서비스를 이용하고자 하는 회원은 회사의 회원약관을 통해 회원의 자격을 취득하고 유지하고 있어야 하며, 이 약관에 동의하여 체크하는 방법으로 서비스 이용신청을 하여야 한다.<br>
		- 청약의 주문은 24시간 가능하다. 다만 서비스이용제공의 시간에 변동이 있는 경우 사전에 홈페이지를 통하여 그 변동 사항을 미리 공지한다.<br><br>
		제4조 서비스 수수료 등<br>
		회사는 온라인소액증권 청약과 관련하여 별도의 수수료는 징수하지 아니한다. 다만 청약증거금 이체 시 이체수수료가 발생할 수 있다.<br><br>
		제5조 투자정보의 게재 등<br>
		- 증권의 모집개시일 전에 홈페이지에 발행인이 게재하는 증권의 발행조건, 재무서류, 사업계획서 등 투자판단을 위해 필요한 정보가 게재된다.<br>
		- 제1항에도 불구하고 청약기간 중에도 발행인이 홈페이지에 추가적으로 정보를 게재할 수 있으며, 홈페이지에 게재한 정보의 정정게재가 투자판단에 영향을 줄 수 있는 중요정보인 경우 그 게재가 청약기간의 말일로부터 7일 이내에 있게 된 때에는 그날로부터 7일 후로 청약기간이 연장된다.<br>
		- 청약기간이 종료한 후에도 제12조 제1항에 따라 모집결과가 “성공”인 경우에는 매년 1회 재무제표 등 결산 관련 서류가 홈페이지에 게재된다.<br>
		- 회사는 증권의 모집을 개시하기 전 본 조에 따라 게재된 정보에 관한 사실을 확인하여야 한다.<br><br>
		제6조 청약의 주문 전 정보 확인 등<br>
		- 회원은 본 약관에 따른 청약의 주문 전에 제5조에 따라 제공되는 정보뿐만 아니라 청약기간, 증권의 배정조건, 증권매도의 제한 등에 관하여 충분히 숙지한 후 청약의 의사표시를 하여야 한다.<br>
		- 발행인이 투자자의 유형별로 자격을 제한하거나 배정방법 및 그 기준을 다르게 설정하기를 회사에 요청하는 경우 회사는 그 배정방법과 기준이 합리적이고 명확한 기준에 의한 것인 경우 그 내용을 홈페이지에 게재하며, 이 경우 회원은 위 내용에 따라 증권의 배정을 받는데 제한을 받게 될 수 있다.<br>
		- 회사는 회원이 본 약관에 따른 청약의 주문을 하기 전에 회사로부터 청약대상이 되는 증권에 대한 투자의 위험고지 등에 대하여 회원이 충분히 확인을 하였는지를 전자서명이나 전자우편 등의 방법으로 확인한 후에 청약의 주문을 받을 수 있다.<br>
		- 회사는 발행인이 정정 게재를 하는 경우 자본시장법 등 관계법령이 정하는 바에 따라 회원에게 정정 게재 사실을 통지하고 회원의 청약 의사를 재확인한다. 또한 회사는 회원의 온라인소액투자중개의 위험성에 대한 충분한 이해도를 확인하고 청약을 받아야 하며, 회사는 회원이 재청약 의사를 표시하였는지를 확인하기 전에는 그 청약의 주문을 받을 수 없으며, 이 경우 회원의 기존 청약의 주문 신청은 취소된다.<br><br>
		제7조 의견교환 게시판의 운영·관리 등<br>
		- 회사는 투자정보에 관한 투자의견을 교환할 수 있는 게시판을 운영한다.<br>
		- 회사는 자신의 홈페이지를 통하여 공개되는 투자자들의 의견을 임의로 삭제하거나 수정하여서는 아니 된다. 다만, 다른 법률에 근거가 있는 경우 그러하지 아니하다.<br>
		- 발행인은 청약기간이 종료되기 7일 전까지 홈페이지에 개설된 게시판을 통해 회원들에게 투자정보를 제공할 수 있다.<br><br>
		본 약관은 2020년 5월 20일부터 시행한다.
	  </p>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->

<!-- 약관3 Modal -->
<div class="modal fade" id="termsModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle">개인정보처리방침 동의</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <p style=font-size:2px;>
      주식회사 스타트펀(이하 "당사"라고 합니다)는 고객의 개인정보보호를 매우 중요시하며, 개인정보보호법, 정보통신망이용촉진등에관한법률 등 관련법령, 규정을 준수하고 있습니다.
	<br>당사는 개인정보처리방침을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
	<br>당사는 개인정보처리방침을 홈페이지 첫 화면에 공개함으로써 귀하께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다. 당사의 개인정보처리방침은 정부의 법률 및 지침 변경이나 당사 내부 방침변경 등으로 수시로 변경될 수 있으며, 개인정보처리방침의 지속적인 개선을 위하여 필요한 절차를 정하고 있습니다. 개인정보 보호정책을 개정하는 경우 당사는 그 변경사항을 홈페이지에 게시하여 이용자들이 개정된 사항을 쉽게 알아볼 수 있도록 하고 있습니다. 귀하께서는 사이트 방문 시 수시로 확인하시기 바랍니다.
	<br>
	<br>제 1 조 개인정보처리방침의 순서
	<br>- 처리하는 개인정보의 항목
	<br>- 개인정보의 처리 목적
	<br>- 개인정보의 제3자 제공
	<br>- 개인정보 처리의 위탁
	<br>- 개인정보 처리에 대한 동의 및 방법
	<br>- 개인정보의 수집
	<br>- 개인정보의 열람/정정
	<br>- 개인정보의 보유 및 이용기간
	<br>- 동의철회(회원탈퇴)
	<br>- 개인정보의 파기절차 및 방법
	<br>- 법정대리인의 권리
	<br>- 개인정보 자동 수집 장치의 설치·운영 및 그 거부에 관한 사항
	<br>- 개인정보 안정성 확보조치
	<br>- 개인정보침해 관련 상담 및 신고
	<br>- 개인정보 처리방침의 변경에 따른 공지의무
	<br>- 개인정보관리책임자
	<br>
	<br>제 2 조 처리하는 개인정보의 항목
	<br>당사는 회원가입한 이용자의 투자서비스 제공을 위해 실명확인 및 계좌등록 등을 진행하고 있으며, 아래와 같은 개인정보를 수집하고 있습니다.
	<br>1. 소득요건 확인 또는 전문투자자 확인 시(이하 ‘투자자 확인’) 필수항목: 소득요건구비 투자자 확인서류(금융소득명세서, 근로소득원천징수영수증, 온라인소액투자증권 투자내역 확인서, 금융투자전문인력확인서 등) 또는 전문투자자 확인서류(전문자격증, 전문투자자 확인증 등)
	<br>2. 실명확인 시 필수항목
	<br>자연인: 성명, 휴대폰번호, 주소, 신분증 사본, 주민등록번호
	<br>외국인: 성명, 휴대폰번호, 주소, 외국인등록번호, 거소증
	<br>법인: 법인명, 사업자등록번호, 법인등록번호, 대표 전화번호, 법인 담당자 전화번호, 주사무소 소재지, 법인등기부등본, 대표자 신분증 사본
	<br>3. 계좌등록시 필수항목: 본인의 증권계좌번호, 증권사, 은행명, 은행계좌번호
	<br>4. 청약증거금 납입시 필수항목: 은행, 계좌번호, 고유식별번호(미성년자의 경우 법정대리인의 실명확인증표, 가족관계서류 등 별도 서류)
	<br>5. 플랫폼 이용기록, IP Address, 쿠키 등
	<br>6. 금융거래정보: 상품종류, 거래조건, 거래일시, 금액 등 거래 설정 및 내역 정보
	<br>※ 귀하는 위와 같은 개인정보의 수집·이용에 거부할 권리가 있으나, 필수정보 또는 고유식별정보의 수집·이용에 거부할 경우 금융거래 서비스의 이용에 제약이 있을 수 있습니다.
	<br>
	<br>제 3 조 개인정보의 처리 목적
	<br>관련법령 또는 규정이 허용하는 범위에서 당사는 본 개인정보처리방침 전문에 기재된 목적을 위하여 개인정보를 수집·이용합니다. 수집하는 구체적인 수집목적 및 이용목적은 다음과 같습니다.
	<br> 회원가입 및 ID발급, 서비스 이용에 따른 본인 확인 절차에서의 이용, 서비스이용을 위한 계약의 체결 확인 등
	<br> 고지사항 전달, 민원·불만처리 등을 위한 원활한 의사소통
	 <br>기타 새로운 서비스 정보, 신상품이나 이벤트 정보 등의 안내, 서비스 관련 고객상담, 고객정보 관리 및 통계, 감사, 모니터링, 금융사고 조사, 기타 법령상 의무이행 등 이벤트 진행 시 배송지의 확보
	<br>
	<br>제 4 조 개인정보의 제 3자 제공
	<br>당사는 귀하의 동의가 있거나 관련 법령의 규정에 의한 경우, 또는 당사가 귀하에게 제공하는 서비스 또는 상품의 공급을 위하여 필요한 경우를 제외하고는 본 개인정보 처리방침에서 고지한 범위를 넘어 귀하의 개인정보를 이용하거나 타인 또는 타기업·기관에 제공하지 않습니다.
	<br>귀하의 개인정보를 제 3자에게 제공하거나 공유하는 경우에는 사전에 귀하에게 제공받거나 공유 받는 자가 누구이며 주된 사업이 무엇인지, 제공 또는 공유되는 개인정보항목이 무엇인지, 개인정보를 제공하거나 공유하는 목적이 무엇인지 등에 대해 개인정보처리방침 및 홈페이지 등을 통해 고지한 후 동의를 구합니다.
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

<!-- iamport -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">

//투자한도 이내로 투자금액 제한
$(function(){
	var min_amount;
	var quantity;
	var limit = $('#limit').val();
	init();
});

function init() {
	min_amount = $('#min_amount').val();
	quantity = $('#quantity').val();
	var sum = $('#invest_amount').val(min_amount);
	change();
	
}

$('#plus').click(function(){

	num = $('#quantity')[0];
	sum = $('#invest_amount')[0];
	min = $('#min_amount')[0];
	limit = $('#limit')[0];
	
	if((parseInt(sum.value) + parseInt(min.value))  <=  parseInt(limit.value)) {
		num.value ++ ;
		change(); 
	}
});

$('#minus').click(function(){
	num = $('#quantity')[0];
	sum = $('#invest_amount')[0];
		if (num.value > 1) {
			num.value -- ;
			change();
		}
});

function change() {
	num = $('#quantity')[0]; 
	sum = $('#invest_amount')[0]; 
		if (num.value < 0) {
			num.value = 0;
		}
		
	limit = $('#limit')[0];
		if(parseInt(sum.value) <=  parseInt(limit.value)) {
			sum.value = parseInt(num.value) * min_amount;
		}	
}

//결제하기
$('#paymentBtn').click(function(){
	
	//투자한도 체크
	var invest_limit = ${investInfo.investVO.invest_limit}; //투자한도
	var min_amount = ${investInfo.investVO.min_amount} //최소투자금액

	if(invest_limit < min_amount) {
		swal({
			  text: "투자한도를 확인하세요.",
			  icon: "warning"
		 });
		return false;
	}
	
	//약관동의 체크여부 확인	 
 	if($("input:checkbox[name=terms]:checked").length < 3) {
 		swal({
			  text: "모든 약관을 확인하고 동의해주세요.",
			  icon: "warning"
		 });
		 return false;
 	}
	
	//결제 시스템
 	iamport();
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
 
//가맹점 식별코드
 const { IMP } = window;
 IMP.init("imp27592092");
 	
 let project_title = '${project_title}';


 function iamport(){
 	
  	IMP.request_pay({
 	    pg : 'danal',
 	    pay_method : 'card',
 	    merchant_uid : 'merchant_' + new Date().getTime(),
 	    name : project_title , //결제창에서 보여질 이름
 	    amount : $('#invest_amount').val(), //실제 결제되는 가격
 	    buyer_email : '${pageContext.request.userPrincipal.name}' //구매자 이메일
 	    
 	}, function(rsp) {
 		console.log(rsp);
 	    if ( rsp.success ) {
 	    	var msg = '결제가 완료되었습니다.';
 	        
 	        $('form').submit();
 	    } else {
 	    	 var msg = '결제에 실패하였습니다.';
 	    }
 	    //alert(msg);
 	   swal({
		   icon:'warning',
           text: msg
       }); 

 	}); 
 }
</script>
</html>