<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>업무</title>
<!-- plugins:css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets_admin/vendors/iconfonts/mdi/css/materialdesignicons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets_admin/vendors/css/vendor.addons.css">
<!-- endinject -->
<!-- vendor css for this page -->
<!-- End vendor css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets_admin/css/shared/style.css">
<!-- endinject -->
<!-- Layout style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets_admin/css/demo_1/style.css">
<!-- Layout style -->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets_admin/images/favicon.ico" />
</head>
<body class="header-fixed">
	<!-- partial:../../partials/_header.html -->
	<nav class="t-header">

		<div class="t-header-brand-wrapper">
			<a href="../../index.html">
				<img class="logo" src="<%=request.getContextPath()%>/assets_admin/images/logo.svg" alt=""> <img class="logo-mini" src="<%=request.getContextPath()%>/assets_admin/images/logo_mini.svg" alt="">
			</a>
		</div>
		<div class="t-header-content-wrapper">
			<div class="t-header-content">
				<button class="t-header-toggler t-header-mobile-toggler d-block d-lg-none">
					<i class="mdi mdi-menu"></i>
				</button>
				<form action="#" class="t-header-search-box">
					<div class="input-group">
						<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="검색하기" autocomplete="off">
						<button class="btn btn-primary" type="submit">
							<i class="mdi mdi-arrow-right-thick"></i>
						</button>
					</div>
				</form>
				<ul class="nav ml-auto">
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="notificationDropdown" data-toggle="dropdown" aria-expanded="false">
							<i class="mdi mdi-bell-outline mdi-1x"></i>
						</a>
						<div class="dropdown-menu navbar-dropdown dropdown-menu-right" aria-labelledby="notificationDropdown">
							<div class="dropdown-header">
								<h6 class="dropdown-title">Notifications</h6>
								<p class="dropdown-title-text">You have 4 unread notification</p>
							</div>
							<div class="dropdown-body">
								<div class="dropdown-list">
									<div class="icon-wrapper rounded-circle bg-inverse-primary text-primary">
										<i class="mdi mdi-alert"></i>
									</div>
									<div class="content-wrapper">
										<small class="name">Storage Full</small> <small class="content-text">Server storage almost full</small>
									</div>
								</div>
								<div class="dropdown-list">
									<div class="icon-wrapper rounded-circle bg-inverse-success text-success">
										<i class="mdi mdi-cloud-upload"></i>
									</div>
									<div class="content-wrapper">
										<small class="name">Upload Completed</small> <small class="content-text">3 Files uploded successfully</small>
									</div>
								</div>
								<div class="dropdown-list">
									<div class="icon-wrapper rounded-circle bg-inverse-warning text-warning">
										<i class="mdi mdi-security"></i>
									</div>
									<div class="content-wrapper">
										<small class="name">Authentication Required</small> <small class="content-text">Please verify your password to continue using cloud services</small>
									</div>
								</div>
							</div>
							<div class="dropdown-footer">
								<a href="#">View All</a>
							</div>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="messageDropdown" data-toggle="dropdown" aria-expanded="false">
							<i class="mdi mdi-message-outline mdi-1x"></i>
							<span class="notification-indicator notification-indicator-primary notification-indicator-ripple"></span>
						</a>
						<div class="dropdown-menu navbar-dropdown dropdown-menu-right" aria-labelledby="messageDropdown">
							<div class="dropdown-header">
								<h6 class="dropdown-title">Messages</h6>
								<p class="dropdown-title-text">You have 4 unread messages</p>
							</div>
							<div class="dropdown-body">
								<div class="dropdown-list">
									<div class="image-wrapper">
										<img class="profile-img" src="<%=request.getContextPath()%>/assets_admin/images/profile/male/image_1.png" alt="profile image">
										<div class="status-indicator rounded-indicator bg-success"></div>
									</div>
									<div class="content-wrapper">
										<small class="name">Clifford Gordon</small> <small class="content-text">Lorem ipsum dolor sit amet.</small>
									</div>
								</div>
								<div class="dropdown-list">
									<div class="image-wrapper">
										<img class="profile-img" src="<%=request.getContextPath()%>/assets_admin/images/profile/female/image_2.png" alt="profile image">
										<div class="status-indicator rounded-indicator bg-success"></div>
									</div>
									<div class="content-wrapper">
										<small class="name">Rachel Doyle</small> <small class="content-text">Lorem ipsum dolor sit amet.</small>
									</div>
								</div>
								<div class="dropdown-list">
									<div class="image-wrapper">
										<img class="profile-img" src="<%=request.getContextPath()%>/assets_admin/images/profile/male/image_3.png" alt="profile image">
										<div class="status-indicator rounded-indicator bg-warning"></div>
									</div>
									<div class="content-wrapper">
										<small class="name">Lewis Guzman</small> <small class="content-text">Lorem ipsum dolor sit amet.</small>
									</div>
								</div>
							</div>
							<div class="dropdown-footer">
								<a href="#">View All</a>
							</div>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="appsDropdown" data-toggle="dropdown" aria-expanded="false">
							<i class="mdi mdi-apps mdi-1x"></i>
						</a>
						<div class="dropdown-menu navbar-dropdown dropdown-menu-right" aria-labelledby="appsDropdown">
							<div class="dropdown-header">
								<h6 class="dropdown-title">Apps</h6>
								<p class="dropdown-title-text mt-2">Authentication required for 3 apps</p>
							</div>
							<div class="dropdown-body border-top pt-0">
								<a class="dropdown-grid">
									<i class="grid-icon mdi mdi-jira mdi-2x"></i>
									<span class="grid-tittle">Jira</span>
								</a>
								<a class="dropdown-grid">
									<i class="grid-icon mdi mdi-trello mdi-2x"></i>
									<span class="grid-tittle">Trello</span>
								</a>
								<a class="dropdown-grid">
									<i class="grid-icon mdi mdi-artstation mdi-2x"></i>
									<span class="grid-tittle">Artstation</span>
								</a>
								<a class="dropdown-grid">
									<i class="grid-icon mdi mdi-bitbucket mdi-2x"></i>
									<span class="grid-tittle">Bitbucket</span>
								</a>
							</div>
							<div class="dropdown-footer">
								<a href="#">View All</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<jsp:include page="../../common/nav_admin.jsp" />
	<!-- partial -->
	<div class="page-content-wrapper">
		<div class="page-content-wrapper-inner">
			<div class="viewport-header">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb has-arrow">
						<li class="breadcrumb-item">
							<a href="#">HOME</a>
						</li>
						<li class="breadcrumb-item">
							<a href="#">사원</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">직원업무</li>
					</ol>
				</nav>
			</div>

			<style>
