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
    justify-content: center!important;
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
											<button type="button"
												class="btn btn-primary btn-lg dropdown-toggle dropdown-toggle-split"
												data-bs-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<span class="sr-only">전체&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</span>
											</button>
											<div class="dropdown-menu" style="margin: 0px;">
												<a class="dropdown-item" href="#">취소환불</a> <a
													class="dropdown-item" href="#">예약확정</a> <a
													class="dropdown-item" href="#">Option 3</a>
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
											<c:if test="${reservationLists.size() eq 0 }">
												예약내역이 없습니다.
											</c:if>
											<c:if test="${ reservationLists.size() ne 0 }">
												예약내역이 ${reservationLists.size() }개 있습니다.
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
																		src="<%=request.getContextPath()%>/resources/spaceimage/${dsp.mainimage}"
																		class="img-fluid h-100 rounded-start">
																</div>
																<div class="col-md-8">
																	<div class="card-body">
																		<c:if test="${reservation.status eq '예약확정' }">
																			<span class="badge bg-primary">${reservation.status }</span>
																		</c:if>
																		<c:if test="${reservation.status eq '취소환불' }">
																			<span class="badge bg-danger">${reservation.status }</span>
																		</c:if>
																		<p class="card-text">${reservation.applicationdate }
																			${reservation.checkin}시~${reservation.checkout}시</p>
																	</div>
																	<div
																		class="card-footer d-flex justify-content-between bg-light p-2 px-3">
																		<div class="left-side">
																			<button class="btn btn-sm btn-light-primary">
																				<fmt:formatNumber value="${reservation.amounts}"
																					pattern="###,###" />
																				원
																			</button>
																		</div>
																		<div class="right-side">
																			<button class="btn btn-sm btn-danger"
																				onClick="deleteReserv(${reservation.num})">예약취소</button>
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
										
										<nav aria-label="Page navigation example">
											<ul class="pagination pagination-primary justify-content-center" >
												<li class="page-item"><a class="page-link" href="#">
														<span aria-hidden="true"><i
															class="bi bi-chevron-left"></i></span>
												</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item active"><a class="page-link"
													href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">
														<span aria-hidden="true"><i
															class="bi bi-chevron-right"></i></span>
												</a></li>
											</ul>
										</nav>
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
			function deleteReserv(num){
				alert(num);
 				location.href="reservationdelete.rv?num="+num;
			}
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>