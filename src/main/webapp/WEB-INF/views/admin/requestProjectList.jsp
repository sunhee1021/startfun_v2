<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>스타트펀 : 관리자 : 신청</title>
	
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
	<!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<!-- SweetAlert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<style type="text/css">

.reportProject-margin {
	width: 100%;
	height: 10px;
}
 
.btn  {
    border-radius: 0.5rem;
    border-top-right-radius : 0.5rem;
	border-bottom-right-radius : 0.5rem;
}

.form-select {
    border-radius: 0.5rem;
}
.ms-3{
    margin-left: 0.5rem !important;
}

.mb-3{
	margin-bottom: 0rem !important;
}

#buttonline	{
	text-align : right;
	margin-bottom : 10px;
}

.page-item:last-child .page-link{
	border-top-right-radius : 0.5rem;
	border-bottom-right-radius : 0.5rem;
}

.page-item:first-child .page-link{
	border-top-left-radius : 0.5rem;
	border-bottom-left-radius : 0.5rem;
}

.input-group:not(.has-validation) > :not(:last-child):not(.dropdown-toggle):not(.dropdown-menu), .input-group:not(.has-validation) > .dropdown-toggle:nth-last-child(n + 3) {
    border-top-right-radius: 0rem;
    border-bottom-right-radius: 0rem;
 }
 
.input-group:not(.has-validation) > :not(:last-child):not(.dropdown-toggle):not(.dropdown-menu), .input-group:not(.has-validation) > .dropdown-toggle:nth-last-child(n + 3) {
    border-top-right-radius: 0.5rem;
    border-bottom-right-radius: 0.5rem;
}

</style>

