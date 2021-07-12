<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>StartFun</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Favicon -->
	<link rel="shortcut icon" href="favicon.png">

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
      <div class="col-lg-6">
        <div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
            <h2 class="h3 text-center">이메일 인증</h2>
            <p>개인회원 가입</p>
          </div>
          <div class="card">
			<form method="post" action="/startfun/joinus/Auth.do" id ="auth">
	 		  <div class="row mb-4 justify-content-center">
				<div class="form-group col-md-10 mt-7">
					<div class="input-group">
						<input type="email" name="member_email" id="member_email" placeholder="  이메일주소를 입력하세요. " class="form-control form-pill">
					</div>
					<small id="emailCheck"></small> 
					<br><br>
					<div class="text-center">
					    <button type="submit" id="emailAuth" class="btn btn-primary">인증번호 보내기</button>
					</div>
				 </div>
			  </div>
			</form>
		  </div>
		</div>
	  </div>
	</div>
</main>
	
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</body>
<!-- JS Global Compulsory -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/popper.js/dist/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header-fixing.js"></script>

<script type="text/javascript">

<!-- 이메일 정규표현 -->
function emailCheck(){
		let email = $('#member_email').val();
		console.log(email)
		let regExp =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(email == ""){
			$('#emailCheck').text('이메일을 입력해주세요');
			$('#emailCheck').css('color','red');
			return false;
		}else if(regExp.test(email)){
			$('#emailCheck').text('');
		}else if(!regExp.test(email)){
			$('#emailCheck').text('올바른 이메일 형식으로 입력(@포함)');
			$('#emailCheck').css('color','red');
			return false;
		}
};

/* 중복 아이디 체크 */
let id_result = false;
function idCheck() {
	let email = $('#member_email').val();
	
	$.ajax({
		type : "post", 	
		url : "idcheck.do",
		data : {"member_email" : email},
		success : function(data){
			console.log(data);
			var responsedata = JSON.parse(data);
			
			if(responsedata == 1){
				swal({
					icon:'warning',
                    text: "중복된 이메일입니다."
               }); 

				id_result = false;
				
			}else if(responsedata == 0){
				swal({
                    text: "사용가능한 이메일입니다.",
                    button: false,
                    timer: 1500
               }); 

				$('#auth').submit();
			}
		}
	});
}

<!-- 이메일 중복체크 -->
$('#emailAuth').click(function(){
	if(emailCheck() == false) return false;
	idCheck();
	if(id_result == false) return false;
	
	return true;
});

</script>
</html>