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
		<div id="" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">
						<%-- ******* Main Code HERE ******* --%>
						<div class="row justify-content-center">
						<div class="col-8">
						<div class="card">
						<div class="card-body">
							<h3>${space.name }
							<button class="btn btn-danger"
								onclick="favorite(${space.num},${space.membernum})">찜하기</button>
							</h3>
							<div class="card-text mb-2">
							${space.contentssim }
							</div>
							<p class="card-text">
								<c:set var="tagList" value="${fn:split(space.tag, ',')}" />
								<c:forEach var="tagToken" items="${tagList }">
									<span class="badge bg-light-info"
										style="font-weight: normal; font-size: 14px;">#${tagToken }</span>
								</c:forEach>
							</p>
						<div class="row">
							<div class="col-7">
								<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
									<div class="carousel-inner">
						               <div class="carousel-item active">
						                   <img src="<%=request.getContextPath() %>/resources/spaceimage/${space.mainimage}" class="d-block w-100" style="height:588px;">
						              </div>
						              <c:forEach var="spaceImageBean" items="${spImgList }">
						               <div class="carousel-item">
						                   <img src="<%=request.getContextPath() %>/resources/spaceimage/${spaceImageBean.image}" class="d-block w-100" style="height:588px;">
						               </div>
						              </c:forEach>
									</div>
						           <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-bs-slide="prev">
						               <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						               <span class="visually-hidden">Previous</span>
						           </a>
						           <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-bs-slide="next">
						               <span class="carousel-control-next-icon" aria-hidden="true"></span>
						               <span class="visually-hidden">Next</span>
						           </a>
								</div>
							</div>
							<!-- 우측사이드 시작 -->
							<div class="col-5 py-2 border rounded-3 border-secondary">
								<div class="row mb-3">
									<div class="col-6">
										<h5>현재 상태</h5>
										<p class="card-text">
											${space.status }
											<c:if test="${space.status eq '등록대기' }">
												<small class="text-muted link-class" onclick="approval(${space.num})">검수신청하기</small>
											</c:if>
											<c:if test="${space.status eq '검수반려' }">
												<small class="text-muted link-class" onclick="approval(${space.num})">검수 재신청하기</small>
											</c:if>
										</p>
										<h5>영업 시간</h5>
										<p class="card-text">
										<c:set var="isAllTime" value="${false }"/>
										<c:if test="${(space.operatingtime eq 0) and (space.operatingendtime eq 24) }">
											<c:set var="isAllTime" value="${true }"/>
											24시간 영업
										</c:if>
										<c:if test="${not isAllTime }">
											${space.operatingtime }시 ~ ${space.operatingendtime }시
										</c:if>
										</p>
										<h5>휴무일</h5>
										<p class="card-text">
											<c:if test="${empty space.holiday}">
												휴무일 없음
											</c:if>
											<c:if test="${not empty space.holiday }">
											 	매주 ${space.holiday }
											</c:if>
										</p>
									</div>
									<div class="col-6">
										<h5>분류</h5>
										<p class="card-text">${space.type }</p>
										<h5>연락처</h5>
										<p class="card-text">${space.hp }</p>
										<h5>등록일</h5>
										<p class="card-text">
										<fmt:parseDate var="parseRegDate" value="${space.regdate }" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${parseRegDate }" pattern="yyyy/MM/dd"/>
										</p>
									</div>
								</div>
								<div class="divider my-2"><div class="divider-text">호스트 정보</div></div>
								<div class="row mb-3">
								<div class="col-6">
									<h5>상호명</h5>
									<p class="card-text">${balanceBean.company }</p>
									<h5>이메일</h5>
									<p class="card-text">${balanceBean.email }</p>
								</div>
								<div class="col-6">
									<h5>대표자명</h5>
									<p class="card-text">${balanceBean.name }</p>
									<h5>연락처</h5>
									<p class="card-text">${balanceBean.call }</p>
								</div>
								<h5 style="margin-top:16px;">사업장 주소</h5>
								<p class="card-text">${balanceBean.address }</p>
								</div>
							</div>
							<!-- 우측사이드 끝 -->
							<!-- 상세설명 시작 -->
							<div class="col-7 my-2 py-2">
								<h4>상세 설명</h4>
								<p class="card-text">${space.contentscom }</p>
								<h4>시설 안내</h4>
								<c:forEach var="facBean" items="${spFacList }">
									<p class="card-text">${facBean.facility }</p>
								</c:forEach>
								<h4>사용 시 주의사항</h4>
								<p class="card-text">${space.warning }</p>
								<h4>주소</h4>
								<p class="card-text">
									<c:set var="addrArr" value="${fn:split(space.address, ',') }"/>
									<c:set var="addr" value="${addrArr[0] }"/>
									<c:set var="addrDetail" value="${addrArr[1] }"/>
									${addr } ${addrDetail }
								</p>
								<div id="map" class="p-2 mb-4" style="width:100%; height: 400px;"></div>
								<!-- 후기	시작 -->
								<h4>후기</h4>
								<c:if test="${empty reviewList }">등록된 후기가 없습니다.</c:if>
								<c:if test="${not empty reviewList }">등록된 후기가 총 ${allCount }개 있습니다.</c:if>
								<c:forEach var="review" items="${reviewList }" varStatus="vs">
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
													<c:set var="service_score" value="${(review.servicerating / 5)*100 }" />
													<div class="progress progress-warning progress-sm mx-1 my-auto d-flex" style="width: 100px;">
														<div class="progress-bar" role="progressbar" style="width: ${service_score}%"></div>
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
							<!-- 상세설명 끝 -->
							<!-- 세부공간리스트 시작 -->
							<div class="col-5 my-2 py-2 border rounded-3 border-secondary">
								<h5>세부공간 리스트 (${dspList.size()}개)</h5>
								<c:if test="${empty dspList }">
									<p class="card-text text-center"><small class="text-muted">등록된 세부공간이 없습니다.</small> </p> 
								</c:if>
								<c:if test="${not empty dspList }">
									<div class="accordion" id="accordionDSP">
									<c:forEach var="dspBean" items="${dspList }" varStatus="vs">
										<div class="accordion-item">
											<div class="list-title list-group-item list-group-item-success" data-bs-toggle="collapse" data-bs-target="#collapse${vs.count }">${dspBean.name }</div>
											<div id="collapse${vs.count }" class="accordion-collapse collapse" data-bs-parent="accordionDSP"
											 style="text-decoration: none; background-color:#fff; border: 1px solid rgba(0,0,0,0.125);">
												<div class="accordion-body p-3">
													<div class="dsp-title p-1">
														<img src="<%=request.getContextPath() %>/resources/spaceimage/${dspBean.mainimage}" class="d-block h-100 mx-auto" style="width:300px;">
													</div>
													<div class="dsp-body p-1">
														<div class="list-group">
															<div class="list-group-item" style="border:none; border-bottom: 1px solid #eee;">
																<b>예약시간</b>&nbsp;&nbsp;&nbsp;&nbsp;최소 ${dspBean.mintime } 시간부터
															</div>
															<div class="list-group-item" style="border:none; border-bottom: 1px solid #eee;">
																<b>수용인원</b>&nbsp;&nbsp;&nbsp;&nbsp;최소 ${dspBean.minperson } 명 ~ 최대 ${dspBean.maxperson } 명
															</div>
															<div class="list-group-item" style="border:none; border-bottom: 1px solid #eee;">
																<b>가격</b>&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${dspBean.price }" pattern="#,###"/>원 / ${dspBean.priceunit }
															</div>
															<div class="list-group-item" style="border:none; border-bottom: 1px solid #eee; text-align:center;">
																<form action="reserv.rv" method="post">           
																	<input type="hidden" name="spacenum" value="${space.num }">
																	<input type="hidden" name="detailspacenum" value="${detailSpaceBean.num }">	
																	<button class="btn btn-outline-success" type="submit">예약하기</button>
																</form>
															</div>
														</div>
													</div>
												</div>
											</div>
											</div>
									</c:forEach>
									</div>
								</c:if>
							</div>
							<!-- 세부공간리스트 끝 -->
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
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6a5567b90a1de962f1fcd120b45bd86&libraries=services"></script>
		<script type="text/javascript">
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		var geocoder = new kakao.maps.services.Geocoder();
		geocoder.addressSearch('${addr}',
			function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y,
							result[0].x);
					var marker = new kakao.maps.Marker({
						map : map,
						position : coords
					});
					map.setCenter(coords);
				}
			}
		);
		
		function approval(num){
			result = confirm('검수를 완료하시겠습니까? 해당 공간이 영업을 시작합니다.');
			if(result){
				location.href='approvalProc.admin?spaceNum='+num+'&flag=true';
			}
		}
		function reject(num){
			result = confirm('검수를 반려하시겠습니까?');
			if(result){
				location.href='approvalProc.admin?spaceNum='+num+'&flag=false';
			}
		}
		</script>
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