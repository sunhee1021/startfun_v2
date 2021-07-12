<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타트펀 : 관리자</title>
	
	<!-- Favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon_a.png">
	
	<!-- Fontawesome -->
	<link type="text/css" href="${pageContext.request.contextPath}/resources/admin/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
	<link type="text/css" href="${pageContext.request.contextPath}/resources/admin/vendor/notyf/notyf.min.css" rel="stylesheet">
	<link type="text/css" href="${pageContext.request.contextPath}/resources/admin/css/volt.css" rel="stylesheet">
	<!-- Core -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/@popperjs/core/dist/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Vendor JS -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/onscreen/dist/on-screen.umd.min.js"></script>
	<!-- Slider -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/nouislider/distribute/nouislider.min.js"></script>
	<!-- Smooth scroll -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
	<!-- Charts -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/chartist/dist/chartist.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<!-- Datepicker -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>
	<!-- Moment JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
	<!-- Vanilla JS Datepicker -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>
	<!-- Notyf -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/notyf/notyf.min.js"></script>
	<!-- Simplebar -->
	<script src="${pageContext.request.contextPath}/resources/admin/vendor/simplebar/dist/simplebar.min.js"></script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Volt JS -->
	<script src="${pageContext.request.contextPath}/resources/admin/assets/js/volt.js"></script>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header_admin.jsp" />

	<main>

		<!-- Section -->
		<section class="d-flex align-items-center my-5 mt-lg-6 mb-lg-5">
			<div class="container">
				<div class="row justify-content-center form-bg-image"
					data-background-lg="../../assets/img/illustrations/signin.svg">
					<div
						class="col-12 d-flex align-items-center justify-content-center">
						<div
							class="mb-4 mb-lg-0 bg-white shadow-soft border rounded border-light p-4 p-lg-5 w-100 edit">

							<div class="text-center text-md-center mb-4 mt-md-0">
								<h1 class="mb-0 h3">${list.member_name} 님</h1>
							</div>
							<form action="/admin/userEdit.do" method="POST" id= "edit" name ="edit">
								
								<!-- Form -->
								<div class="form-group mb-4">
									<label for="email">이름</label>
									<div class="input-group">
										<span class="input-group-text" id="basic-addon3"> 
										<span class="fas fa-envelope"></span></span> 						
									<input type = "text" value ="${list.member_name}" name ="member_name" id="member_name" class="form-control">
									</div>
									</div>
									<!-- End of Form -->
								
								<!-- Form -->
								<div class="form-group mb-4">							
									<label for="email">이메일</label>
									<div class="input-group">
										<span class="input-group-text" id="basic-addon3"> 
										<span class="fas fa-envelope"></span></span> 
										
									<input type = "text" value ="${list.member_email}" name ="member_email" id="member_email" class="form-control">
									<input type="button" id="idCheck" value="중복확인" class="btn btn-outline-primary btn-pill"></input>
									</div>
									<small id="emailCheck"></small>
									</div>
									<!-- End of Form -->
									
									<!-- Form -->
								<div class="form-group mb-4">
									<label for="password">비밀번호</label>
									<div class="input-group">
										<span class="input-group-text" id="basic-addon3"> 
										<span class="fas fa-key"></span></span> 	
										<input type= "password" name ="member_password" id="member_password" class="form-control form-pill">
									</div>
									<small id=lengthCheck></small>
								</div>
									<!-- End of Form -->
									
									<!-- Form -->
								<div class="form-group mb-4">
									<label for="password">비밀번호 확인</label>
									<div class="input-group">
										<span class="input-group-text" id="basic-addon3"> 
										<span class="fas fa-key"></span></span> 	
										<input type="password"name="passwordheck" id="passwordCheck"class="form-control form-pill" /> 
									</div>
									<small id="pwdCheck"></small>
								</div>
									<!-- End of Form -->
									
									
									<!-- Form -->
								<div class="form-group mb-4">
									<label for="phone">전화번호</label>
									<div class="input-group">
										<span class="input-group-text" id="basic-addon3"> 
										<span class="fas fa-phone"></span></span> 	
										<input type = "text" value ="${list.member_phone}" name ="member_phone" id = "member_phone" class="form-control">
									</div>
									<small id="phoneCheck"></small>
								</div>
									<!-- End of Form -->
									
										<!-- Form -->
								<div class="form-group mb-4">
									<label for="stsus">상태</label>
									<div class="input-group">
										<span class="input-group-text" id="basic-addon3"> 
										<span class="fas fa-user-edit"></span></span> 	
										<select name ="member_status" class="form-select">
											<option>활동</option>
											<option>정지</option>
											<option>탈퇴</option>
										</select> 	
										<input value ="${list.member_status}" class="form-control" >
									</div>
									<!-- End of Form -->
								</div>
								<button type ="submit" onclick="joinCheck()" class="btn btnedit" id="submit">수정</button>
								<a href="/admin/user.do" type="button"class="btn btnedit">취소</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- End of Form -->
