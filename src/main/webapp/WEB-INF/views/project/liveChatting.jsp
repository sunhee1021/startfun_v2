<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!--
설 명 : 채팅
작성일 : 2021.06.18
작성자 : 조하선
-->
<head>
	<meta charset="UTF-8">
	<title>${project.project_title } || 실시간 문의하기</title>
	
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
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	<style type="text/css">

	.chatMiddle {
		min-height: 400px;
	}	
	.msgWarapper {
		margin-top: 10px;
		display: flex;
	}
	
	/* 오른쪽 */
	
	.msgWarapperRight {
		padding-right: 12px;
		text-align: right;
		color: rgb(36, 36, 40);
	}
	
	.messageHeaderRight {
		display: block;
		font-size: 11px;
		margin: 10px 0px 4px;
		color: rgb(167, 167, 170);
	}
	
	.messageContentRight {
		display: flex;
		align-items: flex-end;
		justify-content: flex-end;
		margin-bottom: 4px;
	}
	
	.contentWrapRight {
		max-width: 269px;
		padding: 10px;
		border-radius: 12px;
		background-color: #205DA0;
		color: white;
		margin-right: 10px;
	}
	
	/* 왼쪽 */
	
	.leftImgWrapper {
		width: 46px;
		padding-left: 10px;
		box-sizing: boreder-box;
	}
	
	.leftImg {
		position: relative;
		border-radius: 50%;
		background-size: cover;
		background-position: center center;
		box-sizing: none;
	}
	
	.message {
		flex: 1 1 0px;
		overflow: hidden;
	}
	
	.messageHeader {
		display: flex;
		align-items: center;
		margin: 0px 20% 4px 0px;
		color: rgb(36, 36, 40);
	}
	
	.name {
		flex: 0 1 auto;
		font-weight: 700;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		font-size: 0.8rem !important;
		line-height: 1.12rem !important;
	}
	
	.messageContent {
		display: flex;
		margin-bottom: 4px;
	}
	
	.contentWrap {
		max-width: 269px;
		padding: 10px;
		border-radius: 12px;
		background-color: rgb(240, 240, 241);
		color: rgb(36, 36, 40);
	}
	
	.content {
		display: flex;
		max-width: 260px;
		font-size: 1rem !important;
		line-height: 1.4rem !important;
		display: inline-block !important;
		text-align: left !important;
		letter-spacing: -0.1px !important;
		border-radius: 15px !important;
	}
	
	.chatContainer {
		z-index: 100;
		padding: 5rem 0 7rem;
	}
	
	.textbox {
		width: 100%;
		height: 100px;
		border: none;
		resize: none;
		outline: none;
		box-shadow: 0 -5px 15px -8px rgb(0 0 0 / 7%);
		padding: 20px 70px 20px 20px;
	}
	
	.submitBtn {
		margin-left: -4rem;
		height: 30px;
		margin-top: 15px;
		z-index: 10;
		border-radius: 0.3rem;
		width: 50px;
		font-size: 13px;
		color: #fff;
		background-color: #205DA0;
		border: 1px solid transparent;
	}
	</style>
