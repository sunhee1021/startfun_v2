<%--
@JSP : updateMember.jsp 
@Date : 2021.06.10
@Author : 정수빈
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>    
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
      <div class="row justify-content-center py-11">
        <div class="col-lg-9">
          <div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
            <h2 class="h3 text-center">계정정보</h2>
          </div>

        <!-- Contact Form -->
		<div class="card">
          	<form action="/startfun/mypage/account.do" method="post" enctype="multipart/form-data">
          	
          	<div class="row mb-4 justify-content-center">
          		<div class="form-group mx-auto col-sm-6 col-md-3 text-center mb-7 mb-5 mt-5">
					<img class="shadow img-fluid rounded-circle mt-1 mb-5 mt-5" src="${pageContext.request.contextPath}/upload/${member.member_profile}" id="profileImg" width="150px" height="150px">
					<input type="file" name="member_file" id="member_file" style="display:none" accept="image/gif, image/jpeg, image/png">
					<input type="hidden" id="member_profile" name="member_profile">
					<button class="btn btn-sm btn-primary" type="button" id="pofileDelBtn">삭제</button >
					<label for="member_file" class="btn btn-sm btn-outline-primary mb-0">편집</label>
				</div>
				<div class="form-group col-md-10 ">
					<label for="member_email">이메일</label>
					<input type="text" value="${member.member_email}" name="member_email" id="member_email" class="form-control form-pill" readonly>
          		</div>
          		<se:authorize access="hasRole('ROLE_USER')">
          		<div class="form-group col-md-10 ">
          			<label for="member_name">이름</label>
          			<input type="text" value="${member.member_name}" name="member_name" id="member_name" class="form-control form-pill">
          		</div>
          		</se:authorize>
				<div class="form-group col-md-10 ">
					<label for="member_password">비밀번호</label>
					<input type="password" name="member_password" id="member_password" class="form-control form-pill" placeholder="영문, 숫자를 포함한 8-14자리">
          			<small id="password_check" class="text-danger"></small>
          		</div>
				<div class="form-group col-md-10 ">
					<label for="password_checking">비밀번호 확인</label>
					<input type="password" name="password_checking" id="password_checking" class="form-control form-pill" placeholder="비밀번호 확인">
          			<small id="password_checking_check" class="text-danger"></small>
          		</div>
				<div class="form-group col-md-10 ">
					<label for="member_phone">연락처</label>
					<input type="text" value="${member.member_phone}" name="member_phone" id="member_phone" class="form-control form-pill">
          			<small id="member_phone_check" class="text-danger"></small>
          		</div>                 		