</head>
<body>
	<c:import url="/WEB-INF/views/common/header_admin.jsp" />
	
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
     <div class="py-4">
           <nav aria-label="breadcrumb">
               <ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
                   <li class="breadcrumb-item"><a href="#"><span class="fas fa-home"></span></a></li>
                   <li class="breadcrumb-item"><a href="requestProjectList.do">신청프로젝트</a></li>
               </ol>
           </nav>
           <div class="d-flex justify-content-between w-100 flex-wrap">
               <div class="mb-3 mb-lg-0">
                   <h1 class="h4">신청프로젝트</h1>
                   <p class="mb-0"></p>
               </div>
               <div>
					<div class="row align-items-center justify-content-between">
					<div class="input-group" align="center">
            <select id="category" name="category" class="form-select mb-0">
             <option value ="project_title" selected>프로젝트명</option>
             <option value ="project_email">개설자(이메일)</option>
         	</select>
            <input type="text" class="form-control" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" placeholder="Search" aria-label="Search" aria-describedby="basic-addon2">
            <!-- onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit}"  -->
        	<!-- <a class="input-group-text" id ="search_click" name="search_click"><span class="fas fa-search"></span></a> -->
        	<input type ="button" id ="search_click" name="search_click" value="검색" class="btn btn-dark">
        	
        		 </div>
    			</div>                    
    		</div>
          </div>
      </div>
      
	<div class="card card-body shadow-sm table-wrapper table-responsive">
				<c:choose>
				<c:when test="${not empty requestList}">
                <table class="table table-hover">        
				<thead class="thead-light">
				    			
				<tr>
					<td class="border-0" colspan="7" style="text-align: right;">
					 <div class="d-flex justify-content-between w-100 flex-wrap">
              		 <div class="mb-3 mb-lg-0">
              		 </div>
					<div class="row align-items-center justify-content-between">
					<div class="d-flex mb-3">
							<select id="projectStatus" name="projectStatus" class="form-select fmxw-200">
								<option value="심사중" selected>심사중</option>
								<option value="승인">승인</option>
								<option value="거절">거절</option>
							</select>
					<!-- 	<input type ="button" id ="submit" name="submit" value="변경" class="btn btn-dark"> -->
					<button class="btn btn-sm px-3 btn-primary ms-3" id="submit">변경</button>
					</div>
					</div>
					</div>
					</td>
				</tr>
				
				<tr align="center">
					<th width="8%">프로젝트번호</th>
					<th width="8%">분류</th>
					<th width="34%">프로젝트명</th>
					<th width="20%">개설자</th>
					<th width="15%">등록일</th>
					<th width="10%">결과</th>
					<th><input type="checkbox" class="form-check-input" name="selectall" value="selectall" onclick="selectAll(this)"  />
					<input type="hidden" name="project_no" value="${r.project_no}" />
					<input type="hidden" name="project_status" value="${r.project_status}" /></th>
					
				</tr>
				</thead>
				<!-- forEach()  목록 출력하기  -->
				<tbody id="tbody">
				<c:forEach var="r" items="${requestList}">
					<tr onmouseover="this.style.backgroundColor='#e6f1ff'" onmouseout="this.style.backgroundColor='white'">
						
						<td align="center"><span class="h6">${r.project_no}</span></td>
						<td align="center">${r.category_name}</td>
										   
										   
						<c:if test="${r.project_type eq '후원'}">
							<c:choose>
							<c:when test="${r.project_title != null && fn:length(r.project_title) > 26}">
							<td align="left"><a href="/startfun/supportDetail.do?project_no=${r.project_no}" target='_blank'>
							<span class="text-info me-3">${fn:substring(r.project_title,0,26)}...</span></a></td>
							</c:when>
							<c:otherwise>
							<td align="left"><a href="/startfun/supportDetail.do?project_no=${r.project_no}" target='_blank'>
							<span class="text-info me-3">${r.project_title}</span></a></td>
							</c:otherwise>
							</c:choose>
						</c:if>
						
						<c:if test="${r.project_type eq '투자'}">
							<c:choose>
							<c:when test="${r.project_title != null && fn:length(r.project_title) > 26}">
							<td align="left"><a href="/startfun/investDetail.do?project_no=${r.project_no}" target='_blank'>
							<span class="text-info me-3">${fn:substring(r.project_title,0,26)}...</span></a></td>
							</c:when>
							<c:otherwise>
							<td align="left"><a href="/startfun/investDetail.do?project_no=${r.project_no}" target='_blank'>
							<span class="text-info me-3">${r.project_title}</span></a></td>
							</c:otherwise>
							</c:choose>
						</c:if>
						
						<c:choose>
							<c:when test="${r.project_email != null && fn:length(r.project_email) > 21}">
								<td align="center">${fn:substring(r.project_email,0,21)}...</td>
							</c:when>
							<c:otherwise>
								<td align="center">${r.project_email}</td>
							</c:otherwise>
						</c:choose>
						
						<td align="center">${r.project_regdate}</td>
						<td align="center"><span class="text-danger">${r.project_status}</span></td>
						<td align="center"><input type="checkbox" name="projectNo" class="form-check-input" value="${r.project_no}" onclick="checkSelectAll()" /></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</c:when>
			<c:when test="${empty requestList}">
				<h5 align="center">검색 결과가 없습니다</h5>
			</c:when>
			</c:choose>
			<!-- forEach() 종료 -->
			
			<!-- 페이징처리 -->
			<div class="card-footer px-3 border-0 d-flex flex-column align-items-center justify-content-between">
				<nav aria-label="Page navigation example">
				<ul class="pagination mb-0" id="pagination">
				
				<li class="page-item <c:if test="${not pageMaker.prev}">disabled</c:if>">
    			 <a class="page-link" href="${pageMaker.startPage-1}" aria-label="Previous">Pre</a>
					</li>
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
    			<li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}" >
    				<a class="page-link" href="${num}">${num}</a>
    			</li>
    			</c:forEach>
					<li class="page-item <c:if test="${not pageMaker.next}">disabled</c:if>">
					<a class="page-link" href="${pageMaker.endPage +1}" aria-label="Next">Next</a>
					</li>
				</ul>	
				</nav>
			</div>
			<form id="searchForm" action="./requestProjectList.do" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
			<input type="hidden" name="category" value="${pageMaker.cri.category}" />
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}" />
			</form>
			
		</div>
		</main>
	
<script type="text/javascript">

/* 체크박스 */
$(function (){
	$(document).on('click', '#submit', function(){
		
		if($("input:checkbox[name=projectNo]:checked").length == 0){
			swal({
				icon:'warning',
                text: "프로젝트를 선택해주세요."
             }); 

			return false;
			
		}else{
			changeStatus();
		}
	});
	
});

