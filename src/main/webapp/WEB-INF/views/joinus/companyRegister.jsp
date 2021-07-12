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
            <h2 class="h3 text-center">법인회원가입</h2>
          </div>
          <div class="card">
          <br>
          	<!-- Form -->
			<form method="post" action="/startfun/joinus/companyregister.do" id="join" name="join">
			  <div class="row mb-4 justify-content-center">
				<div class="form-group col-md-10 ">
					<label for="member_email">이메일</label>
					<div class="input-group">
						<input type="text" name="member_email" id="member_email" value="${param.member_email}" class="form-control form-pill" readonly />
					</div>
					<small id="emailCheck"></small> 
				</div>
				<div class="form-group col-md-10 ">
				  <label for="password">비밀번호</label>
					<div class="input-group">
						<input type="password"name="member_password" id="member_password" class="form-control form-pill" />
					</div>
				  <small id=lengthCheck></small>
				</div>
				<div class="form-group col-md-10 ">
				  <label for="password">비밀번호 확인</label>
					<div class="input-group"> 
						<input type="password"name="passwordheck" id="passwordCheck" class="form-control form-pill" /> 
					</div>
					<small id="pwdCheck"></small>
				</div>
				<div class="form-group col-md-10 ">
				  <label for="member_name">대표자명</label>
				    <div class="input-group">
					  <input type="text" name="member_name"id="member_name" class="form-control form-pill" />	
					</div>
				</div>
				<div class="form-group col-md-10 ">
				  <label for="member_name">기업명</label>
				    <div class="input-group">
					   <input type="text" name="member_company"id = "member_comapnyName" class="form-control form-pill">
					</div>
				</div>
				<div class="form-group col-md-10 ">
				  <label for="phone">전화번호</label>
					<div class="input-group">
						<input type="text"name="member_phone" id="member_phone" class="form-control form-pill" />
					</div>
					<small id="phoneCheck"></small>
				</div>
				<div class="form-group col-md-10 ">
				  <label for="phone">사업자등록번호</label>
					<div class="input-group">
						<input type="text" name="member_brn"id="member_brn" class="form-control form-pill">
					</div>
					<small id="brnCheck" ></small>
				</div>
				<div class="form-group col-md-10 ">
				  <label for="phone">법인등록번호</label>
					<div class="input-group">
						<input type="text" name="member_crn"id="member_crn" class="form-control form-pill">
					</div>
					<small id="crnCheck"></small>
				</div>
			  </div>
			  <button type="submit" onclick="joinCheck()" class="btn btn-primary btn-block" id="submit">회원가입</button>
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

<script type="text/javascript">
<!-- 이메일 중복체크 -->
$(document).ready(function(){
	$('#idCheck').click(function(){
		var email = $('#member_email').val();
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		$.ajax({
			type : "post", 	
			url : "companyIdCheck.do",
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
                        text: "중복된 이메일입니다."
                   }); 

					return false;
				}else if(responsedata == 0){
					swal({
                        text: "사용가능한 이메일입니다.",
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
				return false;
			}else{
				$('#pwdCheck').text('');
			}
		}
		if(pwd1.length < 8){
			$('#lengthCheck').text('8자리 이상 14자리 이하 입력');
			$('#lengthCheck').css('color','red');
			return false;
		}else if(pwd1.length > 14){
			$('#lengthCheck').text('8자리 이상 14자리 이하 입력');
			$('#lengthCheck').css('color','red');
			return false;
			
		}else{
			$('#lengthCheck').text('');
		
		}
		
	
};


<!-- 사업자번호 확인 -->
$('#member_brn').keyup(function(){
	brnCheck();
});
function brnCheck(){
	
		let brn = $('#member_brn').val()
		let regExp = /^\d{3}-\d{2}-\d{5}$/;
		
		if(regExp.test(brn)){
			$('#brnCheck').text('');
		}else if(!regExp.test(brn)){
			$('#brnCheck').text('올바른 형식(xxx-xx-xxxxx)로 입력');
			$('#brnCheck').css('color','red');
			return false;
		}
	
};


<!-- 법인등록번호 확인 -->
$('#member_crn').keyup(function(){
	crnCheck();
});
function crnCheck(){
	
		let crn = $('#member_crn').val()
		let regExp = /^\d{4}\s\d{2}-\d{6}\s\d{1}$/;
		
		if(regExp.test(crn)){
			$('#crnCheck').text('');
		}else if(!regExp.test(crn)){
			$('#crnCheck').text('올바른 형식(xxxx xx-xxxxxx x)로 입력');
			$('#crnCheck').css('color','red');
			return false;
		}
	
};

<!-- 빈값확인 -->
function joinCheck(){
	if(!join.member_email.value){
		swal({
			icon:'warning',
            text: "이메일을 입력해주세요."
        }); 

		return false;
	}
	if(!join.member_password.value){
		swal({
			icon:'warning',
            text: "비밀번호를 입력해주세요."
        }); 

		return false;
	}
	if(!join.member_phone.value){
		swal({
			icon:'warning',
            text: "연락처를 입력해주세요."
        }); 

		return false;
	}
	if(!join.member_name.value){
		swal({
			icon:'warning',
            text: "대표자명을 입력해주세요."
        }); 

		return false;
	}
	if(!join.member_company.value){
		swal({
			icon:'warning',
            text: "기업명을 입력해주세요."
       }); 

		return false;
	}
	if(!join.member_brn.value){
		swal({
			icon:'warning',
            text: "사업자등록번호를 입력해주세요."
       }); 

		return false;
	}
	if(!join.member_crn.value){
		swal({
			icon:'warning',
            text: "법인등록번호를 입력해주세요."
       }); 

		return false;
	}

}
$('#submit').click(function(){
	if(emailCheck() == false) return false;
	if(phoneCheck() == false) return false;
	if(passwordCheck()== false) return false;
	if(brnCheck()== false) return false;
	if(crnCheck()== false) return false;
	if(joinCheck() == false) return false;
	return true;
});
</script>
</html>