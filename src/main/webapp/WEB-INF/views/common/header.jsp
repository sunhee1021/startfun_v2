<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<style>
	#search_input {
		border-top: 0;
		border-left: 0;
		border-right: 0;
		border-bottom: 2px solid #d0d0d0;
		border-radius: 0;
	}

</style>

<!-- header -->
<header>
<!-- Navbar Dark -->
<nav class="navbar navbar-expand-lg navbar-light bg-white">
  <div class="container">
    <a class="navbar-brand" href="/startfun/index.do"><img src="${pageContext.request.contextPath}/resources/img/logo.jpg" alt="STARTFUN" style="width: 150px;"></a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse-2" aria-controls="navbarCollapse-2" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarCollapse-2">
      <ul class="navbar-nav mr-sm-2 mt-2 mt-lg-0 align-items-center">
        <li class="nav-item mr-3">
          <a class="nav-link" href="/startfun/supportList.do">후원하기 <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item mr-3">
          <a class="nav-link" href="/startfun/investList.do">투자하기</a>
        </li>
        <li class="nav-item mr-3">
          <se:authorize access="hasRole('ROLE_USER')">
          <a class="nav-link" href="/startfun/project/supportProjectReg.do">프로젝트 신청</a>
          </se:authorize>
          <se:authorize access="hasRole('ROLE_COMPANY')">
          <a class="nav-link" href="/startfun/project/investProjectReg.do">프로젝트 신청</a>
          </se:authorize>
        </li>
        <li class="nav-item mr-3">
          <a class="nav-link" href="/startfun/notice/notice.do">공지사항</a>
        </li>
        <li class="nav-item mr-3 ml-3">
        	<a class="nav-link p-0">
	        	<i id="search_btn" class="fas fa-search"></i>
	        	<div id="search_div" style="display:none;">
	        		<!-- Header Search -->
	        		<form action="/startfun/projectSearch.do" name="search" id="search" method="get">
		    			<input name="keyword" id="search_input" style="display:inline-block; padding:0px 8px" class="form-control border-0 form-control-sm" type="text" placeholder="Search...">
		    		</form>
		    		<!-- End Header Search -->
		    	</div>
        	</a>
      	</li>
      </ul>

      <ul class="navbar-nav ml-auto">
      	<c:set var="userprincalpal" value="${pageContext.request.userPrincipal}" />
      	<c:if test="${not empty pageContext.request.userPrincipal}">
        <li class="nav-item dropdown">
          <span id="qna" class="badge badge-primary"></span>
          <a class="nav-link" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            ${pageContext.request.userPrincipal.name} <i class="fas fa-angle-down small ml-1"></i>
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
            <a class="dropdown-item" href="/startfun/mypage/account.do">계정정보</a>
            <a class="dropdown-item" href="/startfun/mypage/following.do">팔로우</a>
            <a class="dropdown-item" href="/startfun/mypage/wish.do">관심프로젝트</a>
            <a class="dropdown-item" href="/startfun/mypage/openproject.do">개설프로젝트</a>
            <a class="justify-content-between dropdown-item align-items-center" href="/startfun/mypage/liveChatList.do">실시간문의
            	<span id="alarm" class='badge badge-danger float-right'></span>
            </a>
            <se:authorize access="hasRole('ROLE_USER')">
            	<a class="dropdown-item" href="/startfun/mypage/join/supportlist.do">참여프로젝트</a>
            </se:authorize>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/startfun/logout">로그아웃</a>
          </div>
        </li>
        </c:if>
        <c:if test="${empty pageContext.request.userPrincipal}">
        <li class="nav-item dropdown">
          <a class="nav-link" href="/startfun/login.do" role="button">
          	로그인
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="/startfun/joinus/join.do" role="button">
          	회원가입
          </a>
        </li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>
<!-- End Navbar Dark -->
</header>
<!-- End header -->


<script type="text/javascript">

$('#search_btn').click(function() {
	//$('#search_input').toggleClass('d-lg-block');
	$('#search_btn').hide();
	$('#search_div').show();
	$('#search_input').focus();
});

$('#search_input').focusout(function(){
	$('#search_div').hide();
	$('#search_btn').show();
}); 

//검색
function fn_project_search(){
	let keyword = $('#search_input').val();
	
	 if(window.event.keyCode == 13){
		if(keyword.trim() == ''){
			swal('검색어를 입력해주세요.');
			$('#search_input').focus();
			return false;
		}else{
			document.search.submit();
		}
	 }
}

</script>

<!-- 로그인 한 사용자에 한해서 웹소켓 연결하기 -->
<se:authorize access="isAuthenticated()">
	<script>
		getAlarm();

		// 문의 요청 가져오기
		function getAlarm() {
			$.ajax({
				type : "GET",
				url : '/startfun/chatRoomList.do',
				data:{
					user_email : "${pageContext.request.userPrincipal.name}",
					type : "all"
				},
				success : function(data) {
					console.log(data)

					let unreadCount=0;
					
					for(var i in data){
						unreadCount += parseInt(data[i].unread_count);
					}
					
					if (unreadCount > 0) {
						$('#alarm').html(unreadCount);
					}
				}
			});
		}
		
		//소켓 객체 생성
		let sock = new SockJS("http://localhost:8090/startfun/websocket/echo.do");

		//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
		sock.onopen = onOpen;
		sock.onmessage = onMessage;
		sock.onclose = onClose;

		function onOpen() {
			console.log("onOpend함수실행!")
			// alarm 라는 메시지를 보내어, Java Map에 session 추가 (memberSessionList)
			sock.send("alarm");
		}

		function onMessage(evt) {
			
			let receive = evt.data.split(",");
			
			const data = {
					"master_email" : receive[0],
					"name" : receive[1],
					"email" : receive[2],
					"message" : receive[3],
					"room_id" : receive[4]
			}
			
			if($('#toast').length){
				$('#toast').remove();	
			}
			
			let toast = "<div id='toast' style='width:400px; right: 25px; position: fixed; bottom: 25px; z-index: 200;'  class='modal-content' room_id='"+data.room_id+"'>";
			toast += "<div class='modal-header'><h5 class='model-title'><i class='fas fa-bell'></i> 알림</h5>";
			toast += "<button type='button' class='close'><span aria-hidden='true'>x</span></button>";
			toast += "</div><div class='modal-body message text-primary'>["+ data.name +"] "+ data.message +"</div></div>"
			
			$('main').append(toast);
			
			$('#toast').fadeOut(5000);
			
			getAlarm();
		}
		
		$(document).on('click', '#toast', function(){
			enterRoom(this);
		});
		
		function enterRoom(obj) {
			window.open('/startfun/liveChat.do?room_id='+obj.getAttribute("room_id"), '실시간 문의하기', 'width=400, height=600');
		}
		
		// 서버와 연결을 끊었을 때
		function onClose(evt) {
			$("#messageArea").append("연결 끊김");

		}
		
	</script>
</se:authorize>