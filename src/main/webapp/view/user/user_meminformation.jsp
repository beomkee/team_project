<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 내정보수정 -->
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 정보 - 식스택배</title>
<!-- favicon -->
<link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">
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
						<span>내 정보</span>
						<h1>프로필 수정</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a href="index.html"> 연락처와 주소를 수정 하실 수 있습니다.</a>
								</li>
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
			<h2 class="subtitle">내 정보</h2>
			<div class="contact-infos"></div>
			<!--  contact infos end  -->





			<br>
			<center>
				<form action="memUpdate" method="post" name="twin">
					<table width="800">
						<!-- 	<tr height="40">
								<td align="center"><b>[회원가입]</b></td>
							</tr> -->
					</table>


					<table width="700" height="600" cellpadding="0" style="border-collapse: collapse; font-size: 9pt;">



						<%-- 	<div class="hero-txt">
					<span class="wow fadeInDown" data-wow-duration="1.5s">단 한사람, <c:if test="${empty member }">당신</c:if><c:if test="${!empty member }">
					${member.m_name}
					</c:if>을 위하여 </span>
					<h1 class="wow fadeInUp" data-wow-duration="1.5s">나의 택배,<br>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#fac08f">식스 택배.</span></h1>
					<span class="wow fadeInDown" data-wow-duration="1.5s">마음이 통하면, 세상은 더, 따뜻해 집니다.</span><br>
					<a class="wow fadeInUp boxed-btn" data-wow-duration="1.5s" href="accept/accept">
						<span>택배예약</span>
					</a>
				</div> --%>




						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">회원 ID</td>
							<td>
								<c:if test="${!empty member }"> ${member.m_id} </c:if>
								&nbsp;
								<input type="hidden" name="m_id" value="${member.m_id}">
							</td>
						</tr>
						<tr height="7">
							<td colspan="3">
								<hr />
							</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">현재 비밀번호</td>
							<td>
								<c:if test="${!empty member }"> ${member.m_pw} </c:if>
							</td>
						</tr>

						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">새 비밀번호</td>
							<td>
								<input type="password" name="m_pw" id="pw" onchange="isSame()" />
							</td>
						</tr>


						<tr height="7">
							<td colspan="3">
								<hr />
							</td>
						</tr>
						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">이 름</td>
							<td>
								<c:if test="${!empty member }"> ${member.m_name} </c:if>
							</td>
						</tr>
						<tr height="7">
							<td colspan="3">
								<hr />
							</td>
						</tr>


						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">생년월일</td>
							<td>
								<c:if test="${!empty member }"> ${member.m_birth} </c:if>
							</td>
						</tr>
						<tr height="7">
							<td colspan="3">
								<hr />
							</td>
						</tr>


						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">성 별</td>
							<td>
								남 성&nbsp;&nbsp;
								<input type="radio" name="wUserGender" value="1" checked />
								&nbsp;여 성&nbsp;&nbsp;
								<input type="radio" name="wUserGender" value="2" />
							</td>
						</tr>
						<tr height="7">
							<td colspan="3">
								<hr />
							</td>
						</tr>

						<tr class="register" height="30">
							<td width="5%" align="center">*</td>
							<td width="15%">핸드폰번호</td>
							<td>
								<input type="tel" name="m_tel" value="${member.m_tel}"/>
								
							</td>
						</tr>
						<tr height="7">
							<td colspan="3">
								<hr />
							</td>
						</tr>

						<tr>
							<td width="5%" align="center">*</td>
							<td width="15%">주 소</td>
							<td>
								<input type="text" size="10" name="wPostCode" id="postcode" placeholder="우편번호" value="${wPostCode }">
								<input type="button" onclick="DaumPostcode()" value="우편번호 찾기">
								<br>
								<br />
								<input type="text" size="30" name="wRoadAdderess" id="roadAddress" placeholder="도로명주소" value="${wRoadAdderess }">
								<br />
								<span id="guide" style="color: #999; font-size: 10px;"></span>
								<br />
								<br />
								<input type="text" name="wRestAddress" value="${wRestAddress }" size="70" />
							</td>
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
								<span>수정</span>
							</button>
						</div>
					</div>
				</form>
			</center>



		</div>
	</div>
	<div class="loader-container">
		<span class="loader">
			<span class="loader-inner"></span>
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBqFuLx8S7A8eianoUhkYMeXpGPvsXp1NM&callback=initMap" async defer></script>
	<!-- google map activate js -->
	<script src="assets/js/google-map-activate.js"></script>
	<!-- main js -->
	<script src="assets/js/main.js"></script>
</body>
</html>