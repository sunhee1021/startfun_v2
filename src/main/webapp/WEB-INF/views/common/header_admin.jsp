<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Menu Bar Start -->
	<nav class="navbar navbar-top navbar-expand navbar-dashboard navbar-dark pt-4">
	<div class="container-fluid px-0">
		<div class="d-flex justify-content-between w-100"
			id="navbarSupportedContent">
			<div class="d-flex align-items-center">
				<form class="navbar-search form-inline" id="navbar-search-main">
					<div class="input-group input-group-merge search-bar">
					</div>
				</form>
			</div>
			<ul class="navbar-nav align-items-center">
					<li class= "nav-item dropdown">
					   <img src="${pageContext.request.contextPath}/resources/img/1.png" alt="WEIS" style="width: 25px; height: 17px; margin-top:-8px;">
					</li>
				<li class="nav-item dropdown">
				<div class="media d-flex align-items-center">
							<div class="media-body ms-2 text-dark align-items-center d-none d-lg-block mr-5" style="margin-right: 40px">
								<a href="/admin/login.do"><span class="mb-0 font-small fw-bold text-gray-700">로그아웃</span></a>
							</div>
						</div>
					</div>
</nav>
 <nav class="navbar navbar-dark navbar-theme-primary px-4 col-12 d-md-none">
    <a href="adminMain.do">
    </a>
    <div class="d-flex align-items-center">
        <button class="navbar-toggler d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>
 <nav id="sidebarMenu" class="sidebar d-md-block bg-dark text-white collapse" data-simplebar>
  <div class="sidebar-inner px-4 pt-3">
  	<!-- 없애도 되는 부분인가? -->
    <div class="user-card d-flex d-md-none align-items-center justify-content-between justify-content-md-center pb-4">
      <div class="d-flex align-items-center">
        <div class="user-avatar lg-avatar me-4">
			<!-- 이미지 -->
        </div>
      </div>
      <div class="collapse-close d-md-none">
        <a href="#sidebarMenu" class="fas fa-times" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
          aria-controls="sidebarMenu" aria-expanded="true" aria-label="Toggle navigation"></a>
      </div>
    </div>
    <ul class="nav flex-column pt-3 pt-md-0">
      <li class="nav-item">
        <a href="/startfun/index.do" class="nav-link d-flex align-items-center">
          <span class="sidebar-icon">
            <!-- WEIS LOGO -->
          </span>
           <img class="mb-3" src="${pageContext.request.contextPath}/resources/img/logo_f.png" alt="STARTFUN" style="width: 200px;">
        </a>
      </li>
      <li class="nav-item ">
        <a href="/admin/index.do" class="nav-link">
          <span class="sidebar-icon"><span class="fas fa-chart-pie"></span></span>
          <span class="sidebar-text">메인 페이지(차트)</span>
        </a>
      </li>
      <li class="nav-item">
        <span
          class="nav-link  collapsed  d-flex justify-content-between align-items-center"
          data-bs-toggle="collapse" data-bs-target="#submenu-pages">
          <span>
            <span class="sidebar-icon"><span class="far fa-file-alt"></span></span>
            <span class="sidebar-text">회원 관리</span>
          </span>
          <span class="link-arrow"><span class="fas fa-chevron-right"></span></span>
        </span>
        <div class="multi-level collapse " role="list"
          id="submenu-pages" aria-expanded="false">
          <ul class="flex-column nav">
            <li class="nav-item">
              <a class="nav-link" href="/admin/user.do">
                <span class="sidebar-text">개인 회원</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/admin/companyUser.do">
                <span class="sidebar-text">법인 회원</span>
              </a>
            </li>
          </ul>
        </div>
      </li>
      <li class="nav-item">
        <span
          class="nav-link  collapsed  d-flex justify-content-between align-items-center"
          data-bs-toggle="collapse" data-bs-target="#submenu-components">
          <span>
            <span class="sidebar-icon"><span class="fas fa-box-open"></span></span>
            <span class="sidebar-text">프로젝트 관리</span>
          </span>
          <span class="link-arrow"><span class="fas fa-chevron-right"></span></span>
        </span>
        <div class="multi-level collapse " role="list"
          id="submenu-components" aria-expanded="false">
          <ul class="flex-column nav">
            <li class="nav-item">
              <a class="nav-link" href="/admin/requestProjectList.do">
                <span class="sidebar-text">신청 프로젝트</span>
              </a>
            </li>
            <li class="nav-item ">
              <a class="nav-link" href="/admin/permitProjectList.do">
                <span class="sidebar-text">승인 프로젝트</span>
              </a>
            </li>
          </ul>
        </div>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="/admin/notice/adminNotice.do">
          <span class="sidebar-icon"><span class="fas fa-cog"></span></span>
          <span class="sidebar-text">공지사항 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a href="#"
          class="d-flex align-items-center justify-content-center btn-upgrade-pro">
          <img src="${pageContext.request.contextPath}/resources/img/weis.png" alt="WEIS" style="width: 29px; height: 20px; margin-bottom: 10px">
        </a>
      </li>
    </ul>
  </div>
</nav>
<!-- Menu Bar End -->
