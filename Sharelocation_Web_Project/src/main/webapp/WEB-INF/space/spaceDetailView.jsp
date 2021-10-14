<%@page import="detailspace.model.DetailSpaceBean"%>
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
.img-fluid1, .img-thumbnail {
	max-width: 70%;
	height: auto;
	margin-left: 20%;
}

.parent {
	width: 90%;
	margin: 10px auto;
}

.first {
	border: 1px solid black;
	float: left;
	width: 30%;
	box-sizing: border-box;
}

.second {
	border: 1px solid black;
	float: left;
	margin-left: 5%;
	width: 30%;
	box-sizing: border-box;
}

.third {
	border: 1px solid black;
	float: right;
	width: 30%;
	box-sizing: border-box;
}

/* 별 스타일 시작*/
element.style {
	width: 160px;
	height: 32px;
	background-size: 32px;
}

.star-rating {
	width: 0;
	position: relative;
	display: inline-block;
	background-image:
		url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDguOSIgaGVpZ2h0PSIxMDMuNiIgdmlld0JveD0iMCAwIDEwOC45IDEwMy42Ij48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6I2UzZTZlNjt9PC9zdHlsZT48L2RlZnM+PHRpdGxlPnN0YXJfMDwvdGl0bGU+PGcgaWQ9IkxheWVyXzIiIGRhdGEtbmFtZT0iTGF5ZXIgMiI+PGcgaWQ9IkxheWVyXzEtMiIgZGF0YS1uYW1lPSJMYXllciAxIj48cG9seWdvbiBjbGFzcz0iY2xzLTEiIHBvaW50cz0iMTA4LjkgMzkuNiA3MS4zIDM0LjEgNTQuNCAwIDM3LjYgMzQuMSAwIDM5LjYgMjcuMiA2Ni4xIDIwLjggMTAzLjYgNTQuNCA4NS45IDg4LjEgMTAzLjYgODEuNyA2Ni4xIDEwOC45IDM5LjYiLz48L2c+PC9nPjwvc3ZnPg0K);
	background-position: 0 0;
	background-repeat: repeat-x;
	cursor: pointer;
}

.star-rating {
	width: 0;
	position: relative;
	display: inline-block;
	background-image: url(star_0.svg);
	background-position: 0 0;
	background-repeat: repeat-x;
	cursor: pointer;
}

*, :after, :before {
	box-sizing: border-box;
}

.star-rating .star-value {
	position: absolute;
	height: 100%;
	width: 100%;
	background:
		url(data:image/svg+xml;base64,PHN2Zw0KCXhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwOC45IiBoZWlnaHQ9IjEwMy42IiB2aWV3Qm94PSIwIDAgMTA4LjkgMTAzLjYiPg0KCTxkZWZzPg0KCQk8c3R5bGU+LmNscy0xe2ZpbGw6I2YxYzk0Nzt9PC9zdHlsZT4NCgk8L2RlZnM+DQoJPHRpdGxlPnN0YXIxPC90aXRsZT4NCgk8ZyBpZD0iTGF5ZXJfMiIgZGF0YS1uYW1lPSJMYXllciAyIj4NCgkJPGcgaWQ9IkxheWVyXzEtMiIgZGF0YS1uYW1lPSJMYXllciAxIj4NCgkJCTxwb2x5Z29uIGNsYXNzPSJjbHMtMSIgcG9pbnRzPSI1NC40IDAgNzEuMyAzNC4xIDEwOC45IDM5LjYgODEuNyA2Ni4xIDg4LjEgMTAzLjYgNTQuNCA4NS45IDIwLjggMTAzLjYgMjcuMiA2Ni4xIDAgMzkuNiAzNy42IDM0LjEgNTQuNCAwIi8+DQoJCTwvZz4NCgk8L2c+DQo8L3N2Zz4NCg==);
	background-repeat: repeat-x;
}

