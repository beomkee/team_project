<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 - 식스택배</title>
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

<!-- <link rel="stylesheet" href="assets/css/style.css"> -->
<!-- responsive css -->
<link rel="stylesheet" href="assets/css/responsive.css">

<!-- jquery js -->
<script src="assets/js/jquery-3.3.1.min.js"></script>
</head>

<link rel="stylesheet" href="assets/css/chaebin_style.css">

<body>


<!-- 	<style>
.userJoin-breadcrumb-bg {
	background-image: url('../img/about/speed.jpg');
	background-size: cover;
}
</style>
 -->
	<!--  breadcrumb start  -->
	<div class="breadcrumb-area userJoin-breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<div class="breadcrumb-txt">
						<span>로그인</span>
						<h1>로그인하기</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">고객에 최적화된 원스톱 물류솔루션을 제공합니다.</a></li>
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
			<h2 class="subtitle">로그인</h2>
			<form action="#">
			
	<td align="center">
				<form method="post" id="authForm" action="https://www.tistory.com/auth/login">
    <input type="hidden" name="redirectUrl" value="https://blogpack.tistory.com/manage">
    <fieldset style="text-align: center;">
      <div class="box_login">
        <div class="inp_text">
          <label for="loginId" class="screen_out">아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
          <input type="email" id="loginId" name="loginId" placeholder="" >
        </div>
        
        
        <tr height="7">
        <td colspan="3">
        </td>
        
        <div class="inp_text">
          <label for="loginPw" class="screen_out">비밀번호&nbsp;&nbsp;</label>
          <input type="password" id="loginPw" name="password" placeholder="" >
        </div><br>
      </div>
    <!--   <button type="submit" class="btn_login"  disabled>로그인</button> -->
    <br>
    		<div class="col-md-12">
							<div class="form-element">
								<button type="submit">
									<span>로그인</span>
								</button>
							</div>
						</div>
    
    
      <div class="login_append">
        <div class="inp_chk"> <!-- 체크시 checked 추가 -->
          <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin">
          <label for="keepLogin" class="lab_g">
<span class="img_top ico_check"></span>
<span class="txt_lab">아이디 기억하기</span>
  </label>
        </div>
        <span class="txt_find">
           <a href="/member/find/Join" class="link_find">회원가입</a>
 			  |            
           <a href="/member/find/loginId" class="link_find">아이디찾기</a>
              | 
           <a href="/member/find/password" class="link_find">비밀번호 찾기</a>
           
           
         </span>
      </div>
     </td>
    </fieldset>
  </form>


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