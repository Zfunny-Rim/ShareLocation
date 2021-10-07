<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
<c:if test="${dspBeanList.size() eq 0 }">
등록된 세부공간이 없습니다.
</c:if>
<c:if test="${ dspBeanList.size() ne 0 }">
등록된 세부공간이 ${dspBeanList.size() }개 있습니다.
</c:if>
<div class="container">
	<div class="row row-cols-2">
		<c:forEach var="dsp" items="${dspBeanList }">
			<div class="col-md-6">
				<div class="card bg-light mx-auto" style="max-width: 640px;">
					<div class="row g-0">
						<div class="col-md-4">
							<img
								src="<%=request.getContextPath()%>/resources/spaceimage/${dsp.mainimage}"
								class="img-fluid h-100 rounded-start">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">${dsp.name }</h5>
								<p class="card-text">${dsp.contents }</p>
							</div>
							<div
								class="card-footer d-flex justify-content-between bg-light p-2 px-3">
								<div class="left-side">
									<button class="btn btn-sm btn-light-primary">TEST1</button>
								</div>
								<div class="right-side">
									<button class="btn btn-sm btn-primary"
										onClick="modifyDSpace(${dsp.num})">수정</button>
									<button class="btn btn-sm btn-danger"
										onClick="deleteDSpace(${dsp.num})">삭제</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>