<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- satisfaction CSS Sheet -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/custom/satisfactionCustom.css">
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
							<li class="breadcrumb-item">식스택배를 이용하신 고객님들의 후기입니다.</li>
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
						<h2 class="subtitle">이용 후기</h2>
					</div>
				</div>
			</div>
			<!-- 만족도 게시판 -->
			<div class="col-xl-12 col-lg-12">
				<div class="row">
					<div class="col-lg-12">
						<table class="table">
							<tr>
								<th>no</th>
								<th colspan="3">제목</th>
								<th colspan="1">작성자</th>
								<th colspan="4">작성일시</th>
								<th>조회수</th>
							</tr>
							<c:forEach items="${surveyBoardList}" var="surveyBoard">
								<tr>
									<td><c:out value="${number}" /></td>
									<c:set var="number" value="${number-1}" />
									<td colspan="3">${surveyBoard.sb_title}</td>
									<td colspan="1">${surveyBoard.r_receiver}</td>
									<td colspan="4">${surveyBoard.sb_regdate}</td>
									<td>${surveyBoard.sb_readcount}</td>
								</tr>
							</c:forEach>
						</table>
						<div class="row">
							<div class="col-lg-12">
								<nav class="pagination-nav">
									<ul class="pagination justify-content-center">
									    <c:if test="${startPage>bottomLine}">
										<li class="page-item"><a class="page-link"
											href="#" tabindex="-1"><i class="fas fa-chevron-left"></i></a>
										</li>
										</c:if>
										
										
										<c:if test="${startPage<=bottomLine}">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1"><i class="fas fa-chevron-left"></i></a>
										</li>
										</c:if>
										
										<c:forEach var="i" begin="${startPage }" end="${endPage }">
										  <c:if test="${i==pageNum}">
										  	<li class="page-item active"><a class="page-link" href="list?pageNum=${i}">${i}</a></li>
										  </c:if>
										  <c:if test="${i!=pageNum}">
										  <li class="page-item"><a class="page-link" href="#">${i}</a></li>
										  </c:if>
										</c:forEach>
										
										
										<c:if test="${ endPage<pageCount}">
										<li class="page-item"><a class="page-link" href="#"><i
												class="fas fa-chevron-right"></i></a></li>
										</c:if>
										<c:if test="${ endPage>=pageCount}">
										<li class="page-item disabled"><a class="page-link" href="#"><i
												class="fas fa-chevron-right"></i></a></li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>
					</div>

					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-element mb-0">
									<br>
									<a href="<%=request.getContextPath()%>/satisfaction/survey">
										<button type="button" class="boxed-btn" style="float: right;">
											<span>평가 작성</span>

										</button>
									</a>
								</div>
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
<!--  features section end  -->
<style>
.common-table-top {
	margin-bottom: 15px;
	padding: 18px 30px 15px;
	border-bottom: solid 1px #bec0c2;
	background: #f2f2f2
}

.common-table-top strong {
	font-weight: 800;
	font-size: 18px;
	color: #007ac3
}

.common-table-top span:before {
	display: inline-block;
	content: '';
	width: 7px;
	height: 1px;
	vertical-align: middle;
	margin: 0 6px 0 11px;
	background: #333
}

.common-table-top span {
	font-size: 15px;
	color: #333
}
</style>