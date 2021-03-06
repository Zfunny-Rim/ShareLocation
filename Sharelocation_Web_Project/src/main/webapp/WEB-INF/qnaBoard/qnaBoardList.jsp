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
<%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp"%>
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp"%>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
		<%
			MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		%>
		<div id="" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section"> 
						<%-- ******* Main Code HERE ******* --%>
						<div class="row justify-content-center">
						<div class="col-8">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">QnA</h4>
								<div class="card-text">
								총게시물 &nbsp;${pageInfo.totalCount }
								</div>
								<div class="table-responsive">
									<table class="table mb-3">
										<thead class="thead-dark">
											<tr>
												<th>No.</th>
												<th>TYPE</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty list }">
											<tr>
												<td colspan="6" style="text-align:center">
													<span class="text-muted">등록된 게시물이 없습니다.</span>
												</td>
											</tr>
											</c:if>
											<c:forEach var="list" items="${list }" varStatus="status">
												<tr>
													<td class="text-bold-500">${pageInfo.totalCount - ((pageInfo.pageNumber-1) * pageInfo.pageSize) - status.count + 1}</td>
													<td class="text-bold-500">${list.type }</td>
													<td>
														<c:if test="${list.relevel > 0 }">
															<c:set var="imgWidth" value="${(list.relevel-1) * 15 }"/>
															<img src="<%=request.getContextPath()%>/resources/assets/images/board/level.gif" width="${imgWidth }" height="20">
															<img src="<%=request.getContextPath()%>/resources/assets/images/board/re.gif">
														</c:if>
														<a href="detailView.qnaBoard?num=${list.num }&pageNumber=${pageInfo.pageNumber }">
														${list.subject }
														</a>
														<c:if test="${article.readcount > 10 }">
															<img src="<%=request.getContextPath()%>/resources/images/hot.gif">
														</c:if>
													</td>
													<td class="text-bold-500">${list.writer }</td>
													<td><fmt:parseDate var="wiriteDate"
															value="${list.regdate }" pattern="yyyy-MM-dd" /> <fmt:formatDate
															value="${wiriteDate }" pattern="yyyy/MM/dd" /></td>
													<td>${list.readcount }</td>
												</tr>
												<input type = "hidden" name ="num" value="${list.num}">
											</c:forEach>
										</tbody>
									</table>
								</div>
								<form action="list.qnaBoard" method="get">
									<div class="d-flex justify-content-between">
										<div class="left-side"></div>
										<div class="center-side">
											<div class="input-group mb-3">
												<select class="form-select" name="whatColumn">
													<option value="all">전체</option>
													<option value="subject">제목</option>
													<option value="writer">작성자</option>
												</select> 
												<input type="text" class="form-control" name="keyword">
												<input type="submit" class="input-group-text" value="검색" >&nbsp;
											</div>
										</div>
										<div class="right-side">
											<button class="btn btn-outline-secondary" type="button"
											onClick="location.href='insert.qnaBoard'">글쓰기</button>
										</div>
									</div>
								</form>
								<div class="page-nav d-flex justify-content-center">
									<nav>
										<ul class="pagination pagination-primary">
											<c:if test="${pageInfo.beginPage eq 1 }">
												<li class="page-item disabled"><a class="page-link">이전</a></li>
											</c:if>
											<c:if test="${pageInfo.beginPage ne 1 }">
												<c:set var="url"
													value="${pageInfo.url }?pagenumber=${pageInfo.beginPage -1 }&whatColumn=${pageInfo.whatColumn }&keyword=${pageInfo.keyword }"/>
												<li class="page-item"><a class="page-link"
													href="${url }">이전</a></li>
											</c:if>
											<c:forEach var="i" begin="${pageInfo.beginPage }"
												end="${pageInfo.endPage }">
												<c:set var="url"
													value="${pageInfo.url }?pagenumber=${i }&whatColumn=${pageInfo.whatColumn }&keyword=${pageInfo.keyword }" />
												<c:if test="${i eq pageInfo.pageNumber }">
													<li class="page-item active"><a class="page-link">${i }</a></li>
												</c:if>
												<c:if test="${i ne pageInfo.pageNumber }">
													<li class="page-item"><a class="page-link"
														href="${url }">${i }</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${pageInfo.endPage eq pageInfo.totalPage }">
												<li class="page-item disabled"><a class="page-link">다음</a></li>
											</c:if>
											<c:if test="${pageInfo.endPage ne pageInfo.totalPage }">
												<c:set var="url"
													value="${pageInfo.url }?pagenumber=${pageInfo.endPage +1 }&whatColumn=${pageInfo.whatColumn }&keyword=${pageInfo.keyword }" />
												<li class="page-item"><a class="page-link"
													href="${url }">다음</a></li>
											</c:if>
										</ul>
									</nav>
								</div>
								
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