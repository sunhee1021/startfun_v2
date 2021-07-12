<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


	<nav class="navbar navbar-dark navbar-theme-primary px-4 col-12 d-md-none">
    <a class="navbar-brand me-lg-5" href="../index.html">
        <!-- <img class="navbar-brand-dark" src="" />  <img class="navbar-brand-light" src="../assets/img/brand/dark.svg" alt="Volt logo" />-->
    </a>
    <div class="d-flex align-items-center">
        <button class="navbar-toggler d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    </div>
	</nav>

        <nav id="sidebarMenu" class="sidebar d-md-block bg-dark text-white collapse" data-simplebar>
  <div class="sidebar-inner px-4 pt-3">
    <div class="user-card d-flex d-md-none align-items-center justify-content-between justify-content-md-center pb-4">
      <div class="d-flex align-items-center">
        <div class="user-avatar lg-avatar me-4">
          <img src="../assets/img/team/profile-picture-3.jpg" class="card-img-top rounded-circle border-white"
            alt="Bonnie Green">
        </div>
        <div class="d-block">
          <h2 class="h6">Hi, Jane</h2>
          <a href="../pages/examples/sign-in.html" class="btn btn-secondary text-dark btn-xs"><span
              class="me-2"><span class="fas fa-sign-out-alt"></span></span>Sign Out</a>
        </div>
      </div>
      <div class="collapse-close d-md-none">
        <a href="#sidebarMenu" class="fas fa-times" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
          aria-controls="sidebarMenu" aria-expanded="true" aria-label="Toggle navigation"></a>
      </div>
    </div>
    <ul class="nav flex-column pt-3 pt-md-0">
      <li class="nav-item">
        <a href="https://www.ohmycompany.com/" class="nav-link d-flex align-items-center">
          <span class="sidebar-icon">
            <img src="" height="20" width="20" alt="START_FUN">
          </span>
          <span class="mt-1 ms-1 sidebar-text"></span>
        </a>
      </li>
      <li class="nav-item ">
        <a href="https://www.ohmycompany.com/" class="nav-link">
          <span class="sidebar-icon"><span class="fas fa-chart-pie"></span></span>
          <span class="sidebar-text">메인페이지(차트)</span>
        </a>
      </li>
       <li class="nav-item">
        <span
          class="nav-link  collapsed  d-flex justify-content-between align-items-center"
          data-bs-toggle="collapse" data-bs-target="#submenu-app">
          <span>
            <span class="sidebar-icon"><span class="fas fa-th"></span></span>
            <span class="sidebar-text">회원관리</span>
          </span>
          <span class="link-arrow"><span class="fas fa-chevron-right"></span></span>
        </span>
        <div class="multi-level collapse "
          role="list" id="submenu-app" aria-expanded="false">
          <ul class="flex-column nav">
            <li class="nav-item ">
              <a class="nav-link" href="../admin/requestProjectList.do">
                <span class="sidebar-text">개인회원</span>
              </a>
            </li>
          </ul>
        </div>
         <div class="multi-level collapse "
          role="list" id="submenu-app" aria-expanded="false">
          <ul class="flex-column nav">
            <li class="nav-item ">
              <a class="nav-link" href="../admin/permitProjectList.do">
                <span class="sidebar-text">법인회원</span>
              </a>
            </li>
          </ul>
        </div>
      </li>
      <li class="nav-item">
        <span
          class="nav-link  collapsed  d-flex justify-content-between align-items-center"
          data-bs-toggle="collapse" data-bs-target="#submenu-app">
          <span>
            <span class="sidebar-icon"><span class="fas fa-th"></span></span>
            <span class="sidebar-text">프로젝트 관리</span>
          </span>
          <span class="link-arrow"><span class="fas fa-chevron-right"></span></span>
        </span>
        <div class="multi-level collapse "
          role="list" id="submenu-app" aria-expanded="false">
          <ul class="flex-column nav">
            <li class="nav-item ">
              <a class="nav-link" href="../admin/requestProjectList.do">
                <span class="sidebar-text">신청프로젝트</span>
              </a>
            </li>
          </ul>
        </div>
         <div class="multi-level collapse "
          role="list" id="submenu-app" aria-expanded="false">
          <ul class="flex-column nav">
            <li class="nav-item ">
              <a class="nav-link" href="../admin/permitProjectList.do">
                <span class="sidebar-text">승인프로젝트</span>
              </a>
            </li>
          </ul>
        </div>
      </li>
      <li class="nav-item">
        <a href="https://www.ohmycompany.com/" target="_blank" class="nav-link d-flex justify-content-between">
          <span>
            <span class="sidebar-icon"><span class="fas fa-th"></span></span>
            <span class="sidebar-text">공지사항 관리</span>
          </span>
        </a>
        </li>
      <li role="separator" class="dropdown-divider mt-4 mb-3 border-black"></li>
      <li class="nav-item">
        <a href="https://www.ohmycompany.com/" target="_blank"
          class="nav-link d-flex align-items-center">
          <span class="sidebar-icon"><span class="fas fa-book"></span></span>
          <span class="sidebar-text">START_FUN<br><span
              class="badge badge-md bg-secondary ms-1 text-dark">스타트펀 메인페이지</span></span>
        </a>
      </li>
    </ul>
  </div>
</nav>
