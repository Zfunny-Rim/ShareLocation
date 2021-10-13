<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IPS partagé</title>
    <%@ include file="/WEB-INF/views/include/head_css.jsp" %>
    <%-- ******* CUSTOM CSS Link HERE ******* --%>
    <style type="text/css">
    .accordion-item:hover{
    	cursor: pointer;
    }
	</style>
    <%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp" %>
		<%@ include file="/WEB-INF/views/include/body_sidebar_admin.jsp" %>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
        <div id="main" style="padding-top:0px;">
        <div id="main-content">   
        <div class="page-heading">
        <section class="section">
	         <%-- ******* Main Code HERE ******* --%>
	        <div class="row justify-content-center">
	        <div class="col-9">
			<div class="card">
			<div class="card-content">
			<div class="card-body">
				<h4 class="card-title mb-4">공간 상세보기</h4>
				<h3>${spaceBean.name }</h3>
				<div class="card-text mb-2">
				${spaceBean.contentssim }
				</div>
				<p class="card-text">
					<c:set var="tagList" value="${fn:split(spaceBean.tag, ',')}" />
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
				                    <img src="<%=request.getContextPath() %>/resources/spaceimage/${spaceBean.mainimage}" class="d-block w-100" style="height:588px;">
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
					<div class="col-5 py-2 border rounded-3 border-secondary">
						<div class="row mb-3">
							<div class="col-6">
								<h5>현재 상태</h5>
								<p class="card-text">
									${spaceBean.status }
									<c:if test="${spaceBean.status eq '등록대기' }">
										<small class="text-muted link-class" onclick="approval(${spaceBean.num})">검수신청하기</small>
									</c:if>
								</p>
								<h5>주소</h5>
								<p class="card-text">${spaceBean.address }</p>
								<h5>영업 시간</h5>
								<p class="card-text">
								<c:set var="isAllTime" value="${false }"/>
								<c:if test="${(spaceBean.operatingtime eq 0) and (spaceBean.operatingendtime eq 24) }">
									<c:set var="isAllTime" value="${true }"/>
									24시간 영업
								</c:if>
								<c:if test="${not isAllTime }">
									${spaceBean.operatingtime }시 ~ ${spaceBean.operatingendtime }시
								</c:if>
								</p>
								<h5>휴무일</h5>
								<p class="card-text">
									<c:if test="${empty spaceBean.holiday}">
										휴무일 없음
									</c:if>
									<c:if test="${not empty spaceBean.holiday }">
									 	매주 ${spaceBean.holiday }
									</c:if>
								</p>
							</div>
							<div class="col-6">
								<h5>분류</h5>
								<p class="card-text">${spaceBean.type }</p>
								<h5>연락처</h5>
								<p class="card-text">${spaceBean.hp }</p>
								<h5>등급</h5>
								<p class="card-text">${spaceBean.grade }</p>
								<h5>등록일</h5>
								<p class="card-text">
								<fmt:parseDate var="parseRegDate" value="${spaceBean.regdate }" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${parseRegDate }" pattern="yyyy/MM/dd"/>
								</p>
							</div>
						</div>
						<hr>
					</div>
					<div class="col-7 my-2 py-2">
						<h4>상세 설명</h4>
						<p class="card-text">${spaceBean.contentscom }</p>
						<h4>시설 안내</h4>
						<c:forEach var="facBean" items="${spFacList }">
							<p class="card-text">${facBean.facility }</p>
						</c:forEach>
						<h4>사용 시 주의사항</h4>
						<p class="card-text">${spaceBean.warning }</p>
					</div>
					<div class="col-5 my-2 py-2 border rounded-3 border-secondary">
					<h5>세부공간 리스트 (${dspList.size()}개)</h5>
					<c:if test="${empty dspList }">
						<p class="card-text text-center"><small class="text-muted">등록된 세부공간이 없습니다.</small> </p> 
					</c:if>
					<c:if test="${not empty dspList }">
						<div class="accordion" id="accordionDSP">
						<c:forEach var="dspBean" items="${dspList }" varStatus="vs">
							<div class="accordion-item">
								<div class="list-group-item list-group-item-success" data-bs-toggle="collapse" data-bs-target="#collapse${vs.count }">${dspBean.name }</div>
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
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</c:if>
					</div>
				</div>
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
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp" %>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script type="text/javascript">
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>