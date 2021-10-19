
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
String[] locationtype = new String[]{"파티룸", "스터디룸", "게임룸", "카페", "공유주방", "회의실", "연습실", "보컬연습실", "악기연습실", "녹음실", "운동시설",
		"촬영스튜디오", "라이브방송", "공연장", "공유오피스", "독립오피스", "강의실", "컨퍼런스"};
request.setAttribute("locationtype", locationtype);
String[] area = new String[]{"서울", "인천", "부산", "광주", "대구", "대전", "울산", "제주", "강원도", "경남", "경북", "전남", "전북"};
request.setAttribute("area", area);
%>
<%-- ******* CUSTOM CSS Link HERE ******* --%>
<style type="text/css">
.img-fluid1, .img-thumbnail {
	max-width: 60%;
	height: 40%;
	margin-left: 20%;
}

.search {
	align-content: center;
	align-items: center;
}
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
						<div class="row justify-content-center">
							<div class="col-8">
								<div class="card">
									<div class="card-body">
										<div class="row justify-content-center mb-4">
											<div class="col-6">
												<h2 class="card-title" style="text-align:center;font-size:30px;">
													<c:if test="${not empty param.whatColumn && param.whatColumn ne '%%'}">
														${param.whatColumn } 
													</c:if>
													<c:if test="${not empty param.area && param.area ne '%%'}">
														<c:if test="${not empty param.whatColumn && param.whatColumn ne '%%'}">
														,
														</c:if>
														${param.area }
													</c:if>
													<c:if test="${(not empty param.whatColumn && param.whatColumn ne '%%') or (not empty param.area && param.area ne '%%') }">
														에 대한 
													</c:if>
													<c:if test="${empty param.keyword }">
														전체 
													</c:if>
													<c:if test="${not empty param.keyword }">
														'${param.keyword }' 
													</c:if>
													검색결과입니다.
												</h2>
											</div>
										</div>
										<div class="row justify-content-center">
											<div class="col-10">
												<form class="m-0 p-0" action="list.sp" method="get">
													<div class="input-group ms-auto">
														<select name="whatColumn" class="input-group-text">
															<option value="%%">전체종류</option>
															<c:forEach var="locationtype" items="${locationtype}">
																<option value="${locationtype}">${locationtype}</option>
															</c:forEach>
														</select> <select name="area" class="input-group-text">
															<option value="%%">전체지역</option>
															<c:forEach var="area" items="${area}">
																<option value="${area}">${area}</option>
															</c:forEach>
														</select> <input type="text" class="form-control"
															placeholder="공간을 검색하세요." name="keyword"> <input
															type="submit" value="검색"
															class="btn btn-outline-secondary">
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<!-- power link 시작 -->
								<div class="card">
								<div class="card-body">
								<h4>PowerLink</h4>
								<section id="content-types">
									<div class="row">
										<c:forEach var="power" items="${powerLink}" begin="0" end="2">
											<div class="col-xl-4 col-md-6 col-sm-12">
<!-- 												<div class="card"> -->
<!-- 													<div class="card-content"> -->
<!-- 														<div class="card-body"> -->
<%-- 															<h4 class="card-title">${power.name}</h4> --%>
<%-- 															<p class="card-text">${power.contentssim}</p> --%>
<!-- 														</div> -->
<!-- 														<img class="img-fluid1" -->
<%-- 															src="<%=request.getContextPath()%>/resources/spaceimage/${power.mainimage}" --%>
<!-- 															alt="Card image cap"> -->
<!-- 													</div> -->
<!-- 													<div class="card-footer d-flex justify-content-between"> -->
<!-- 														<p> -->
<%-- 															<span>${power.address} </span> --%>
<!-- 														</p> -->
<%-- 														<button onclick="viewDetail(${power.num})" --%>
<!-- 															class="btn btn-light-primary">detail</button> -->
<!-- 													</div> -->
<!-- 												</div> -->
												<div class="card bg-light clickable" onClick="viewDetail(${power.num})">
					                                <div class="card-content">
					                                    <img class="img-fluid card-img-top w-100" style="height:220px;" src="<%=request.getContextPath()%>/resources/spaceimage/${power.mainimage}">
					                                    <div class="card-body">
					                                    	<div class="row">
					                                    		<div class="col-md-8"><h4 class="card-title">${power.name }</h4></div>
					                                    		<div class="col-md-4" style="text-align:right;">
					                                    		</div>
					                                    	</div>
					                                        <p class="card-text">
					                                          	<c:set var="tagList" value="${fn:split(power.tag, ',')}"/>
					                                          	<c:forEach var="tagToken" items="${tagList }">
					                                          		<span class="badge bg-light-info" style="font-weight: normal; font-size:12px;">#${tagToken }</span>
					                                          	</c:forEach>
					                                        </p>
					                                        <p class="card-text">
					                                        	<span style="font-size:15px">${power.contentssim }</span>
					                                        </p>
					                                        <p class="card-text">
					                                        	<small class="text-muted"> ${power.address } </small>
					                                        </p>
					                                    </div>
					                                </div>
					                            </div>
											</div>
										</c:forEach>
									</div>
								</section>
								<!-- power link 끝 -->
								</div>
								</div>
								<div class="card">
								<div class="card-body">
								<h4>Link</h4>
								<section id="content-types">
									<div class="row">
										<c:forEach var="space" items="${spaceLists}">
											<div class="col-xl-4 col-md-6 col-sm-12">
