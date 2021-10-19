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
											<h4 class="card-title">상세보기</h4>
										</div>
										<div class="card-content">
											<div class="card-body">
													<div class="form-body">
														<div class="row">
															<label>작성자</label>
															<div class="col-md-12 form-group">
																<label>${list.writer }</label>
															</div>
															<br><br>
															<div class="col-12">
																<label>조회수</label>
															</div>
															<div class="col-md-12 form-group">
																<label>${list.readcount }</label>
															</div>
															<br><br>
															<div class="col-12">
																<label>제목</label>
															</div>
															<div class="col-md-12 form-group">
																<label>${list.subject }</label>
															</div>
															<br><br>
															<div class="col-12">
																<label>내용</label>
															</div>
															<div class="col-md-12 form-group">
																<label>${list.content }</label>
															</div>
															<br><br>
															<div class="col-12">
																<label>작성일</label>
															</div>
															<div class="col-md-12 form-group">
																<label>
																	<fmt:parseDate var="parseRegDate" value="${list.regdate }" pattern="yyyy-MM-dd"/>
																	<fmt:formatDate value="${parseRegDate }" pattern="yyyy/MM/dd"/>
																</label>
															</div>
															<br><br>
															<div class="col-12 d-flex justify-content-start">
																<c:if test="${list.writer eq loginInfo.nickname }">
																	<input class="btn btn-primary me-1 mb-1" type="button" value="글수정" onClick="location.href='update.qnaBoard?num=${list.num}&pageNumber=${pageNumber }'">
																	<input class="btn btn-primary me-1 mb-1" type="button" value="글삭제" onClick="location.href='delete.qnaBoard?num=${list.num}&pageNumber=${pageNumber }'">
																</c:if>
																<c:if test="${loginInfo.type eq 'admin' }">
																	<input class="btn btn-primary me-1 mb-1" type="button" value="답글쓰기" onClick="location.href='reply.qnaBoard?num=${list.num}&pageNumber=${pageNumber }'">
																</c:if>
																	<input class="btn btn-primary me-1 mb-1" type="button" value="글목록" onClick="location.href='list.qnaBoard?pageNumber=${pageNumber }'">								
															</div>
														</div>
													</div>
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
		
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>