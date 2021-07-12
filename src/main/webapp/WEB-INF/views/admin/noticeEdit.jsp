<%--
@JSP : noticeEdit.jsp 
@Date : 2021.06.
@Author : 임나영
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스타트펀 | 관리자</title>
	
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
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- 첨부파일 <file> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
	<!-- summernote -->
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.5.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.5.1/js/bootstrap.min.js"></script>
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script type="text/javascript">
		
			//유효성 검사
			function check(){
			    if(!editBtn.notice_title.value){

			    	swal({
  							icon:'warning',
  	                        text: "제목을 입력해주세요."
  	                   }); 

			        editBtn.notice_title.focus();
			        return false;
			    }
			     if(!editBtn.notice_content.value){            
			    	 swal({
							icon:'warning',
	                        text: "내용을 입력해주세요."
	                   }); 
			         editBtn.notice_content.focus();
			         return false;
			    }
			    
			     swal({
                     text: "성공적으로 수정되었습니다.",
                     button: false,
                     timer: 1500
                }); 
 
			     
			    document.editBtn.submit();
			    location.href="/admin/notice/adminNotice.do";
			}
			
			//summernote
			$(document).ready(function(){
				$('#filename').on("change", fileChange);
				$('#summernote').summernote({
					placeholder: '내용을 입력하세요',
					tabsize: 2,
					height: 300,
					minHeight: 300, 
					maxHeight: 300, 
				});			
			})
			
			function fileChange(e){
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);
				
				filesArr.forEach(function(f){
					var reader = new FileReader();
					reader.onload = function(e){
						$('#preview').attr("src", e.target.result);
					}
					reader.readAsDataURL(f);
				})
			}
		</script>
</head>
<body>

<c:import url="/WEB-INF/views/common/header_admin.jsp" />

<!-- START NAV BAR -->
<div class="requestProject-margin"></div>
<main class="content">
	<nav class="navbar navbar-top navbar-expand navbar-dashboard navbar-dark ps-0 pe-2 pb-0">
		<div class="container-fluid px-0">
			<div class="d-flex justify-content-between w-100" id="navbarSupportedContent">
				<div class="d-flex align-items-center">
				</div>
			</div>
		</div>
	</nav>
<!-- NAV BAR END -->
<div class="py-4">
	<nav aria-label="breadcrumb">
         <ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
             <li class="breadcrumb-item"><a href="#"><span class="fas fa-home"></span></a></li>
             <li class="breadcrumb-item"><a href="requestProjectList.do">공지사항 관리</a></li>
         </ol>
     </nav>
     <div class="mb-3 mb-lg-0">
	     <h1 class="h4">공지사항 관리</h1>
	     <p class="mb-0"></p>
     </div>
	<div class="card card-body shadow-sm table-wrapper table-responsive" style="clear: both; text-align: center;">
		<form name="editBtn" action="../notice/noticeEdit.do?notice_no=${notice.notice_no}" target="_blank" method="post" >
	   		<table class="table table-bordered" width="95%" align="center">
	               <tr>
	                   <td width="20%" align="center" style="vertical-align: middle;">제목</td>
	                   <td width="80%" align="left"><input type="text" class="form-control" name="notice_title" size="40" value="${notice.notice_title}"></td>
	               </tr>
	               <tr>
	                   <td width="20%" align="center" style="vertical-align: middle;">글내용</td>
	                   <td width="80%" align="left">
	                   	<textarea rows="10" cols="60" name="notice_content" class="ckeditor" id="summernote">
	                   		${notice.notice_content}
	                   	</textarea>
	                   </td>
	               </tr>
	         </table>
			 <div style="float: right; padding-top: 15px;">
			     <input type="button" class="btn btn-primary" value="수정" onclick="check();"/> 
			     <input type="button" class="btn btn-primary" value="취소" id="cancel" onclick="location.href='/admin/notice/adminNotice.do';">
		     </div>
		</form>
	</div>
</div>
</main>
</body>
</html>