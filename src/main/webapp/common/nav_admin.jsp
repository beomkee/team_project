<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
	$(document).ready(function() {
		$.ajax({
			url		:"${pageContext.request.contextPath}/topMenu",
			method	: "POST",
			data	: {},
			success	: function(data){
				var menu = '';
				$.each(data, function(i, item){
					if(item.tm_div == 9 && item.tm_depth == 2) {
						menu += '<li>'+
							'<a href="/teamProject/'+item.tm_url+'">'+
							'<span class="link-title">'+item.tm_text+'</span>'+
							'<i class="mdi mdi-gauge link-icon"></i></a></li>'
					}	
				});
				$("#adminMenu").append(menu);
			}
		})
	});
</script>

<!-- partial -->
<div class="page-body">
	<!-- partial:partials/_sidebar.html -->
	<div class="sidebar">
		<div class="user-profile">
			<div class="display-avatar animated-avatar">
				<img class="profile-img img-lg rounded-circle" src="<%=request.getContextPath()%>/assets_admin/images/zzang.PNG" alt="profile image">
			</div>
			<div class="info-wrapper"><br>
                    <h6 class="display-income"><c:if test="${!empty emp }"><b> ${emp.rankaverage}등급</b></c:if></h6>
					<span class="user-name"><br>소중한 식스택배 
					<c:if test="${empty emp }"></c:if>
					<c:if test="${!empty emp }">
                    ${emp.e_id}
                    </c:if>사원님<br>
                   	 반갑습니다</span>
				</div>
		</div>
		<ul class="navigation-menu" id="adminMenu">
		</ul>
	</div>
