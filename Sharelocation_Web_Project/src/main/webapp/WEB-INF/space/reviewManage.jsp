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
.clickable:hover{
	cursor:pointer;
}
</style>
<%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
<div id="app">
<%@ include file="/WEB-INF/views/include/body_navbar.jsp" %>
<%@ include file="/WEB-INF/views/include/body_sidebar.jsp" %>
<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
<div id="" style="padding-top:0px;">
<div id="main-content">   
<div class="page-heading">
<section class="section">
<div class="row justify-content-center">
<div class="col-8">
<div class="card">
<div class="card-body">
<%-- ******* Main Code HERE ******* --%>
<h4 class="card-title">후기 관리하기</h4>
<div class="row justify-content-center">
	<div class="col-9">
		<c:if test="${empty reviewList  }">
			작성한 리뷰가 없습니다. 
		</c:if>
		<c:if test="${not empty reviewList }">
		<c:forEach var="review" items="${reviewList }" varStatus="vs">
		<div class="row justify-content-center">
				<div class="col-10">
					<div class="card bg-light">
						<div class="row clickable" onClick="location.href='detailView.sp?num=${review.spaceBean.num}'">
							<div class="col-4">
								<img src="<%=request.getContextPath()%>/resources/spaceimage/${review.spaceBean.mainimage}"
								class="img-fluid w-100 rounded-start" style="height: 100px;">
							</div>
							<div class="col-8 py-2">
								<h5 class="card-title">${review.spaceBean.name }</h5>
								<p class="card-text ellipsis mb-0"><small class="text-muted">${review.spaceBean.contentssim }</small></p>
								<p class="card-text mb-0"><small class="text-muted" style="font-size:12px;">${review.spaceBean.address }</small></p>
							</div>
						</div>
						<hr class="my-1">
						<div class="d-flex justify-content-between p-2">
							<div class="d-flex Writer-Info">
								<div class="img px-2">
									<div class="avatar avatar-xl me-3">
										<img src="./resources/assets/images/faces/none.jpg">
									</div>
								</div>
								<div class="title py-2">
									<b>${review.writer }</b><br>
									<small class="text-muted">
										<fmt:parseDate var="rDate" value="${review.regdate }" pattern="yyyy-MM-dd HH:mm"/>
										<fmt:formatDate value="${rDate }" pattern="yyyy-MM-dd HH:mm"/>
									</small><br>
								</div>
							</div>
							<div class="d-flex Rating">
								<div class="totalRating p-3 my-auto">
		 							<span class="badge bg-success" style="width:75px; font-size: 20px;">
		 							<fmt:formatNumber value="${review.totalrating / 3}" pattern=".0"/>  
		 							<i class="bi bi-star align-middle"></i></span>
								</div>
								<div class="detailRating">
									<div class="d-flex justify-content-start">
										<div class=""><small class="text-muted">서비스 </small></div>
										<c:set var="service_score" value="${(review.servicerating / 5)*100 }"/>
										<div class="progress progress-warning progress-sm mx-1 my-auto d-flex" style="width: 100px;">
			                                <div class="progress-bar" role="progressbar" style="width: ${service_score}%"></div>
			                            </div>	
										<div class=""><small class="text-muted"> ${review.servicerating } </small></div>
			                        </div>						
									<div class="d-flex justify-content-start">
										<div class=""><small class="text-muted">가성비 </small></div>
										<c:set var="pricevalue_score" value="${(review.pricevalueration / 5)*100 }"/>
										<div class="progress progress-warning progress-sm mx-1 my-auto d-flex" style="width: 100px;">
			                                <div class="progress-bar" role="progressbar" style="width: ${pricevalue_score}%"></div>
			                            </div>	
										<div class=""><small class="text-muted">  ${review.pricevalueration } </small></div>
			                        </div>						
									<div class="d-flex justify-content-start">
										<div class=""><small class="text-muted">청결도 </small></div>
										<c:set var="clean_score" value="${(review.cleanrating / 5)*100 }"/>
										<div class="progress progress-warning progress-sm mx-1 my-auto d-flex" style="width: 100px;">
			                                <div class="progress-bar" role="progressbar" style="width: ${clean_score}%"></div>
			                            </div>	
										<div class=""><small class="text-muted">  ${review.cleanrating } </small></div>
			                        </div>						
								</div>
							</div>
						</div>
						<div class="card-body p-3">
							<p class="card-text">${review.content }</p>
							<div class="del-btn">
								<button class="btn btn-sm btn-outline-danger" 
									onClick="replyDel('${review.num }')">삭제</button>
							</div>
						</div>
						<c:set var="replyBean" value="${review.reviewReply }"/>
						<c:if test="${not empty replyBean }">
						<hr class="my-0">
							<div class="card-body">
								<div class="card-title" style="font-weight: bold; color:#6d3afb;">
									<div class="d-flex justify-content-between">
										<div class="title my-auto">
											호스트님의 답글
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
			<!-- Paging -->
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
<%-- ******* Main Code END ******* --%>
</div>
</div>
</div>
</div>
 </section>
</div>
</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/footer_script.jsp" %>
<%-- ******* CUSTOM Script HERE ******* --%>
<script type="text/javascript">
function replyDel(reviewnum){
	result = confirm('리뷰를 삭제하시겠습니까?');
	if(result){
		location.href='reviewDelete.sp?reviewNum='+reviewnum;
	}
}
</script>
<%-- ******* CUSTOM Script END ******* --%>
</div>
</body>
</html>