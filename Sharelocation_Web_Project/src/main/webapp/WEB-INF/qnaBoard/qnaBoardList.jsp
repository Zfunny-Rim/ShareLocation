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
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">QnA Board(총게시물 &nbsp;
									${pageInfo.totalCount })</h4>
							</div>
							<div>
								<form action="list.qnaBoard" method="get">
									<div class="col-md-3 mb-7 mb-2">
										<div class="input-group mb-3">
											<select class="form-select" name="whatColumn">
												<option value="all">전체</option>
												<option value="subject">제목</option>
												<option value="writer">작성자</option>
											</select> 
											<input type="text" class="form-control" name="keyword">
											<input type="submit" class="input-group-text" value="검색" >&nbsp;
										</div>
										<div class="buttons">
										<c:if test="${not empty loginInfo}">
											<a href="insert.qnaBoard" class="btn btn-outline-dark">글쓰기</a>
										</c:if>
										<c:if test="${empty loginInfo}">
											<a href="miniLogin.member" class="btn btn-outline-dark">글쓰기</a>
										</c:if>
										</div>
									</div>
								</form>
							</div>
							<div class="card-content">
								<div class="table-responsive">
									<table class="table mb-0">
										<thead class="thead-dark">
											<tr>
												<th>No.</th>
												<th>제목</th>
												<th>작성자</th>
												<th>TYPE</th>
												<th>작성일</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list }" varStatus="status">
												<tr>
													<td class="text-bold-500">${pageInfo.totalCount - ((pageInfo.pageNumber-1) * pageInfo.pageSize) - status.count + 1}</td>
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
													<td class="text-bold-500">${list.type }</td>
													<td><fmt:parseDate var="wiriteDate"
															value="${list.regdate }" pattern="yyyy-MM-dd" /> <fmt:formatDate
															value="${wiriteDate }" pattern="yyyy/MM/dd" /></td>
													<td>${list.readcount }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									${pageInfo.pagingHtml }   
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