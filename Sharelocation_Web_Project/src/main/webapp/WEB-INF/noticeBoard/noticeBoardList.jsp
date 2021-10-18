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
		<div id="" style="padding-top: 0px;">
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
													<h4>공지 사항</h4>

													<c:if test="${empty noticeBoard }"> 등록된 공지사항이 없습니다.</c:if>
													<div class="col-12">
														<div class="card">
															<div class="card-content">
																<div class="card-body"></div>
																<!-- table head dark -->
																<div class="table-responsive">
																	<div class="d-flex justify-content-end">
																		<c:if test="${id eq 'admin'}">
																			<button type="button"
																				class="btn btn-sm btn-outline-success"
																				onClick="location.href='insertNoticeBoard.nb'">삽입하기</button>
																		</c:if>
																	</div>
																	<table class="table mb-0">
																		<thead class="thead-dark">
																			<tr>
																				<th>번호</th>
																				<th>작성자</th>
																				<th>제목</th>
																				<th>작성일</th>
																			</tr>
																		</thead>
																		<tbody>
																			<c:forEach var="notice" items="${noticeBoard}"  varStatus="vs">
																				<tr>
																					<td class="text-bold-500" width="200px">${pageInfo.totalCount - ((pageInfo.pageNumber-1) * pageInfo.pageSize) - vs.count + 1}</td>
																					<td class="text-bold-500" width="200px">${notice.writer }</td>
																					<td width="600px"><a
																						href="detailViewNoticeBoard.nb?num=${notice.num}">${notice.subject }</a></td>
																					<td>${notice.regdate }</td>
																					<td><input type = "hidden" name ="spacenum" value="${notice.num}"></td>
																				</tr>
																			</c:forEach>
																		</tbody>
																	</table>

																</div>
															</div>
														</div>
													</div>
													<!-- 페이징 시작 -->
													<c:if test="${not empty noticeBoard }">
														<div class="page-nav d-flex justify-content-center">
															<nav>
																<ul class="pagination pagination-primary">
																	<c:if test="${pageInfo.beginPage eq 1 }">
																		<li class="page-item disabled"><a
																			class="page-link">이전</a></li>
																	</c:if>
																	<c:if test="${pageInfo.beginPage ne 1 }">
																		<c:set var="url"
																			value="${pageInfo.url }?pagenumber=${pageInfo.beginPage -1 }&spacenum=${spacenum }" />
																		<li class="page-item"><a class="page-link"
																			href="${url }">이전</a></li>
																	</c:if>
																	<c:forEach var="i" begin="${pageInfo.beginPage }"
																		end="${pageInfo.endPage }">
																		<c:set var="url"
																			value="${pageInfo.url }?pagenumber=${i }&spacenum=${spacenum }" />
																		<c:if test="${i eq pagenumber }">
																			<li class="page-item active"><a
																				class="page-link">${i }</a></li>
																		</c:if>
																		<c:if test="${i ne pagenumber }">
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
																			value="${pageInfo.url }?pagenumber=${pageInfo.endPage +1 }&spacenum=${spacenum}" />
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


		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>