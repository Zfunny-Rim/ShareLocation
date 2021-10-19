<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IPS partagé</title>
<%@ include file="/WEB-INF/views/include/head_css.jsp"%>
<%
String[] category = new String[]{"회원", "예약 및 결제", "취소 및 환불", "공간이용 및 후기", "기타"};
request.setAttribute("category", category);
%>

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
.ck-editor__editable{
	min-height: 250px;
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
						<section id="basic-vertical-layouts">
							<div class="row justify-content-md-center">
								<div class="col-md-8 col-12">
									<div class="card">
										<div class="card-header">
											<h4 class="card-title">도움말 입력</h4>
										</div>
										<div class="card-content">
											<div class="card-body">
												<form class="form form-vertical" action="insertHelpBoard.hb"
													method="post">
													<input type="hidden" name="writer" value="${loginInfo.nickname }">
													<input type="hidden" name="membernum" value="${loginInfo.num }">
													<input type="hidden" name="type" value="${loginInfo.type }">
													<div class="form-body">
														<div class="row">
															<label><b>작성자&nbsp;&nbsp;</b>${loginInfo.nickname }</label>
															<br><br>
															<div class="col-12 mb-2">
																<label><b>종류</b></label>
															</div>
															<div class="col-md-12 form-group">
																<select name="category">
																	<option value="">선택하세요</option>
																	<c:forEach var="category" items="${category}">
																		<option value="${category}"
																			<c:if test ="">selected</c:if>>${category}</option>
																	</c:forEach>
																</select>
															</div>
															<div class="col-12 mb-2">
																<label><b>제목</b></label>
															</div>
															<div class="col-md-12 form-group">
																<input type="text" id="subject"
																	class="form-control" name="title">
															</div>
															<div class="col-12 mb-2">
																<label><b>내용</b></label>
															</div>
															<br><br>
															<div class="col-md-12 form-group">
																<textarea class="form-control" id="editor" name="content"></textarea>
															</div>
															<br><br>
															<div class="col-12 d-flex justify-content-end">
																<input type="submit" class="btn btn-primary me-1 mb-1"
																	onClick="return processing()" value="확인"> <input
																	type="button" class="btn btn-light-secondary me-1 mb-1"
																	onClick="javascript:history.back()" value="취소">
															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						
						
						
						
						<div id="main-content">
							<div class="page-heading">
								<section class="section">

									<div class="row justify-content-md-center">
										<div class="card mb-2">
											<div class="card-content">
												<div class="card-body">
													<h4>공지사항 입력</h4>
													<form:form commandName="helpBoardBean"
														action="insertHelpBoard.hb" method="post">
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
																		value="${id}"> <input type="hidden"
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
																	<select name="category">
																		<option value="">선택하세요</option>
																		<c:forEach var="category" items="${category}">
																			<option value="${category}"
																				<c:if test ="">selected</c:if>>${category}</option>
																		</c:forEach>
																	</select>

																	<form:errors cssClass="err" path="category" />
																	<p>
																		<small class="text-muted"> </small>
																	</p>
																</div>
																<div class="col-md-4">
																	<label>제목 <span class="required">*</span>
																	</label>
																</div>

																<div class="col-md-8 form-group">
																	<input type="text" class="form-control" name="title">
																	<p>
																		<small class="text-muted"><form:errors cssClass="err" path="title" /> </small>
																	</p>
																</div>

																<!-- 입력 2 start -->
																<div class="col-md-4">
																	<label>공지 내용 <span class="required">*</span></label>
																</div>
																<div class="col-md-8 form-group">
																	<textarea class="form-control" rows="3" name="content"
																		style="margin-top: 0px; margin-bottom: 0px; height: 170px; resize: none;"
																		placeholder="공지 내용 쓰기"></textarea>
																	<p>
																		<small class="text-muted"> <form:errors
																				cssClass="err" path="content" />
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
																		<button class="btn btn-sm btn-outline-success"
																			onclick="listHelp()">목록</button>
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
		<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
		<script type="text/javascript">
			function insert() {
				location.href = "insertHelpBoard.hb";
			}
			
			function listHelp(){
				//alert();
				location.href="helpBoardList.hb";
			}
			
			var myEditor;
			ClassicEditor
	          .create( document.querySelector( '#editor' ) )
	          .then(editor => {
	          console.log('Editor was initialized', editor);
	          myEditor = editor;
	          })
	          .catch( error => {
	              console.error( error );
	          } );
			function processing(){
				if($("#subject").val()==""){
					alert("제목을 입력하세요");
					$("#subject").focus();
					return false;
				}
				if(myEditor.getData()==""){
					alert("내용을 입력하세요");
					$("#editor").focus();
					return false;
				}
				return true;
			}
		</script>

		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>