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
		<div id="" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">
						<%-- ******* Main Code HERE ******* --%>

						<div id="main-content">
							<div class="page-heading">
								<section class="section">

									<div class="row justify-content-md-center mb-2">
										<div class="col-md-9 col-12">
											<div class="row">
												<div class="col-6 col-md-6 order-md-1 order-last">
													<h3>찜한 내용</h3>

												</div>
											</div>
										</div>
									</div>

									<div class="row justify-content-md-center">
										<div class="col-md-9 col-12">
											<div class="card">
												<div class="card-header"></div>
												<div class="card-content">
													<div class="card-body">
														<div class="container">
															<div class="row row-cols-3">

																<c:forEach var="favorite" items="${favoriteResult}">
																	<div class="col">
																		<div class="card bg-light">
																			<div class="card-content">
																				<img class="img-fluid card-img-top w-100"
																					style="height: 220px;"
																					src="/sharelocation/resources/spaceimage/${favorite.mainimage}">
																				<div class="card-body">
																					<div class="row">
																						<div class="col-md-8">
																							<h4 class="card-title">${favorite.num}</h4>
																							<h4 class="card-title">${favorite.name}</h4>
																							<input type="hidden" value="${favorite.num}">
																							<h4 class="card-title">${favorite.type}</h4>
																							<h4 class="card-title">${favorite.contentssim}</h4>
																							<h4 class="card-title">${favorite.address}</h4>
																						</div>

																					</div>
																					<p class="card-text">
																						<span class="badge bg-light-info"
																							style="font-weight: normal; font-size: 12px;">${favorit.tag}</span>
																					</p>
																				</div>
																			</div>
																			<div
																				class="card-footer d-flex justify-content-between bg-light">
																				<button onclick="viewDetail(${favorite.num})"
																					class="btn btn-light-primary">detail</button>
																				<button class="btn btn-light-danger"
																					onclick="favorite(${favorite.num},${membernum})">삭제</button>
																			</div>
																		</div>
																	</div>
																</c:forEach>
															</div>
														</div>
													</div>
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
