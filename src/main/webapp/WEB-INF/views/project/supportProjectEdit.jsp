<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>       
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>StartFun</title>
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
	
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
	<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
	
	<script type="text/javascript">
		$(function(){
			/* 로드 시 출력해야할 것
			1. 프로젝트 분야 
				1-1. 프로젝트 분야 로드
				1-2. 작성자의 프로젝트 분야 판단해서 seleted 설정하기
			2. 프로젝트 동영상
				2-1. input value에 동영상 주소 넣어주기
				2-2. input value값이 있다면 프로젝트 동영상 사용체크
				2-3. 없으면 미사용 체크 하고 동영상 입력창 감추기
			3. 리워드
				3-1. 리워드 수만큼 forEach문으로 리워드 만들기
			4. 
			*/
			
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
			$('#dueDate, #projectStart, #projectEnd').datepicker({
				dateFormat: 'yy-mm-dd'
			});
			
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
			
			//제목 글자수 체크해놓기
			$('#projectTitle').trigger('keyup');
			
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
			
			////////////////////리워드//////////////////////
			
			//리워드 추가 
			$(document).on('click', '#rewardAddBtn', function(){
				//비동기 함수 호출
				$.ajax(
					{
						url:"${pageContext.request.contextPath}/htmlfolder/reward.html",
						datatype:"html",
						success:function(data){
							
							let rewardNum = $('div > #reward').length;
							
							$('#tab-projectReward').append($(data));
							
							//동적생성 datepicker 설정해주기
							$(document).find("input[name=add_due_date]").removeClass('hasDatepicker');
							$('input[name=add_due_date]').removeAttr('id');
							$('input[name=add_due_date]').datepicker({dateFormat: 'yy-mm-dd'});

							//name - > add_reward_@@ 로 되어있는 부분은
							//rewardVOList[rewardNum].reward@@로 바꿔준다
							//리워드 금액
							$('#tab-projectReward').find("input[name='add_reward_price']").attr('name', 'RewardVOList['+rewardNum+'].reward_price');
							
							//리워드 구성
							$('#tab-projectReward').find("input[name='add_reward_compose']").attr('name', 'RewardVOList['+rewardNum+'].reward_compose');
							
							//배송조건
							$('#tab-projectReward').find("input[name='add_reward_ship_type']").attr('name', 'RewardVOList['+rewardNum+'].reward_ship_type');

							//라디오버튼 - 배송형
							$('#tab-projectReward').find("#add_deliveryType").attr('id', 'deliveryType'+rewardNum);
							//label
							$('#tab-projectReward').find("#add_label").attr('for', 'deliveryType'+rewardNum);
							//label id
							$('#tab-projectReward').find("#add_label").attr('id', 'label'+rewardNum);
							
							//라디오버튼 - 미배송형
							$('#tab-projectReward').find("#add_non_deliveryType").attr('id', 'nondeliveryType'+rewardNum);
							//label
							$('#tab-projectReward').find("#add_non_label").attr('for', 'nondeliveryType'+rewardNum);
							//label id
							$('#tab-projectReward').find("#add_non_label").attr('id', 'nonLabel'+rewardNum);
							
							//배송료
							$('#tab-projectReward').find("input[name='add_reward_charge']").attr('name', 'RewardVOList['+rewardNum+'].reward_charge');
							
							//배송예정일
							$('#tab-projectReward').find("input[name='add_due_date']").attr('name', 'RewardVOList['+rewardNum+'].due_date');
							
							//일괄적용 label
							$('#add_allCheckBtn').attr('id', 'allCheckBtn'+rewardNum);
							$('#addAllCheckBtn').attr('for', 'allCheckBtn'+rewardNum);
							$('#addAllCheckBtn').attr('id', 'allCheckBtn');
						}
						
					}	
				);
				
			});
			
			//리워드 삭제
			$(document).on('click', '#rewardDelBtn', function(){
				//지우기
				$(this).closest('#reward').remove();
				
				//리워드 index 업데이트 필요
				
				//div 태그 중 이름이 reward인 것들 반복
				$('div > #reward').each(function(index, item){
					//리워드 번호 (인덱스값만 바꿔주고 value값은 그대로 둬야됨)
					$(item).find('#rewardNo').attr('name', 'RewardVOList['+index+'].reward_no')
					
					//리워드 금액
					$(item).find("#rewardPrice").attr('name', 'RewardVOList['+index+'].reward_price');
					
					//리워드 구성
					$(item).find("#rewardCompose").attr('name', 'RewardVOList['+index+'].reward_compose');
					
					//배송조건
					$(item).find("input[type=checkbox]").attr('name', 'RewardVOList['+index+'].reward_price');
					
					//배송료
					$(item).find("#rewardCharge").attr('name', 'RewardVOList['+index+'].reward_charge');
					
					//배송예정일
					$(item).find("#dueDate").attr('name', 'RewardVOList['+index+'].due_date');
					
					/* //노출순서
					$(item).find("#rewardOrder").attr('name', 'RewardVOList['+index+'].reward_order'); */
				});
				
			});
			
			//배송형 / 미배송형 radio 버튼 클릭 시
			$(document).on('click', 'input:radio[name*=reward_ship_type]', function(){
				if($(this).val()=="1"){ //배송형 배송료입력창 보임
					$(this).parent().parent().next().show();
					$(this).parent().parent().next().next().show();
				} else if ($(this).val()=="2") { //미배송형 배송료입력창 숨김
					$(this).parent().parent().next().hide();
					$(this).parent().parent().next().next().hide();
				}
			});
			
			//배송예정일 일괄적용
			$(document).on('click', '#allCheckBtn', function(){
				let date = $(this).parent().parent().children().find('input:text[name*=due_date]').val();
				$('input:text[name*=due_date]').each(function(index, item){
					$(item).val(date);
				});
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
			
			//탭 체크하는 함수 유효성 검사할때 해당 탭으로 이동한다.
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
			
			////////////////////////////////////유효성 - 리워드//////////////////////////////////////////////
			
			//배송예정일
			$(document).on('change', 'input[name*=due_date]', function(){
				//배송예정일
				let dueDateCompare = dateGetTime($(this).val());
				let now = new Date();
				
				//펀딩마감일 비교
				if(!($('#projectEnd').val() == "")){
					let projectEndCompare = dateGetTime($('#projectEnd').val());
					
					if(projectEndCompare.getTime() > dueDateCompare.getTime()){
						swal('', '펀딩마감일보다 이전 날짜는 선택할 수 없습니다.', 'warning');
						$(this).val("");
						$(this).focus();
					}
				}
					
				//현재날짜보다 이전날짜
				if(now.getTime() > dueDateCompare.getTime()){
					swal('', '현재날짜보다 이전 날짜는 선택할 수 없습니다.', 'warning');
					$(this).val("");
					$(this).focus();
				}
				
			})
			
			//getTime
			function dateGetTime(dgt){
				let arr = dgt.split('-');
				let dgtCompare = new Date(arr[0], parseInt(arr[1])-1, arr[2]);
				return dgtCompare;
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
			
			//펀딩시작일 변경할때마다 실행되는 함수
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
				if(!projectFileCheck()) return false;		//프로젝트 파일
				
				//정산
				if(!projectStartCheck()) return false;	//펀딩시작일
				if(!projectEndCheck()) return false;	//펀딩마감일
				if(!projectGoalCheck()) return false;	//펀딩목표금액
				
				//리워드 유효성 체크 (비동기)
				//리워드 금액
				let returnStatus = true;
				$("input[name*=reward_price]").each(function(index, item){
					if($(item).val()==""){
						swal('', '리워드 금액을 입력해주세요.', 'warning');
						activeCheck($('#projectRewardTab'));
						$(item).focus();
						returnStatus = false;
						return false;
					}
				});
				
				if(!returnStatus){
					return false;
				}
				
				//리워드 구성
				$("input[name*=reward_compose]").each(function(index, item){
					if($(item).val()==""){
						swal('', '리워드 구성을 입력해주세요.', 'warning');
						activeCheck($('#projectRewardTab'));
						$(item).focus();
						returnStatus = false;
						return false;
					}
				});
				
				if(!returnStatus){
					return false;
				}
				
				//배송료
				$("input[name*=reward_charge]").each(function(index, item){
					if($(item).is(':visible')){
						if($(item).val()==""){
							swal('', '배송료를 입력해주세요.', 'warning');
							activeCheck($('#projectRewardTab'));
							$(item).focus();
							returnStatus = false;
							return false;
						}
					}
				});
				
				if(!returnStatus){
					return false;
				}
				
				//배송예정일
				$("input[name*=due_date]").each(function(index, item){
					if($(item).is(':visible')){
						if($(item).val()==""){
							swal('', '배송예정일을 입력해주세요.', 'warning');
							activeCheck($('#projectRewardTab'));
							$(item).focus();
							returnStatus = false;
							return false;
						}
					}
					
					//펀딩마감일 비교 - 프로젝트
					let dueDateCompare = dateGetTime($(item).val());
					let projectEndCompare = dateGetTime($('#projectEnd').val());
						
					if(projectEndCompare.getTime() > dueDateCompare.getTime()){
						swal('', '펀딩마감일보다 이전 날짜는 선택할 수 없습니다.', 'warning');
						$(item).val("");
						activeCheck($('#projectRewardTab'));
						$(this).focus();
						returnStatus = false;
						return false;
					}
					
				});
				
				if(!returnStatus){
					return false;
				}
				
				if($('#projectStatus').val()=='임시저장'){
					console.log('임시저장 프로젝트 접수로 변경')
					$('#projectStatus').val('접수');
				}
				//$('#target').submit();
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
						    <a id="memberInfoTab" class="nav-link active" href="#tab-memberInfo" role="tab" aria-selected="false" data-toggle="tab">개설자 정보</a>
						  </li>
						  <li class="nav-item">
						    <a id="projectStoryTab" class="nav-link" href="#tab-projectStory" role="tab" aria-selected="false" data-toggle="tab">프로젝트 스토리</a>
						  </li>
						  <li class="nav-item">
						    <a id="projectRewardTab" class="nav-link" href="#tab-projectReward" role="tab" aria-selected="true" data-toggle="tab">리워드</a>
						  </li>
						  <li class="nav-item">
						    <a id="calculateTab" class="nav-link" href="#tab-Calculate" role="tab" aria-selected="false" data-toggle="tab">정산</a>
						  </li>
						</ul> <!-- tab 메뉴 end -->
						
						<!-- 프로젝트 form -->
						<form id="target" action="" enctype="multipart/form-data" method="post">
							<input type="hidden" name="project_type" value="후원">
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
										<input type="text" id="memberPhone" class="form-control form-pill" name="member_phone" value="${member.member_phone }" oninput="this.value = this.value.replace(/[^0-9.-]/g, '').replace(/(\..*)\./g, '$1');">
										<small id="memberPhoneHelp" class="form-text text-gray"></small>
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
							  			<input type="text" id="projectTitle" name="project_title" class="form-control form-pill" maxlength="25" <c:if test="${not empty project.project_title }">value="${project.project_title }"</c:if> >
							  			<small class="float-right" id="testCnt">0/25</small>
							  		</div>
							  		<div class="form-group mb-4">
							  			<label for="imageNamePreview">프로젝트 이미지</label>
							  			<div class="input-group">
							  				<input type="text" id="imageNamePreview" class="form-control form-pill" aria-label="Readonly" readonly <c:if test="${not empty project.project_thumbnail}">value="${project.project_thumbnail }"</c:if> >
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
							  			<textarea id="summernote" class="form-control" name="project_content" ><c:if test="${not empty project.project_content}">${project.project_content }</c:if></textarea>
							  		</div>
									<div class="form-group mb-4">
										<label>리워드 배송 및 환불·교환 정책</label>
										<small class="form-text text-muted mb-3">리워드 배송 안내</small>
										<textarea class="form-control form-pill" name="delivery_guide" rows="3"><c:if test="${not empty support.delivery_guide}">${support.delivery_guide }</c:if></textarea>
										<small class="form-text text-muted mt-3 mb-3">리워드 배송 지연 시</small>
										<textarea name="delivery_delay" class="form-control form-pill" rows="5"><c:if test="${not empty support.delivery_delay}">${support.delivery_delay }</c:if></textarea>
										<small class="form-text text-muted mt-3 mb-3">환불 및 교환정책</small>
										<textarea name="refund_policy" class="form-control form-pill" rows="7"><c:if test="${not empty support.refund_policy}">${support.refund_policy }</c:if></textarea>
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
											<small id="projectFileHelp" class="form-text text-gray"></small>
										</div>
									</div>
								</div>
							  </div> <!-- 프로젝트 스토리 end -->
							  
							  <!-- 리워드 tab -->
							  <div class="tab-pane fade" id="tab-projectReward" role="tabpanel">
							  	<c:forEach items="${reward }" var="reward" varStatus="status">
							  		<div id="reward" class="mb-5 mt-5">
								  		<div id="rewarTop" class="form-group">
								  			<ul class="nav justify-content-between">
								  				<li class="nav-item text-center mt-3">
								  					<label>리워드</label>
								  					<input type="hidden" id="rewardNo" name="RewardVOList[${status.index }].reward_no" value="${reward.reward_no }">
								  				</li>
								  				<c:choose>
								  					<c:when test="${status.first }">
								  						<li class="nav-item">
										  					<button type="button" class="btn btn-sm btn-outline-primary" id="rewardAddBtn">리워드 추가</button>
										  				</li>
								  					</c:when>
								  					<c:otherwise>
								  						<li class="nav-item">
															<button type="button" class="btn btn-sm btn-outline-primary" id="rewardDelBtn">리워드 삭제</button>
														</li>
								  					</c:otherwise>
								  				</c:choose>
								  			</ul>
								  		</div><hr>
								  		<div id="rewardPriceDiv" class="form-group mb-4">
											<label for="rewardPrice">리워드 금액</label>
											<div class="input-group mb-3">
												<input type="text" id="rewardPrice" class="form-control form-pill" name="RewardVOList[${status.index }].reward_price" <c:if test="${not empty reward.reward_price}">value="${reward.reward_price }"</c:if> oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
												<span class="input-group-append p-0">원</span>
											</div>
										</div>
										<div class="form-group mb-4">
								  			<label for="rewardCompose">리워드 구성</label>
								  			<input type="text" id="rewardCompose" name="RewardVOList[${status.index }].reward_compose" class="form-control form-pill" <c:if test="${not empty reward.reward_compose}">value="${reward.reward_compose }"</c:if>>
								  		</div>
								  		<div class="form-group mb-4">
								  			<label for="rewardShipType">배송조건</label><br>
								  			<div class="form-check form-check-inline">
								  				<input class="form-check-input" type="radio" id="nondeliveryType${status.index }" value="1" name="RewardVOList[${status.index }].reward_ship_type" 
								  				<c:if test="${reward.reward_ship_type eq '1' }"> checked </c:if>>
								  				<label for="nondeliveryType${status.index }">배송형</label>
								  			</div>
								  			<div class="form-check form-check-inline">
								  				<input class="form-check-input" type="radio" id="deliveryType${status.index }" value="2" name="RewardVOList[${status.index }].reward_ship_type"
								  				<c:if test="${reward.reward_ship_type eq '2' }"> checked </c:if>>
								  				<label for="deliveryType${status.index }">미배송형</label><br>
								  			</div>
								  		</div>
								  		<div id="rewardChargeDiv" class="form-group mb-4">
								  			<label for="rewardCharge">배송료</label>
								  			<div class="input-group mb-3">
								  				<input type="text" id="rewardCharge" class="form-control form-pill" name="RewardVOList[${status.index }].reward_charge" <c:if test="${not empty reward.reward_charge}">value="${reward.reward_charge }"</c:if> oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								  				<span class="input-group-append p-0">원</span>
								  			</div>
								  		</div>
								  		<div class="form-group mb-4">
								  			<label for="dueDate">배송예정일</label>
								  			<div class="input-group mb-3">
								  				<div class="input-group-prepend">
								  					<span class="input-group-text">
								  						<i class="far fa-calendar-alt"></i>
								  					</span>
								  				</div>
								  				<input type="text" id="dueDate" class="form-control form-pill" name="RewardVOList[${status.index }].due_date" <c:if test="${not empty reward.due_date}">value="${reward.due_date }"</c:if> oninput="this.value = this.value.replace(/[^0-9.-]/g, '').replace(/(\..*)\./g, '$1');">
								  				<small id="dueDateHelp" class="form-text text-gray"></small> 
								  			</div>
								  			<div class="form-group form-check">
											    <input type="checkbox" class="form-check-input" id="allCheckBtn${status.index }">
											    <label class="form-check-label" id="allCheckBtn" for="allCheckBtn${status.index }">일괄적용</label>
											</div>
								  		</div>
							  		</div>
							  	</c:forEach>
							  </div> <!-- 리워드 end -->
							  
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