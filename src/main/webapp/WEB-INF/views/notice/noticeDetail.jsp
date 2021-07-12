<%--
@JSP : noticeDetail.jsp 
@Date : 2021.06.
@Author : 임나영
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %> 
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>StartFun</title>
	
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

	<!-- Google Fonts -->
	<link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600" rel="stylesheet">

	<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/fontawesome-all.min.css">

	<!-- CSS font -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notosanskr.css">
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

<c:set var="userprincipal" value="${pageContext.request.userPrincipal.name}" />
<main>
	<section class="pt-11 pb-10">
		<div class="container">
			<div class="row">
				<div style="text-align:center; margin:auto; width:90%;">
					<!-- 공지글 상단 부분 -->
					<div>
						<div>
							<hr><div class="mt-8" style="font-size: 20pt;">${notice.notice_title}</div>
						</div>
						<br>
						<div style="text-align: right;">
							등록일&emsp;${notice.notice_regdate}
						</div>
						<hr>
						<div class="ml-3 mt-5">
							<div>${fn:replace(notice.notice_content, newLineChar,"<br>")}</div>
						</div>
					</div>
					
					<hr>	
							
					<!-- 댓글 목록 테이블 -->
					<div >
						<div id="reply_list" class="justify-content-center mt-4 mb-4">
						</div>
					</div>
					
					<!-- 댓글 달기 테이블 -->
					<form name="reply" id="reply">
						<c:set var="replyList" value="${reply}" />
						<input type="hidden" name="notice_no" value="${notice.notice_no}" id="notice_no">
						
						<table class="mx-auto">
							<tr>
								<td style="width:90%">
									<textarea class="form-control form-pill mx-auto pl-3" name="reply_content" id="reply_content" rows="2"></textarea>
								</td>
								<td style="width:10%">
									<button type="button" class="btn btn-outline-primary ml-5" id="replybtn">등록</button>
								</td>
							</tr>
						</table>
					</form>
				
					<!-- 공지사항 게시판 목록 -->
					<br>
					<div>
						<div colspan="4" align="center">
							<a class="btn btn-primary col-sm-2 mt-10" href="/startfun/notice/notice.do">목록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->
