<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  breadcrumb start  -->
<div class="breadcrumb-area quote-breadcrumb-bg">
	<div class="container">
		<div class="row">
			<div class="col-lg-7">
				<div class="breadcrumb-txt">
					<span>접수</span>
					<h1>예약 완료</h1>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">식스택배는 고객님의 소중한 마음까지 전달합니다.</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="breadcrumb-overlay"></div>
</div>
<!--  breadcrumb end  -->
 <!--    Error section start   -->
      <div class="error-section">
         <div class="container">
            <div class="row">
               <div class="col-lg-6">
                  <div class="not-found">
                     <img src="<%=request.getContextPath() %>/assets/img/parselsuccess.jpg" alt="">
                  </div>
               </div>
               <div class="col-lg-6">
                  <div class="error-txt">
                     <div class="oops">
                        <img src="<%=request.getContextPath() %>/assets/img/payLogo.jpg" alt="">
                     </div>
                     <h2>${wbNum}</h2>
                     <p>고객님의 소중한 택배예약이 완료되었습니다</p>
                     <p>택배번호를 기억해주세요</p>
                     <a href="<%=request.getContextPath() %>/search/search" class="go-home-btn">택배 조회</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!--    Error section end   -->
<!--   cta section end    -->
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
						<div class="single-feature wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">
							<div class="icon-wrapper">
								<i class="flaticon-email"></i>
							</div>
							<div class="feature-details">
								<h4>파손, 택배 사고 접수</h4>
								<p>상품의 파손, 변질에 의한 택배 사고 접수는1:1 문의를 통해 직접 하실 수 있습니다.</p>
							</div>
						</div>
						<div class="single-feature wow fadeInUp" data-wow-duration="1s" data-wow-delay=".4s">
							<div class="icon-wrapper">
								<i class="flaticon-worldwide"></i>
							</div>
							<div class="feature-details">
								<h4>글로벌 서비스</h4>
								<p>언제 어디서든 편리하게 택배 발송 예약을 하실 수 있습니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--  features section end  -->