</head>
<body>
	<!-- 채팅 창 -->
	<div class="chatContainer js-scrollbar">
		<!-- 스타터정보 -->
		<div class="chatTop fixed-top bg-primary media ">
			<!-- 스타터프로필 -->
			<div class="d-flex mr-3 ml-3 mt-3 mb-2 ml-2" id="starterImg">
				<img id="profile" class="rounded-circle shadow mt-1" width="40" height="40" src="${pageContext.request.contextPath}/upload/default.jpg">
			</div>
			<div class="media-body mt-3 mb-3 mr-2">
				<!-- 스타터이름 -->
				<p class="mb-0">
					<span class="text-white">${receiver.member_name }</span>
					<!-- 상대방이 스타터일 경우 -->
					<c:if test="${project.project_email eq receiver.member_email }">
						<span class="badge badge-warning ml-1">스타터</span>
					</c:if>
				</p>
				<!-- 프로젝트이름 -->
				<span style="font-size: 0.8rem; opacity:0.7" class="text-white">${project.project_title }</span>
			</div>
		</div>
		<div class="chatMiddle">
			<!-- 동적 생성 -->
		</div>
		<div class="chatBottom fixed-bottom">
			<div class="input-group">
				<textarea class="textbox" placeholder="메시지를 입력해주세요."></textarea>
				<button class="submitBtn" type="button">전송</button>
			</div>
		</div>
	</div>
	
	<!-- format -->
	<div class="chatMiddle format">
		<div class="msgWarapper">
			<div class="leftImgWrapper">
				<img width="30" height="30" class="leftImg" src="${pageContext.request.contextPath}/upload/default.jpg">
			</div>
			<div class="message">
				<div class="messageHeader">
					<div class="name"></div>
				</div>
				<div class="messageContent">
					<div class="contentWrap">
						<div class="content"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">

	if(${!empty receiver.member_profile && receiver.member_profile ne ''}){
		$('.leftImg').attr("src", "${pageContext.request.contextPath}/upload/${receiver.member_profile}")
		$('#profile').attr("src", "${pageContext.request.contextPath}/upload/${receiver.member_profile}")
	} 

	$('.format').hide();

	//채팅창 로드 시 채팅 내역 불러오기
	$.ajax({
		url : "/startfun/"+${room.room_id}+".do",
		data : {
			user_email : "${myemail}"
		},
		async:false,
		dataType:"json",
		success:function(data){
			for(var i = 0; i < data.length; i++){
				// 채팅 목록 동적 추가
				CheckLR(data[i]);
			}
		}
	});
	
	$(".submitBtn").click(function() {
		
		let search3 = $('div.chatBottom textarea').val();
		
		// 공백 입력 시 데이터 전송 X
		if(search3.replace(/\s|  /gi, "").length == 0){
            return false;
            $('div.chatBottom textarea').focus();
         }
		
		sendMessage(search3);
		// textarea 비우기
		clearTextarea();
	});
	
	// enter 키 이벤트
	$(document).on('keydown', 'div.chatBottom textarea', function(e){
		if(e.keyCode == 13 && !e.shiftKey){
			e.preventDefault(); // 엔터키가 입력되는 것을 막아준다.
			const message = $(this).val(); // 현재 입력된 메세지를 담는다.
			
			let search3 = $('div.chatBottom textarea').val();
			
			// 공백 입력 시 데이터 전송 X
			if(search3.replace(/\s|  /gi, "").length == 0){
                return false;
                $('div.chatBottom textarea').focus();
             }
			
			sendMessage(message);
			// textarea 비우기
			clearTextarea();
		}
	});

	
	
	//소켓 객체 생성
	let sock = new SockJS("http://localhost:8090/startfun/websocket/echo.do");
	
	//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
	sock.onopen = onOpen;
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	// 웹 소켓에 연결되었을 때 호출 될 함수
	function onOpen() {
		// ENTER-CHAT 이라는 메세지를 보내어, Java Map에 session 추가 ()
		const data = {
				"room_id" : "${room.room_id}",
				"name"	: "${myname}",
				"email" : "${myemail}",
				"message" : "ENTER-CHAT"
		};
		
		let jsonData = JSON.stringify(data);
		sock.send(jsonData);
		
	}
	
	// 1. 메시지 전송
	function sendMessage(message) {
		
		const data = {
				"room_id" : "${room.room_id}",
				"name"	: "${myname}",
				"email" : "${myemail}",
				"message" : message
		}
		
		CheckLR(data);
		
		let jsonData = JSON.stringify(data);
		sock.send(jsonData);
	}
	
	// 2. 서버로부터 메시지를 받았을 때
	function onMessage(evt) {
		
		let receive = evt.data.split(",");
		
		const data = {
				"master_email" : receive[0],
				"name" : receive[1],
				"email" : receive[2],
				"message" : receive[3]
		}
		
		if(data.email != "${myemail}"){
			CheckLR(data);
		}
		
		/* var data = evt.data;
		$("#messageArea").append(data + "<br/>"); */
	}
	
	// 2-1. 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
	function CheckLR(data) {
		// email이 내 email과 다르면 왼쪽, 같으면 오른쪽
		const LR = (data.email != "${myemail}") ? "left" : "right";
		// 메세지 추가
		appendMessageTag(LR, data.email, data.message, data.name);
	}
	
	// 3. 메세지 태그 append
	function appendMessageTag(LR_className, email, message, name) {
		
		const chatLi = createMessageTag(LR_className, email, message, name);
		
		$('div.chatMiddle:not(.format)').append(chatLi);
		
		// 스크롤바 아래 고정
		console.log($('div.chatMiddle').prop('scrollHeight'))
		if($('div.chatMiddle').prop('scrollHeight') > 401){
			$('html, body').scrollTop($(document).height());
		}
	}
	
	// 4. 메세지 태그 생성
	function createMessageTag(LR_className, email, message, name) {
		// 형식 가져오기
		let chatLi = $('div.chatMiddle.format').find('.msgWarapper').clone();
		
		// 내가 보냈을 때는 img 태그, 이름 태그 지우기, right class로 변경
		if (LR_className == "right") {
			chatLi.find('.msgWarapper').attr('class', 'msgWarapperRight');
			chatLi.find('.leftImgWrapper').remove();
			chatLi.find('.messageHeader').remove();
			chatLi.find('.messageContent').attr('class', 'messageContentRight');
			chatLi.find('.contentWrap').attr('class', 'contentWrapRight');
		} 
		// 상대방이 보냈을 때
		else if(LR_className == "left") {
			chatLi.find('.name').text(name);
		}
		
		chatLi.find('.content').text(message);
		console.log("cht: "+chatLi)
		return chatLi;
	}
	
	// 5. 채팅장 비우기
	function clearTextarea() {
		$('div.chatBottom textarea').val('');
		return false;
	}
	
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$(".chatContainer").append("연결 끊김");

	}
	
</script>
</html>