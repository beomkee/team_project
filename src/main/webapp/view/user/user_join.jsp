<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 - 식스택배</title>
<!-- favicon -->
<link rel="shortcut icon" href="assets/img/favicon.png"
	type="image/x-icon">
<!-- bootstrap css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<!-- fontawesome css -->
<link rel="stylesheet" href="assets/css/flaticon.css">
<!-- fontawesome css -->
<link rel="stylesheet" href="assets/css/fontawesome.min.css">
<!-- owl carousel css -->
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<!-- owl carousel theme css -->
<link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
<!-- slicknav css -->
<link rel="stylesheet" href="assets/css/slicknav.css">
<!-- animate css -->
<link rel="stylesheet" href="assets/css/animate.min.css">
<!-- main css -->
<link rel="stylesheet" href="assets/css/style.css">
<!-- responsive css -->
<link rel="stylesheet" href="assets/css/responsive.css">
<!-- jquery js -->
<script src="assets/js/jquery-3.3.1.min.js"></script>
</head>



<body>

	<!-- 
	<style>
.userJoin-breadcrumb-bg {
	background-image: url('../img/about/sign.jpg');
	background-size: cover;
}


</style> -->

	<!--  breadcrumb start  -->
	<div class="breadcrumb-area userJoin-breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<div class="breadcrumb-txt">
						<span>회원가입</span>
						<h1>가입하기</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">식스택배는
										글로벌 물류 혁신을 주도합니다.</a></li>
								<!-- 									<li class="breadcrumb-item active" aria-current="page">회원가입</li>
 -->

							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div class="breadcrumb-overlay"></div>
	</div>
	<!--  breadcrumb end  -->






	<!--   contact section start    -->
	<div class="contact-section">
		<div class="container">
			<!--  contact infos start  -->
			<h2 class="subtitle">회원가입</h2>
				<div class="contact-infos">
					<div class="row no-gutters">
						<div class="col-lg-4 single-info-col">
							<div class="single-info wow fadeInRight" data-wow-duration="1s">
								<div class="icon-wrapper">
									<i class="fas fa-home"></i>
								</div>
								<div class="info-txt">
									<p>01</p>
									<p>약관동의</p>
								</div>
							</div>
						</div>
						<div class="col-lg-4 single-info-col">
							<div class="single-info wow fadeInRight" data-wow-duration="1s"
								data-wow-delay=".2s">
								<div class="icon-wrapper">
									<i class="fas fa-phone"></i>
								</div>
								<div class="info-txt">
									<p>
										<b>02</b>
									</p>
									<p>
										<b>정보입력</b>
									</p>
								</div>
							</div>
						</div>
						<div class="col-lg-4 single-info-col">
							<div class="single-info wow fadeInRight" data-wow-duration="1s"
								data-wow-delay=".4s">
								<div class="icon-wrapper">
									<i class="far fa-envelope"></i>
								</div>
								<div class="info-txt">
									<p>03</p>
									<p>가입완료</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--  contact infos end  -->





				<br> <br> <br>
				<center>
					<form action="memJoin2" method="post" name="twin">
					
						<!-- <form action="register.php" method="post" name="twin"> -->

							<table width="800">
								<!-- 	<tr height="40">
								<td align="center"><b>[회원가입]</b></td>
							</tr> -->
							</table>
							<table width="700" height="600" cellpadding="0"
								style="border-collapse: collapse; font-size: 9pt;">
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="15%">회원 ID</td>
									<td><input type="text" name="m_id" />&nbsp;<a
										href="javascript:id_check()">&nbsp;&nbsp;&nbsp;[ID 중복 검사]</a></td>
								</tr>
								<tr height="7">
									<td colspan="3"><hr /></td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="15%">비밀번호</td>
									<td><input type="password" name="m_pw" id="pw"
										onchange="isSame()" /></td>

								</tr>
								<tr height="7">
									<td colspan="3"><hr /></td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="15%">비밀번호 확인</td>
									<td><input type="password" name="m_pw2"
										id="pwCheck" onchange="isSame()" />&nbsp;&nbsp;<span
										id="same"></span></td>
								</tr>
								<tr height="7">
									<td colspan="3"><hr /></td>
								</tr>
								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="15%">이 름</td>
									<td><input type="text" name="m_name" /></td>
								</tr>
								<tr height="7">
									<td colspan="3"><hr /></td>
								</tr>


								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="15%">생년월일</td>
									<td><input type="text" name="m_birth" /></td>
								</tr>
								<tr height="7">
									<td colspan="3"><hr /></td>
								</tr>





								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="15%">성 별</td>
									<td>남 성&nbsp;&nbsp;<input type="radio" name="m_sex"
										value="M" checked />&nbsp;여 성&nbsp;&nbsp;<input type="radio"
										name="m_sex" value="F" />
									</td>
								</tr>
								<tr height="7">
									<td colspan="3"><hr /></td>
								</tr>

								<tr class="register" height="30">
									<td width="5%" align="center">*</td>
									<td width="15%">핸드폰번호</td>
									<td><input type="tel" name="m_tel" /></td>
								</tr>
								<tr height="7">
									<td colspan="3"><hr /></td>
								</tr>

						<tr>
							<td width="5%" align="center">*</td>
							<td width="15%">주 소</td>
							<td><input type="text" size="10" name="wPostCode"
								id="postcode" placeholder="우편번호" 
								onclick="DaumPostcode()"> <input type="button"
								onclick="DaumPostcode()" value="우편번호 찾기"><br> <br />

								<!-- 					<div class="col-md-12">
							<div class="form-element">
								<button type="submit">
									<span>우편번호 찾기</span>
								</button>
							</div>
						</div> --> <input type="text" size="30" name="wRoadAddress"
								id="roadAddress" placeholder="도로명주소" 
								onclick="DaumPostcode()">  <br /> <span
								id="guide" style="color: #999; font-size: 10px;"></span> <br />
								<br /> <input type="text" name="wRestAddress"
								placeholder="나머지 주소" size="70" /></td>
						</tr>

					</table>
							<br />
							<table>
								<tr height="40">
									<!-- <td><input width="120" type="image"
									src="img/button/btn_join.png" />&nbsp;<a href="index.php"><img
										src="img/button/btn_cancel.png" width="120" /></a></td> -->
								</tr>
							</table>


							<div class="col-md-12">
								<div class="form-element">
									<button type="submit">
										<span>확인</span>
									</button>
								</div>
							</div>


						</form>
				</center>



				<!--  contact form and map start  -->
				<!-- 	<div class="contact-form-section">
					<div class="row">
						<div class="col-lg-6">
 -->


				<!-- <span class="title"> </span> -->
				<!-- <h2 class="subtitle">회원가입</h2>
                     <form action="#">
                 
                      -->
				<!-- 	<div class="row">
								<div class="col-md-6">
									<div class="form-element">
										<input type="text" placeholder="Name">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-element">
										<input type="text" placeholder="Email">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-element">
										<input type="text" placeholder="Phone">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-element">
										<input type="text" placeholder="Subject">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-element">
										<textarea name="comment" cols="30" rows="10"
											placeholder="Comment"></textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-element">
										<button type="submit">
											<span>확인</span>
										</button>
									</div>
								</div>
							</div>
			</form>
		</div>
		<div class="col-lg-6">
			<div class="map-wrapper">
				<div id="map"></div>
			</div>
		</div>
	</div>
	</div> -->
				<!--  contact form and map end  -->
		</div>
	</div>
	<!--   contact section end    -->





	<!-- preloader section start -->
	<div class="loader-container">
		<span class="loader"> <span class="loader-inner"></span>
		</span>
	</div>
	<!-- preloader section end -->


	<!-- back to top area start -->
	<div class="back-to-top">
		<i class="fas fa-chevron-up"></i>
	</div>
	<!-- back to top area end -->



	<!-- popper js -->
	<script src="assets/js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- owl carousel js -->
	<script src="assets/js/owl.carousel.min.js"></script>
	<!-- isotope js -->
	<script src="assets/js/isotope.pkgd.min.js"></script>
	<!-- slicknav js -->
	<script src="assets/js/jquery.slicknav.min.js"></script>
	<!-- wow js -->
	<script src="assets/js/wow.min.js"></script>
	<!-- google map api -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBqFuLx8S7A8eianoUhkYMeXpGPvsXp1NM&callback=initMap"
		async defer></script>
	<!-- google map activate js -->
	<script src="assets/js/google-map-activate.js"></script>
	<!-- main js -->
	<script src="assets/js/main.js"></script>
</body>
</html>