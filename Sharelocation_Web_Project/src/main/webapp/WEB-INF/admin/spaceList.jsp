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
<%@ include file="/WEB-INF/views/include/body_sidebar_admin.jsp" %>
<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
<div id="" style="padding-top:0px;">
<div id="main-content">   
<div class="page-heading">
<section class="section">
<%-- ******* Main Code HERE ******* --%>
	<div class="row justify-content-center">
	<div class="col-8">
	<div class="card">
	<div class="card-content">
	<div class="card-body">
		<h4 class="card-title">등록된 공간</h4>
		<c:if test="${not empty spaceList }">
			등록된 공간이 총 ${pageInfo.totalCount }개 있습니다.
		</c:if>
		<div class="row justify-content-center my-3">
		<div class="col-10">
		<div class="table-responsive">
			<table class="table table-hover mb-3">
				<tr>
					<th>번호</th>	
					<th>호스트 이름</th>	
					<th>분류</th>	
					<th>공간명</th>	
					<th>영업시간</th>	
					<th>연락처</th>	
					<th>등록일</th>	
					<th>현재 상태</th>	
				</tr>
				<c:if test="${empty spaceList }">
					<tr>
						<td colspan="8" style="text-align:center;">
							등록된 공간이 없습니다.
						</td>
					</tr>
				</c:if>
				<c:forEach var="spaceBean" items="${spaceList }">
				<tr class="clickable" onClick="goViewPage('${spaceBean.num}')">
					<td>${spaceBean.num }</td>
					<td>${spaceBean.mnickname }</td>
					<td>${spaceBean.type }</td>
					<td>${spaceBean.name }</td>
					<td>
						<c:if test="${(spaceBean.operatingtime eq 0)and(spaceBean.operatingendtime eq 24) }">
							24시간 영업
						</c:if>
						<c:if test="${(spaceBean.operatingtime ne 0)or(spaceBean.operatingendtime ne 24) }">
							${spaceBean.operatingtime }시~${spaceBean.operatingendtime }시
						</c:if>
						
					</td>
					<td>${spaceBean.hp }</td>
					<td>
						<fmt:parseDate var="regDate" value="${spaceBean.regdate }" pattern="yyyy-MM-dd HH:mm"/>
						<fmt:formatDate value="${regDate }" pattern="yyyy년 MM월 dd일 HH:mm"/>
					</td>
					<td>
						<c:if test="${spaceBean.status eq '검수대기' }">
							<span class="badge bg-warning">${spaceBean.status }</span>
						</c:if>
						<c:if test="${spaceBean.status eq '등록대기' }">
							<span class="badge bg-info">${spaceBean.status }</span>
						</c:if>
						<c:if test="${spaceBean.status eq '운영중' }">
							<span class="badge bg-success">${spaceBean.status }</span>
						</c:if>
						<c:if test="${spaceBean.status eq '검수반려' }">
							<span class="badge bg-danger">${spaceBean.status }</span>
						</c:if>
						
					</td>
				</tr>
				</c:forEach>
			</table>
			<c:if test="${not empty spaceList }">
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
	function goViewPage(num){
		location.href='approvalView.admin?spaceNum='+num;
	}
</script>
<%-- ******* CUSTOM Script END ******* --%>
</div>
</body>
</html>