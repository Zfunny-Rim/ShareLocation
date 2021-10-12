<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<style type="text/css">
th, td{
text-align:center;
}
tr:hover{
	cursor: pointer;
}
</style>
<h4 class="card-title">예약 리스트</h4>
<c:if test="${empty reservationList }">
	예약이 없습니다.
</c:if>
<c:if test="${not empty reservationList }">
	조회된 예약이 총 ${totalCount }개 있습니다.
</c:if>
<div class="row justify-content-center mb-3">
	<div class="col-10">
		<div class="d-flex justify-content-end">
			<div class="d-flex filter">
				<form action="spaceManageReservation.ho" method="get">
					<input type="hidden" name="whatColumn" value="status">
					<input type="hidden" name="spaceNum" value="${spaceNum }">
					<div class="input-group">
						<select class="form-control" name="keyword" style="font-size:12px;">
							<option value="%">전체보기</option>
							<option value="예약대기" 
								<c:if test="${param.keyword eq '예약대기'}">
									selected
								</c:if>
							>예약대기</option>
							<option value="입금대기"
								<c:if test="${param.keyword eq '입금대기'}">
									selected
								</c:if>
							>입금대기</option>
							<option value="예약확정"
								<c:if test="${param.keyword eq '예약확정'}">
									selected
								</c:if>
							>예약확정</option>
							<option value="이용완료"
								<c:if test="${param.keyword eq '이용완료'}">
									selected
								</c:if>
							>이용완료</option>
							<option value="예약취소"
								<c:if test="${param.keyword eq '예약취소'}">
									selected
								</c:if>
							>예약취소</option>
						</select>
						<button class="btn btn-sm btn-primary" type="submit">검색</button>
					</div>
				</form>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table table-hover mb-0">
				<thead>
					<tr>
						<th>번호</th>
						<th>예약자</th>
						<th>예약공간</th>
						<th>체크인</th>
						<th>체크아웃</th>
						<th>인원</th>
						<th>예약일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty reservationList }">
					<tr>
						<td colspan="8">예약내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="resBean" items="${reservationList }" varStatus="vs">
					<tr onClick="detailView('${spaceNum}', '${pageNumber }', '${resBean.num}', '${param.whatColumn}', '${param.keyword }')">
						<td>${totalCount - ((pageNumber-1) * pageInfo.pageSize) - vs.count + 1}</td>
						<td>${resBean.memberBean.nickname }</td>
						<td>${resBean.detailSpaceBean.name }</td>
						<td>
							<fmt:parseDate var="parseCiDate" value="${resBean.checkin }" pattern="yyyy-MM-dd HH:mm"/>
							<fmt:formatDate value="${parseCiDate }" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>
							<fmt:parseDate var="parseCoDate" value="${resBean.checkout }" pattern="yyyy-MM-dd HH:mm"/>
							<fmt:formatDate value="${parseCoDate }" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>${resBean.person }</td>
						<td>
							<fmt:parseDate var="parseAppDate" value="${resBean.applicationdate }" pattern="yyyy-MM-dd HH:mm"/>
							<fmt:formatDate value="${parseAppDate }" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>
							<c:if test="${resBean.status eq '예약대기' }">
								<span class="badge bg-warning">${resBean.status }</span>
							</c:if>
							<c:if test="${resBean.status eq '입금대기' }">
								<span class="badge bg-info">${resBean.status }</span>
							</c:if>
							<c:if test="${resBean.status eq '예약확정' }">
								<span class="badge bg-success">${resBean.status }</span>
							</c:if>
							<c:if test="${resBean.status eq '이용완료' }">
								<span class="badge bg-primary">${resBean.status }</span>
							</c:if>
							<c:if test="${resBean.status eq '예약취소' }">
								<span class="badge bg-danger">${resBean.status }</span>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<c:if test="${not empty reservationList }">
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
	function detailView(spaceNum, pageNum, num, whatColumn, keyword){
		location.href="spaceManageReservationView.ho?spaceNum="+spaceNum+"&num="+num+"&pageNumber="+pageNum+
				"&whatColumn="+whatColumn+"&keyword="+keyword;
	}
</script>