<%--           		<se:authorize access="hasRole('ROLE_USER')">
          		<div class="form-group col-md-10 ">
					<label for="member_sns">SNS 연동</label>
					<input type="text" value="${member.member_sns}" name="member_sns" id="member_sns" class="form-control form-pill" readonly>
          		</div>
				</se:authorize>      --%>
				<se:authorize access="hasRole('ROLE_COMPANY')">
				<div class="form-group col-md-10 ">
					<label for="member_company">기업명</label>
					<input type="text" value="${member.member_company}" name="member_company" id="member_company" class="form-control form-pill" readonly>
          		</div>      				
				<div class="form-group col-md-10 ">
					<label for="member_name">대표자명</label>
					<input type="text" value="${member.member_name}" name="member_name" id="member_name" class="form-control form-pill">
          		</div>				
				<div class="form-group col-md-10 ">
					<label for="member_brn">사업자등록번호</label>
					<input type="text" value="${member.member_brn}" name="member_brn" id="member_brn" class="form-control form-pill" readonly>
          		</div>
				<div class="form-group col-md-10 ">
					<label for="member_crn">법인등록번호</label>
					<input type="text" value="${member.member_crn}" name="member_crn" id="member_crn" class="form-control form-pill" readonly>
          		</div>          					
				</se:authorize>
				<div class="form-group col-md-10 ">
					<label for="member_introduce">소개</label>
					<textarea name="member_introduce" id="member_introduce" class="form-control form-pill" cols="30" rows="5">${member.member_introduce}</textarea>
          		</div>
          		
          	</div>
          	<div class="mx-auto col-sm-6 text-center mb-7 mb-5 mt-5">
          		<button type="button" id="withdrawbtn" class="btn btn-outline-primary col-sm-3"> 탈퇴 </button>
          		<button id="submit" type="submit" class="btn btn-primary col-sm-3"> 수정 </button>
          	</div>
          	
			</form>
		</div>
        <!-- End Contact Form -->
        
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
		//프로필 삭제 버튼 클릭 시
		//이미지 default로 변경
		$('#pofileDelBtn').click(function(){
			$('#profileImg').attr("src", "${pageContext.request.contextPath}/upload/default.jpg");

			$('#member_profile').val('default.jpg');
			
			var agent = navigator.userAgent.toLowerCase();
			//파일초기화
			if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
			    $("#member_file").replaceWith($("#member_file").clone(true));
			}else{
			    $("#member_file").val("");
			}
		});
		//프로필 편집 -> 변경 시 미리보기 이미지 변경
		$('#member_file').change(function(e){
			let files = e.target.files;
			let filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f){
				var reader = new FileReader();
				reader.onload = function(e){
					$('#profileImg').attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			})
		});
		
		//비밀번호 확인
		//비밀번호 일치확인
		/* 
			영문 + 숫자 포함 8자리 이상 14자리미만
			pwdChange -> readonly false 상태일때만 실행
		*/
		$('#member_password').keyup(function(){
			fn_check_pwd();
			
		});
		function fn_check_pwd(){
			let pwd = $('#member_password').val();
			let eng = pwd.search(/[a-z]/ig);
			let num = pwd.search(/[0-9]/g);
			let spe = pwd.search(/[`~!@#$%^&*|\\\'\";:\/?]/gi);
			
			console.log(pwd);
			//자리수체크
			if(pwd.length < 8 || pwd.length > 14){
				$('#password_check').text("8~14자리 이내로 입력하세요.");
				$('#member_password').addClass('is-invalid');
				$('#member_password').focus();
				return false;
			} else if (pwd.search(/\s/)!=-1){ //공백체크
				$('#password_check').text("공백은 입력할 수 없습니다.");
				$('#member_password').addClass('is-invalid');
				$('#member_password').focus();
				return false;
			} else if (num < 0 || eng < 0 || spe != -1){ //영문, 숫자, 특수문자 체크
				$('#password_check').text("영문과 숫자를 포함하여 입력하세요. 특수문자는 입력할 수 없습니다.");
				$('#member_password').addClass('is-invalid');
				$('#member_password').focus();
				return false;
			} else { //성공
				$('#password_check').text("");
				$('#member_password').removeClass('is-invalid');
				return true;
			}
		}
		//비밀번호 일치 체크
		$('#password_checking').keyup(function(){
			fn_check_pwd2();
			
		});
		function fn_check_pwd2(){
			let check = $('#password_checking').val();
			let pwd = $('#member_password').val();
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
		//휴대전화번호 확인
		$('#member_phone').keyup(function(){
			fn_check_phone();
		});
		function fn_check_phone(){
			let phonenum = $('#member_phone').val();
			let regExp =/^\d{3}-\d{3,4}-\d{4}$/;
			
			if(regExp.test(phonenum)){
				$('#member_phone_check').text('');
				$('#member_phone').removeClass('is-invalid');
				
			}else if(!regExp.test(phonenum)){
				$('#member_phone_check').text("올바른 전화번호 형식으로 입력(-포함)");
				$('#member_phone').addClass('is-invalid');
				$('#member_phone').focus();
				return false;
			}
		}
		
		//회원 수정
		$('#submit').click(function(){
			
			if(fn_check_pwd() == false) return false; //비밀번호
			if(fn_check_pwd2() == false) return false; //비밀번호 확인
			if(fn_check_phone() == false) return false; //휴대전화번호 확인
			return true;
		});
		
		//회원 탈퇴
		$('#withdrawbtn').click(function(){
			
			swal({
				  text: "정말로 탈퇴하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					  swal({
                          text: "탈퇴가 완료되었습니다.",
                          button: false,
                          timer: 1500
                     }); 

				    location.replace('/startfun/mypage/withdraw.do');
				  }
			});
		});
	</script>
</html>