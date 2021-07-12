<%--
@JSP : serchIdOk.jsp 
@Date : 2021.06.24
@Author : 이보희
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:set var="memberinfo" value="${member}"></c:set>
	<div class="container">
		<div class="justify-content-center py-11">
			<div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
		    	<h2 class="text-center">아이디찾기</h2>
		    	<span style="font-size: 13px; color: gray">회원 정보와 일치하는 이메일 아이디는 다음과 같습니다.<br>
				만약, 비밀번호를 잊어버리셨다면 비밀번호 찾기 서비스를 이용해주세요.</span>
		    </div>
			<div class="col-lg-5 mx-auto">
			<div class="card">
			
				<div class="row mt-4 justify-content-center">
	          		<div class="form-group col-md-10 ">
	          			<label for="name"><small>아이디</small></label>
	          			<input type="text" class="form-control form-pill-login" id="email" readonly="readonly">
	          		</div>
					<div class="form-group col-md-10 ">
						<label for="phone"><small>가입일자</small></label>
						<input type="text" class="form-control form-pill-login" value="${member.member_regdate}" readonly="readonly">
	          		</div>
	          		
							
				</div>
				
				<div class="mx-auto col-sm-11 text-center mb-3 mt-3">
	          		<button class="btn btn-sm btn-block btn-primary"  onclick="login()"> 로그인 </button>
	          	</div>
	          	
	          	<div class="mx-auto col-sm-11 text-center mb-5">
	          		<hr>
	          		<a href="/startfun/forgotpassword.do" class="mr-3">비밀번호 찾기</a>
	          		<a href="/startfun/joinus/join.do">회원가입</a> 
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
</body>
<script type="text/javascript">
var name = '${member.member_email}';
var regdate = '${member.member_regdate}';


var member_email = '${member.member_email}';
var email = member_email.split("@");
var id = email[0]; //@앞부분
var mailadd = email[1]; //@뒷부분
var subid1 = id.substr(0,4) //표시아이디
var subid2 = id.substr(4); //*로 대체될 아이디
var sublength = subid2.length; //*표시될 개수

var star = ''
for (var i=0; i < subid2.length; i++) {
	star = star + '*';
}

$('#email').val(subid1 + star + '@'+mailadd);
	
function login() {
	location.href = "/startfun/login.do";
}	

</script>

</html>