<!-- 												<div class="card bg-light"> -->
<!-- 													<div class="card-content"> -->
<!-- 														<div class="card-body"> -->
<%-- 															<h4 class="card-title">${space.name}</h4> --%>
<%-- 															<p class="card-text">${space.contentssim}</p> --%>
<!-- 														</div> -->
<!-- 														<img class="img-fluid1" -->
<%-- 															src="<%=request.getContextPath()%>/resources/spaceimage/${space.mainimage}"> --%>
<!-- 													</div> -->
<!-- 													<div class="card-footer bg-light d-flex justify-content-between"> -->
<!-- 														<p> -->
<%-- 															<span>${space.address} </span> --%>
<!-- 														</p> -->

<%-- 														<input type="hidden" name="spacenum" value="${space.num}"> --%>

<%-- 														<button onclick="viewDetail(${space.num})" --%>
<!-- 															class="btn btn-light-primary">detail</button> -->
<!-- 													</div> -->
<!-- 												</div> -->
												<div class="card bg-light clickable" onClick="viewDetail(${space.num})">
					                                <div class="card-content">
					                                    <img class="img-fluid card-img-top w-100" style="height:220px;" src="<%=request.getContextPath()%>/resources/spaceimage/${space.mainimage}">
					                                    <div class="card-body">
					                                    	<div class="row">
					                                    		<div class="col-md-8"><h4 class="card-title">${space.name }</h4></div>
					                                    		<div class="col-md-4" style="text-align:right;">
					                                    		</div>
					                                    	</div>
					                                        <p class="card-text">
					                                          	<c:set var="tagList" value="${fn:split(space.tag, ',')}"/>
					                                          	<c:forEach var="tagToken" items="${tagList }">
					                                          		<span class="badge bg-light-info" style="font-weight: normal; font-size:12px;">#${tagToken }</span>
					                                          	</c:forEach>
					                                        </p>
					                                        <p class="card-text">
					                                        	<span style="font-size:15px">${space.contentssim }</span>
					                                        </p>
					                                        <p class="card-text">
					                                        	<small class="text-muted"> ${space.address } </small>
					                                        </p>
					                                    </div>
					                                </div>
					                            </div>
											</div>
										</c:forEach>
									</div>
								</section>
								</div>
								</div>
								<!-- page info start -->
								<c:if test="${not empty spaceLists }">
									<div class="page-nav d-flex justify-content-center">
										<nav>
											<ul class="pagination pagination-primary">
												<c:if test="${pageInfo.beginPage eq 1 }">
													<li class="page-item disabled"><a class="page-link">이전</a></li>
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
														<li class="page-item active"><a class="page-link">${i }</a></li>
													</c:if>
													<c:if test="${i ne pagenumber }">
														<li class="page-item"><a class="page-link"
															href="${url }">${i }</a></li>
													</c:if>
												</c:forEach>
												<c:if test="${pageInfo.endPage eq pageInfo.totalPage }">
													<li class="page-item disabled"><a class="page-link">다음</a></li>
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
						<!-- page info end -->
						<%-- ******* Main Code END ******* --%>
					</section>
				</div>
			</div>
		</div>
		<BR>

		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script type="text/javascript">
function viewDetail(num){
	//alert(1);
	location.href="detailView.sp?num="+num;
}
</script>


		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>