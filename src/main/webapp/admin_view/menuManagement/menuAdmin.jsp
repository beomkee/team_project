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

function setDisplay() {
	if ($('input:radio[id=tm_parentY]').is(':checked')) {
		$('#showSelect').show();
	} else if ($('input:radio[id=tm_parentN]').is(':checked')) {
		$('#showSelect').hide();
	} else {
		$('#showSelect').hide();
	}
}
	$(document).ready(function(e) {
		//값 가져오기
		$('.button').click(function() {
			var tmNum = $(this).attr('value');
			var yes="y";
			var no="n";
			$.ajax({
				url : "${pageContext.request.contextPath}/administer/getMenu",
				type : "GET",
				data : {
					"tm_num" : $(this).val()
				},
				dataType : "json",
				success : function(data) {
					console.log(data.getTm_num);
					$('input[name=tm_num]').attr('value', data.getTm_num);
					$('input[name=tm_text]').attr('value', data.getTm_text);
					$('input[name=tm_div]').attr('value', data.getTm_div);
					$('input[name=tm_url]').attr('value', data.getTm_url);

					if (data.getTm_use == yes) {
						$("input:radio[name='tm_use']:radio[value='y']").prop('checked', true);
						$("input:radio[name='tm_use']:radio[value='n']").prop('checked', false);
					} else if(data.getTm_use==no) {
						$("input:radio[name='tm_use']:radio[value='y']").prop('checked', false);
						$("input:radio[name='tm_use']:radio[value='n']").prop('checked', true);
					} else{
						
					}

					if ((data.getTm_parent) != 0) {
						$("input:radio[name='tm_parentYN']:radio[value='y']").prop('checked', true);
						$("input:radio[name='tm_parentYN']:radio[value='n']").prop('checked', false);
						$("#tm_parent").val(data.getTm_parent).prop("selected", true);
						
					} else {
						$("input:radio[name='tm_parentYN']:radio[value='y']").prop('checked', false);
						$("input:radio[name='tm_parentYN']:radio[value='n']").prop('checked', true);
						$('#showSelect').hide();
					}

				},
				error : function() {

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
										<form name="WriteMenu" method="post" id="WriteMenu"
											action="<%=request.getContextPath()%>/administer/writeMenu">
											<div class="form-group row showcase_row_area">
												<input type="hidden" name="tm_num" value="0">
												<div class="col-md-2 showcase_text_area">
													<label for="inputType1">메뉴</label>
												</div>
												<div class="col-md-4 showcase_content_area">
													<input type="text" name="tm_text" class="form-control"
														id="tm_text" placeholder="메뉴명">
												</div>
												<div class="col-md-2 showcase_text_area">
													<label for="inputType2">구분</label>
												</div>
												<div class="col-md-4 showcase_content_area">
													<input type="text" name="tm_div" class="form-control"
														id="tm_div" placeholder="구분">
												</div>
											</div>
											<div class="form-group row showcase_row_area">
												<div class="col-md-2 showcase_text_area">
													<label for="tm_url">주소</label>
												</div>
												<div class="col-md-6 showcase_content_area">
													<input type="text" class="form-control" id="tm_url"
														name="tm_url" placeholder="주소">
												</div>
											</div>

											<div class="form-group row showcase_row_area">
												<div class="col-md-2 showcase_text_area">
													<label for="tm_use">사용 여부</label>
												</div>
												<div class="col-md-9 showcase_content_area">
													<div class="form-inline">
														<div class="radio mb-3">
															<label class="radio-label mr-3"> <input
																name="tm_use" id="tm_useY" type="radio" value="y">사용<i
																class="input-frame"></i>
															</label>
														</div>
														<div class="radio mb-3">
															<label class="radio-label"> <input name="tm_use"
																id="tm_useN" type="radio" value="n" checked="checked">사용안함<i
																class="input-frame"></i>
															</label>
														</div>
													</div>
												</div>
											</div>

											<div class="form-group row showcase_row_area">
												<div class="col-md-2 showcase_text_area">
													<label for="tm_parentYN">상위 메뉴 여부</label>
												</div>
												<div class="col-md-9 showcase_content_area">
													<div class="form-inline">
														<div class="radio mb-3">
															<label class="radio-label mr-3"> <input
																name="tm_parentYN" type="radio" id="tm_parentY"
																value="y" onchange="setDisplay()" checked="checked">있음
																<i class="input-frame"></i>
															</label>
														</div>
														<div class="radio mb-3">
															<label class="radio-label"> <input
																name="tm_parentYN" type="radio" id="tm_parentN"
																value="n" onchange="setDisplay()">없음 <i
																class="input-frame"></i>
															</label>
														</div>
													</div>
												</div>
											</div>

											<div class="form-group row showcase_row_area" id="showSelect">
												<div class="col-md-2 showcase_text_area">
													<label for="tm_parent">상위메뉴</label>
												</div>
												<div class="col-md-4 showcase_content_area">
													<select class="custom-select" name="tm_parent" id="tm_parent">
														<c:forEach items="${topMenuList}" var="topMenuList">
															<c:if test="${topMenuList.tm_depth==1}">
																<option value="${topMenuList.tm_num}">${topMenuList.tm_text}</option>
															</c:if>
															<c:if test="${topMenuList.tm_depth!=1}">
															</c:if>
														</c:forEach>
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
							<div class="table-responsive">
								<table class="table info-table">

									<thead>
										<tr>
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
														<button type="button" name="updateMove"
															value="${topMenuList.tm_num}"
															class="dropdown-item button">수정하기</button>
														<a class="dropdown-item"
															href="<%=request.getContextPath()%>/administer/deleteMenu?tm_num=${topMenuList.tm_num}">삭제하기</a>
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