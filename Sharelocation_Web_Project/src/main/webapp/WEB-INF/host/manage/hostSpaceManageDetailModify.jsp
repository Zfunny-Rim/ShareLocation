<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<style type="text/css">
	.err{color:red; font-weight: bold; font-size:11px;}
	.required{color:red;}
</style>
<h4 class="card-title">세부공간 수정하기</h4>
<form:form commandName="detailSpaceBean" class="form form-horizontal"
	action="detailSpaceInsert.ho" method="post"
	enctype="multipart/form-data" name="insert_form">
	<div class="form-body">
		<div class="row">
			<div class="divider">
				<div class="divider-text">기본 정보</div>
			</div>
			<div class="col-md-4">
				<label>세부공간 이름 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<input type="text" class="form-control" name="name" value="${detailSpaceBean.name }">
				<p>
					<small class="text-muted"> <form:errors cssClass="err"
							path="name" />
					</small>
				</p>
			</div>
			<div class="col-md-4">
				<label>세부공간 소개 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<input type="text" class="form-control" name="contents"
					value="${detailSpaceBean.contents }">
				<p>
					<small class="text-muted"> <form:errors cssClass="err" />
					</small>
				</p>
			</div>
			<div class="col-md-4">
				<label>대표 이미지 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<input class="form-control" type="file" name="mainimagefile">
				<p>
					<small class="text-muted"> <form:errors cssClass="err"
							path="mainimage" />
					</small>
				</p>
			</div>
			<div class="col-md-4">
				<label>최소 예약시간 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<input type="number" class="form-control" name="mintime" value="${detailSpaceBean.mintime  }">
				<p>
					<small class="text-muted"> <form:errors cssClass="err" />
					</small>
				</p>
			</div>
			<div class="col-md-6">
				<div class="row align-items-center">
					<div class="col-lg-4 col-4">
						<label>최소 인원 <span class="required">*</span></label>
					</div>
					<div class="col-lg-8 col-8">
						<input type="number" class="form-control" name="minperson"
							value="${detailSpaceBean.minperson }">
						<form:errors cssClass="err" />
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="row align-items-center">
					<div class="col-lg-4 col-4">
						<label>최대 인원<span class="required">*</span></label>
					</div>
					<div class="col-lg-8 col-8">
						<input type="number" class="form-control" name="maxperson"
							value="${detailSpaceBean.maxperson }">
						<form:errors cssClass="err" />
					</div>
				</div>
			</div>
			<div class="divider">
				<div class="divider-text">가격/옵션 정보</div>
			</div>
			<div class="col-md-4">
				<label>가격단위 설정 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<input class="form-check-input" type="radio" name="priceunit"
					id="priceunitTime" value="시간" checked> <label
					class="form-check-label" for="priceunitTime"
						<c:if test="${detailSpaceBean.priceunit eq '시간'}">checked</c:if>
					>시간당</label> <input
					class="form-check-input" type="radio" name="priceunit"
					id="priceunitPackage" value="공간"> <label
					class="form-check-label" for="priceunitPackage"
						<c:if test="${detailSpaceBean.priceunit eq '공간'}">checked</c:if>
					>공간당</label>
				<p>
					<small class="text-muted"> <form:errors cssClass="err" />
					</small>
				</p>
			</div>
			<div class="col-md-4">
				<label>인원당 가격 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<div class="input-group">
					<input type="number" class="form-control" name="price"
						value="${detailSpaceBean.price }"> <span class="input-group-text"
						id="priceUnitLabel">￦/시간</span>
					<form:errors cssClass="err" />
				</div>
			</div>

			<hr class="divider">
			<input type="hidden" name="spacenum" value="${spaceNum }">
			<input type="hidden" name="num" value="${detailSpaceBean.num }">
			<div class="col-sm-12 d-flex justify-content-end">
				<button type="submit" class="btn btn-primary me-1 mb-1">저장</button>
				<button type="reset" class="btn btn-light-secondary me-1 mb-1">취소</button>
			</div>
		</div>
	</div>
</form:form>