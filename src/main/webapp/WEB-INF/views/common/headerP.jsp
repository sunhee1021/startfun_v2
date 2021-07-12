<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!-- header -->
<header>
<!-- Navbar Dark -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="/startfun/index.do"><img src="${pageContext.request.contextPath}/resources/img/logo-light.png" alt="Docs UI Kit" style="width: 150px;"></a>

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
	        	<div id="search_div">
	        		<!-- Header Search -->
		    		<input id="search_input" style="display:inline-block; padding:0px 8px" class="border-0 form-control-sm" type="text" placeholder="Search...">
		    		<!-- End Header Search -->
		    	</div>
        	</a>
      	</li>
      </ul>

      <ul class="navbar-nav ml-auto">
      	<c:set var="userprincalpal" value="${pageContext.request.userPrincipal}" />
      	<c:if test="${not empty pageContext.request.userPrincipal}">
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            ${pageContext.request.userPrincipal.name} <i class="fas fa-angle-down small ml-1"></i>
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
            <a class="dropdown-item" href="/startfun/mypage/account.do">계정정보</a>
            <a class="dropdown-item" href="/startfun/mypage/following.do">팔로우</a>
            <a class="dropdown-item" href="/startfun/mypage/wish.do">관심프로젝트</a>
            <a class="dropdown-item" href="/startfun/mypage/openproject.do">개설프로젝트</a>
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
$(document).ready(function(){
	$('#search_div').hide();
});

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

</script>