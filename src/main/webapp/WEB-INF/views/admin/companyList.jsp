<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>스타트펀 : 관리자</title>
	
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
</head>
<body>
<c:set var="pagesize" value="${requestScope.pagesize}" />
<c:set var="cpage" value="${requestScope.cpage}" />
<c:set var="permitList" value="${requestScope.permitList}" />
<c:set var="reportCount" value="${requestScope.reportCount}" />

<c:import url="/WEB-INF/views/common/header_admin.jsp" />
<main class="content">
                    
       <div class="py-4">
           <nav aria-label="breadcrumb">
               <ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
                   <li class="breadcrumb-item"><a href="#"><span class="fas fa-home"></span></a></li>
                   <li class="breadcrumb-item"><a href="companyUser.do">법인회원 리스트</a></li>
               </ol>
           </nav>
           <div class="d-flex justify-content-between w-100 flex-wrap">
               <div class="mb-3 mb-lg-0">
                   <h1 class="h4">법인회원</h1>
                   <p class="mb-0"></p>
               </div>
               <div>
					<div class="row align-items-center justify-content-between">
					<div class="input-group" align="center">
            <select id="selectBox" class="form-select mb-0">
             <option value ="email" selected>이메일</option>
             <option value ="name">이름</option>
         	</select>
            <input type="search" class="form-control" name="company_search" id="company_search" placeholder="Search" aria-label="Search" aria-describedby="basic-addon2">
        	<input type ="button" id ="search_click" name="search_click" value="검색" class="btn btn-dark">
        	</div>
    				</div>   
    			</div>
          </div>
      </div>

<div class="card card-body shadow-sm table-wrapper table-responsive">

                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="thead-light">
                                <tr>
                                   <th>이메일</th>
									<th>대표자명</th>
									<th>기업명</th>
									<th>연락처</th>
									<th>가입일</th>
									<th>상태</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
                                <!-- Item -->
                               <c:forEach items="${list}" var="list">
			<tr>
				<td><span class="fw-normal"><a href="/admin/companyEdit.do?member_email=${list.member_email}">${list.member_email}</a></span></td>				
				<td><span class="fw-normal"><a href="/admin/companyEdit.do?member_email=${list.member_email}">${list.member_name}</a></span></td>
				<td><span class="fw-normal">${list.member_company}</span></td>
				<td><span class="fw-normal">${list.member_phone}</span></td>
				<td><span class="fw-normal">${list.member_regdate}</span></td>
				<td><span class="fw-normal">${list.member_status}</span></td>
			</tr>
		</c:forEach>
                            </tbody>
                           
                        </table>
                        <div id ="page">
                        <form id="actionForm" action="/admin/companyUser.do" method="get">
							<input type="hidden" name = "pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name = "amount" value="${pageMaker.cri.amount}">
						</form>
						<nav aria-label="Page navigation example">
			    	<ul class="pagination justify-content-center mb-10 mt-5">
			    		<li class="page-item <c:if test="${not pageMaker.prev}">disabled</c:if>">
			    			 <a class="page-link" href="${pageMaker.startPage-1 }" aria-label="Previous">
			        			<svg class="duik-icon-svg-1x" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg>
			      			</a>
			    		</li>
			    		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			    			<li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}" >
			    				<a class="page-link" href="${num }">${num }</a>
			    			</li>	
			    		</c:forEach>
						<li class="page-item <c:if test="${not pageMaker.next}">disabled</c:if>">
							<a class="page-link" href="${pageMaker.endPage +1 }" aria-label="Next">
						       <svg class="duik-icon-svg-1x" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
						    </a>
						</li>
			    	</ul>
   					 </nav>
   					 </div>
                    </div>
                </div>
            </div>
            
</main>
<script type="text/javascript">
$(function(){
	var keyword = $('#selectBox option:selected').val();
	$('#selectBox').change(function(){
		keyword =$('#selectBox option:selected').val();
	});
	$('#search_click').on("click",function(){
		var search = $('#company_search').val();
		console.log(search);
		if(keyword == "email"){
			$.ajax({
				url:"/admin/searchCompany.do",
				type:"POST",
				datatype:'json',
				data :{"company_email":search},
				success : function(data){
					console.log("data="+data);
					$('#tbody').empty();
					$('#page').empty();
					if(search !=""){
						$.each(data,function(key, value){
							
							var start=$('#tbody');
	                		start +="<tr>"
	                		start +='<td>'+'<a href="/admin/companyEdit.do?member_email='+value.member_email+'">'+value.member_email+'</td>'
	                		start +='<td>'+value.member_name+'</td>'
	                		start +='<td>'+value.member_company+'</td>'
	                		start +='<td>'+value.member_phone+'</td>'
	                		start +='<td>'+value.member_regdate+'</td>'
	                		start +='<td>'+value.member_status+'</td>'
	                		start +="</tr>"
	                		
	                		$('#tbody').append(start);
						});
					}else{
							$.each(data,function(key, value){
							
							var start=$('#tbody');
	                		start +="<tr>"
	                		start +='<td>'+'<a href="/admin/companyEdit.do?member_email='+value.member_email+'">'+value.member_email+'</a>'+'</td>'
	                		start +='<td>'+value.member_name+'</td>'
	                		start +='<td>'+value.member_company+'</td>'
	                		start +='<td>'+value.member_phone+'</td>'
	                		start +='<td>'+value.member_regdate+'</td>'
	                		start +='<td>'+value.member_status+'</td>'
	                		start +="</tr>"
	                		
	                		$('#tbody').append(start);
						});
					}
				}
			});
		
		}else{
			$.ajax({
				url:"/admin/searchCompanyName.do",
				type:"POST",
				datatype:"json",
				data :{"company_name":search},
				success:function(data){
					$('#tbody').empty();
					if(search!=""){
						$.each(data,function(key, value){
							var start=$('#tbody');
							start +='<tr>'
	                		start +='<td>'+'<a href="/admin/companyEdit.do?member_email='+value.member_email+'">'+value.member_email+'</a>'+'</td>'
	                		start +='<td>'+value.member_name+'</td>'
	                		start +='<td>'+value.member_company+'</td>'
	                		start +='<td>'+value.member_phone+'</td>'
	                		start +='<td>'+value.member_regdate+'</td>'
	                		start +='<td>'+value.member_status+'</td>'
	                		
	                		start +='</tr>'
	                		$('#tbody').append(start);
						});
					}else{
							$.each(data,function(key, value){
							
							var start=$('#tbody');
	                		start +="<tr>"
	                		start +='<td>'+'<a href="/admin/companyEdit.do?member_email='+value.member_email+'">'+value.member_email+'</td>'
	                		start +='<td>'+value.member_name+'</td>'
	                		start +='<td>'+value.member_company+'</td>'
	                		start +='<td>'+value.member_phone+'</td>'
	                		start +='<td>'+value.member_regdate+'</td>'
	                		start +='<td>'+value.member_status+'</td>'
	                		start +="</tr>"
	                		
	                		$('#tbody').append(start);
						});
					}
				}
			});
		}
	})
})

var actionForm = $('#actionForm');
$(".page-item a").on('click', function(e){
	e.preventDefault();
	console.log('click')
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
});
</script>
</body>
</html>