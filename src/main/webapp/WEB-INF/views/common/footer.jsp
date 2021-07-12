<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!-- Footer -->
<footer class="bg-dark font-weight-light text-white-55 pt-5 pb-5 overflow-hidden">
    <div class="container">
      <div class="row justify-content-md-between">
        <div class="col-md-12 col-lg-7 mr-lg-auto">
          <img class="mb-3" src="${pageContext.request.contextPath}/resources/img/logo_f.png" alt="STARTFUN" style="width: 200px;">
          <p class="small font-weight-light mb-3">스타트펀은 플랫폼 제공자로서 프로젝트의 당사자가 아니며, 직접적인 통신판매를 진행하지 않습니다.<br> 프로젝트의 완수 및 선물제공의 책임은 해당 프로젝트의 창작자에게 있으며, 프로젝트와 관련하여 후원자와 발생하는 법적 분쟁에 대한 책임은 해당 창작자가 부담합니다.</p>
          <br>
          <p class="small font-weight-light mb-3">대표자 | 박선희 이광희 이보희 임나영 정수빈 조하선</p>
        </div>


        <div class="col-sm-4 col-lg-2 mb-4">
          <h4 class="h6 text-white mb-3">COMPANY</h4>

          <!-- Links -->
          <ul class="list-unstyled">
            <li class="mb-3"><a class="link-white-55" href="/startfun/startfun.do">ABOUT US</a></li>
            <li class="mb-3"><a class="link-white-55" href="/startfun/notice/notice.do">NOTICE</a></li>
            <li class="mb-3"><a class="link-white-55" href="/startfun/projectGuide.do">GUIDE</a></li>
            <li class="mb-3"><a class="link-white-55" href="https://github.com/weis62021">GITHUB</a></li>
          </ul>
          <!-- End Links -->
        </div>

        <div class="col-sm-4 col-lg-2 mb-4">
          <h4 class="h6 text-white mb-3">CONTACTS</h4>

          <!-- Links -->
          <ul class="list-unstyled">
            <li class="mb-3"><a class="link-white-55" href="#">weis62021@gmail.com</a></li>
          </ul>
          <!-- End Links -->
        </div>
      </div>

      <hr class="my-1 opacity-10">

      <div class="row" style="margin-top: 17px;">
        <div class="col-md-7">
          <p class="small font-weight-light mb-md-0">&copy; 2021 <a class="text-white" href="https://github.com/weis62021">WEIS</a>. </p>
        </div>

        <div class="col-md-5 text-md-right">
          <img src="${pageContext.request.contextPath}/resources/img/weis.png" alt="WEIS" style="width: 25px; height: 17px; margin-right: 10px">
        </div>
      </div>
    </div>
</footer>
<!-- End Footer -->
<!-- Go to Top -->
<a class="js-go-to duik-go-to" href="javascript:;"> <span
	class="fa fa-arrow-up duik-go-to__inner"></span>
</a>
<!-- End Go to Top -->

<!-- JS Global Compulsory -->
<%-- <script src="${pageContext.request.contextPath}/resources/vendor/jquery/dist/jquery.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/popper.js/dist/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	
<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header-fixing.js"></script>