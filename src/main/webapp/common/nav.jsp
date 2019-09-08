<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	var currentUrl = document.location.href.split("teamProject")[1]
			.substring(1);

	$(document)
			.ready(
					function() {
						$
								.ajax({
									url : "${pageContext.request.contextPath}/topMenu",
									method : "POST",
									data : {},
									success : function(data) {
										$
												.each(
														data,
														function(i, item) {
															if (item.tm_depth == 1) {
																var menu = '';
																var hasSub = false;
																var isCurrent = false;
																$
																		.each(
																				data,
																				function(
																						j,
																						submenu) {
																					if (submenu.tm_parent == item.tm_num) {
																						hasSub = true;
																						if (submenu.tm_url == currentUrl) {
																							isCurrent = true;
																						}
																					}
																				})
																if (hasSub) {
																	if (isCurrent) {
																		menu += '<li class="dropdown active">'
																				+ '<a href="#">'
																				+ item.tm_text
																				+ '</a>'
																				+ '<ul>';
																	} else {
																		menu += '<li class="dropdown">'
																				+ '<a href="#">'
																				+ item.tm_text
																				+ '</a>'
																				+ '<ul>';
																	}
																	$
																			.each(
																					data,
																					function(
																							j,
																							submenu) {
																						if (submenu.tm_parent == item.tm_num) {
																							menu += '<li>'
																									+ '<a href="${pageContext.request.contextPath}/'+ submenu.tm_url+'">'
																									+ submenu.tm_text
																									+ '</a>'
																									+ '</li>';
																						}
																					})
																	'</ul>';
																} else {
																	if (item.tm_url == currentUrl) {
																		menu += '<li class="active">'
																				+ '<a href="${pageContext.request.contextPath}/'+item.tm_url+'">'
																				+ item.tm_text
																				+ '</a>';
																	} else {
																		menu += '<li>'
																				+ '<a href="${pageContext.request.contextPath}/'+item.tm_url+'">'
																				+ item.tm_text
																				+ '</a>';
																	}
																}
																menu += '</li>';
																$(
																		"#mainMenustart")
																		.append(
																				menu);
															}
														})
									}
								})
					});
</script>
<body>
	<!--   header area start   -->
	<div class="header-area" style="z-index: 2002;">
		<div class="support-nav-area" style="z-index: 2001;">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-6">
						<div class="logo-wrapper">
							<div class="logo-wrapper-inner">
								<a href="<%=request.getContextPath()%>/main">
									<img src="<%=request.getContextPath()%>/assets/img/mainLogo.png" alt="">
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg-9 col-6 position-lg-relative position-static">
						<div class="support-bar">
							<div class="row">
								<div class="offset-xl-4 col-xl-8 offset-2 col-10">
									<div class="row">
										<div class="col-lg-4">
											<div class="support-info">
												<div class="left-content">
													<i class="flaticon-call"></i>
												</div>
												<div class="right-content">
													<div class="right-content-inner">
														<h5>고객 센터</h5>
														<p>+ 00 12 123 456</p>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="support-info">
												<div class="left-content">
													<i class="flaticon-email"></i>
												</div>
												<div class="right-content">
													<h5>문의 메일</h5>
													<p>Support@mail.com</p>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<a href="<%=request.getContextPath()%>/accept/accept" class="boxed-btn">
												<span>택배 예약</span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="navbar-area">
							<div class="row">
								<div class="col-lg-9 d-lg-block d-none">
									<nav class="main-menu" id="mainMenu">
										<ul id="mainMenustart">
											<!--DB에서  Ajax로 메뉴 가져와 Append로 붙임 -->
										</ul>
									</nav>
								</div>
								<div class="col-lg-3 col-12 position-lg-relative position-static">
									<div id="mobileMenu"></div>
									<ul class="search-cart-area">


										<c:if test="${ member == null}">

											<li>
												<a class="logout" href="<%=request.getContextPath()%>/member/login" style="font-size: 13px;">로그인</a>
											</li>
											<li>
												<a class="logout" href="<%=request.getContextPath()%>/member/memJoin" style="font-size: 13px;">회원가입</a>
											</li>

										</c:if>

										<c:if test="${ member != null}">

											<li>
												<a class="logout" href="<%=request.getContextPath()%>/member/logout" style="font-size: 13px;">로그아웃</a>
											</li>
											<li>
												<a class="logout" href="<%=request.getContextPath()%>/member/memInformation" style="font-size: 13px;">마이페이지</a>
											</li>

										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--   header area end   -->