function fn_statusUpdate(){
	
	let projectNo = [];
    let projectStatus =  $("#projectStatus").val();

	
    $('input[name="projectNo"]:checked').each(function(){
    	projectNo.push($(this).val());
    });
    
    let pageNum = $("input[name='pageNum']").val();
    let amount =  $("input[name='amount']").val();
    
    /*
    let cate = $(".input-group select").val();
    let key = $(".input-group input[name='keyword']").val();

	let category = $("input[name='category']").val(cate);
	let keyword = ("input[name='keyword']").val(key);
    */
    console.log(projectNo);
    console.log(projectStatus);
    
   	var params = {
            "projectNo" : projectNo,        
            "projectStatus" : projectStatus,
            "pageNum" : pageNum,
            "amount" : amount
    }
    
    //ajax 호출
    $.ajax({
        url         : "../updateStatus.do",
        async       : false,
        type        : "GET",
        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        dataType    : "json",
        
        data        :  params,
        success     :  function(data){
			
 	       	console.log("성공?");
 	       	
 	       	
 	       	console.log(data);
 	       	console.log(data.project_no);
 	       	console.log(data.project_category);
 	       	console.log(data.project_title);
 	       	
 	       	
 	        $('#tbody').empty();
			
				$.each(data,function(key,value){
				
				console.log(typeof 'data');
				console.log(data);
				
				var start=$('#tbody');
				
       			start +="<tr>"
      			start +='<td align="center">'+value.project_no+'</td>'
      			
      			start +='<td align="center">'+value.category_name+'</td>'
      			
      			if(value.project_type == "후원"){
      				start +='<td align="left">'+'<a href="/startfun/supportDetail.do?project_no='+value.project_no+'" target="_blank">'+'<span class="text-info me-3">'+value.project_title+'</span>'+'</a>'+'</td>'
      			}else if(value.project_type == "투자"){
      				start +='<td align="left">'+'<a href="/startfun/investDetail.do?project_no='+value.project_no+'" target="_blank">'+'<span class="text-info me-3">'+value.project_title+'</span>'+'</a>'+'</td>'
      			}
      			
      			start +='<td align="center">'+value.project_email+'</td>'
      			start +='<td align="center">'+value.project_regdate+'</td>'
      			start +='<td align="center">'+'<span class="text-danger">'+value.project_status+'</span>'+'</td>'
      			start +='<td align="center">'+'<input type="checkbox" name="projectNo" class="form-check-input" value="'+value.project_no+'" onclick="checkSelectAll()" />'+'</td>'
      			
      			start +="</tr>"
       		
       		$('#tbody').append(start);
			
			}
		  );
				
				reload();
		},
         error : function(request, status, error){
            console.log("AJAX_ERROR");
        }  
        
    });
   	
}

function checkSelectAll() {
	const checkboxes = document.querySelectorAll('input[name="projectNo"]');
	const checked = document.querySelectorAll('input[name="projectNo"]:checked');
	const selectAll = document.querySelector('input[name="selectall"]');
	
	if(checkboxes.length === checked.length) {
		selectAll.checked = true;
	}else {
		selectAll.checked = false;
	}
}

function selectAll(selectAll) {
	const checkboxes = document.getElementsByName('projectNo');
	
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
}

function reload(){
	$("input:checkbox[name='selectall']").prop("checked", false); 
    $("input:checkbox[name='projectNo']").prop("checked", false);
    $("#projectStatus").prop('selectedIndex',0);

}


$(function(){

	$('#search_click').on("click",function(){

		let keyword = $('#keyword').val();
	
		if(keyword == ""){
			swal({
				icon:'warning',
                text: "검색어를 입력해주세요."
           }); 

			return;
		}
		searchPage();
		
	});
		
	});

function changeStatus(){
	  swal({
          text: "상태를 변경하시겠습니까?",
          icon: "warning",
          buttons: true,
          dangerMode: true,
        })
        .then((willDelete) => {
          if (willDelete) {

			 fn_statusUpdate();
			 
		}else{
			 return false;
		} 
});
}

$(function(){

	let actionForm = $("#searchForm");
	
	$(".page-item a").on("click",function(e){
	e.preventDefault();
	
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();

	});
});

function searchPage(){

	let actionForm = $("#searchForm");
	
	let category = $(".input-group select").val();
    let keyword = $(".input-group input[name='keyword']").val();

	actionForm.find("input[name='category']").val(category);
	actionForm.find("input[name='keyword']").val(keyword);
	actionForm.find("input[name='pageNum']").val('1');
	actionForm.find("input[name='amount']").val();
	actionForm.submit();
}

</script>
</body>
</html>