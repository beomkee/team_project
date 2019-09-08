<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  hero area start  -->
<div class="hero-area hero-bg-3 home-3" id="heroHome15">
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-lg-8">
				<div class="hero-txt">
					<span class="wow fadeInDown" data-wow-duration="1.5s">단 한사람, <c:if test="${empty member }">당신</c:if><c:if test="${!empty member }">
					${member.m_name}
					</c:if>을 위하여 </span>
					<h1 class="wow fadeInUp" data-wow-duration="1.5s">나의 택배,<br>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#fac08f">식스 택배.</span></h1>
					<span class="wow fadeInDown" data-wow-duration="1.5s">마음이 통하면, 세상은 더, 따뜻해 집니다.</span><br>
					<a class="wow fadeInUp boxed-btn" data-wow-duration="1.5s" href="accept/accept">
						<span>택배예약</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="hero-overlay"></div>
</div>
<!--  hero area end  -->
<div class="cta-section home-2">
	<div class="container">
		<div class="cta-container">
			<div class="col-lg-12">
               <form method="post" action="search/search">
                  <div class="row">
                  <div class="col-lg-1">&nbsp;</div>
                     <div class="col-lg-8">
                        <div class="form-element"><input name="w_num" id="searchbox" type="text" placeholder="운송장 번호를 입력하세요." ></div>
                     </div>
                     <div class="col-lg-3">
                        <div class="form-element"><input type="submit" value="조회"></div>
                     </div>
                  </div>
               </form>
            </div>
		</div>
	</div>
	<div class="cta-overlay"></div>
</div>
<!--   cta section end    -->
<!--  service section start  -->
<div class="service-section home-3">
	<div class="container">
		<span class="title">Our Services</span>
		<h2 class="subtitle">WHAT WE PROVIDE</h2>
		<div class="services">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-service wow fadeInUp" data-wow-duration="1.5s">
						<div class="icon-wrapper">
							<i class="flaticon-airplane"></i>
						</div>
						<div class="service-txt">
							<h4 class="service-title">택배 예약</h4>
							<p class="service-para">We offers a host of logistic management services and supply chain solutions.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-service wow fadeInUp" data-wow-duration="1.5s" data-wow-delay=".2s">
						<div class="icon-wrapper">
							<i class="flaticon-delivery-truck"></i>
						</div>
						<div class="service-txt">
							<h4 class="service-title">택배 조회</h4>
							<p class="service-para">We offers a host of logistic management services and supply chain solutions.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-service wow fadeInUp" data-wow-duration="1.5s" data-wow-delay=".4s">
						<div class="icon-wrapper">
							<i class="flaticon-loader"></i>
						</div>
						<div class="service-txt">
							<h4 class="service-title">픽업 예약</h4>
							<p class="service-para">We offers a host of logistic management services and supply chain solutions.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-service wow fadeInUp" data-wow-duration="1.5s" data-wow-delay=".6s">
						<div class="icon-wrapper">
							<i class="flaticon-ferry"></i>
						</div>
						<div class="service-txt">
							<h4 class="service-title">만족도 평가</h4>
							<p class="service-para">We offers a host of logistic management services and supply chain solutions.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-service wow fadeInUp" data-wow-duration="1.5s" data-wow-delay=".8s">
						<div class="icon-wrapper">
							<i class="flaticon-package"></i>
						</div>
						<div class="service-txt">
							<h4 class="service-title">회원가입</h4>
							<p class="service-para">We offers a host of logistic management services and supply chain solutions.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-service wow fadeInUp" data-wow-duration="1.5s" data-wow-delay="1s">
						<div class="icon-wrapper">
							<i class="flaticon-baby-toy"></i>
						</div>
						<div class="service-txt">
							<h4 class="service-title">이건뭐하지</h4>
							<p class="service-para">We offers a host of logistic management services and supply chain solutions.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--  service section end  -->