/* 별 스타일 끝*/
.col1 {
	border: solid;
	border-collapse: collapse;
	border-radius: 8px;
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
						<div class="page-heading">
							<div class="page-title">
								<div class="row">
									<div class="col-12 col-md-6 order-md-1 order-last">
										<h3>${space.name }
											<a href="#" class="btn btn-danger"
												onclick="favorite(${space.num},${space.membernum})">찜하기</a>
											<!-- tag 넣기  시작-->
											<br>
											<c:forEach var="tag" items="${space.tag }">
												<span class="badge bg-light-info"
													style="font-weight: normal; font-size: 12px;">#${tag}
												</span>
											</c:forEach>

											<!-- tag 넣기  끝-->


										</h3>
									</div>
									<div class="col-12 col-md-6 order-md-2 order-first">
										<nav aria-label="breadcrumb"
											class="breadcrumb-header float-start float-lg-end"></nav>
									</div>
								</div>
							</div>
							<section class="section">
								<div class="card">
									<div class="card-body">
										<!-- 기본 틀 -->

										<!-- 	사진 test 1 -->

										<div class="card">
											<div class="col-12 col-md-4, parent">
												<img
													src="<%=request.getContextPath()%>/resources/spaceimage/${space.mainimage}"
													class="img-fluid1, first" alt="singleminded">

												<c:forEach items="${detailspace}" var="detail" begin="0"
													end="1">
													<a onclick="detailView(${detail.spacenum})"> <img
														src="<%=request.getContextPath()%>/resources/spaceimage/${detail.mainimage}"
														class="img-fluid1, second" alt="singleminded"></a>

												</c:forEach>

												<div class="card-body"></div>
											</div>
											<ul class="list-group list-group-flush">

											</ul>
										</div>

										<!-- 	사진 test 1 -->

										<!-- 설명 시작1 -->

										<div class="container">
											<div class="row row-cols-2">

												<div class="col">
													<h4 class="card-title">한줄소개</h4>
													${space.contentssim}
													<h4 class="card-title">공간소개</h4>
													${space.contentscom}
													<h4 class="card-title">주의 사항</h4>
													${space.warning}
													<h4 class="card-title">지도</h4>


													<h4 class="card-title">사용자 후기</h4>
													<!-- 후기	시작 -->
													<c:if test="${empty reviewList }">
	등록된 후기가 없습니다.
</c:if>
													<c:if test="${not empty reviewList }">
	등록된 후기가 총 ${allCount }개 있습니다.
</c:if>
													<c:forEach var="review" items="${reviewList }"
														varStatus="vs">
														<div class="row justify-content-center">
															<div class="col-12">
																<div class="card bg-light">
																	<div class="d-flex justify-content-between p-2">
																		<div class="d-flex Writer-Info">
																			<div class="img px-2">
																				<div class="avatar avatar-xl me-3">
																					<img src="./resources/assets/images/faces/none.jpg">
																				</div>
																			</div>
																			<div class="title py-2">
																				<b>${review.writer }</b><br> <small
																					class="text-muted"> <fmt:parseDate
																						var="rDate" value="${review.regdate }"
																						pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
																						value="${rDate }" pattern="yyyy-MM-dd HH:mm" />
																				</small><br>
																			</div>
																		</div>
																		<div class="d-flex Rating">
																			<div class="totalRating p-3 my-auto">
																				<span class="badge bg-success"
																					style="width: 75px; font-size: 20px;"> <fmt:formatNumber
																						value="${review.totalrating / 3}" pattern=".0" />
																					<i class="bi bi-star align-middle"></i></span>
																			</div>
																			<div class="detailRating">
																				<div class="d-flex justify-content-start">
																					<div class="">
																						<small class="text-muted">서비스 </small>
																					</div>
																					<c:set var="service_score"
																						value="${(review.servicerating / 5)*100 }" />
																					<div
																						class="progress progress-warning progress-sm mx-1 my-auto d-flex"
																						style="width: 100px;">
																						<div class="progress-bar" role="progressbar"
																							style="width: ${service_score}%"></div>
																					</div>
																					<div class="">
																						<small class="text-muted">
																							${review.servicerating } </small>
																					</div>
																				</div>
																				<div class="d-flex justify-content-start">
																					<div class="">
																						<small class="text-muted">가성비 </small>
																					</div>
																					<c:set var="pricevalue_score"
																						value="${(review.pricevalueration / 5)*100 }" />
																					<div
																						class="progress progress-warning progress-sm mx-1 my-auto d-flex"
																						style="width: 100px;">
																						<div class="progress-bar" role="progressbar"
																							style="width: ${pricevalue_score}%"></div>
																					</div>
																					<div class="">
																						<small class="text-muted">
																							${review.pricevalueration } </small>
																					</div>
																				</div>
																				<div class="d-flex justify-content-start">
																					<div class="">
																						<small class="text-muted">청결도 </small>
																					</div>
																					<c:set var="clean_score"
																						value="${(review.cleanrating / 5)*100 }" />
																					<div
																						class="progress progress-warning progress-sm mx-1 my-auto d-flex"
																						style="width: 100px;">
																						<div class="progress-bar" role="progressbar"
																							style="width: ${clean_score}%"></div>
																					</div>
																					<div class="">
																						<small class="text-muted">
																							${review.cleanrating } </small>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
				<div class="card-body p-3">
					${review.content }<br>
				</div>
				<c:set var="replyBean" value="${review.reviewReply }"/>
				
				<c:if test="${not empty replyBean }">
					<div class="card-body">
						<div class="card-title" style="font-weight: bold; color:#6d3afb;">
							<div class="d-flex justify-content-between">
								<div class="title my-auto">
									호스트님의 답글
								</div>
								<div class="del-btn">
									<button class="btn btn-sm btn-outline-danger" 
										onClick="replyDel('${spaceNum}', '${replyBean.num }')">삭제</button>
								</div>
							</div>
						</div>
						<div class="card-text">
							${replyBean.content }<br>
						</div>
						<span class="text-muted" style="font-size: 12px;">
							<fmt:parseDate var="replyDate" value="${replyBean.regdate }" pattern="yyyy-MM-dd HH:mm"/>
							<fmt:formatDate value="${replyDate }" pattern="yyyy-MM-dd HH:mm"/>
						</span>
					</div>
				</c:if>
																</div>
															</div>
														</div>
													</c:forEach>
													<!-- 페이징 시작 -->
													<c:if test="${not empty reviewList }">
														<div class="page-nav d-flex justify-content-center">
															<nav>
																<ul class="pagination pagination-primary">
																	<c:if test="${pageInfo.beginPage eq 1 }">
																		<li class="page-item disabled"><a
																			class="page-link">이전</a></li>
																	</c:if>
																	<c:if test="${pageInfo.beginPage ne 1 }">
																		<c:set var="url"
																			value="${pageInfo.url }?pagenumber=${pageInfo.beginPage -1 }&spacenum=${spacenum }&num=${spacenum }" />
																		<li class="page-item"><a class="page-link"
																			href="${url }">이전</a></li>
																	</c:if>
																	<c:forEach var="i" begin="${pageInfo.beginPage }"
																		end="${pageInfo.endPage }">
																		<c:set var="url"
																			value="${pageInfo.url }?pagenumber=${i }&spacenum=${spacenum }&num=${spacenum }" />
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
																			value="${pageInfo.url }?pagenumber=${pageInfo.endPage +1 }&spacenum=${spacenum}&num=${spacenum }" />
																		<li class="page-item"><a class="page-link"
																			href="${url }">다음</a></li>
																	</c:if>
																</ul>
															</nav>
														</div>
													</c:if>
													<!--페이징 끝 -->


													<!-- 후기	끝 -->
												</div>
												<!-- 설명 끝1 -->


												<!-- 	  접히는거 시작 -->

												<div class="col1" style="align-content: center;">
													<!-- reservation 넘어가기 -->
													<h4 class="text-bold-500">예약하기</h4>
													<h4 class="card-title">장소 선택</h4>
													<h4 class="card-title">
														<c:forEach var="spacename" items="${detailspace}">
															<input type="radio" value="${spacename.name}" name="name"
																onclick="selectunit(${spacename.spacenum} ,${spacename.num})"<%-- <c:if test="${eq spacename.num}">selected</c:if> --%>
																>${spacename.name}
														</c:forEach>
													</h4>

													<form action="reserv.rv" method="post">
														<input type="hidden" name="spacenum" value="${space.num }">
														<input type="hidden" name="detailspacenum"
															value="${detailSpaceBean.num }">
														<c:if test="${not empty detailSpaceBean.num}">
															<table class="table table-lg"
																style="border: thick; border-radius: 8px;">
																<tbody>
																	<tr>
																		<td class="text-bold-500">이름</td>
																		<td>${detailSpaceBean.name}</td>
																	</tr>
																	<tr>
																		<td align="center" colspan="2"><img
																			src="<%=request.getContextPath()%>/resources/spaceimage/${detailSpaceBean.mainimage}"
																			alt="숙박이미지" width="200px" height="200px"></td>
																	</tr>
																	<tr>
																		<td class="text-bold-500">가격</td>

																		<td>&#8361;<fmt:formatNumber
																				value="${detailSpaceBean.price}" pattern="#,###" />원/${detailSpaceBean.priceunit}
																		</td>
																	</tr>
																	<tr>
																		<td class="text-bold-500">인원</td>
																		<td>최소${detailSpaceBean.minperson}명~최대${detailSpaceBean.maxperson}명</td>
																	</tr>
																	<tr>
																		<td colspan="2">${detailSpaceBean.contents}</td>
																	</tr>

																	<tr>
																		<td colspan="2" class="text-bold-500" align="center"><input
																			type="submit" class="btn btn-secondary" value="예약하기"></td>
																	</tr>

																</tbody>
															</table>
														</c:if>

													</form>

												</div>
											</div>
										</div>
										<!-- 	  접히는거 끝 -->

										<!-- 기본 틀 -->
									</div>
								</div>
							</section>
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
	
	function favorite(spacenum,membernum){
		location.href="favorite.sp?spacenum="+spacenum+"&membernum="+membernum;
	}
	
	function detailView(spacenum){
		alert("세부 사진 보기");
		window.open("spaceImage.sp?spacenum="+spacenum, "imageView", "width=400, height=300, left=100, top=50")
	}
	
	function selectunit(num, detailspacenum){
		var detailspacenum = String(detailspacenum);
		location.href="detailView.sp?num="+num+"&detailspacenum="+detailspacenum;
		
	}
	

	function replyDel(spaceNum, num){
		result = confirm('답글을 삭제하시겠습니까?');
		if(result){
			location.href='spaceManagerReviewReplyDelete.ho?spaceNum='+spaceNum+'&num='+num;
		}
	}

/*  TOSTRING SPECATDETAIL NUM 변경 */
	
	
	</script>

		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>