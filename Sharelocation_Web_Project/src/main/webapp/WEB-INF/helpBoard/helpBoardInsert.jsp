<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IPS partagé</title>
<%@ include file="/WEB-INF/views/include/head_css.jsp"%>
<%-- ******* CUSTOM CSS Link HERE ******* --%>
<link rel="stylesheet"
	href="./resources/assets/vendors/choices.js/choices.min.css">
<style type="text/css">
tr th {
	align-items: center;
}

.err {
	color: red;
	font-weight: bold;
	font-size: 11px;
}

.required {
	color: red;
}
</style>


<%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp"%>
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp"%>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
		<div id="main" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">


						<%-- ******* Main Code HERE ******* --%>

						<div id="main-content">
							<div class="page-heading">
								<section class="section">

									<div class="row justify-content-md-center">
										<div class="card mb-2">
											<div class="card-content">
												<div class="card-body">
													<h4>공지사항 입력</h4>
													<form:form commandName="helpBoardBean" action="insertHelpBoard.hb" method="post">
														<div class="form-body">
															<div class="row">
																<div class="divider">
																	<div class="divider-text">입력란</div>
																</div>
																<!-- 입력 1 start -->
																<div class="col-md-4">
																	<label>작성자 <span class="required">*</span>
																	</label>
																</div>
																<div class="col-md-8 form-group">
																	<input type="text" class="form-control" name="writer"
																		value="${id}"> <input type="text"
																		class="form-control" name="membernum"
																		value="${membernum}">
																	<p>
																		<small class="text-muted"> </small>
																	</p>
																</div>
																<!-- 입력 1 end -->
																<div class="col-md-4">
																	<label>종류<span class="required">*</span>
																	</label>

																</div>
																<div class="col-md-8 form-group">
																	<input type="text" class="form-control" name="category">
																	<form:errors cssClass="err" path="category"/>
																	<p>
																		<small class="text-muted"> 
																		
																		</small>
																	</p>
																</div>
																<!-- 입력 2 start -->
																<div class="col-md-4">
																	<label>공지 내용 <span class="required">*</span></label>
																</div>
																<div class="col-md-8 form-group">
																	<textarea class="form-control" rows="3" name="content"
																		style="margin-top: 0px; margin-bottom: 0px; height: 170px; resize: none;" placeholder="공지 내용 쓰기"></textarea>
																	<p>
																		<small class="text-muted"> 
																		<form:errors cssClass="err" path="content" />
																		</small>
																	</p>
																</div>
																<!-- 입력 2 end -->
																<div class="divider"></div>
																<div class="d-flex justify-content-center">
																	<div>
																		<button class="btn btn-sm btn-outline-success"
																			type="submit">삽입</button>
																		<button class="btn btn-sm btn-outline-success"
																			type="reset">취소</button>
																		<button class="btn btn-sm btn-outline-success" onclick="listHelp()">목록</button>
																	</div>
																</div>

															</div>
														</div>
													</form:form>
												</div>
											</div>
										</div>
									</div>
								</section>
							</div>
						</div>
						<%-- ******* Main Code END ******* --%>
					</section>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script type="text/javascript">
			function insert() {
				location.href = "insertHelpBoard.hb";
			}
			
			function listHelp(){
				//alert();
				location.href="helpBoardList.hb";
			}
		</script>

		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>