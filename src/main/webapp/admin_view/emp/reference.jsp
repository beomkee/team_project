<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>칭찬게시판</title>
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
			<a href="<%= request.getContextPath()%>/main">
				<img class="logo" src="<%=request.getContextPath()%>/assets_admin/images/mainLogo.png" alt=""> <img class="logo-mini" src="<%=request.getContextPath()%>/assets_admin/images/logo_mini.svg" alt="">
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
	<!-- partial -->
	<div class="page-body">
		<!-- partial:../../partials/_sidebar.html -->
		<jsp:include page="../../common/nav_admin.jsp" />
		<!-- partial -->
		<div class="page-content-wrapper">
			<div class="page-content-wrapper-inner">
				<div class="viewport-header">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb has-arrow">
							<li class="breadcrumb-item">
								<a href="#">사원</a>
							</li>
							<li class="breadcrumb-item active" aria-current="page">평가조회</li>
						</ol>
					</nav>
				</div>



				<!-- 테이블 시작 -->

				<div class="col-lg-12">
					<div class="grid">
						<p class="grid-header">사원정보</p>

						<div class="grid">
							<div class="grid-body">
								<div class="item-wrapper">
									<br>
                                    <p style="text-align: center;"><c:if test="${!empty EMP }"><b> ${EMP.e_id}</b> </c:if>
									사원님의 평가도를 한 눈에 파악할 수 있도록 표준모형에 의한 평점통계 정보를 제공해 드립니다.</p>
									<br>
								</div>
							</div>
						</div>


						<div class="item-wrapper">
							<div class="table-responsive">
								<table class="table table-hover">
									<tbody>

										<div class="grid">
											<div class="grid-body">
												<div class="item-wrapper">
													<div class="row mb-3">
														<div class="col-md-8 mx-auto">
															<div class="form-group row showcase_row_area">
																<div class="col-md-3 showcase_text_area">
																	<label for="inputType1">사원번호</label>
																</div>
																<div class="col-md-9 showcase_content_area">
                                                                    <c:if test="${!empty EMP }"> ${EMP.e_num}</c:if>
																</div>
															</div>
															<div class="form-group row showcase_row_area">
																<div class="col-md-3 showcase_text_area">
																	<label for="inputType1">근무지</label>
																</div>
																<div class="col-md-9 showcase_content_area">
                                                                    <c:if test="${!empty EMP }"> ${EMP.e_add}</c:if>
																</div>
															</div>

															

															<div class="form-group row showcase_row_area">
																<div class="col-md-3 showcase_text_area">
																	<label for="inputType1">아이디</label>
																</div>
																<div class="col-md-9 showcase_content_area">
                                                                    <c:if test="${!empty EMP }"> ${EMP.e_id}</c:if>
																</div>
															</div>
															<div class="form-group row showcase_row_area">
																<div class="col-md-3 showcase_text_area">
																	<label for="inputType13">비밀번호</label>
																</div>
																<div class="col-md-9 showcase_content_area">
                                                                    <c:if test="${!empty EMP }"> ${EMP.e_passwd}</c:if>
																</div>
															</div>

															

															<div class="form-group row showcase_row_area">
																<div class="col-md-3 showcase_text_area">
																	<label for="inputType1">직급</label>
																</div>
																<div class="col-md-9 showcase_content_area">
																<c:if test="${!empty EMP }"> ${EMP.position}</c:if>
																</div>
															</div>

															<div class="form-group row showcase_row_area">
																<div class="col-md-3 showcase_text_area">
																	<label for="inputType1">전화번호</label>
																</div>
																<div class="col-md-9 showcase_content_area">
                                                                    <c:if test="${!empty EMP }"> ${EMP.e_tel}</c:if>
																</div>
															</div>

															<div class="form-group row showcase_row_area">
																<div class="col-md-3 showcase_text_area">
																	<label for="inputType1">생년월일</label>
																</div>
																<div class="col-md-9 showcase_content_area">
                                                                    <c:if test="${!empty EMP }"> ${EMP.e_birth}</c:if>
																</div>
															</div>

															<div class="form-group row showcase_row_area">
																<div class="col-md-3 showcase_text_area">
																	<label for="inputType1">평가평균</label>
																</div>
																<div class="col-md-9 showcase_content_area">
                                                                    <c:if test="${!empty EMP }"> ${EMP.rankaverage}</c:if>
																</div>
															</div>
														</div>
														<div class="col-lg-4 col-md-6 equel-grid">
															<div class="grid">
																<div class="grid-body">
                                                                    <p class="card-title">등급</p>
																	<div id="radial-chart"></div>
																	<h3 class="text-center"><b>${EMP.rankaverage}등급</b></h3>
																	<p class="text-center text-muted"><b>Six 랭킹</b></p>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										</div>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- content viewport ends -->
	<script>
	var chaebin = 0;
	if(${EMP.rankaverage}==1){
		chaebin = 100;
	}else if(${EMP.rankaverage}==2){
		chaebin = 80;
	}else if(${EMP.rankaverage}==3){
		chaebin = 60;
	}else if(${EMP.rankaverage}==4){
		chaebin = 40;
	}else if(${EMP.rankaverage}==5){
		chaebin = 20;
	}
	
	
	</script>
	<!-- partial -->
	</div>
	<!-- page content ends -->
	</div>
	<!--page body ends -->
	<!-- SCRIPT LOADING START FORM HERE /////////////-->
	 <script src="<%=request.getContextPath() %>/assets_admin/vendors/js/core.js"></script>
    <!-- endinject -->
    <!-- Vendor Js For This Page Ends-->
    <script src="<%=request.getContextPath() %>/assets_admin/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets_admin/vendors/chartjs/Chart.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets_admin/js/charts/chartjs.addon.js"></script>
    <!-- Vendor Js For This Page Ends-->
    <!-- build:js -->
    <script src="<%=request.getContextPath() %>/assets_admin/js/template.js"></script>
    <!-- endbuild -->
    <script src="<%=request.getContextPath() %>/assets_admin/js/empMember.custom.js"></script>
</body>
</html>