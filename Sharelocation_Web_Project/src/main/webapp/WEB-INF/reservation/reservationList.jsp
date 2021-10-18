<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IPS partagé</title>
<%@ include file="/WEB-INF/views/include/head_css.jsp"%>
<%-- ******* CUSTOM CSS Link HERE ******* --%>
<style type="text/css">
.dropdown-menu {
	min-width: 13rem;
}

.btn-primary {
	color: #fff;
	background-color: #435ebe;
	border-color: #435ebe;
}

dl, ol, ul {
	margin-top: 0;
	margin-bottom: 2rem;
}

.justify-content-center {
	justify-content: center !important;
}

.btn-outline-primary {
	color: #fff;
	border-color: #fff;
}
</style>
<%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp"%>
		<%@ include file="/WEB-INF/views/include/body_sidebar_host.jsp"%>
		<div id="main" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">
						<%-- ******* Main Code HERE ******* --%>
						<h3 align="center">예약 내역 리스트</h3>
						<br> <br>
						<div class="row justify-content-md-center mb-2">
							<div class="col-md-9 col-12">
								<div class="row">
									<div class="col-6 col-md-6 order-md-1 order-last"></div>
									<div class="col-6 col-md-6 order-md-2 order-first">
										<div
											class="btn-group dropdown me-1 mb-1 breadcrumb-header float-start float-lg-end">
											<div class="d-flex justify-content-end">
												<div class="d-flex filter">
													<form action="reservList.rv" method="get">
														<input type="hidden" name="whatColumn" value="status">
														<input type="hidden" name="membernum" value="${loginInfo.num}">
														<div class="input-group">
															<select class="form-control" name="keyword"
																style="font-size: 12px;">
																<option value="%">전체보기</option>
																<option value="예약대기"
																	<c:if test="${param.keyword eq '예약대기'}">
																			selected
																	</c:if>>예약대기</option>
																<option value="입금대기"
																	<c:if test="${param.keyword eq '입금대기'}">
																			selected
																	</c:if>>입금대기</option>
																<option value="예약확정"
																	<c:if test="${param.keyword eq '예약확정'}">
																			selected
																	</c:if>>예약확정</option>
																<option value="이용완료"
																	<c:if test="${param.keyword eq '이용완료'}">
																			selected
																	</c:if>>이용완료</option>
																<option value="예약취소"
																	<c:if test="${param.keyword eq '예약취소'}">
																			selected
																	</c:if>>예약취소</option>
															</select>
															<button class="btn btn-sm btn-primary" type="submit">검색</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row justify-content-md-center">
							<div class="col-md-9 col-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">예약 내역 리스트</h4>
									</div>
									<div class="card-content">
										<div class="card-body">
											<c:if test="${empty reservationLists }">
												예약이 없습니다.
											</c:if>
											<c:if test="${not empty reservationLists }">
												조회된 예약이 총 ${totalCount }개 있습니다.
											</c:if>
										</div>
										<div class="container">
											<div class="row row-cols-2">
												<c:forEach var="reservation" items="${reservationLists }">
													<div class="col-md-6">
														<div class="card bg-light mx-auto"
															style="max-width: 640px;">
															<div class="row g-0">
																<div class="col-md-4">
																	<img
																		src="<%=request.getContextPath()%>/resources/spaceimage/${spacebean.mainimage}"
																		class="img-fluid h-100 rounded-start">
																</div>
																<div class="col-md-8">
																	<div class="card-body">
																		<c:if test="${reservation.status eq '예약대기' }">
																			<span class="badge bg-warning res-stat">${reservation.status }</span>
																		</c:if>
																		<c:if test="${reservation.status eq '입금대기' }">
																			<span class="badge bg-info res-stat">${reservation.status }</span>
																		</c:if>
																		<c:if test="${reservation.status eq '예약확정' }">
																			<span class="badge bg-success res-stat">${reservation.status }</span>
																		</c:if>
																		<c:if test="${reservation.status eq '이용완료' }">
																			<span class="badge bg-primary res-stat">${reservation.status }</span>
																		</c:if>
																		<c:if test="${reservation.status eq '예약취소' }">
																			<span class="badge bg-danger">${reservation.status }</span>
																		</c:if>
																		<p></p>
																		<h5>
																		${spacebean.name},${detailSpacebean.name}
																		</h5>
																		<p class="card-text">
																			<fmt:parseDate var="ciDate" value="${reservation.checkin}" pattern="yyyy-MM-dd HH:mm"/>
																			<fmt:formatDate  value="${ciDate}" pattern="yyyy년 MM월 dd일 HH시"/>
																			~ 
																			<fmt:parseDate var="coDate" value="${reservation.checkout }" pattern="yyyy-MM-dd HH:mm"/>
																			<fmt:formatDate  value="${coDate}" pattern="yyyy년 MM월 dd일 HH시"/>
																		</p>
																	</div>
																	<div
																		class="card-footer d-flex justify-content-between bg-light p-2 px-3">
																		<div class="left-side">
																			<button class="btn btn-sm btn-light-primary">
																				<fmt:formatNumber value="${reservation.amounts}"
																					pattern="###,###" />
																				원
																			</button>
																			<button class="btn btn-sm btn-light-primary"
																				onClick="reservView(${reservation.num},${reservation.detailspacenum})">
																				예약보기</button>
																		</div>
																		<c:if test="${reservation.status != '예약취소' && reservation.status != '이용완료'}">
																			<button type="button"
																			class="btn btn-outline-primary block bg-danger"
																			data-bs-toggle="modal" data-bs-backdrop="false"
																			data-bs-target="#backdrop">예약취소
																			</button>
																		</c:if>
																		<div class="modal fade text-left" id="backdrop"
																			tabindex="-1" aria-labelledby="myModalLabel4"
																			style="display: none;" aria-hidden="true">
																			<div
																				class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
																				role="document">
																				<div class="modal-content">
																					<div class="modal-header">
																						<h4 class="modal-title" id="myModalLabel4">
																							예약 취소</h4>
																						<button type="button" class="close"
																							data-bs-dismiss="modal" aria-label="Close">
																							<i data-feather="x"></i>
																						</button>
																					</div>
																					<div class="modal-body">
																						<p>예약을 취소하시겠습니까?</p>
																					</div>
																					<div class="modal-footer">
																						<button type="button"
																							class="btn btn-light-secondary"
																							data-bs-dismiss="modal">
																							<i class="bx bx-x d-block d-sm-none"></i> <span
																								class="d-none d-sm-block">Close</span>
																						</button>
																						<button type="button" class="btn btn-primary ml-1"
																							data-bs-dismiss="modal"
																							onClick="deleteReserv(${reservation.num},${pageNumber})">
																							<i class="bx bx-check d-block d-sm-none"></i> <span
																								class="d-none d-sm-block">Accept</span>
																							<!-- 확인누를시 예약취소됌 -->
																						</button>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
										<!--  페이지 -->

										<c:if test="${not empty reservationLists }">
											<div class="page-nav d-flex justify-content-center">
												<nav>
													<ul class="pagination pagination-primary">
														<c:if test="${pageInfo.beginPage eq 1 }">
															<li class="page-item disabled"><a class="page-link">이전</a></li>
														</c:if>
														<c:if test="${pageInfo.beginPage ne 1 }">
															<c:set var="url"
																value="${pageInfo.url }?pageNumber=${pageInfo.beginPage -1 }&spaceNum=${spaceNum }" />
															<li class="page-item"><a class="page-link"
																href="${url }">이전</a></li>
														</c:if>
														<c:forEach var="i" begin="${pageInfo.beginPage }"
															end="${pageInfo.endPage }">
															<c:set var="url"
																value="${pageInfo.url }?pageNumber=${i }&spaceNum=${spaceNum }" />
															<c:if test="${i eq pageNumber }">
																<li class="page-item active"><a class="page-link">${i }</a></li>
															</c:if>
															<c:if test="${i ne pageNumber }">
																<li class="page-item"><a class="page-link"
																	href="${url }">${i }</a></li>
															</c:if>
														</c:forEach>
														<c:if test="${pageInfo.endPage eq pageInfo.totalPage }">
															<li class="page-item disabled"><a class="page-link">다음</a></li>
														</c:if>
														<c:if test="${pageInfo.endPage ne pageInfo.totalPage }">
															<c:set var="url"
																value="${pageInfo.url }?pageNumber=${pageInfo.endPage +1 }&spaceNum=${spaceNum }" />
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
		<script type="text/javascript">
			function deleteReserv(num,pageNumber){
				//alert(num);
 				location.href="reservationdelete.rv?num="+num+"&pageNumber="+pageNumber;
			}
			function reservView(num,detailspacenum){
				//alert(num,detailspacenum);
 				location.href="reservView.rv?num="+num+"&detailspacenum="+detailspacenum;
			}
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>