</body>

	<script type="text/javascript">
	
	let userprincipal = '${userprincipal}';
	
	$(function() {
		replyList();
		replyAdd();
	});
	
	//댓글 등록 로그인 확인
	$('#reply_content').click(function(){
		if('${userprincipal}' == "") {
			swal({
		           text: "로그인 페이지로 이동하시겠습니까?",
		           buttons: true,
		           dangerMode: true,
		         })
		         .then((willDelete) => {
		           if (willDelete) {
		              location.href = "/startfun/login.do";
		           }
		      });
		}
	});
	
	//댓글 등록
	function replyAdd(){
		
		$('#replybtn').click(function() {

			let frm = document.reply;
			
			//댓글 유효성 검사
			if (frm.reply_content.value == "") {
				swal({
						icon:'warning',
                        text: "댓글내용을 입력해주세요."
                   }); 

				return false;
			}
			
			let paramData = JSON.stringify({
				"reply_content" : $('#reply_content').val(),
				"notice_no" : $('#notice_no').val()
			});
				
			$.ajax({
				type: 'POST',
				url: '/startfun/notice/reply',
				data: paramData,
				contentType : "application/json; charset=utf-8",
				success: function(data){
					if(data > 0){
						swal({
                            text: "댓글이 등록되었습니다.",
                            button: false,
                            timer: 1500
                       }); 

						replyList();
						$('#reply_content').val("");	
					}
				},
				error: function(){
					swal({
						icon:'warning',
                        text: "댓글등록을 실패하였습니다."
                   }); 

					$('#reply_content').val("");
				}
			})//ajax : end
		});//등록 버튼 : end
	}//댓글 등록 함수 : end
		
	//댓글 목록
	function replyList(){
		
		$.ajax({
			url : "/startfun/notice/reply/list",
			type : 'GET',
			data : {
				"notice_no" : $('#notice_no').val()
			},
			success : function(data) { //글내용
				console.log(data);
				
				$('#reply_list').empty();
				
				$.each(data, function(index,obj) {
					
					var start = '<div class="ml-4" align="left"><form><div width="80%" id="reply_no'+obj.reply_no+'">'
					start += obj.reply_email+'<span class="small text-muted ml-3">'+obj.reply_regdate+'</span>'
					start += '<div id="btn_div'+obj.reply_no+'" class="col-sm-3 float-right">'
					start += '<se:authorize access="hasRole(\'ROLE_ADMIN\')">'
					start += '<input type="button" value="삭제" onclick="reply_del(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right" >' 
					start += '<input type="button" value="수정" onclick="reply_edit(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right mr-1" >'	
					start += '</se:authorize></div>'
					start += '<br><div style="margin-top: 8px;">'+obj.reply_content+'</div>'
					start += '<input type="hidden" id="reply_no" value="' +obj.reply_no +'" class="reply_no">'
					start += '<input type="hidden" name="notice_no" value="' +obj.notice_no +'" class="notice_no">'
					start += '</div></form></div><hr>'
					
					$('#reply_list').append(start);
					
					if(userprincipal == obj.reply_email){
						$('#btn_div'+obj.reply_no).empty();
						
						$('#btn_div'+obj.reply_no).append(
							'<input type="button" value="삭제" onclick="reply_del(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right" >' 
							+'<input type="button" value="수정" onclick="reply_edit(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right mr-1" >'
						);
					} 
				});
			},
			error : function() {
				alert('댓글 로드 실패');
			}
		}); //ajax : end
	}//댓글 목록 함수 : end
			
	//댓글 삭제
	function reply_del(frm) {
		console.log(frm);
		
		let reply_no = frm.reply_no.value;
		
		$.ajax({
			type: 'DELETE',
			url: '/startfun/notice/reply/'+reply_no,
			dataType : "text",
			success: function(data){
				swal({
                    text: "해당댓글이 삭제되었습니다.",
                    button: false,
                    timer: 1500
               }); 

					replyList();
			},
			error: function(){
				alert('댓글 삭제 실패');
			}
		});//ajax : end
	}//댓글 삭제 : end
			
 	//댓글 수정(view)
	function reply_edit(form){
				
		let reply_no = form.reply_no.value;
		
		$.ajax({
			url: '/startfun/notice/reply/'+reply_no,
			type: 'GET',
			success: function(data){
				var htmls = '<div align="left"><form><div id="reply_no'+reply_no+'">' 
						+ data.reply_email +'<span class="small text-muted ml-3">'+data.reply_regdate+'</span>'
						+'<div id="btn_div" class="col-sm-3 float-right">'
						+'<input type="button" value="취소" onclick="replyList()" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right">'
						+'<input type="button" value="수정" onclick="replyEdit(this.form)" class="btn btn-sm btn-outline-dark-soft px-1 py-1 float-right mr-1">'
						+'</div><br><textarea class="form-control form-pill" name="editReply" id="editReply" placeholder="댓글 내용" rows="2" cols="50" style="margin-top: 10px;">'+data.reply_content+'</textarea>'
						+'<input type="hidden" name="reply_no" id="reply_no" value="'+reply_no+'" class="reply_no">'
						+'</div><form></div>';
						
				$('#reply_no'+reply_no).replaceWith(htmls);	
			},
			error: function(){
				alert('댓글 수정 실패');
			}
		});//ajax : end
	}//댓글 수정(view) : end 
			
	//댓글 수정(처리)
	function replyEdit(frm){
		
		let reply_no = frm.reply_no.value;
		
		let paramData = JSON.stringify({
			"reply_no" : reply_no,
			"reply_content" : $('#editReply').val(),
			"notice_no" : $('#notice_no').val()
		});
		console.log(paramData);
		
		$.ajax({
			type: 'PUT',
			url: '/startfun/notice/reply/'+reply_no,
			contentType : "application/json; charset=utf-8",
			data: paramData,
			success : function(result){
				swal({
                    text: "해당 댓글수정이 완료되었습니다.",
                    button: false,
                    timer: 1500
               }); 

				replyList();
			},
			error: function(){
				alert('댓글 수정 실패');
			}
		})//ajax : end
	}//댓글 수정 : end
			
	</script>
</html>