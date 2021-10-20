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
						<div class="row justify-content-md-center">
							<div class="col-8">
								<div class="card">
										<div class="card-body">
											<h4>도움말</h4>
											<c:if test="${empty helpBoard }"> 등록된 도움말이 없습니다.</c:if>
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th style="width:10%;">번호</th>
															<th style="width:10%;">작성자</th>
															<th style="width:15%;">분류</th>
															<th>제목</th>
															<th style="width:25%">작성일</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="help" items="${helpBoard}"  varStatus="vs">
															<tr>
																<td class="text-bold-500" width="200px">${pageInfo.totalCount - ((pageInfo.pageNumber-1) * pageInfo.pageSize) - vs.count + 1}</td>
																<td class="text-bold-500" width="200px">${help.writer }</td>
																<td class="text-bold-500" width="200px">${help.category }</td>
																<td width="auto"><a
																	href="detailViewHelpBoard.hb?num=${help.num}">${help.title }</a></td>
																<td>
																	<fmt:parseDate var="regDate" value="${help.regdate }" pattern="yyyy-MM-dd HH:mm"/>
																	<fmt:formatDate value="${regDate }" pattern="yyyy/MM/dd HH:mm"/>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<div class="d-flex justify-content-between mb-3">
												<div class="left-side"></div>
												<div class="center-side">
													<div class="row justify-content-center">
														<form class="m-0 p-0" action="helpBoardList.hb" method="get"
															style="width: 500px">
															<div class="input-group ms-auto">
																<select name="whatColumn" class="input-group-text">
																	<option value="%%">전체종류</option>
																	<c:forEach var="category" items="${category}">
																		<option value="${category}">${category}</option>
																	</c:forEach>
																</select> <input type="text" class="form-control"
																	placeholder="도움말 내용 검색하세요." name="keyword"> <input
																	type="submit" value="검색"
																	class="btn btn-outline-secondary">
															</div>
														</form>
													</div>
												</div>
												<div class="right-side">
													<c:if test="${id eq 'admin'}">
														<button class="btn btn-outline-secondary" type="button"
															onClick="location.href='insertHelpBoard.hb'">글쓰기</button>
													</c:if>
												</div>
											</div>
											<c:if test="${not empty helpBoard }">
												<div class="page-nav d-flex justify-content-center">
													<nav>
														<ul class="pagination pagination-primary">
															<c:if test="${pageInfo.beginPage eq 1 }">
																<li class="page-item disabled"><a
																	class="page-link">이전</a></li>
															</c:if>
															<c:if test="${pageInfo.beginPage ne 1 }">
																<c:set var="url"
																	value="${pageInfo.url }?pagenumber=${pageInfo.beginPage -1 }" />
																<li class="page-item"><a class="page-link"
																	href="${url }">이전</a></li>
															</c:if>
															<c:forEach var="i" begin="${pageInfo.beginPage }"
																end="${pageInfo.endPage }">
																<c:set var="url"
																	value="${pageInfo.url }?pagenumber=${i }" />
																<c:if test="${i eq pageInfo.pageNumber }">
																	<li class="page-item active"><a
																		class="page-link">${i }</a></li>
																</c:if>
																<c:if test="${i ne pageInfo.pageNumber }">
																	<li class="page-item"><a class="page-link"
																		href="${url }">${i }</a></li>
																</c:if>
															</c:forEach>
															<c:if test="${pageInfo.endPage eq pageInfo.totalPage }">
																<li class="page-item disabled"><a
																	class="page-link">다음</a></li>
															</c:if>
															<c:if test="${pageInfo.endPage ne pageInfo.totalPage }">
																<c:set var="url"
																	value="${pageInfo.url }?pagenumber=${pageInfo.endPage +1 }" />
																<li class="page-item"><a class="page-link"
																	href="${url }">다음</a></li>
															</c:if>
														</ul>
													</nav>
												</div>
											</c:if>
										</div>
									</div>
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


		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>