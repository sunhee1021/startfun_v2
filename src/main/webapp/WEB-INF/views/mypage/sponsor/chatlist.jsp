<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>실시간 문의내역</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
	
	<!-- 웹소켓 -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$('.format').hide()
						
			// 총 읽지 않은 갯수
			let countAll = 0;
			
			// 처음 로드 시 내 프로젝트 / 내가 보낸 문의 다 가져옴 -> new icon 표시하기 위해서
			getRoomList('user')
			getRoomList('master')
				
			$('#chatlist-tab-send').click(function(){
				getRoomList("user");
			});
			
			$('#chatlist-tab-receive').click(function(){
				getRoomList("master");
			});
			
			// 채팅방 내역
			function getRoomList(type) {
				
				// 채팅 방 목록 가져오기
				$.ajax({
					url:"/startfun/chatRoomList.do",
					data:{
						user_email : "${pageContext.request.userPrincipal.name}",
						type : type
					},
					dataType:"json",
					async:false, // async : false를 줌으로써 비동기를 동기로 처리
					success:function(data){
						
						if(data.length > 0) {
							
							if(type == "master") {
								$('div.master ul').empty();	
							} else if (type == "user") {
								$('div.user ul').empty();
							}
							
							// 읽지 않은 메세지 초기화
							countAll = 0;
							
							// 태그 동적 추가
							for(var i in data) {
								
								// 형식 가져오기
					            let chatLi = $('div.chatList.format ul li').clone();
								
								// 읽지 않은 메세지가 0이 아닐 때 ( 안 읽은 메세지가 있을 때 )
								if(data[i].unread_count != 0) {
									chatLi.find('.alarmNum').text(data[i].unread_count);
								} else {
									chatLi.find('.alarmNum').remove();
								}
								
								// 내 프로젝트 문의 로드 시
								if(type == "master") {

									// img
									if(${!empty data[i].user_pic && !data[i].user_pic ne '' } ){
										chatLi.find('.profile').attr("src", "${pageContext.request.contextPath}/upload/"+data[i].user_pic)	
									}
									// 이름
									chatLi.find('.userName').text(data[i].user_name);
								
								// 내가 보낸 문의 로드 시
								} else if (type == "user") {
									
									// img
									if(data[i].master_pic != null){
										chatLi.find('.profile').attr("src", "${pageContext.request.contextPath}/upload/"+data[i].master_pic)	
									}
									
									// 이름
									if(data[i].project_type == "투자") {
										chatLi.find('.userName').text(data[i].member_company);
									} else {
										chatLi.find('.userName').text(data[i].master_name);
									}
									
								}
								
								// a태그 
								chatLi.find('.enterRoom').attr('id', data[i].room_id).attr('type', type)
								
								// 프로젝트 제목 
								chatLi.find('.projectTitle').text(data[i].project_title);
								
								// 마지막메시지
								chatLi.find('.lastMessage').text(data[i].last_message);
								
								// 마지막 메시지 보낸 시간
								chatLi.find('.lastMessageTime').text(data[i].regtime);
								
								// String을 int로 바꿔주고 더해준다.
								countAll += parseInt(data[i].unread_count);
								console.log('안읽은 메시지 수 : '+countAll)
								
								// 태그 생성
								if(type == "master") {
									$('div.master ul').append(chatLi);
									
									// 안읽은 메시지가 있으면 icon 보이기
									if(countAll > 0) {
										$('#new-receive-icon').css('visibility', 'visible');
									} else {
										$('#new-receive-icon').css('visibility', 'hidden');
									}
								} else if (type == "user") {
									$('div.user ul').append(chatLi);
									if(countAll > 0) {
										$('#new-send-icon').css('visibility', 'visible');
									} else {
										$('#new-send-icon').css('visibility', 'hidden');
									}
								}
							}
						}
					}
				});
				
			} /* 채팅방 내역 불러오기 function end  */
			
			$(document).on('click', '.enterRoom', function(){
				console.log('click')
				enterRoom(this);
			})
			
			function enterRoom(obj) {
				
				// 클릭 한 채팅방이 master라면 내 프로젝트 문의를 재로드한다. -> 읽음표시 업데이트
				if(obj.getAttribute('type') == "master") {
					getRoomList('master')
				} 
				// 클릭 한 채팅방이 user라면 내가 보낸 문의를 재로드한다. -> 읽음표시 업데이트
				else if (obj.getAttribute('type') == "user") {
					getRoomList('user')
				}
				
				window.open('/startfun/liveChat.do?room_id='+obj.getAttribute("id"), '실시간 문의하기', 'width=400, height=600');
				
			}
			
			//소켓 객체 생성
			let sock = new SockJS("http://localhost:8090/startfun/websocket/echo.do");
			
			//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
			sock.onopen = onOpen;
			sock.onmessage = onMessage;
			sock.onclose = onClose;
			
			function onOpen() {
				console.log("onOpend함수실행!")
				// alarm 라는 메시지를 보내어, Java Map에 session 추가 (alarmSessionList)
				sock.send("alarm");
			}

			// 메세지 받았을때
			function onMessage(evt) {
				
				let receive = evt.data.split(",");
				
				const data = {
						"master_email" : receive[0],
						"name" : receive[1],
						"email" : receive[2],
						"message" : receive[3]
				}
				
				let my = "${pageContext.request.userPrincipal.name}";
				
				// 내 프로젝트 문의
				if(my == data.master_email) {
					getRoomList('master')
				} 
				// 내가 보낸 문의
				else {
					getRoomList('user')
				}
				
			}
			
			// 서버와 연결을 끊었을 때
			function onClose(evt) {
			
			} 
		});
	</script>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->

