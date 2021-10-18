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
	<div class="col-9">
	<div class="card">
	<div class="card-content">
	<div class="card-body">
		<h4 class="card-title">등록된 공간</h4>
		<c:if test="${empty spaceList }">
			등록된 공간이 없습니다.
		</c:if>
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
				<c:forEach var="spaceBean" items="${spaceList }">
				<tr onClick="goViewPage('${spaceBean.num}')">
					<td>${spaceBean.num }</td>
					<td>${spaceBean.mnickname }</td>
					<td>${spaceBean.type }</td>
					<td>${spaceBean.name }</td>
					<td>${spaceBean.operatingtime }~${spaceBean.operatingendtime }</td>
					<td>${spaceBean.hp }</td>
					<td>${spaceBean.regdate }</td>
					<td>${spaceBean.status }</td>
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
					    		<c:if test="${i eq param.pageNumber }">
						    		<li class="page-item active"><a class="page-link">${i }</a></li>
					    		</c:if>
					    		<c:if test="${i ne param.pageNumber }">
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