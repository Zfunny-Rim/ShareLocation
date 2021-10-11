<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<h4 class="card-title">후기 리스트</h4>
<c:if test="${empty reviewList }">
	등록된 후기가 없습니다.
</c:if>
<c:if test="${not empty reviewList }">
	등록된 후기가 총 ${allCount }개 있습니다.
</c:if>
<c:forEach var="review" items="${reviewList }" varStatus="vs">
<div class="row justify-content-center">
		<div class="col-6">
			<div class="card bg-light">
				<div class="d-flex justify-content-between p-2">
					<div class="d-flex Writer-Info">
						<div class="img px-2">
							<div class="avatar avatar-xl me-3">
								<img src="./resources/assets/images/faces/none.jpg">
							</div>
						</div>
						<div class="title py-2">
							<b>${review.write }</b><br>
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
					${review.content }<br>
				</div>
				<c:set var="replyBean" value="${review.reviewReply }"/>
				<hr class="my-0">
				<c:if test="${empty replyBean }">
					<div class="card-body px-3 mb-3">
						<div class="accordion" id="cardAccordion">
							<div class="accordion-item">
						      	<button class="btn btn-sm btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${vs.count }">
						        	답글 작성하기
						      	</button>
								<div id="collapse${vs.count }" class="accordion-collapse collapse py-3">
									<form action="spacemanageReviewReply.ho" method="POST">
										<div class="accordion-body">
											<input type="hidden" name="num" value="${review.num }"/>
											<input type="hidden" name="spacenum" value="${spaceNum }"/>
											<input type="hidden" name="pageNumber" value="${param.pageNumber }"/>
											<textarea class="form-control" name="content" rows="3" style="resize: none;"></textarea>
											<div class="d-flex justify-content-end py-3">
												<button class="btn btn-sm btn-outline-success" type="submit">등록</button>
											</div>
								      	</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</c:if>
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
<c:if test="${not empty reviewList }">
	<div class="page-nav d-flex justify-content-center">
		<nav>
		    <ul class="pagination pagination-primary">
		    	<c:if test="${pageInfo.beginPage eq 1 }">
			        <li class="page-item disabled"><a class="page-link">이전</a></li>
		    	</c:if>
		    	<c:if test="${pageInfo.beginPage ne 1 }">
		    		<c:set var="url" value="${pageInfo.url }?pageNumber=${pageInfo.beginPage -1 }&spaceNum=${spaceNum }"/>
			        <li class="page-item"><a class="page-link" href="${url }">이전</a></li>
		    	</c:if>
		    	<c:forEach var="i" begin="${pageInfo.beginPage }" end="${pageInfo.endPage }">
		    	<c:set var="url" value="${pageInfo.url }?pageNumber=${i }&spaceNum=${spaceNum }"/>
		    		<c:if test="${i eq pageNumber }">
			    		<li class="page-item active"><a class="page-link">${i }</a></li>
		    		</c:if>
		    		<c:if test="${i ne pageNumber }">
			    		<li class="page-item"><a class="page-link" href="${url }">${i }</a></li>
		    		</c:if>
		    	</c:forEach>
		    	<c:if test="${pageInfo.endPage eq pageInfo.totalPage }">
			        <li class="page-item disabled"><a class="page-link">다음</a></li>
		    	</c:if>
		    	<c:if test="${pageInfo.endPage ne pageInfo.totalPage }">
		    	<c:set var="url" value="${pageInfo.url }?pageNumber=${pageInfo.endPage +1 }&spaceNum=${spaceNum }"/>
			        <li class="page-item"><a class="page-link" href="${url }">다음</a></li>
		    	</c:if>
		    </ul>
		</nav>
	</div>
</c:if>
<script type="text/javascript">
	function replyDel(spaceNum, num){
		result = confirm('답글을 삭제하시겠습니까?');
		if(result){
			location.href='spaceManagerReviewReplyDelete.ho?spaceNum='+spaceNum+'&num='+num;
		}
	}
</script>