<!-- main -->
<main>
	<div class="container px-11">
		<div class="row justify-content-center pt-11 pb-6">
			<div class="col-lg-9">
				<div class="w-md-75 w-lg-50 mx-auto text-center mb-5">
					<h2 class="h3 text-center">실시간 문의 내역</h2>
				</div>
				<!-- 탭 -->
				<ul class="nav nav-bordered justify-content-center" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" style="position: relative;" id="chatlist-tab-receive" data-toggle="tab" href="#chatlist-tab-receive-content" 
						   role="tab" aria-controls="chatlist-tab-receive-content" aria-selected="true">
						   <div id="new-receive-icon" style="width: 8px; height: 8px; margin-left: 110px; visibility:hidden;" class="rounded-circle bg-danger"></div>
								내 프로젝트 문의
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="chatlist-tab-send" data-toggle="tab" href="#chatlist-tab-send-content" 
						   role="tab" aria-controls="chatlist-tab-send-content" aria-selected="false">
						   <div id="new-send-icon" style="width: 8px; height: 8px; margin-left: 95px; visibility:hidden;" class="rounded-circle bg-danger"></div>
						   내가 보낸 문의
						   </a>
					</li>
				</ul>
			</div>
		</div>
		<div class="card-body tab-content p-0  chatList" id="chatTabContent">
			<div class="tab-pane fade py-2 px-11 pb-11 show active master" id="chatlist-tab-receive-content" role="tabpanel" aria-labelledby="chatlist-tab-receive">
				<!-- 동적 생성 -->
				<ul class="list-group">
					<div class="justify-content-center text-center mb-8 mt-5 pb-10 pt-8 list-group-item">
						<span  style="color: #9a9a9b8c">
							<i class="far fa-comments fa-8x"></i>
						</span>
						<br>
						<p class="mt-3">실시간 문의 내역이 없습니다.</p>
					</div>		
				</ul>
			</div>
			<div class="tab-pane fade py-2 px-11 pb-11 show user" id="chatlist-tab-send-content" role="tabpanel" aria-labelledby="chatlist-tab-send">
				<!-- 동적 생성 -->
				<ul class="list-group">
					<div class="justify-content-center text-center mb-8 mt-5 pb-10 pt-8 list-group-item">
						<span  style="color: #9a9a9b8c">
							<i class="far fa-comments fa-8x"></i>
						</span>
						<br>
						<p class="mt-3">실시간 문의 내역이 없습니다.</p>
					</div>
				</ul>
			</div>
		</div>
	</div>
	
	
	
</main>	<!-- onclick="enterRoom(this)" -->
	<!-- format -->
	<div class="chatList format">
		<ul class="list-group">
			<li class="list-group-item">
				<a id="enterRoom"  class="enterRoom link-dark link-hover-dark bg-hover-light" >
					<div class="media m-3 align-items-center">
						<div class="d-flex mr-4">
							<img id="profile" class="profile rounded-circle shadow mt-1" width="100" height="100" src="${pageContext.request.contextPath}/upload/default.jpg">
						</div>
						<div class="media-body">
							<span id="projectTitle" class="projectTitle text-black h6"></span><br>
							<span id="userName" class="userName text-black"></span><br>
							<span id="lastMessage" class="lastMessage" style="color: #939292"></span>
						</div>
						<div>
							<span id="lastMessageTime" class="lastMessageTime" style="color: #939292">123123</span><br>
							<div  id="alarmNum" style="width: 30px; height: 30px;" class="alarmNum mt-2 rounded-circle bg-danger text-center text-white float-right" ></div>
						</div>
					</div>
				</a>
			</li>				
		</ul>
	</div> 
	
	<!-- <script >
	// 채팅 방 클릭 시 방번호 배정 후 웹소켓 연결
	function enterRoom(obj) {
		window.open('/startfun/liveChat.do?room_id='+obj.getAttribute("id"), '실시간 문의하기', 'width=400, height=600');
		
		// 클릭 한 채팅방이 master라면 내 프로젝트 문의를 재로드한다. -> 읽음표시 업데이트
		if(obj.getAttribute('type') == "master") {
			getRoomList("master")
		} 
		// 클릭 한 채팅방이 user라면 내가 보낸 문의를 재로드한다. -> 읽음표시 업데이트
		else if (obj.getAttribute('type') == "user") {
			getRoomList("user")
		}
	}
	</script> -->
</body>
</html>