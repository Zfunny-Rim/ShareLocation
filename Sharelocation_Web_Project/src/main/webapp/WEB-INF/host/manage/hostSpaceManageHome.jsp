<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<style type="text/css">
.link-class:hover{
	text-decoration: underline;
	cursor: pointer;
}
</style>
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
			<h5>세부공간 리스트</h5>
			<c:if test="${empty dspList }">
				<p class="card-text text-center"><small class="text-muted">등록된 세부공간이 없습니다.</small> </p> 
			</c:if>
			<c:if test="${not empty dspList }">
				<ul class="list-group mb-2">
					<c:forEach var="dspBean" items="${dspList }">
	                 <li class="list-group-item d-flex justify-content-between align-items-center">
	                     <span> ${dspBean.name } </span>
	                 </li>
					</c:forEach>
	            </ul>
			</c:if>
	           <div class="d-flex justify-content-end">
	            <button class="btn btn-sm btn-outline-success">세부공간 관리</button>
	           </div>
		</div>
		<div class="col-7 my-2 py-2 border rounded-3 border-secondary">
			<h4>상세 설명</h4>
			<p class="card-text">${spaceBean.contentscom }</p>
		</div>
		<div class="col-5 my-2 py-2">
		</div>
	</div>
	
<script type="text/javascript">
	function approval(num){
		result = confirm("검수 통과시 공간이 바로 노출됩니다. 신청하시겠습니까?");
		if(result){
			location.href="spaceManageApproval.ho?spaceNum="+num;
		}
	}
</script>