.table td {
	padding: 0px;
}
</style>
			<!-- 테이블 시작 -->
			<div class="col-lg-12">
				<div class="grid">
					<p class="grid-header">나의 업무</p>
					<div class="item-wrapper">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<!--  //사번 이름 직위 입사일  //사원번호 사원구분(계약직,정규직,아르바이트) 직위(사원,부장,과장) 사원명   주소  연락처 입사일자 
		택배번호 송장번호 현재위치 품질 수령여부 /간선지번호 간선지명 지역
		/직원번호 근무지 관리자번호 아이디   -->
										<th>배송/평가 번호</th>
										<th>택배번호</th>
										<th>수령일</th>
										<th>상태</th>
										<th>처리</th>
									</tr>
								</thead>
								<tbody>
									<input type="hidden" id="e_num" value="${emp.e_num }">
									<c:forEach var="ds" items="${DSs}">
										<c:if test=""></c:if>
										<tr id="${ds.ds_num }row">
											<td>${ds.ds_num }</td>
											<td>${ds.p_num }</td>
											<td>
												${ds.ds_date}
												<%-- <fmt:formatDate value="${ds.ds_date}" pattern="yyyy-MM-dd"/> --%>
											</td>
											<td>
												<div class="grid">
													<div class="grid-body">
														<div class="item-wrapper">
															<div class="demo-wrapper">
																<div class="btn-group mb-0" data-toggle="buttons">
																	<input type="hidden" id="quality_${ds.ds_num }" value="${ds.ds_result}">
																	<c:if test="${ds.ds_result eq '상'}">
																		<label class="btn btn-outline-info active" onclick="clickRadio(${ds.ds_num},'상')"> <input type="radio" id="high_${ds.ds_num}"> 상
																		</label>
																		<label class="btn btn-outline-info" onclick="clickRadio(${ds.ds_num},'중')"> <input type="radio" id="middle_${ds.ds_num}"> 중
																		</label>
																		<label class="btn btn-outline-info" onclick="clickRadio(${ds.ds_num},'하')"> <input type="radio" id="row_${ds.ds_num}"> 하
																		</label>
																	</c:if>
																	<c:if test="${ds.ds_result eq '중'}">
																		<label class="btn btn-outline-info" onclick="clickRadio(${ds.ds_num},'상')"> <input type="radio" id="high_${ds.ds_num}"> 상
																		</label>
																		<label class="btn btn-outline-info active" onclick="clickRadio(${ds.ds_num},'중')"> <input type="radio" id="middle_${ds.ds_num}"> 중
																		</label>
																		<label class="btn btn-outline-info" onclick="clickRadio(${ds.ds_num},'하')"> <input type="radio" id="row_${ds.ds_num}"> 하
																		</label>
																	</c:if>
																	<c:if test="${ds.ds_result eq '하'}">
																		<label class="btn btn-outline-info" onclick="clickRadio(${ds.ds_num},'상')"> <input type="radio" id="high_${ds.ds_num}"> 상
																		</label>
																		<label class="btn btn-outline-info" onclick="clickRadio(${ds.ds_num},'중')"> <input type="radio" id="middle_${ds.ds_num}"> 중
																		</label>
																		<label class="btn btn-outline-info active" onclick="clickRadio(${ds.ds_num},'하')"> <input type="radio" id="row_${ds.ds_num}"> 하
																		</label>
																	</c:if>
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
											<td>
												<div class="grid">
													<div class="grid-body">
														<div class="item-wrapper">
															<div class="demo-wrapper">
																<button type="button" class="btn btn-outline-warning" onclick="workProcess(${ds.ds_num})">넘기기</button>
															</div>
														</div>
													</div>
												</div>
												<!-- 업무처리 모달창  -->
												<div class="w3-container">
													<div id="id${ds.ds_num}" class="w3-modal" style="z-index: 2001;">
														<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
															<div class="w3-center">
																<br>
																<span onclick="document.getElementById('id${ds.ds_num}').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
																<img src="<%=request.getContextPath()%>/assets/img/payLogo.jpg" style="width: 30%" class="w3-circle w3-margin-top">
															</div>
															<div class="w3-section col-lg-12">
																	<input type="hidden" name="nextEmp${ds.ds_num}" id="nextEmp${ds.ds_num}"/>
																<div class="col-lg-12" style="float: left;" id="empList${ds.ds_num }">
																</div>
																<button class="w3-button w3-block w3-green w3-section w3-padding" type="button" onclick="passParcel(${ds.ds_num},$('#nextEmp${ds.ds_num}').val(),$('#quality_${ds.ds_num}').val())">넘기기</button>
															</div>
															<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
																<button onclick="document.getElementById('id${ds.ds_num}').style.display='none'" type="button" class="w3-button w3-red">취소</button>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
									<!-- 한사람 -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="cn"/>
	</div>
	<script>
	
	function workProcess(ds_num){
		$("#empList"+ds_num).empty();
		
		$.ajax({
	         url      	:"workProcess",
	         method   	: "POST",
	         dataType: "json",     
	         data   	: {num : ds_num},
	         success  	: function(data){
	        	$('#cn').val(data.currentNode);
	        	console.log(data);
	        	if (data.emps == null) {
	        		$('#nextEmp'+ds_num).val($('#e_num').val());
	        		var receiver = '수령인명: <input type="text" id="receiver'+ds_num+'"><br>수령장소<input type="text" id="receiveLocation'+ds_num+'"><br>';
	        		$("#empList"+ds_num).append(receiver);
				} else{
		        	 var emps = '다음 간선지 직원<br>';
		        	 $.each(data.emps, function(i, emp) {
		        		 emps += '<input type="radio" name="nextEmp'+ds_num+'" onclick="nextEmp('+ds_num+','+emp.e_num+')" value="'+emp.e_num+'">'+emp.e_num;
		        	 })
		        	 $("#empList"+ds_num).append(emps);
				}
	        	 $('#id'+ds_num).css("display",'block');
	         }
		})
	}
	function nextEmp(ds_num,e_num){
		$('#nextEmp'+ds_num).val(e_num);
	}
	</script>
	<script src="<%=request.getContextPath()%>/assets_admin/js/empMember.custom.js"></script>
	</div>
	</div>
	</div>
	<script src="<%=request.getContextPath()%>/assets_admin/vendors/js/core.js"></script>
	<script src="<%=request.getContextPath()%>/assets_admin/vendors/js/vendor.addons.js"></script>
	<script src="<%=request.getContextPath()%>/assets_admin/js/template.js"></script>
</body>
</html>