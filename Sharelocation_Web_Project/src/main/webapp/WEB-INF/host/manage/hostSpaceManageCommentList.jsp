<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<!-- 댓글 시작 -->
<h4>댓글</h4>
<c:if test="${not empty commentList }">
	<span class="text-muted">댓글이 ${commentTotalCount }개 있습니다.</span>
</c:if>
<div class="row justify-content-center">
<div class="col-8">
	<div class="card">
		<div class="card-body">
			<c:if test="${empty commentList }">
				<div class="card-body border-bottom p-3 mb-3">
					<div class="d-flex justify-content-center mb-2">
						<div class="card-text">
							등록된 댓글이 없습니다.
						</div>
					</div>
				</div>
			</c:if>
			<c:forEach var="comment" items="${commentList }" varStatus="vs">
				<div class="card-body border-bottom p-3 mb-3">
					<div class="d-flex justify-content-between mb-2">
						<div class="left-side">
							<b>${comment.writer }</b><br>
							<small class="text-muted">
								<fmt:parseDate var="regDate" value="${comment.regdate }" pattern="yyyy-MM-dd HH:mm" />
								<fmt:formatDate value="${regDate }" pattern="yyyy-MM-dd HH:mm" />
							</small>
						</div>
						<div class="right-side">
							<c:if test="${empty comment.replyComment }">
								<button class="btn btn-sm btn-outline-success"
								type="button" data-bs-toggle="collapse" data-bs-target="#collapse${vs.count }">답글달기</button>
							</c:if>
						</div>
					</div>
					<p class="card-text">
						${comment.content }
					</p>
					<div id="collapse${vs.count }" class="accordion-collapse collapse py-3">
						<form action="spaceManageCommentReply.ho" method="POST">
							<div class="accordion-body">
								
								<input type="hidden" name="replynum" value="${comment.num }"/>
								<input type="hidden" name="spacenum" value="${comment.spacenum }"/>
								<input type="hidden" name="pageNumber" value="${commentPageInfo.pageNumber }"/>
								<hr>
								<h6>답글 작성하기</h6>
								<textarea class="form-control" name="content" rows="3" style="resize: none;"></textarea>
								<div class="d-flex justify-content-end py-3">
									<button class="btn btn-sm btn-outline-success" type="submit">등록</button>
								</div>
					      	</div>
						</form>
					</div>
					<c:if test="${not empty comment.replyComment }">
						<div class="reply-section bg-light" style="padding:5px 5px 5px 20px;">
							<div class="d-flex justify-content-between mb-2">
								<div class="left-side">
									<span style="font-weight: bold; color: #6d3afb; font-size:19px;">
										호스트님의 답글
									</span>
								</div>
								<div class="right-side">
									<button class="btn btn-sm btn-outline-danger"
									onClick="deleteComment(${comment.replyComment.num}, ${spacenum })">삭제</button>
								</div>
							</div>
							<p class="card-text">
								${comment.replyComment.content }
							</p>
							<small class="text-muted">
								<fmt:parseDate var="regDate" value="${comment.replyComment.regdate }" pattern="yyyy-MM-dd HH:mm" />
								<fmt:formatDate value="${regDate }" pattern="yyyy-MM-dd HH:mm" />
							</small>
						</div>
					</c:if>
				</div>
			</c:forEach>
			<!--  페이징 들어갈거임. -->
			<div class="page-nav d-flex justify-content-center">
			<nav>
				<ul class="pagination pagination-primary">
					<c:if test="${commentPageInfo.beginPage eq 1 }">
						<li class="page-item disabled"><a
							class="page-link">이전</a></li>
					</c:if>
					<c:if test="${commentPageInfo.beginPage ne 1 }">
						<c:set var="url"
							value="${commentPageInfo.url }?pageNumber=${commentPageInfo.beginPage -1 }&spaceNum=${param.spaceNum }" />
						<li class="page-item"><a class="page-link"
							href="${url }">이전</a></li>
					</c:if>
					<c:forEach var="i" begin="${commentPageInfo.beginPage }"
						end="${commentPageInfo.endPage }">
						<c:set var="url"
							value="${commentPageInfo.url }?pageNumber=${i }&spaceNum=${param.spaceNum  }" />
						<c:if test="${i eq commentPageInfo.pageNumber }">
							<li class="page-item active"><a
								class="page-link">${i }</a></li>
						</c:if>
						<c:if test="${i ne commentPageInfo.pageNumber }">
							<li class="page-item"><a class="page-link"
								href="${url }">${i }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${commentPageInfo.endPage eq commentPageInfo.totalPage }">
						<li class="page-item disabled"><a
							class="page-link">다음</a></li>
					</c:if>
					<c:if test="${commentPageInfo.endPage ne commentPageInfo.totalPage }">
						<c:set var="url"
							value="${commentPageInfo.url }?pageNumber=${commentPageInfo.endPage +1 }&spaceNum=${param.spaceNum  }" />
						<li class="page-item"><a class="page-link"
							href="${url }">다음</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
		<!-- 페이징 끝 -->
		</div>
	</div>
</div>
</div>
<!-- 댓글 종료 -->
<script type="text/javascript">
function deleteComment(num, spaceNum){
	result = confirm('댓글을 삭제하시겠습니까?');
	if(result){
		location.href='deleteComment.sp?num='+num+'&spaceNum='+spaceNum;
	}
}
</script>