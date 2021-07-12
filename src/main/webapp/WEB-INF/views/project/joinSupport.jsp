<%--
@JSP : joinSupport.jsp 
@Date : 2021.06.10
@Author : 이보희
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html lang="en">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <title>StartFun</title>
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
      
   <!-- common JS -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <!-- sweetalert -->
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- End header -->
<c:set var="detail" value="${supportDetailTop}" />
<c:set var="optionList" value="${optionList}" />

 
<main>
    <div class="container">
      <div class="row justify-content-center py-11" >
        <div class="col-lg-8">
          <div class="w-md-80 w-lg-40 mx-auto text-center mb-7">
             <p>${detail.projectCategoryVO.category_name}</p>
            <h2 class="h3 text-center">${detail.project_title}</h2>
          </div>
          
        <!-- 옵션창 -->
        <form action="/startfun/joinSupportOption.do" method="post">
          <div class="row">
            <div class="col-lg-12 mb-4 mb-lg-3 order-lg-2">   
           <div class="js-sticky-sidebar">
         <input type="hidden" class="form-check-input d-none" name="project_no" value="${param.project_no}">
              <c:forEach items="${optionList}" var="option" varStatus="status">
                       <div class="card-header border pb-0" style="height: 55px;">
                          <input type="radio" id="option${status.index}" name="reward_no" value="${option.reward_no}" > 
                       <label for="option${status.index}">&nbsp;선택</label><br><br>
                       </div>
                      <div class="card-body border" style="padding-bottom: 15px;">
                             <input type="hidden" id="option${status.index}price" value="${option.reward_price}">
                            <h4 class="h5 mb-3"><fmt:formatNumber value="${option.reward_price}" pattern="#,###"/>원 펀딩</h4>
                          <p>${option.reward_compose}</p>
                          <span style="color:gray; font-size: 0.9em;">배송예정일 : ${option.due_date} 
                          (배송비 <fmt:formatNumber value="${option.reward_charge}" pattern="#,###"/>원)</span><br>
                          <input type="hidden" id="option${status.index}charge" value="${option.reward_charge}">
                          <span style="font-weight: bold; color:#107ef4; font-size: 1.5em;">${option.sponsor_count}</span>명 참여하였습니다.
                     </div><br>
               </c:forEach>
               </div>
               <!-- 추가참여금 -->
                <div class="js-sticky-sidebar">
                 <div class="card-header border pb-0"  style="height: 55px;">
                      <input type="checkbox" id="addOption" name="addOption" disabled>
                 <label class="radio radio-xxs form-check-label ml-1" for="addOption">선택</label><br><br>
                 </div>
                  <div class="card-body border" style="height: 100px;">
                       <div style="width: 50%; float: left;">
                      추가참여금
                     </div> 
                     <div style="width: 50%; float: left; text-align: right;">
                      <input type="text" style="text-align: right" size=10 id="support_add_amount" name="support_add_amount" value=""
                            disabled oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">원
                     </div>
                     <div style="width: 50%; float: left;">
                       <small class="d-block text-muted">참여금을 추가로 후원할 수 있습니다.</small>
                     </div>
                     <div style="width: 50%; float: left; text-align: right;">
                       <small class="d-block text-muted">1,000원 이상부터 가능</small>
                     </div>
                 </div> 
              </div>
              <!-- 총금액 -->
                 <div class="js-sticky-sidebar">
                   <div id='result' style="text-align: center; display: none; margin-top: 20px">
                     <p>총 참여금액 <span id="total2" style="font-weight:bold"></span>원 입니다.</p>
                     <button type="submit" id="nextBtn" class="btn btn-primary" style="display: none;">다음단계</button>
                 </div><br>
                 </div>
           </div> 
        </div>
        </form>
        </div>
        </div>
      </div>
  </main>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- End footer -->   
</body>
<script type="text/javascript">

var amount = 0; //리워드금액
var addamount = 0; //추가참여금
var charge = 0; //배송비
var total = 0; //총금액

$(function(){
   //파라미터 값 사용을 위한 함수
   function getParameter(name) {
       name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
       var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
           results = regex.exec(location.search);
       return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
   }
   
   //파라미터로 넘어온 옵션 체크
   var option = getParameter("selected"); 
   $('#'+option).prop('checked', true);
   
   //총 금액계산
   total = 0;
   
   var optionprice = $('#'+option).attr('id') + 'price'; //리워드금액
   amount = $('#'+optionprice).val();
   total += parseInt(amount);
   
   var optioncharge = $('#'+option).attr('id') + 'charge'; //배송비
   charge = $('#'+optioncharge).val();
   total += parseInt(charge);
   
   console.log(option);
   
   //총금액 및 참여버튼 보이기
   if(option.length != ""){
   document.getElementById("nextBtn").style.display = ""; 
   document.getElementById("result").style.display = ""; 
   document.getElementById('total2').innerHTML = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   }
   //추가참여금버튼 활성화
   $("#addOption").removeAttr( "disabled" );
   
   //추가참여금
   $("#addOption").change(function(){
      addoption();
   });
});   
   
   
//옵션 선택시
$("input:radio[name=reward_no]").click(function(){
   total = 0;
   
   var optionprice = (this.id) + 'price'; //리워드금액
   amount = $('#'+optionprice).val();
   total += parseInt(amount);
   
   var optioncharge = (this.id) + 'charge'; //배송비
   charge = $('#'+optioncharge).val();
   total += parseInt(charge);
   
   //총금액 및 참여버튼 보이기
   document.getElementById("nextBtn").style.display = ""; 
   document.getElementById("result").style.display = ""; 
   document.getElementById('total2').innerHTML = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   
   //추가참여금버튼 활성화
   $("#addOption").removeAttr( "disabled" );
   
   //추가참여금
   $("#addOption").change(function(){
      addoption();
   });
});   
   
   
//추가참여금
function addoption() {
   if($("#addOption").is(":checked")){ //선택시
       
       $("input:text[name=support_add_amount]").attr("disabled",false);
       
        addamount = parseInt($('#support_add_amount').val() || 0 );
         total = parseInt(amount) +  parseInt(charge) + addamount;
         document.getElementById('total2').innerHTML = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
       
       //추가참여금 입력
       $('#support_add_amount').keyup(function(){
            addamount = parseInt($('#support_add_amount').val() || 0 );
            total = parseInt(amount) +  parseInt(charge) + addamount;
            document.getElementById('total2').innerHTML = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");        
        });
       
    }else{ //체크해제시
       
       $("input:text[name=support_add_amount]").attr("disabled",true);
       
       addamount = 0;
        total = parseInt(amount) +  parseInt(charge) + addamount;
        document.getElementById('total2').innerHTML = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");   
    }
}


//추가참여금 1,000원이상
$('#nextBtn').click(function(){
   if($("#addOption").is(":checked")){
      if($('#support_add_amount').val() < 1000) {
         swal({
              text: "추가 참여금액은 1,000원이상부터 가능합니다.",
              icon: "warning"
          });
         $('#support_add_amount').focus();
         return false;
      }   
   }
});   

</script>
</html>