<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../common/head_admin.jsp" />
<jsp:include page="../../common/nav_admin.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets_admin/css/customAdmin/adminStyleEdit.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script type="text/javascript">
$(document).ready(function(e){
	
	var idx = false;
	
	
	//작성보내기 전에 확인
	$('#submitNotice').click(function(){
		if($.trim($('#nb_title').val()) == ''||$.trim($('#nb_title').val())==' '){
			alert("공지사항 제목을 입력해주세요.");
			$('#nb_title').focus();
			idx = false;
			return idx;
		} else if($.trim($('#nb_content').val()) == ''||$.trim($('#nb_content').val()) ==' '){
			alert("공지사항 내용을 입력해주세요.");
			$('#nb_content').focus();
			idx = false;
			return idx;
		} 
	});
	
	
	
	
	
	
	//값 가져오기
	$('.button').click(function(){
		var nbNum = $(this).attr('value');
		$.ajax({
			url: "${pageContext.request.contextPath}/administer/bringInfo",
			type: "GET",
			data:{
				"nb_num":$(this).val()
			},
			dataType:"json",
			success: function(data){
				console.log(data.getNb_num);
				$('input[name=nb_num]').attr('value',data.getNb_num);
				$('input[name=nb_title]').attr('value',data.getNb_title);
				/* $('input[name=nb_content]').attr('value',data.getNb_content); */
			},
			error: function(){
				
			}
		});
	});
	
	
});
</script>



<!-- body 시작 -->
<!-- partial -->
<div class="page-content-wrapper">
	<div class="page-content-wrapper-inner">
		<div class="viewport-header">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb has-arrow">
					<li class="breadcrumb-item"><a href="#">관리</a></li>
					<li class="breadcrumb-item active" aria-current="page">공지사항 관리</li>
				</ol>
			</nav>
		</div>
		<div class="content-viewport">
			<div class="row">
				<!-- 공지사항 관리 -->
				<div class="col-lg-12">
					<div class="grid">
						<p class="grid-header">공지사항 추가 / 수정</p>
						<div class="grid-body">
							<div class="item-wrapper">
								<div class="row mb-3">
									<div class="col-md-8 mx-auto">
										<br>
										<form name="WriteNotice" method="post" action="<%=request.getContextPath()%>/administer/WriteNotice">
										<input type="hidden" name="nb_num" value="0">
											<div class="form-group row showcase_row_area">
												<div class="col-md-3 showcase_text_area">
													<label for="nb_title">제목</label>
												</div>
												<div class="col-md-9 showcase_content_area">
													<input type="text" class="form-control" id="nb_title" name="nb_title" placeholder="제목을 입력해주세요">
												</div>
											</div>
											<div class="form-group row showcase_row_area">
												<div class="col-md-3 showcase_text_area">
													<label for="nb_content">내용</label>
												</div>
												<div class="col-md-9 showcase_content_area">
													<textarea name="nb_content" class="form-control" id="nb_content" cols="12" rows="5" placeholder="공지사항 내용을 입력해주세요"></textarea>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="form-group showcase_row_area"
													style="margin-left: 520px;">
													<button type="submit" id="submitNotice" value="write" class="btn btn-warning btn-sm has-icon">
														<i class="mdi mdi-check"></i>작성
													</button>
												</div>
												<div class="form-group showcase_row_area"
													style="margin-left: 10px;">
													<button type="reset"
														class="btn btn-warning btn-sm has-icon">
														<i class="mdi mdi-refresh"></i>다시 작성
													</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="grid">
						<p class="grid-header">조회</p>
						<div class="item-wrapper">
							
							<div class="table-responsive">
								<table class="table info-table">

									<thead>
										<tr>
											<th>제목</th>
											<th>내용</th>
											<th>작성자</th>
											
											<th>조회수</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${noticeList}" var="noticeList">
										<tr>
											<td>${noticeList.nb_title}</td>
											<td>${noticeList.nb_content}</td>
											<td>${noticeList.e_num}</td>
											<td>${noticeList.nb_readcount}</td>
											<td class="actions">
												<button type="button"
													class="btn btn-trasnparent action-btn btn-xs component-flat pr-0"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">
													<i class="mdi mdi-dots-vertical"> </i>
												</button>
												<div class="dropdown-menu dropdown-menu-right">
													<button type="button" name="updateMovenb_num" value="${noticeList.nb_num}" class="dropdown-item button">수정하기</button> 
													<a class="dropdown-item" href="<%=request.getContextPath()%>/administer/DeleteNotice?nb_num=${noticeList.nb_num}">삭제하기</a>
												</div>
											</td>	
										</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>




			</div>
		</div>
	</div>
</div>
<!-- content viewport ends -->
<!-- content viewport ends -->
<jsp:include page="../../common/footer_admin.jsp" />