<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
	$(document).ready(function() {
		$.ajax({
			url		:"${pageContext.request.contextPath}/topMenu",
			method	: "POST",
			data	: {},
			success	: function(data){
			var menu = '';
			$.each(data, function(i, item){
				if (item.tm_depth == 2 ) {
					if (item.tm_div != 9) {
						menu += '<li><a href="${pageContext.request.contextPath}/'+item.tm_url+'">'+ item.tm_text +'</a></li>';
					}
				}
			})
			$("#footerMenu").append(menu);
			}
		})
	});
    </script>
 <!--   footer section start    -->
      <footer>
         <div class="container">
            <div class="top-footer">
               <div class="row">
                  <div class="col-xl-4 col-lg-4">
                     <div class="logo-wrapper"><img src="<%= request.getContextPath()%>/assets/img/six_logo_white.png" alt=""></div>
                     <p><b>단 한사람, 당신을 위하여<br>나의 택배,<br>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#fac08f">식스 택배.</span> <br>마음이 통하면, 세상은 더, 따뜻해 집니다. </b></p>
                  </div>
                  <div class="offset-xl-1 col-xl-2 col-lg-2">
                     <h4>Menu Links</h4>
                     <ul class="userful-links" id="footerMenu">
                     </ul>
                  </div>
                  <div class="col-xl-2 col-lg-2">
                     <h4>Member Services</h4>
                     <ul class="userful-links">
                        <li><a href="<%=request.getContextPath() %>/member/login">로그인</a></li>
                        <li><a href="<%=request.getContextPath() %>/member/memJoin">회원가입</a></li>
                     </ul>
                  </div>
                  <div class="col-xl-3 col-lg-4">
                     <h4>Contact Us</h4>
                     <div class="footer-contact">
                        <div class="contact-info">
                           <div class="icon-wrapper"><i class="flaticon-placeholder"></i></div>
                           <p>서울특별시 강남구 역삼동 테헤란로 132</p>
                        </div>
                        <div class="contact-info">
                           <div class="icon-wrapper"><i class="flaticon-call"></i></div>
                           <p>010-1111-1111</p>
                        </div>
                        <div class="contact-info">
                           <div class="icon-wrapper"><i class="flaticon-email"></i></div>
                           <p>six@ssit.com</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="bottom-footer">
               <p class="text-center">© Copyrights 2019 식스택배. All rights reserved.</p>
            </div>
         </div>
      </footer>
      <!--   footer section end    -->


      <!-- preloader section start -->
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
      <script src="<%=request.getContextPath() %>/assets/js/popper.min.js"></script>
      <!-- bootstrap js -->
      <script src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
      <!-- owl carousel js -->
      <script src="<%=request.getContextPath() %>/assets/js/owl.carousel.min.js"></script>
      <!-- isotope js -->
      <script src="<%=request.getContextPath() %>/assets/js/isotope.pkgd.min.js"></script>
      <!-- slicknav js -->
      <script src="<%=request.getContextPath() %>/assets/js/jquery.slicknav.min.js"></script>
      <!-- wow js -->
      <script src="<%=request.getContextPath() %>/assets/js/wow.min.js"></script>
      <!-- ripples js -->
      <script src="<%=request.getContextPath() %>/assets/js/jquery.ripples-min.js"></script>
      <!-- main js -->
      <script src="<%=request.getContextPath() %>/assets/js/main.js"></script>
   </body>
</html>