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
		    	<h2 class="text-center">아이디찾기</h2>
		    </div>
			<div class="col-lg-5 mx-auto">
			<div class="card">
			
			<div class="mx-auto col-sm-11 text-center mb-1 mt-5">
	          	<p>가입정보로 확인</p>
				<span style="font-size: 12px; color: gray">* 기존 가입 회원정보에 휴대전화번호가 등록 되어있지 않았을 경우,<br> 아이디 찾기 서비스에 제한이 있을 수 있습니다.</span>
	        </div>
			
			<form id="searchIdForm" action="searchId.do" method="post">
				<div class="row mt-4 justify-content-center">
	          		<div class="form-group col-md-10 ">
	          			<input type="text" name="member_name" id="member_name" class="form-control form-pill-login" placeholder="이름 입력">
	          		</div>
					<div class="form-group col-md-10 ">
						<input type="text" name="member_phone" id="member_phone" class="form-control form-pill-login" placeholder="핸드펀번호 입력">
	          		</div>
	          		<div class="form-group col-md-10 "> 
	          		<small id="phoneCheck"></small>
	          		</div>
							
				</div>
				
				<div class="mx-auto col-sm-11 text-center mb-5 mb-5">
	          		<button id="searchIdBtn" type="button" class="btn btn-sm btn-block btn-primary"> 확인 </button>
	          	</div>
	          	
	          	<div class="mx-auto col-sm-11 text-center mb-5 mt-5">
	          		<hr>
	          		<a href="/startfun/forgotpassword.do" class="mr-3">혹시 비밀번호를 잊으셨나요?</a>
	          		<!-- <a href="/startfun/login.do" class="mr-3">로그인</a>
	          		<a href="/startfun/joinus/join.do">회원가입</a>  -->
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
<!-- 휴대폰 번호 정규표현 -->
$(function(){
	$('#member_phone').keyup(function(){
		var phonenum = $('#member_phone').val();
		var regExp =/^\d{3}-\d{3,4}-\d{4}$/;
		
		if(regExp.test(phonenum)){
			$('#phoneCheck').text('');
			
		}else if(!regExp.test(phonenum)){
			$('#phoneCheck').css('color','red');
			$('#phoneCheck').text("올바른 전화번호 형식으로 입력(-포함)");
			return false;
		}
		
	})
});


$('#searchIdBtn').click(function(){
	$.ajax(
		   {
			type : "post",
			url  : "searchUserInfo.do",
			data : {member_name : $('#member_name').val(), member_phone: $('#member_phone').val()},
	        async: false,
	        success : function(data){ 

                   if(data > 0) {
                	   $('#searchIdForm').submit();
                	   console.log("submit");
                   }else {
                	   swal({
                			  text: "등록된 정보와 일치하지 않습니다. 다시 입력해주세요.",
                			  icon: "warning"
                		 });
                	    $('#member_name').val("");
                	    $('#member_phone').val("");
                   }
            	} 
   		  });
});
</script>
</html>