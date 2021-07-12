<%--
@JSP : serchId.jsp 
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
	<div class="container">
		<div class="justify-content-center py-11">
			<div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
		    	<h2 class="text-center">비밀번호 재설정</h2>
		    </div>
			<div class="col-lg-5 mx-auto">
			<div class="card">
			
			<div class="mx-auto col-sm-11 text-center mb-1 mt-5">
	          	<p>변경할 비밀번호</p>
	        </div>
			
			<form action="/startfun/passwordChange.do" method="post">
				<div class="row mt-4 justify-content-center">
	          		<div class="form-group col-md-10 ">
	          			<input type="hidden" name="member_email" value="${param.email}">
	          			<input type="password" name="member_password" id="password" class="form-control form-pill-login" placeholder="변경할 비밀번호">
	          			<small id="password_check" class="text-danger"></small>
	          		</div>
					<div class="form-group col-md-10 ">
						<input type="password" name="password_checking" id="password_checking" class="form-control form-pill-login" placeholder="변경할 비밀번호 확인">
	          			<small id="password_checking_check" class="text-danger"></small>
	          		</div>
	          		<div class="form-group col-md-10 "> 
	          		<small id="phoneCheck"></small>
	          		</div>
				</div>
				
				<div class="mx-auto col-sm-11 text-center mb-5 mb-5">
	          		<button id="password_submit" type="submit" class="btn btn-sm btn-block btn-primary">비밀번호 재설정</button>
	          	</div>
			  </form>
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

//비밀번호 확인
//비밀번호 일치확인
/* 
	영문 + 숫자 포함 8자리 이상 14자리미만
	pwdChange -> readonly false 상태일때만 실행
*/
$('#password').keyup(function(){
	fn_check_pwd();
	
});
function fn_check_pwd(){
	let pwd = $('#password').val();
	let eng = pwd.search(/[a-z]/ig);
	let num = pwd.search(/[0-9]/g);
	let spe = pwd.search(/[`~!@#$%^&*|\\\'\";:\/?]/gi);
	
	console.log(pwd);
	//자리수체크
	if(pwd.length < 8 || pwd.length > 14){
		$('#password_check').text("8~14자리 이내로 입력하세요.");
		$('#password').addClass('is-invalid');
		$('#password').focus();
		return false;
	} else if (pwd.search(/\s/)!=-1){ //공백체크
		$('#password_check').text("공백은 입력할 수 없습니다.");
		$('#password').addClass('is-invalid');
		$('#password').focus();
		return false;
	} else if (num < 0 || eng < 0 || spe != -1){ //영문, 숫자, 특수문자 체크
		$('#password_check').text("영문과 숫자를 포함하여 입력하세요. 특수문자는 입력할 수 없습니다.");
		$('#password').addClass('is-invalid');
		$('#password').focus();
		return false;
	} else { //성공
		$('#password_check').text("");
		$('#password').removeClass('is-invalid');
		return true;
	}
}
//비밀번호 일치 체크
$('#password_checking').keyup(function(){
	fn_check_pwd2();
	
});
function fn_check_pwd2(){
	let check = $('#password_checking').val();
	let pwd = $('#password').val();
	if(!(check==pwd)){
		$('#password_checking_check').text("비밀번호가 일치하지 않습니다.");
		$('#password_checking').addClass('is-invalid');
		$('#password_checking').focus();
		return false;
	} else {
		$('#password_checking_check').text("");
		$('#password_checking').removeClass('is-invalid');
		return true;
	}
}

//회원 수정
$('#password_submit').click(function(){
	
	if(fn_check_pwd() == false) return false; //비밀번호
	if(fn_check_pwd2() == false) return false; //비밀번호 확인
	return true;
});

</script>
</html>