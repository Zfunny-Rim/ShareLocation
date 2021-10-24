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
<style type="text/css">
tr th {
	align-items: center;
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
		<div id="" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">


						<%-- ******* Main Code HERE ******* --%>
						<section id="basic-vertical-layouts">
							<div class="row justify-content-md-center">
								<div class="col-md-8 col-12">
									<div class="card">
										<div class="card-header">
											<h4 class="card-title">도움말 수정</h4>
										</div>
										<div class="card-content">
											<div class="card-body">
												<form action="updateHelp.hb?num=${helpBoard.num}" method="post">
													<input type="hidden" name="num" value="${noticeBoard.num}">
													<input type="hidden" name="writer" value="${loginInfo.nickname }">
													<input type="hidden" name="membernum" value="${loginInfo.num }">
													<input type="hidden" name="type" value="${loginInfo.type }">
													<div class="form-body">
														<div class="row">
															<label><b>작성자&nbsp;&nbsp;</b>${loginInfo.nickname }</label>
															<br><br>
															<div class="col-12 mb-2">
																<label><b>분류</b></label>
															</div>
															<div class="col-md-12 form-group">
																<select name="category">
																	<option value="">선택하세요</option>
																	<c:forEach var="category" items="${category}">
																		<option value="${category}"
																			<c:if test ="${category eq helpBoard.category }">selected</c:if>>${category}</option>
																	</c:forEach>
																</select>
															</div>
															<div class="col-12 mb-2">
																<label><b>제목</b></label>
															</div>
															<div class="col-md-12 form-group">
																<input type="text" id="subject"  value="${helpBoard.title}"
																	class="form-control" name="subject">
															</div>
															<div class="col-12 mb-2">
																<label><b>내용</b></label>
															</div>
															<br><br>
															<div class="col-md-12 form-group">
																<textarea class="form-control" id="editor" name="content">${helpBoard.content}</textarea>
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
						<%-- ******* Main Code END ******* --%>
					</section>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script type="text/javascript">
			function insert() {
				location.href = "insertNoticeBoard.nb";
			}
			
			function listNotice(){
				//alert();
				location.href="noticeBoardList.nb";
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
		<script type="text/javascript">
			function insert() {
				location.href = "insertHelpBoard.nb";
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