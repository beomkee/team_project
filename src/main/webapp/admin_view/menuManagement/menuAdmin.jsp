<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../common/head_admin.jsp" />
<jsp:include page="../../common/nav_admin.jsp" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets_admin/css/customAdmin/adminStyleEdit.css">
<script>
function setDisplay(){
    if($('input:radio[id=tm_parentY]').is(':checked')){
        $('#showSelect').show();
    } else if($('input:radio[id=tm_parentN]').is(':checked')){
        $('#showSelect').hide();
    } else {
    	 $('#showSelect').hide();
	}
}
</script>
<!-- body 시작 -->
<!-- partial -->
<div class="page-content-wrapper">
	<div class="page-content-wrapper-inner">
		<div class="viewport-header">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb has-arrow">
					<li class="breadcrumb-item"><a href="#">관리</a></li>
					<li class="breadcrumb-item active" aria-current="page">메뉴 관리</li>
				</ol>
			</nav>
		</div>
		<div class="content-viewport">
			<div class="row">
				<!-- 공지사항 관리 -->
				<div class="col-lg-12">
					<div class="grid">
						<p class="grid-header">메뉴 추가 / 수정</p>
						<div class="grid-body">
							<div class="item-wrapper">
								<div class="row mb-3">
									<div class="col-md-8 mx-auto">
										<br>
										<form>
											<div class="form-group row showcase_row_area">
											<input type="hidden" name="tm_num" value="0">
												<div class="col-md-2 showcase_text_area">
													<label for="inputType1">메뉴</label>
												</div>
												<div class="col-md-4 showcase_content_area">
													<input type="text" name="tm_text" class="form-control" id="tm_text"
														placeholder="메뉴명">
												</div>
												<div class="col-md-2 showcase_text_area">
													<label for="inputType2">구분</label>
												</div>
												<div class="col-md-4 showcase_content_area">
													<select class="custom-select" name="tm_div">
														<option selected>선택해주세요.</option>
														<option value="1">회원</option>
														<option value="2">직원</option>
														<option value="3">관리자</option>
													</select>
												</div>
											</div>
											<div class="form-group row showcase_row_area">
												<div class="col-md-2 showcase_text_area">
													<label for="inputType3">주소</label>
												</div>
												<div class="col-md-6 showcase_content_area">
													<input type="text" class="form-control" id="inputType3"
														placeholder="주소">
												</div>
											</div>

											<div class="form-group row showcase_row_area">
												<div class="col-md-2 showcase_text_area">
													<label for="inputType4">사용 여부</label>
												</div>
												<div class="col-md-9 showcase_content_area">
													<div class="form-inline">
														<div class="radio mb-3">
															<label class="radio-label mr-3"> 
															<input name="tm_use" type="radio" value="y">사용<i class="input-frame"></i>
															</label>
														</div>
														<div class="radio mb-3">
															<label class="radio-label"> 
															<input name="tm_use" type="radio" value="n" checked="checked">사용안함<i class="input-frame"></i>
															</label>
														</div>
													</div>
												</div>
											</div>
											
											<div class="form-group row showcase_row_area">
												<div class="col-md-2 showcase_text_area">
													<label for="inputType4">상위 메뉴 여부</label>
												</div>
												<div class="col-md-9 showcase_content_area">
													<div class="form-inline">
														<div class="radio mb-3">
															<label class="radio-label mr-3"> 
															<input name="tm_parentYN" type="radio" id="tm_parentY" value="y" onchange="setDisplay()" checked="checked">있음
															<i class="input-frame"></i>
															</label>
														</div>
														<div class="radio mb-3">
															<label class="radio-label"> 
															<input name="tm_parentYN" type="radio" id="tm_parentN" value="n" onchange="setDisplay()">없음
															<i class="input-frame"></i>
															</label>
														</div>
													</div>
												</div>
											</div>
											
											<div class="form-group row showcase_row_area" id="showSelect">
												<div class="col-md-2 showcase_text_area">
													<label for="inputType2">상위메뉴</label>
												</div>
												<div class="col-md-4 showcase_content_area">
													<select class="custom-select" name="tm_parent">
														<option selected>선택해주세요.</option>
														<option value="1">회원</option>
														<option value="2">직원</option>
														<option value="3">관리자</option>
													</select>
												</div>
											</div>

											<div class="form-group row showcase_row_area"></div>
											<div class="row">
												<div class="form-group showcase_row_area"
													style="margin-left: 520px;">
													<button type="submit"
														class="btn btn-warning btn-sm has-icon">
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
							<!-- 서치버튼 추가 -->
							<div>
								<form action="#">
									<div class="form-group row showcase_row_area">
										<div class="col-md-4 showcase_content_area"
											style="margin-left: 690px;">
											<input type="text" class="form-control" id="inputType10"
												placeholder="Search">

										</div>
										<button type="reset"
											class="btn action-btn btn-sm btn-like btn-outline-danger btn-rounded">
											<i class="mdi mdi-arrow-right-bold"></i>
										</button>
									</div>
								</form>
							</div>
							<div class="table-responsive">
								<table class="table info-table">

									<thead>
										<tr>
											<th>번호</th>
											<th>구분</th>
											<th>메뉴명</th>
											<th>담당직원</th>
											<th>상위 메뉴명</th>
											<th>주소</th>
											<th>사용여부</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${topMenuList}" var="topMenuList">
										<tr>
											<td>${topMenuList.tm_num}</td>
											<td>${topMenuList.tm_div}</td>
											<td>${topMenuList.tm_text}</td>
											<td>${topMenuList.e_num}</td>
											<td>${topMenuList.tm_parent}</td>
											<td>${topMenuList.tm_url}</td>
											<td>${topMenuList.tm_use}</td>
											<td class="actions">
												<button type="button"
													class="btn btn-trasnparent action-btn btn-xs component-flat pr-0"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">
													<i class="mdi mdi-dots-vertical"> </i>
												</button>
												<div class="dropdown-menu dropdown-menu-right">
													<button type="button" name="updateMovenb_num" value="${topMenuList.tm_num}" class="dropdown-item button">수정하기</button> 
													<a class="dropdown-item" href="<%=request.getContextPath()%>/administer/deleteMenu?tm_num=${topMenuList.tm_num}">삭제하기</a>
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