</body>
<script type="text/javascript">
<!-- 이메일 중복체크 -->
$(document).ready(function(){
	$('#idCheck').click(function(){
		var email = $('#member_email').val();
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		$.ajax({
			type : "post", 	
			url : "idcheck.do",
			data : {"member_email" : email},
			success : function(data){
				console.log(data);
				var responsedata = JSON.parse(data);
				if(email == ""){
					swal({
						icon:'warning',
                        text: "이메일을 입력해주세요."
                   }); 
					return false;
				}
				
				if(responsedata == 1){
					swal({
						icon:'warning',
                        text: "중복된 이메일 입니다."
                   }); 
					return false;
				}else if(responsedata == 0){
					swal({
                        text: "사용가능한 이메일 입니다.",
                        button: false,
                        timer: 1500
                   });
				}
			}
		})
	})
})

<!-- 이메일 정규표현 -->
$('#member_email').keyup(function(){
	emailCheck();
});
function emailCheck(){
		let email = $('#member_email').val();
		console.log(email)
		let regExp =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(regExp.test(email)){
			$('#emailCheck').text('');
		}else if(!regExp.test(email)){
			$('#emailCheck').text('올바른 이메일 형식으로 입력(@포함)');
			$('#emailCheck').css('color','red');
			return false;
		}
};

<!-- 비밀번호 확인 -->
$('#passwordCheck').keyup(function(){
	passwordCheck();
});
function passwordCheck(){
	
		let pwd1 = $('#member_password').val();
		let pwd2 = $('#passwordCheck').val();
		
		if(pwd1 !=''|| pwd2 !=''){
			if(pwd1==pwd2){
				$('#pwdCheck').text('일치');
				$('#pwdCheck').css('color','blue');
			}else if(pwd1 != pwd2){
				$('#pwdCheck').text('불일치 다시입력');
				$('#pwdCheck').css('color','red');
			}else{
				$('#pwdCheck').text('');
			}
		}
		if(pwd1.length < 8){
			$('#lengthCheck').text('8자리 이상 14자리 이하 입력');
			$('#lengthCheck').css('color','red');
		}else if(pwd1.length > 14){
			$('#lengthCheck').text('8자리 이상 14자리 이하 입력');
			$('#lengthCheck').css('color','red');
			
		}else{
			$('#lengthCheck').text('');
		
		}
		
	
	
};

<!-- 휴대폰 번호 정규표현 -->
$('#member_phone').keyup(function(){
	phoneCheck();
});
function phoneCheck(){
	let phonenum = $('#member_phone').val();
	let regExp =/^\d{3}-\d{3,4}-\d{4}$/;
		if(regExp.test(phonenum)){
			$('#phoneCheck').text('');
			
		}else if(!regExp.test(phonenum)){
			$('#phoneCheck').css('color','red');
			$('#phoneCheck').text("올바른 전화번호 형식으로 입력(-포함)");
			return false;
		}
	
};

<!-- 빈값확인 -->
function joinCheck(){
	if(!edit.member_email.value){
		swal({
			icon:'warning',
            text: "이메일을 입력해주세요."
       });
		return false;
	}
	if(!edit.member_name.value){
		swal({
			icon:'warning',
            text: "이름을 입력해주세요."
       });
		return false;
	}
	if(!edit.member_phone.value){
		swal({
			icon:'warning',
            text: "연락처를 입력해주세요."
       });
		return false;
	}
	
}
$('#submit').click(function(){
	if(emailCheck() == false) return false;
	if(phoneCheck() == false) return false;
	if(passwordCheck()== false) return false;
	if(joinCheck() == false) return false;
	return true;
});
</script>
</html>