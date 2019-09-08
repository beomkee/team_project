<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- satisfaction CSS Sheet -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/custom/satisfactionCustom.css">
<!--  breadcrumb start  -->
<div class="breadcrumb-area satisfactionBoard-bg">
	<div class="container">
		<div class="row">
			<div class="col-lg-7">
				<div class="breadcrumb-txt">
					<span>만족도</span>
					<h1>이용 고객 후기</h1>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">저희 식스택배를 이용하신 고객님들의 후기입니다.</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="breadcrumb-overlay"></div>
</div>
<!--  breadcrumb end  -->

<!--   quote section start    -->
<div class="quote-section quote-page">
	<div class="container">
		<div class="row">
			<div class="col-xl-12 col-lg-12">
				<div class="row">
					<div class="col-lg-12">
						<span class="title">만족도</span>
						<h2 class="subtitle">내용</h2>
					</div>
				</div>
			</div>
			<!-- 만족도 게시판 -->
			<div class="col-xl-12 col-lg-12">
				<div class="row">
					<div class="col-lg-12">
						<table class="table">
							<tr>
								<td style="font-weight: bold;">no</td>
								<td>${surveyBoardContent.sb_num}</td>
								<td style="font-weight: bold;">작성자</td>
								<td colspan="3">${surveyBoardContent.r_receiver}</td>
								<td style="font-weight: bold;">직원 ID</td>
								<td colspan="4">${surveyBoardContent.e_num}</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">작성 일자</td>
								<td colspan="5">${surveyBoardContent.sb_regdate}</td>
								<td style="font-weight: bold;">조회수</td>
								<td colspan="4">${surveyBoardContent.sb_readcount}</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">제목</td>
								<td colspan="11">${surveyBoardContent.sb_title}</td>
							</tr>
							
							<!-- 평가 들어갈 곳 -->
							<c:forEach items="${surveyContentResult}" var="surveyContentResult">
							<tr>
								<td></td>
								<td colspan="4" style="font-size: 90%; text-align: left;">${surveyContentResult.sq_num}. ${surveyContentResult.sq_text}</td>
								<td colspan="7"></td>
							</tr>
							<tr>
								<td></td>
								<c:if test="${surveyContentResult.sa_num%5==1}">
									<td style="float: left; margin-left: 18px;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="staruncheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_uncheck.png"  style="width: 30px; height: auto;">
										<img alt="staruncheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_uncheck.png"  style="width: 30px; height: auto;">
										<img alt="staruncheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_uncheck.png"  style="width: 30px; height: auto;">
										<img alt="staruncheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_uncheck.png"  style="width: 30px; height: auto;">
									</td>
								</c:if>
								<c:if test="${surveyContentResult.sa_num%5==2}">
									<td style="float: left; margin-left: 18px;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="staruncheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_uncheck.png"  style="width: 30px; height: auto;">
										<img alt="staruncheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_uncheck.png"  style="width: 30px; height: auto;">
										<img alt="staruncheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_uncheck.png"  style="width: 30px; height: auto;">
									</td>
								</c:if>
								
								<c:if test="${surveyContentResult.sa_num%5==3}">
									<td style="float: left; margin-left: 18px;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_uncheck.png"  style="width: 30px; height: auto;">
										<img alt="staruncheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_uncheck.png"  style="width: 30px; height: auto;">
									</td>
								</c:if>
								
								<c:if test="${surveyContentResult.sa_num%5==4}">
									<td style="float: left; margin-left: 18px;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="staruncheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_uncheck.png"  style="width: 30px; height: auto;">
									</td>
									
								</c:if>
								
								<c:if test="${surveyContentResult.sa_num%5==0}">
									<td style="float: left; margin-left: 18px;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
										<img alt="starcheck" src="<%=request.getContextPath()%>/assets/img/satisfaction/star_check.png"  style="width: 30px; height: auto;">
									</td>
								</c:if>
								
								<%-- <td colspan="11">${surveyContentResult.sa_item}</td> --%>
							</tr>
							</c:forEach>
							<tr>
							<td></td>
							</tr>
							<tr>
								<td style="font-weight: bold;">내용</td>
								<td colspan="11">${surveyBoardContent.sb_content}</td>
							</tr>

						</table>
						<br>
						<br>

						<div class="row">
							<div class="col-lg-12">
								<button type="button" class="boxed-btn" style="margin-left: 430px; margin-right: 20px;"
									onclick="document.location.href='<%=request.getContextPath()%>/satisfaction/delete?sb_num=${surveyBoardContent.sb_num}&pageNum=${pageNum}'">
									<span>삭제</span>
								</button>
								<button type="button" class="boxed-btn" style="margin-right: 20px;"
									onclick="document.location.href='<%=request.getContextPath()%>/satisfaction/updateMove?sb_num=${surveyBoardContent.sb_num}&pageNum=${pageNum}'">
									<span>수정</span>
								</button>
								<button type="button" class="boxed-btn" style="margin-right: 20px;"
									onclick="document.location.href='<%=request.getContextPath()%>/satisfaction/list?pageNum=${pageNum}'">
									<span>목록</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--   quote section end    -->

<!--  features section start  -->
<div class="features-section home-2 border">
	<div class="container">
		<div class="row feature-content">
			<div class="col-xl-5 offset-xl-7 col-lg-6 offset-lg-6 pr-0">
				<div class="features">
					<span class="title">안내</span>
					<h2 class="subtitle">택배 고객센터 안내</h2>
					<div class="feature-lists">
						<div class="single-feature wow fadeInUp" data-wow-duration="1s">
							<div class="icon-wrapper">
								<i class="flaticon-customer-service"></i>
							</div>
							<div class="feature-details">
								<h4>상담 운영시간</h4>
								<p>월~금요일 09:00~18:00 / 토요일 09:00~13:00</p>
							</div>
						</div>
						<div class="single-feature wow fadeInUp" data-wow-duration="1s"
							data-wow-delay=".2s">
							<div class="icon-wrapper">
								<i class="flaticon-email"></i>
							</div>
							<div class="feature-details">
								<h4>On time delivery</h4>
								<p>We offers logistic management services and supply chain
									perspiciatis unde omnis iste natus error sit voluptat.</p>
							</div>
						</div>
						<div class="single-feature wow fadeInUp" data-wow-duration="1s"
							data-wow-delay=".4s">
							<div class="icon-wrapper">
								<i class="flaticon-worldwide"></i>
							</div>
							<div class="feature-details">
								<h4>global service</h4>
								<p>We offers logistic management services and supply chain
									perspiciatis unde omnis iste natus error sit voluptat.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

