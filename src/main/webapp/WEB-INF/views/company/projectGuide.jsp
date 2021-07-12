<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>스타트펀 | 이용 가이드</title>

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
	<style type="text/css">
		section {
			width: 80%;
			text-align: center;
			margin: auto;
			padding-top: 100px;
			padding-bottom: 100px;
		}
		
		#guide-title > h2 {
			font-weight: bold;
			line-height: 30px;
		}
		
		#guide-sub {
			padding-top: 30px;
			width: 80%;
			margin: auto;
			padding-right: auto;
			text-align: left;
			background-color: white;
			color: #565867;
		}
		
		#guide-sub > #sub {
			padding-bottom: 20px;
			margin-left: 100px;
			color: #565867;
		}
		
		#sub > h4 {
			font-weight: bold;
			color: #565867;
		}
		
		#sub > p {
			padding-left: 24px;
		}
		
		#sub > #sub-main {
			padding-left: 45px;
		}
		
		h5 {
			padding-left: 24px;
		}
		
		body {
			background-color: #f3f5f7;
		}

	</style>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->
<main>
	<section>
		<div id="guide-title">
			<h2>프로젝트 신청 가이드</h2>
			<p>후원형&nbsp;&nbsp;|&nbsp;&nbsp;투자형</p>
		</div>
		<div id="guide-sub">
			<div id="sub">
				<h4>1. 프로젝트 신청 전, 체크리스트</h4>
				<p>
					□&nbsp;공공의 가치를 훼손하지 않는 프로젝트이어야 합니다.<br>
					□&nbsp;실제 구현이 가능한 프로젝트여야 합니다.<br>
					□&nbsp;9가지 프로젝트 분야 중 하나 이상의 카테고리에 부합해야 합니다.<br>
					□&nbsp;프로젝트와 관련한 소개 글, 사진, 영상 자료가 충분히 준비되어 있어야합니다.<br>
				</p>
			</div>
			<div id="sub">
				<h4>2. 프로젝트 유형별 확인 사항</h4>
				<p>
					□&nbsp;공연과 행사 프로젝트의 경우, 이에 대한 정확한 정보(장소, 공연자)를 밝혀야 합니다.<br>
					□&nbsp;출판 프로젝트의 경우, 원고 작성이 완료된 상태에서 출판일정이 확정되어야 프로젝트 오픈이 가능합니다.<br>
				</p>
			</div>
			<div id="sub">
				<h4>3. 프로젝트 기간 및 목표금액 설정</h4>
				<h5>프로젝트 기간</h5>
				<p id="sub-main">
					보통 30일에서 40일 사이의 기간을 설정하고 있으며, 최대 90일까지 설정 가능합니다.<br>
					피드백 반영까지 고려하여 여유있게 프로젝트 시작일정을 설정해 주시고,<br>
					프로젝트 및 정산 상황에 따라 적절한 마감일정을 설정해주세요.<br>
					오랫동안 진행한다고 해서 프로젝트가 반드시 성공하는 것은 아닙니다.<br>
					<img src="https://www.ohmycompany.com/omc/asset/images/project_open_period.jpg">
				</p>
				<br>
				<h5>목표 금액</h5>
				<p>(1)펀딩방식에 따른 설정</p>
				<p id="sub-main">
					후원형, 투자형 둘 다 목표금액에 100% 달성되어야 참여자에게 '리워드' or '증권'을 제공하고 정산받는 방식이기 때문에<br>
					목표금액 설정이 매우 중요합니다.<br>
					모집금액은 펀딩방식에 따른 수수로(플랫폼 이용 수수료+vat)를 제하고 정산되기 때문에<br>
					수수료를 고려하여 목표금액을 설정해주세요.<br>
				</p>
				<br>
				<p>(2)대략적인 예산에 따른 설정</p>
				<p id="sub-main">
					① 프로젝트를 실행하기 위해 최소 어느정도의 금액이 필요한지 계산하기 위해선
					먼저 최소제작(진행)수량을 파악합니다.<br>
					② 후원으로 제공할 상품의 제작 및 배송비를 계산합니다.<br>
					③ 프로젝트를 담당하는 개설자의 인건비를 계산합니다.<br>
					④ 외 추가 참여금액이나 후원 없이 펀딩등 프로젝트 모집금액을 사용할 개발 및 개선비를 계산합니다.<br>
					⑤ 기타 최종 결제 실패 금액, 교환 및 환불을 필요로 하는 경우
					예상되는 금액 등 예비 비용을 리워드 제작에 필요한 금액의 10% 내외로 계산합니다.<br>
					⑥ 위 금액을 합산한 금액으로 목표금액을 설정하실 수 있습니다.<br>
				</p>
				<br>
				<p>(3)예상되는 인원에 따른 설정</p>
				<p id="sub-main">
					프로젝트를 진행한다는 것을 알리면 내 주변에 참여 가능한 인원을 예상해 볼 수 있습니다.
				</p>
				<table class="table table-striped" style="width: 90%;">
					<thead>
						<tr>
							<th class="font-weight-bold border-top-0 py-2">목표 금액</th>
							<th class="font-weight-bold border-top-0 py-2">예상 참여 수</th>
							<th class="font-weight-bold border-top-0 py-2">주요타겟</th>
							<th class="font-weight-bold border-top-0 py-2">홍보채널</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="py-3">50~100&nbsp;만원</td>
							<td class="py-3">50명&nbsp;이내</td>
							<td class="py-3">가족,&nbsp;친구&nbsp;및&nbsp;지인</td>
							<td class="py-3">개설자&nbsp;개인&nbsp;SNS</td>
						</tr>
						<tr>
							<td class="py-3">100~300&nbsp;만원</td>
							<td class="py-3">50명~100명&nbsp;이내</td>
							<td class="py-3">가족,&nbsp;친구&nbsp;및&nbsp;지인&nbsp;+&nbsp;우리를 알고있는 사람들</td>
							<td class="py-3">개설자&nbsp;개인&nbsp;SNS + 기업 SNS, 홈페이지</td>
						</tr>
						<tr>
							<td class="py-3">300만원&nbsp;이상</td>
							<td class="py-3">100명&nbsp;이상</td>
							<td class="py-3">가족,&nbsp;친구&nbsp;및&nbsp;지인&nbsp;+&nbsp;우리를 알고있는 사람들&nbsp;+&nbsp;일반 대중</td>
							<td class="py-3">개설자&nbsp;개인&nbsp;SNS + 기업 SNS, 홈페이지 + 언론보도, 광고집행</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</main>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</body>
</html>