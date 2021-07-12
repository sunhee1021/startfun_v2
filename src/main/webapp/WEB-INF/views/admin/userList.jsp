<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

<nav class="navbar navbar-dark navbar-theme-primary px-4 col-12 d-md-none">
    <a href="adminMain.do">
    </a>
    <div class="d-flex align-items-center">
        <button class="navbar-toggler d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>
<c:import url="/WEB-INF/views/common/header_admin.jsp" />

 <main class="content">
                    <div class="py-4">
           <nav aria-label="breadcrumb">
               <ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
                   <li class="breadcrumb-item"><a href="#"><span class="fas fa-home"></span></a></li>
                   <li class="breadcrumb-item"><a href="user.do">개인회원 리스트</a></li>
               </ol>
           </nav>
           <div class="d-flex justify-content-between w-100 flex-wrap">
               <div class="mb-3 mb-lg-0">
                   <h1 class="h4">개인회원</h1>
                   <p class="mb-0"></p>
               </div>
               <div>
					<div class="row align-items-center justify-content-between">
					<div class="input-group" align="center">
            <select id="selectBox"class="form-select mb-0">
             <option value ="email">이메일</option>
             <option value ="name">이름</option>
         	</select>
            <input type="search" class="form-control" name="member_search" id="member_search"  placeholder="Search" aria-label="Search" aria-describedby="basic-addon2">
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
									<th>이름</th>
									<th>연락처</th>
									<th>가입일</th>
									<th>상태</th>
								</tr>
							</thead>

							<!-- Item -->
							<tbody id="tbody">
								<c:forEach items="${list}" var="list">
									<tr>
										<td><span class="fw-normal"><a
												href="userEdit.do?member_email=${list.member_email}">${list.member_email}</a></span></td>
										<td><span class="fw-normal"><a
												href="userEdit.do?member_email=${list.member_email}">${list.member_name}</a></span></td>
										<td><span class="fw-normal">${list.member_phone}</span></td>
										<td><span class="fw-normal">${list.member_regdate}</span></td>
										<td><span class="fw-normal">${list.member_status}</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<div id ="page">
						<form id="actionForm" action="user.do" method="get">
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
		var search = $('#member_search').val();
		console.log(search);
		if(keyword == "email"){
			$.ajax({
				url:"/admin/searchUser.do",
				type:"POST",
				datatype:'json',
				data :{"member_email":search},
				success : function(data){
					console.log("data="+data);
					$('#tbody').empty();
					$('#page').empty();
					if(search !=""){
						$.each(data,function(key, value){
							
							var start=$('#tbody');
	                		start +="<tr>"
	                		start +='<td>'+'<a href="userEdit.do?member_email='+value.member_email+'">'+value.member_email+'</a>'+'</td>'
	                		start +='<td>'+value.member_name+'</td>'
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
				url:"/admin/searchUserName.do",
				type:"POST",
				datatype:"json",
				data :{"member_name":search},
				success:function(data){
					$('#tbody').empty();
					if(search!=""){
						$.each(data,function(key, value){
							var start=$('#tbody');
							start +='<tr>'
		                	start +='<td>'+'<a href="userEdit.do?member_email='+value.member_email+'">'+value.member_email+'</a>'+'</td>'
	                		start +='<td>'+value.member_name+'</td>'
	                		start +='<td>'+value.member_phone+'</td>'
	                		start +='<td>'+value.member_regdate+'</td>'
	                		start +='<td>'+value.member_status+'</td>'
	                		start +='</tr>'
	                		$('#tbody').append(start);
						});
					}
				}
			});
		}
	})
});
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