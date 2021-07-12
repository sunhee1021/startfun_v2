<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>       
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
		
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- ajax & jquery -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	
	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- js(tab toggle) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
	<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
	
	<script type="text/javascript">
		$(function(){
			
			$('#summernote').summernote({
				placeholder: '프로젝트 소개를 작성해주세요.',
				tabsize: 2,
				height: 300,
				minHeight: 300,
				maxHeight: 300,
				callbacks: { // 콜백을 사용
					// 이미지를 업로드할 경우 이벤트를 발생
					onImageUpload: function(files, editor, welEditable) {
						 // 파일 업로드(다중업로드를 위해 반복문 사용)
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i],
				            this);
			            }
					}
				}
			});
			
			function sendFile(file, editor) {
				// 파일 전송을 위한 폼생성
				data = new FormData();
				data.append("file", file);
				$.ajax({ // ajax를 통해 파일 업로드 처리
					data: data,
					type: "POST",
					url: 'uploadSummernoteImageFile.do',
					enctype : 'multipart/form-data',
					contentType: false,
					processData: false,
					success: function(data) { // 처리가 성공할 경우
						console.log(data)
						$(editor).summernote('editor.insertImage', "${pageContext.request.contextPath}"+data.url);			
					}
				});
			}
			
			//datepicker
			$('#depositDate, #projectStart, #projectEnd').datepicker({
				dateFormat: 'yy-mm-dd'
			});
			
			//이자지급주기
			for(var i = 1; i < 13; i++){
				let option = "<option value='"+i+"'>"+i+"개월</option>";
				$('#payPeriod').append(option);
			}
			//이자지급주기 선택해주기
			if(${not empty invest.pay_period}){
				$('#payPeriod').val(${invest.pay_period}).prop("selected", true);
			}
			
			//로드될 때 프로젝트 분야 생성
			$.ajax(
				{
					type:"GET",
					url:"projectCategory.do",
					success:function(data){
						$.each(data, function(index, category){
							let option = "<option value='"+category.category_code+"'>"+category.category_name+"</option>";
							$('#projectCategory').append(option);
							
						});
						//카테고리 선택해주기!
						if(${not empty project.project_category}){
							$('#projectCategory').val(${project.project_category}).prop("selected", true);
						}
						
					}
				}	
			);
			
			//로드 시 동영상 사용체크
			if($('input[name="videocheck"]:checked').val()=="n"){
				$('#projectVideoDiv').hide();
			}
			
			//임시저장 버튼 클릭시 유효성 검사 없이 바로 보냄
			$('#tempBtn').click(function(){
				$('#target').submit();
			});
			
			////////////////////개설자 정보//////////////////////
			
			//로드 시 프로필 이미지
			if(${!empty member.member_profile  && member.member_profile ne '' } ){
				$('#profileImg').attr("src", "${pageContext.request.contextPath}/upload/${member.member_profile}")	
			}
			
			//프로필 삭제 버튼 클릭 시
			//이미지 default로 변경
			$('#pofileDelBtn').click(function(){
				$('#profileImg').attr("src", "${pageContext.request.contextPath}/upload/default.jpg")
					
				$('#memberProfile').val('default.jpg');
					
				var agent = navigator.userAgent.toLowerCase();
				//파일초기화
				if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
				    $("#img").replaceWith($("#img").clone(true));
				}else{
				    $("#img").val("");
				}
					
				console.log($('#img').val())
			});
				
			
			//프로필 편집 -> 변경 시 미리보기 이미지 변경
			$('#img').change(function(e){
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
			
			//getTime
			function dateGetTime(dgt){
				let arr = dgt.split('-');
				let dgtCompare = new Date(arr[0], parseInt(arr[1])-1, arr[2]);
				return dgtCompare;
			}
			
			////////////////////프로젝트 스토리//////////////////////
			
			//프로젝트 제목 글자 수 세기
			$('#projectTitle').on('keyup', function(){
				$('#testCnt').html($(this).val().length+"/25");
		        if($(this).val().length > 25) {
		            $(this).val($(this).val().substring(0, 25));
		            $('#testCnt').html("25/25");
		        }
			})
			
			//프로젝트 이미지 등록 시 파일명 미리보기
			$('#projectImage').change(function(){
				var fileValue = $("#projectImage").val().split("\\");
				var fileName = fileValue[fileValue.length-1]; // 파일명
				$('#imageNamePreview').attr("value", fileName);
			});
			
			//동영상 입력창
			$('#projectVideoDiv').hide();
			$("input:radio[name=videocheck]").click(function(){
				//선택된 라디오버튼 값 가져오기
				let radioval = $("input:radio[name=videocheck]:checked").val();
				if(radioval=="n"){ //n 이면 입력창 가리기
					$('#projectVideoDiv').hide();
				} else if(radioval=="y"){ //y 이면 입력창 보이기
					$('#projectVideoDiv').show();
				}
			});
			
			//프로젝트 파일 등록 시 파일명 미리보기
			$('#projectFile').change(function(){
				var fileValue = $("#projectFile").val().split("\\");
				var fileName = fileValue[fileValue.length-1]; // 파일명
				$('#fileNamePreview').attr("value", fileName);
			});
			
			////////////////////////////////////유효성 - 개설자정보//////////////////////////////////////////////
			
			//핸드폰번호
			/* 
			010-1111-1111 형식
			한글입력 불가
			*/
			function phoneCheck(){
				var phonenum = $('#memberPhone').val();
		        var regExp =/^\d{3}-\d{3,4}-\d{4}$/;
		        let spe = phonenum.search(/[가-힣a-zA-Z]/gi);
		        
		        if(regExp.test(phonenum)){
		            $('#memberPhoneHelp').text('');
		            return true;
		         }else if(!regExp.test(phonenum)){
		        	 activeCheck($('#memberInfoTab'));
			         $('#memberPhoneHelp').text("올바른 전화번호 형식으로 입력해주세요 ex) 010-1234-5678");
			         $('#memberPhoneHelp').css('color', 'red');
					 $('#memberPhone').focus();
		            return false;
		         }else if(spe > 0){
		        	 activeCheck($('#memberInfoTab'));
		        	 $('#memberPhoneHelp').text("올바른 전화번호 형식으로 입력해주세요 ex) 010-1234-5678");
		        	 $('#memberPhoneHelp').css('color', 'red');
		        	 $('#memberPhone').focus();
		        	 return false;
		         }
		        
			}
			
			$('#memberPhone').on('keyup', phoneCheck);
			
			////////////////////////////////////유효성 - 프로젝트 스토리//////////////////////////////////////////////
			
			function activeCheck(tabid){
				if(tabid.hasClass('active')==true){
					return true;
				} else {
					tabid.trigger('click');
				}
			}

			//프로젝트 분야
			function projectCategoryCheck(){
				if($('#projectCategory').val()==""){
					activeCheck($('#projectStoryTab'));
					swal('', '프로젝트 분야를 선택해주세요.', 'warning');
					$('#projectCategory').focus();
					return false;
				}
				$('#projectCategoryHelp').text("");
				return true;
			}
			
			//프로젝트 제목
			function projectTitleCheck(){
				if($('#projectTitle').val()==""){
					activeCheck($('#projectStoryTab'));
					swal('', '프로젝트 제목을 입력해주세요.', 'warning');
					$('#projectTitle').focus();
					return false;
				}
				$('#projectTitleHelp').text("");
				return true;
			}
			
			//프로젝트 이미지
			function projectImageCheck(){
				if($('#imageNamePreview').val()==""){
					activeCheck($('#projectStoryTab'));
					swal('', '프로젝트 이미지를 등록해주세요.', 'warning');
					$('#imageNamePreview').focus();
					return false;
				}
				$('#projectImageHelp').text("");
				return true;
			}
			
			//프로젝트 동영상
			function projectVideoCheck(){
				if($('#projectVideoDiv').is(':visible')){
					if($('#projectVideo').val()==""){
						activeCheck($('#projectStoryTab'));
						swal('', '프로젝트 동영상을 등록해주세요.', 'warning');
						$('#projectVideo').focus();
						return false;
					} else if(!($('#projectVideo').val().length == 11)){
						activeCheck($('#projectStoryTab'));
						swal('', '동영상 코드를 확인해주세요.', 'warning');
						$('#projectVideo').focus();
						return false;
					}
					$('#projectVideoHelp').text("");
				}
				return true;
			}
			
			//프로젝트 소개
			function projectContentCheck(){
				if($('#projectContent').val()==""){
					activeCheck($('#projectStoryTab'));
					swal('', '프로젝트 소개를 입력해주세요.', 'warning');
					$('#projectContent').focus();
					return false;
				}
				$('#projectContentHelp').text("");
				return true;
			}
			
			//표면이자율
			function interestRateCheck(){
				if($('#interestRate').val()==""){
					activeCheck($('#projectStoryTab'));
					swal('', '표면이자율을 입력해주세요.', 'warning');
					$('#interestRate').focus();
					return false;
				}
				return true;
			}
			
			//입고일
			function depositDateCheck(){
				if($('#depositDate').val()==""){
					activeCheck($('#projectStoryTab'));
					swal('', '입고일을 입력해주세요.', 'warning');
					$('#depositDate').focus();
					return false;
				}
				
				//현재날짜보다 이전날짜 선택
				let depositCompare = dateGetTime($('#depositDate').val()); 		//입고일
				let now = new Date();
				
				if(now.getTime() > depositCompare.getTime()){
					swal('', '입고일을 확인해주세요. 입고일은 현재날짜보다 이전 날짜로 선택할 수 없습니다.', 'warning');
					$('#depositDate').val("");
					$('#depositDate').focus();
					return false;
				}
				
				//펀딩마감일 비교
				if(!($('#projectEnd').val() == "")){
					
					let projectEndCompare = dateGetTime($('#projectEnd').val());	//펀딩마감일
					
					if(projectEndCompare.getTime() > depositCompare.getTime()){
						swal('', '입고일을 확인해주세요. 입고일은 펀딩마감일보다 이전 날짜로 선택할 수 없습니다.', 'warning');
						activeCheck($('#projectStoryTab'));
						$('#depositDate').val("");
						$('#depositDate').focus();
						return false;
					}
				}
				return true;
			}
			
			$('#depositDate').on('change', depositDateCheck);
			
			//최소투자금액
			function minAmountCheck(){
				if($('#minAmount').val()==""){
					activeCheck($('#projectStoryTab'));
					swal('', '최소투자금액을 입력해주세요.', 'warning');
					$('#minAmount').focus();
					return false;
				} else if(parseInt($('#minAmount').val()) < 0){
					activeCheck($('#projectStoryTab'));
					swal('', '최소투자금액이 올바르지 않습니다. ', 'warning');
					$('#minAmount').focus();
					return false;
				}
				return true;
			}
			
			//이자지급주기
			function payPeriodCheck(){
				if($('#payPeriod').val()==""){
					activeCheck($('#projectStoryTab'));
					swal('', '이자지급주기를 선택해주세요.', 'warning');
					$('#payPeriod').focus();
					return false;
				}
				return true;
			}
			
			//만기일수
			function expiryDateCheck(){
				if($('#expiryDate').val()==""){
					activeCheck($('#projectStoryTab'));
					swal('', '만기일수를 입력해주세요.', 'warning');
					$('#expiryDate').focus();
					return false;
				}
				return true;
			}
			
			//프로젝트 관련 파일
			function projectFileCheck(){
				if($('#fileNamePreview').val()==""){
					activeCheck($('#projectStoryTab'));
					swal('', '프로젝트 관련 파일을 업로드해주세요.', 'warning');
					$('#fileNamePreview').focus();
					return false;
				}
				return true;
			}
			
			////////////////////////////////////유효성 - 정산//////////////////////////////////////////////
			
			//펀딩시작일
			function projectStartCheck(){
				//펀딩시작일 미입력
				if($('#projectStart').val()==""){
					swal('', '펀딩시작일을 입력해주세요.', 'warning');
					activeCheck($('#calculateTab'));
					$('#projectStart').focus();
					return false;
				}
				
				//현재날짜보다 이전날짜 선택
				let projectStartCompare = dateGetTime($('#projectStart').val());
				let now = new Date();
				console.log($('#projectStart').val());
				console.log(projectStartCompare)
				
				if(now.getTime() > projectStartCompare.getTime()){
					swal('', '펀딩시작일은 현재날짜보다 이전 날짜로 선택할 수 없습니다.', 'warning');
					activeCheck($('#calculateTab'));
					$('#projectStart').val("");
					$('#projectStart').focus();
					return false;
				}
				
				$('#projectStartHelp').text("");
				return true;
			}
			
			$('#projectStart').on('change', function(){
				if(projectStartCheck()==false) return false;
				$('#projectEnd').attr('readonly', false);					
			});
			
			//펀딩마감일
			function projectEndCheck(){
				//펀딩마감일 미입력
				if($('#projectEnd').val()==""){
					swal('', '펀딩마감일을 입력해주세요.', 'warning');
					activeCheck($('#calculateTab'));
					$('#projectEnd').focus();
					return false;
				}
				
				//현재날짜보다 이전날짜 선택
				let projectEndCompare = dateGetTime($('#projectEnd').val()); //펀딩마감일
				let now = new Date();
				
				if(now.getTime() > projectEndCompare.getTime()){
					swal('', '펀딩마감일을 확인해주세요. 펀딩마감일은 현재날짜보다 이전 날짜로 선택할 수 없습니다.', 'warning');
					activeCheck($('#calculateTab'));
					$('#projectEnd').val("");
					$('#projectEnd').focus();
					return false;
				}
				
				//펀딩시작일보다 이전날짜 선택
				let projectStartCompare = dateGetTime($('#projectStart').val()); //펀딩시작일
				if(projectStartCompare.getTime() > projectEndCompare.getTime()){
					swal('', '펀딩마감일을 확인해주세요. 펀딩마감일은 펀딩시작일보다 이전 날짜로 선택할 수 없습니다.', 'warning');
					activeCheck($('#calculateTab'));
					$('#projectEnd').val("");
					$('#projectEnd').focus();
					return false;
				}
				
				return true;
			}
			
			$('#projectEnd').on('change', projectEndCheck);
			
			//펀딩목표금액
			function projectGoalCheck(){
				if($('#projectGoal').val()==""){
					activeCheck($('#calculateTab'));
					swal('', '펀딩목표금액을 입력해주세요.', 'warning');
					$('#projectGoal').focus();
					return false;
				}
				return true;
			}
			
			////////////////////프로젝트 접수 클릭 시////////////////////////////
			$(document).on('click', '#submit', function(){
				
				//개설자정보
				if(!phoneCheck()) return false; //핸드폰번호
				
				//프로젝트 스토리
				if(!projectCategoryCheck()) return false; 	//프로젝트 분야
				if(!projectTitleCheck()) return false;		//프로젝트 제목
				if(!projectImageCheck()) return false;		//프로젝트 이미지
				if(!projectVideoCheck()) return false;		//프로젝트 동영상
				if(!projectContentCheck()) return false;	//프로젝트 소개
				if(!interestRateCheck()) return false;		//표면이자율
				if(!depositDateCheck()) return false;		//입고일
				if(!minAmountCheck()) return false;			//최소투자금액
				if(!payPeriodCheck()) return false;			//이자지급주기
				if(!expiryDateCheck()) return false;		//만기일수
				if(!projectFileCheck()) return false;		//프로젝트 파일
				
				//정산
				if(!projectStartCheck()) return false;	//펀딩시작일
				if(!projectEndCheck()) return false;	//펀딩마감일
				if(!projectGoalCheck()) return false;	//펀딩목표금액
				
				$('#target').submit();
				
				if($('#projectStatus').val()=='임시저장'){
					console.log('임시저장 프로젝트 접수로 변경')
					$('#projectStatus').val('접수');
				}
				
				return true;
			});
			
			
		});
	
	
	</script>
	
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->
	<main>
		<div class="container">
			<div class="row justify-content-center py-11">
				<div class="mb-3">
						<h1 class="mb-3 h4">${project.project_title }</h1>
				</div>
				<div class="mt-3 mb-7 col-12 d-flex align-items-center justify-content-center">
					<div class="signin-inner my-4 my-lg-0 bg-white shadow-soft border rounded border-gray-300 p-10 p-lg-10 w-100 fmxw-750">
					
						<!-- tab 메뉴 -->
						<ul id="tabs1" class="nav nav-tabs mb-3" role="tablist">
						  <li class="nav-item">
						    <a id="memberInfoTab" class="nav-link active" href="#tab-memberInfo" role="tab" aria-selected="true" data-toggle="tab">개설자 정보</a>
						  </li>
						  <li class="nav-item">
						    <a id="projectStoryTab" class="nav-link" href="#tab-projectStory" role="tab" aria-selected="false" data-toggle="tab">프로젝트 스토리</a>
						  </li>
						  <li class="nav-item">
						    <a id="calculateTab" class="nav-link" href="#tab-Calculate" role="tab" aria-selected="false" data-toggle="tab">정산</a>
						  </li>
						</ul> <!-- tab 메뉴 end -->
						
						<!-- 프로젝트 form -->
						<form id="target" action="" enctype="multipart/form-data" method="post">
							<input type="hidden" name="project_type" value="투자">
							<input type="hidden" id="projectStatus" name="project_status" value="${project.project_status }">
							
							<div id="tabsContent1" class="card-body tab-content p-0">
							
							  <!-- 개설자정보 tab -->
							  <div class="tab-pane fade show active" id="tab-memberInfo" role="tabpanel">
							  	<div class="mb-5 mt-5 ">
								  	<div class="mx-auto col-sm-6 col-md-3 text-center mb-7 mb-5 mt-5">
										  <img class="shadow img-fluid rounded-circle mt-1 mb-5 mt-5" src="${pageContext.request.contextPath}/upload/default.jpg" id="profileImg">
										  <input type="file" name="member_file" style="display:none" id="img" accept="image/gif, image/jpeg, image/png">
										  <button class="btn btn-sm btn-primary" type="button" id="pofileDelBtn">삭제</button >
										  <label for="img"><a class="btn btn-sm btn-outline-primary">편집</a></label>
									</div>
									<div class="form-group mb-4">
										<label for="memberName">개설자명(기업명)</label>
										<input type="text" id="memberName" class="form-control form-pill" disabled value="${member.member_name }">
									</div>
									<div class="form-group mb-4">
										<label for="memberEmail">이메일</label>
										<input type="text" id="memberEmail" class="form-control form-pill" disabled value="${member.member_email }">
									</div>
									<div class="form-group mb-4">
										<label for="memberPhone">휴대폰번호</label>
										<input type="text" id="memberPhone" class="form-control form-pill" value="${member.member_phone }" oninput="this.value = this.value.replace(/[^0-9.-]/g, '').replace(/(\..*)\./g, '$1');">
										<small id="memberPhoneHelp" class="form-text text-gray"></small>
									</div>
									<div class="form-group mb-4">
										<label for="memberPhone">사업자등록번호</label>
										<input type="text" id="memberBrn" class="form-control form-pill" disabled value="${member.member_brn }">
									</div>
									<div class="form-group mb-4">
										<label for="memberPhone">법인등록번호</label>
										<input type="text" id="memberCrn" class="form-control form-pill" disabled value="${member.member_crn }">
									</div>
								</div>
							  </div> <!-- 개설자정보 end -->
							  
							  <!-- 프로젝트 스토리 tab -->
							  <div class="tab-pane fade" id="tab-projectStory" role="tabpanel">
							  	<div class="mb-5 mt-5">
							  		<div class="form-group mb-4">
							  			<label for="projectCategory">프로젝트 분야</label>
							  			<select id="projectCategory" name="project_category" class="form-pill custom-select custom-select-sm">
											<option value="">선택</option>
										</select>
							  		</div>
							  		<div class="form-group mb-4">
							  			<label for="projectTitle">프로젝트 제목</label>
							  			<input type="text" id="projectTitle" name="project_title" class="form-control form-pill" maxlength="25" value="${project.project_title }" <c:if test="${not empty project.project_title }">value="${project.project_title }"</c:if>>
							  			<small class="float-right" id="testCnt">0/25</small>
							  		</div>
							  		<div class="form-group mb-4">
							  			<label for="imageNamePreview">프로젝트 이미지</label>
							  			<div class="input-group">
							  				<input type="text" id="imageNamePreview" class="form-control form-pill" aria-label="Readonly" readonly value="${project.project_thumbnail }" <c:if test="${not empty project.project_thumbnail}">value="${project.project_thumbnail }"</c:if>>
								  			<input type="file" id="projectImage" name="files" style="display:none" accept="image/gif, image/jpeg, image/png">
								  			<div class="input-group-append">
									  			<span class="input-group-text">
									  				<label class="input-group-text" for="projectImage">
									  					<i class="fas fa-folder-plus"></i>
									  				</label>
									  			</span>
								  			</div>
								  			<small id="projectImageHelp" class="form-text text-gray"></small>
								  		</div>
							  		</div>
							  		<div class="form-group mb-4">
							  			<label for="unusedVideo">프로젝트 동영상</label><br>
							  			<div class="form-check form-check-inline">
							  				<input type="radio" id="unusedVideo" name="videocheck" class="form-check-input" value="n" <c:if test="${empty project.project_video }">checked</c:if>>
							  				<label for="unusedVideo" class="form-check-label">미사용</label>
							  			</div>
							  			<div class="form-check form-check-inline mb-2">
							  				<input type="radio" id="useVideo" name="videocheck" class="form-check-input" value="y" <c:if test="${not empty project.project_video }">checked</c:if>>
							  				<label for="useVideo" class="form-check-label">사용</label>
							  			</div>
							  			<div id="projectVideoDiv">
		                                   <input type="text" id="projectVideo" name="project_video" class="form-control form-pill" oninput="this.value = this.value.replace(/[\ㄱ-ㅎ ㅏ-ㅣ 가-힣]/g, '').replace(/(\..*)\./g, '$1');">
		                                   <small>-유튜브 동영상 코드만(11자리) 입력 ex) https://www.youtube.com/watch?v=<span class="text-danger">kq8ncK5SMC8</span></small>
		                                </div>
							  		</div>
							  		<div class="form-group mb-4">
							  			<label for="summernote">프로젝트 소개</label><br>
							  			<textarea id="summernote" class="form-control" name="project_content" > <c:if test="${not empty project.project_content}">${project.project_content }</c:if></textarea>
							  		</div>
							  		<div class="form-group mb-4">
							  			<label for="interestRate">표면이자율(연)</label><br>
							  			<div class="input-group mb-3">
							  				<input type="text" id="interestRate" class="form-control form-pill" name="interest_rate" <c:if test="${not empty invest.interest_rate }">value="${invest.interest_rate }"</c:if> oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							  				<span class="input-group-append p-0">%</span>
							  			</div>
							  		</div>
							  		<div class="form-group mb-4">
							  			<label for="depositDate">입고일</label><br>
							  			<div class="input-group mb-3">
							  				<div class="input-group-prepend">
							  					<span class="input-group-text">
							  						<i class="far fa-calendar-alt"></i>
							  					</span>
							  				</div>
							  				<input type="text" id="depositDate" name="deposit_date" class="form-control form-pill" <c:if test="${not empty invest.deposit_date }">value="${invest.deposit_date }"</c:if>  oninput="this.value = this.value.replace(/[^0-9.-]/g, '').replace(/(\..*)\./g, '$1');">
							  			</div>
							  		</div>
							  		<div class="form-group mb-4">
							  			<label for="minAmount">최소투자금액</label><br>
							  			<div class="input-group mb-3">
							  				<input type="text" id="minAmount" class="form-control form-pill" name="min_amount" <c:if test="${not empty invest.min_amount }">value="${invest.min_amount }"</c:if>  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							  				<span class="input-group-append p-0">원</span>
							  			</div>
							  		</div>
							  		<div class="form-group mb-4">
							  			<label for="payPeriod">이자지급주기</label>
							  			<select id="payPeriod" name="pay_period" class="form-pill custom-select custom-select-sm">
											<option value="">선택</option>
										</select>
							  		</div>
							  		<div class="form-group mb-4">
							  			<label for="expiryDate">만기일수</label><br>
							  			<div class="input-group mb-3">
							  				<input type="text" id="expiryDate" class="form-control form-pill" name="expiry_date" <c:if test="${not empty invest.expiry_date }">value="${invest.expiry_date }"</c:if>  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							  				<span class="input-group-append p-0">일</span>
							  			</div>
							  		</div>	
							  		<div class="form-group mb-4">
										<label for="projectFile">프로젝트 관련 파일</label>
										<div class="input-group">
											<input type="text" id="fileNamePreview" class="form-control form-pill" id="fileNamePreview" aria-label="Readonly" readonly <c:if test="${not empty project.project_file}">value="${project.project_file }"</c:if>>
											<input type="file" id="projectFile" name="files" style="display:none">
											<div class="input-group-append">
												<span class="input-group-text">
									  				<label class="input-group-text" for="projectFile">
									  					<i class="fas fa-folder-plus"></i>
									  				</label>
									  			</span>
											</div>
										</div>
									</div>						  		
							  	  </div>
							  	</div> <!-- 프로젝트 스토리 end -->	
							  	
							  	<!-- 정산 tab -->
							  <div class="tab-pane fade" id="tab-Calculate" role="tabpanel">
							  	<div class="mb-5 mt-5">
							  		<div class="form-group mb-4">
							  			<label for="projectStart">펀딩시작일</label>
							  				<div class="input-group mb-3">
							  					<div class="input-group-prepend">
							  						<span class="input-group-text">
							  							<i class="far fa-calendar-alt"></i>
							  						</span>
							  					</div>
							  					<input type="text" id="projectStart" name="project_start" class="form-control form-pill" oninput="this.value = this.value.replace(/[^0-9.-]/g, '').replace(/(\..*)\./g, '$1');" <c:if test="${not empty project.project_start}">value="${project.project_start }"</c:if>>
							  					<small id="projectStartHelp" class="form-text text-gray"></small>
							  				</div>
							  		</div>
							  		<div class="form-group mb-4">
							  			<label for="projectEnd">펀딩마감일</label>
							  				<div class="input-group mb-3">
							  					<div class="input-group-prepend">
							  						<span class="input-group-text">
							  							<i class="far fa-calendar-alt"></i>
							  						</span>
							  					</div>
							  					<input type="text" id="projectEnd" name="project_end" class="form-control form-pill" oninput="this.value = this.value.replace(/[^0-9.-]/g, '').replace(/(\..*)\./g, '$1');" <c:if test="${not empty project.project_end}">value="${project.project_end }"</c:if>>
							  					<small id="projectEndHelp" class="form-text text-gray"></small>
							  				</div>
							  		</div>
							  		<div class="form-group mb-4">
							  			<label for="projectGoal">펀딩목표금액</label>
							  			<div class="input-group mb-3">
							  				<input id="projectGoal" type="text" name="project_goal" class="form-control form-pill" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" <c:if test="${not empty project.project_goal}">value="${project.project_goal }"</c:if>>
							  				<span class="input-group-append p-0">원</span>
							  				<small id="projectGoalHelp" class="form-text text-gray"></small>
							  			</div>
							  		</div>
								</div>
							  </div> <!-- 정산 end  -->
							  
							  </div> <!-- tabsContent1 end -->
							  
							  <div class="mb-5 mt-5" id="btnDiv">
								<div class="mx-auto col-sm-6 text-center mb-7 mb-5 mt-5">
								<!-- 임시저장이면 임시저장 버튼 보여주기 / 수정이면 수정하기 버튼 보여주기 -->
								<c:choose>
									<c:when test="${project.project_status eq '임시저장' }">
										<button id="tempBtn" type="submit" class="btn btn-sm btn-primary">임시저장</button>
										<button id="submit" type="submit" class="btn btn-sm btn-primary">프로젝트접수</button>
									</c:when>
									<c:otherwise>
										<button id="submit" type="submit" class="btn btn-sm btn-primary">수정하기</button>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div> 
		</div> 
	</main>
</body>
</html>