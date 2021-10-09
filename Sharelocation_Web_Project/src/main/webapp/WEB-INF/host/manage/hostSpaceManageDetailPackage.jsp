<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<h4 class="card-title">패키지 관리</h4>
<div class="mb-3">
	<c:if test="${empty packageBeanList}">
	등록된 패키지가 없습니다.
	</c:if>
	<c:if test="${not empty packageBeanList}">
	등록된 패키지가 ${packageBeanList.size() }개 있습니다.
	</c:if>
	<div class="row justify-content-center">
		<div class="col-6">
			<c:forEach var="packageBean" items="${packageBeanList }">
				<div class="card bg-light">
					<div class="card-content">
						
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<div class="row row-cols-2">
	<c:forEach var="packageBean" items="${packageBeanList }">
		<div class="col-md-6">
			<div class="card bg-light mx-auto" style="max-width: 640px;">
				<div class="card-body">
					<h4 class="card-title">${packageBean.title }</h4>
					<hr>
					<div class="d-flex justify-content-between">
						<div class="left-side">
							<p class="card-text">
							<b>시간 : </b>${packageBean.checkintime }시 ~ ${packageBean.checkouttime }시<br>
							<b>가격 : </b>${packageBean.price }원</p>
						</div>
						<div class="right-side">
							<button class="btn btn-sm btn-danger"
								onClick="">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
	<hr>
<div class="row">
	<div class="d-grid col-4 mx-auto">
		<button class="btn btn-primary" 
			onClick="location.href='spaceManageDetailPackageInsert.ho?spaceNum=${spaceNum}&detailSpaceNum=${detailSpaceNum }'">
		패키지 추가하기</button>
	</div>
</div>
