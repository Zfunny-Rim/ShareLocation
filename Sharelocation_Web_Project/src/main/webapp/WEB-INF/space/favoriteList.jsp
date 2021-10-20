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
.clickable:hover{
	cursor:pointer;
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
										<div class="col-md-8 col-12">
											<div class="card">
												<div class="card-body">
													<h4>찜한공간</h4>
													<section id="content-types" class="mb-3">
														<div class="row">
															<c:if test="${empty favoriteResult }">
																<div style="text-align:center">
																 찜한 공간이 없습니다.
																</div>
															</c:if>
															<c:forEach var="fBean" items="${favoriteResult}">
																<div class="col-xl-4 col-md-6 col-sm-12">
																	<div class="card bg-light clickable"
																		onClick="viewDetail(${fBean.spaceBean.num})">
																		<div class="card-content">
																			<img class="img-fluid card-img-top w-100"
																				style="height: 220px;"
																				src="<%=request.getContextPath()%>/resources/spaceimage/${fBean.spaceBean.mainimage}">
																			<div class="card-body">
																				<div class="row">
																					<div class="col-md-8">
																						<h4 class="card-title">${fBean.spaceBean.name }</h4>
																					</div>
																					<div class="col-md-4" style="text-align: right;">
																					</div>
																				</div>
																				<p class="card-text">
																					<c:set var="tagList"
																						value="${fn:split(fBean.spaceBean.tag, ',')}" />
																					<c:forEach var="tagToken" items="${tagList }">
																						<span class="badge bg-light-info"
																							style="font-weight: normal; font-size: 12px;">#${tagToken
																							}</span>
																					</c:forEach>
																				</p>
																				<p class="card-text">
																					<span style="font-size: 15px">${fBean.spaceBean.contentssim }</span>
																				</p>
																				<p class="card-text">
																					<small class="text-muted">${fBean.spaceBean.address } </small>
																				</p>
																			</div>
																		</div>
																	</div>
																</div>
															</c:forEach>
														</div>
													</section>
													<c:if test="${not empty favoriteResult }">
													<div class="page-nav d-flex justify-content-center">
														<nav>
														    <ul class="pagination pagination-primary">
														    	<c:if test="${pageInfo.beginPage eq 1 }">
															        <li class="page-item disabled"><a class="page-link">이전</a></li>
														    	</c:if>
														    	<c:if test="${pageInfo.beginPage ne 1 }">
														    		<c:set var="url" value="${pageInfo.url }?pageNumber=${pageInfo.beginPage -1 }"/>
															        <li class="page-item"><a class="page-link" href="${url }">이전</a></li>
														    	</c:if>
														    	<c:forEach var="i" begin="${pageInfo.beginPage }" end="${pageInfo.endPage }">
														    	<c:set var="url" value="${pageInfo.url }?pageNumber=${i }"/>
														    		<c:if test="${i eq pageInfo.pageNumber }">
															    		<li class="page-item active"><a class="page-link">${i }</a></li>
														    		</c:if>
														    		<c:if test="${i ne pageInfo.pageNumber }">
															    		<li class="page-item"><a class="page-link" href="${url }">${i }</a></li>
														    		</c:if>
														    	</c:forEach>
														    	<c:if test="${pageInfo.endPage eq pageInfo.totalPage }">
															        <li class="page-item disabled"><a class="page-link">다음</a></li>
														    	</c:if>
														    	<c:if test="${pageInfo.endPage ne pageInfo.totalPage }">
														    	<c:set var="url" value="${pageInfo.url }?pageNumber=${pageInfo.endPage +1 }"/>
															        <li class="page-item"><a class="page-link" href="${url }">다음</a></li>
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
		<script type="text/javascript">
function viewDetail(num){
	//alert(1);
	location.href="detailView.sp?num="+num;
}

function favorite(spacenum,membernum){
	alert(membernum);
	location.href="favorite.sp?spacenum="+spacenum+"&membernum="+membernum;
}


</script>

		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>
