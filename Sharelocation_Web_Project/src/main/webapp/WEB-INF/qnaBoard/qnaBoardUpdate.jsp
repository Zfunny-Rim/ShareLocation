<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IPS partagé</title>
    <%@ include file="/WEB-INF/views/include/head_css.jsp" %>
    <%-- ******* CUSTOM CSS Link HERE ******* --%>
<style type="text/css">
.required {
	color: red;
}
</style>
    <%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp" %>
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp" %>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
		<%
			MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		%>
        <div id="" style="padding-top:0px;">
            <div id="main-content">   
                <div class="page-heading">
                    <section class="section">
                    	<%-- ******* Main Code HERE ******* --%>
						<section id="basic-vertical-layouts">
							<div class="row justify-content-md-center">
								<div class="col-md-8 col-12">
									<div class="card">
										<div class="card-header">
											<h4 class="card-title">수정하기</h4>
										</div>
										<div class="card-content">
											<div class="card-body">
												<form class="form form-vertical" action="update.qnaBoard"
													method="post">
													<input type="hidden" name="num" value="${list.num }">
													<input type="hidden" name="pageNumber" value="${pageNumber }">
													<div class="form-body">
														<div class="row">
															<label>작성자</label>
															<div class="col-md-12 form-group">
																<label>${list.writer }</label>
															</div>
															<br><br>
															<div class="col-12">
																<label>제목<span class="required">*</span></label>
															</div>
															<div class="col-md-12 form-group">
																<input type="text" id="subject"
																	class="form-control" name="subject" value="${list.subject }">
															</div>
															<div class="col-12">
																<label>내용<span class="required">*</span></label>
															</div>
															<br><br>
															<div class="col-md-12 form-group">
																<textarea class="form-control" id="content" name="content"  rows="5">${list.content }</textarea>
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
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp" %>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script>
		function processing(){
			if($("#subject").val()==""){
				alert("제목을 입력하세요");
				$("#subject").focus();
				return false;
			}
			if($("#content").val()==""){
				alert("내용을 입력하세요");
				$("#content").focus();
				return false;
			}
			return true;
		}
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>