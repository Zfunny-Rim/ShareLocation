<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
<style type="text/css">
.ellipsis{
text-overflow:ellipsis; white-space: nowrap; overflow: hidden;
}
</style>
<h4 class="card-title">세부공간 리스트</h4>
<div class="mb-3">
	<c:if test="${dspBeanList.size() eq 0 }">
	등록된 세부공간이 없습니다.
	</c:if>
	<c:if test="${ dspBeanList.size() ne 0 }">
	등록된 세부공간이 ${dspBeanList.size() }개 있습니다.
	</c:if>
</div>
<div class="row row-cols-2">
	<c:forEach var="dsp" items="${dspBeanList }">
		<div class="col-md-6">
			<div class="card bg-light mx-auto" style="max-width: 640px;">
				<div class="row g-0">
					<div class="col-md-5">
						<img
							src="<%=request.getContextPath()%>/resources/spaceimage/${dsp.mainimage}"
							class="img-fluid w-100 rounded-start" style="height:185px;">
					</div>
					<div class="col-md-7">
						<div class="card-body py-2">
							<h5 class="card-title">${dsp.name }</h5>
							<p class="card-text ellipsis"><small class="text-muted">${dsp.contents }</small></p>
							<p class="card-text">
								<b>가격 : </b> ${dsp.price }원 / ${dsp.priceunit }<br>
								<b>인원 : </b>기준 ${dsp.minperson }인 (최대 ${dsp.maxperson }인) <br>
							</p>
						</div>
						<div
							class="card-footer d-flex justify-content-between bg-light p-2 px-3">
							<div class="left-side">
<!-- 								<button class="btn btn-sm btn-light-primary" -->
<%-- 									onClick="location.href='spaceManageDetailPackage.ho?spaceNum=${spaceNum}&detailSpaceNum=${dsp.num }'">패키지 관리</button> --%>
							</div>
							<div class="right-side">
								<button class="btn btn-sm btn-primary"
									onClick="location.href='spaceManageDetailSpaceModify.ho?spaceNum=${spaceNum}&detailSpaceNum=${dsp.num}'">수정</button>
								<button class="btn btn-sm btn-danger"
									onClick="deleteDSpace(${dsp.num},${spaceNum },'${dsp.name }')">삭제</button>
							</div>
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
		<button class="btn btn-primary" onClick="location.href='spaceManageDetailSpaceInsert.ho?spaceNum=${spaceNum}'">세부공간 추가하기</button>
	</div>
</div>
<script type="text/javascript">
	function deleteDSpace(detailnum, spacenum, name){
		result = confirm(name+" 세부공간을 삭제하시겠습니까?");
		if(result){
			location.href='spaceManageDetailSpaceDelete.ho?detailSpaceNum='+detailnum+"&spaceNum="+spacenum;
		}
	}
</script>
