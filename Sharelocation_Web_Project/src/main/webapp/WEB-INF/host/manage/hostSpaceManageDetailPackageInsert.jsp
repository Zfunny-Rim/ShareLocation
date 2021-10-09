<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
<style type="text/css">
	.err{color:red; font-weight: bold; font-size:11px;}
	.required{color:red;}
</style>
<h4 class="card-title">패키지 추가하기</h4>
<hr>
<form:form commandName="packagePriceBean" class="form form-horizontal"
	action="spaceManageDetailPackageInsert.ho" method="post"
	enctype="multipart/form-data" name="insert_form">
	<div class="form-body">
		<div class="row">
			<div class="col-md-4">
				<label>패키지명 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<input type="text" class="form-control" name="title" value="${packagePriceBean.title }">
				<p><small class="text-muted"> <form:errors cssClass="err" path="title" />
				</small></p>
			</div>
			<div class="col-md-4">
				<label>시간 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<div class="input-group">
					<select class="form-control" name="checkintime">
						<c:forEach var="i" begin="${spaceBean.operatingtime }" end="${spaceBean.operatingendtime }" >
							<fmt:formatNumber var="hourStr" value="${i }" pattern="00"/>
							<c:set var="timeStr" value="${hourStr }:00"/>
							<option value="${i }"
								<c:if test="${i eq packagePriceBean.checkintime }">selected</c:if>
							>${timeStr }</option> 
						</c:forEach>
					</select>
					<span class="input-group-text"> ~ </span>
					<select class="form-control" name="checkouttime">
						<c:forEach var="i" begin="${spaceBean.operatingtime }" end="${spaceBean.operatingendtime }" >
							<fmt:formatNumber var="hourStr" value="${i }" pattern="00"/>
							<c:set var="timeStr" value="${hourStr }:00"/>
							<option value="${i }"
								<c:if test="${i eq packagePriceBean.checkouttime }">selected</c:if>
							>${timeStr }</option> 
						</c:forEach>
					</select>
				</div>
				<p><small class="text-muted"> 
					<form:errors cssClass="err" path="checkintime" />
					<form:errors cssClass="err" path="checkouttime" />
				</small></p> 
				
			</div>
			<div class="col-md-4">
				<label>가격 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<input type="text" class="form-control" name="price" value="${packagePriceBean.price }">
				<p><small class="text-muted"> <form:errors cssClass="err" path="price" />
				</small></p>
			</div>
			<hr class="divider">
			<input type="hidden" name="spacenum" value="${spaceNum }">
			<input type="hidden" name="detailspacenum" value="${detailSpaceNum }">
			<div class="col-sm-12 d-flex justify-content-end">
				<button type="submit" class="btn btn-primary me-1 mb-1"
				 onClick="return processing()">저장</button>
				<button type="reset" class="btn btn-light-secondary me-1 mb-1">취소</button>
			</div>
		</div>
	</div>
</form:form>
<script type="text/javascript">
	function processing(){
		var start_time = $('select[name="checkintime"]').val();
		var end_time = $('select[name="checkouttime"]').val();
		
		var opStime = ${spaceBean.operatingtime};
		var opEtime = ${spaceBean.operatingendtime};
		if(opStime == 0 && opEtime == 24){
			//24시간 운영
			return true;
		}
		if(parseInt(start_time) > parseInt(end_time)){
			alert("시작시간은 종료시간보다 빨라야 합니다.");
			return false;
		}
		else if(start_time == end_time){
			alert("시작시간과 종료시간이 같을 수 없습니다.");
			return false;
		}
		return true;
	}
</script>