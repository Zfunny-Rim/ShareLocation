<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<link rel="stylesheet" href="./resources/assets/vendors/choices.js/choices.min.css">
<style type="text/css">
	.err{color:red; font-weight: bold; font-size:11px;}
	.required{color:red;}
</style>
    
    
<form:form commandName="spaceBean" class="form form-horizontal"
			action="spaceManageModify.ho" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${spaceBean.num }"/>
	<div class="form-body">
		<div class="row">
			<div class="divider">
				<div class="divider-text">기본 정보</div>
			</div>
			<div class="col-md-4">
				<label>공간 이름 <span class="required">*</span>
				</label>
			</div>
			<div class="col-md-8 form-group">
				<input type="text" class="form-control" name="name" value="${spaceBean.name }">
				<p>
					<small class="text-muted"> <form:errors cssClass="err"
							path="name" />
					</small>
				</p>
			</div>
			<%
			String[][] spaceTypeArr = { { "파티룸", "스터디룸", "게임룸", "카페", "공유주방", "회의실" }, { "연습실", "보컬연습실", "악기연습실", "녹음실", "운동시설" },
					{ "촬영스튜디오", "라이브방송", "공연장", "갤러리", "스몰웨딩" }, { "공유오피스", "독립오피스", "강의실", "세미나실", "컨퍼런스" } };
			%>
			<c:forEach var="spaceTypeArr1" items="<%=spaceTypeArr%>"
				varStatus="vs">
				<div class="col-md-4">
					<label><c:if test="${vs.count eq 1 }">
	                        공간 종류 <span class="required">*</span>
					</c:if></label>
				</div>
				<div class="col-md-8 form-group">
					<c:forEach var="spaceTypeStr" items="${spaceTypeArr1 }">
						<input type="radio" class="btn-check" name="type"
							id="${spaceTypeStr }" autocomplete="off" value="${spaceTypeStr }"
							<c:if test="${spaceTypeStr eq spaceBean.type }">checked</c:if>
							>
						<label class="btn btn-outline-primary" for="${spaceTypeStr }">${spaceTypeStr }</label>
					</c:forEach>
					<c:if test="${vs.last }">
						<p><small class="text-muted">
							<form:errors cssClass="err" path="type" />
						</small></p>
					</c:if>
				</div>
			</c:forEach>

			<div class="col-md-4">
				<label>공간 한줄소개 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<input type="text" class="form-control" name="contentssim"
					value="${spaceBean.contentssim }">
				<p><small class="text-muted">
					<form:errors cssClass="err"	path="contentssim" />
				</small></p>
			</div>
			<div class="col-md-4">
				<label>공간 소개 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<textarea class="form-control" rows="3" name="contentscom"
					style="margin-top: 0px; margin-bottom: 0px; height: 170px; resize: none;">${spaceBean.contentscom }</textarea>
				<p><small class="text-muted"> 
					<form:errors cssClass="err"	path="contentscom" />
				</small></p>
			</div>
			<div class="col-md-4">
				<label>공간 태그</label>
			</div>
			<div class="col-md-8 form-group">
				<input class="form-control" id="choices-text-remove-button"
					type="text" name="tag" value="${spaceBean.tag }" />
			</div>
			<div class="col-md-4">
				<label>시설 안내 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="fac_input">
					<button class="btn btn-primary" type="button" id="fac_addbtn"
						onClick="fac_add_btn()">추가</button>
				</div>
				<fieldset class="form-group">
					<select class="form-select" name="facility" multiple>
						<c:forEach var="fac" items="${spaceFacilityList }">
							<option value="${fac.facility }">${fac.facility }</option>
						</c:forEach>
					</select>
				</fieldset>
				<div class="col-sm-12 d-flex justify-content-between">
					<p>
						<small class="text-muted"> <form:errors cssClass="err" />
						</small>
					</p>
					<button class="btn btn-sm btn-danger" type="button" id="fac_delbtn"
						onClick="fac_del_btn()">선택삭제</button>
				</div>
			</div>
			<div class="col-md-4">
				<label>사용 시 주의사항 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<textarea class="form-control" rows="3" name="warning"
					style="margin-top: 0px; margin-bottom: 0px; height: 170px; resize: none;">사용시 주의사항</textarea>
				<p>
					<small class="text-muted"> <form:errors cssClass="err"
							path="warning" />
					</small>
				</p>
			</div>
			<div class="col-md-4">
				<label>대표 이미지 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<div class="img-box border border-dark rounded-3 p-2 mb-2 bg-light">
					<img src="<%=request.getContextPath() %>/resources/spaceimage/${spaceBean.mainimage}"
					 style="width:100px;height:100px; margin:5px 7px;">
				</div>
				<input class="form-control" type="file" name="mainimageupdatefile">
				<small class="text-muted"> 이미지 선택시 기존 이미지는 삭제됩니다. </small>
				<p>
					<small class="text-muted"> <form:errors cssClass="err"
							path="mainimage" />
					</small>
				</p>
			</div>
			<div class="col-md-4">
				<label>이미지 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<div class="img-box border border-dark rounded-3 p-2 mb-2 bg-light">
					<c:forEach var="imageBean" items="${spaceImageList }">
						<img src="<%=request.getContextPath() %>/resources/spaceimage/${imageBean.image}"
						 style="width:100px;height:100px; margin:5px 7px;">
					</c:forEach>
				</div>
				<input class="form-control" type="file" name="spaceimageupdatefile"
					multiple="multiple">
				<small class="text-muted"> 이미지 선택시 기존 이미지들은 모두 삭제됩니다. </small>
				<p>
					<small class="text-muted"> <form:errors cssClass="err"
							path="spaceimageCount" />
					</small>
				</p>
			</div>
			<div class="col-md-4">
				<label>주소(위치) <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<div class="input-group mb-2">
					<input type="text" class="form-control"
						placeholder="현재 동작하지 않음. 추후 API 추가 예정">
					<button class="btn btn-primary" type="button" id="button-addon1">주소검색</button>
				</div>
				<input type="text" class="form-control" name="address" value="상세주소">
				<p>
					<small class="text-muted"> <form:errors cssClass="err"
							path="address" />
					</small>
				</p>
			</div>
			<div class="col-md-4">
				<label>웹사이트</label>
			</div>
			<div class="col-md-8 form-group">
				<input type="text" class="form-control" name="site" value="Site URL">
			</div>
			<div class="divider">
				<div class="divider-text">연락처 정보</div>
			</div>
			<div class="col-md-4">
				<label>이메일</label>
			</div>
			<div class="col-md-8 form-group">
				<div class="input-group mb-3">
					<c:if test="${empty spaceBean.email }">
						<c:set var="emailid" value=""/>
						<c:set var="emaildomain" value=""/>
					</c:if>
					<c:if test="${not empty spaceBean.email }">
						<c:set var="emailToken" value="${fn:split(spaceBean.email,'@')}"/>
						<c:set var="emailid" value="${emailToken[0] }"/>
						<c:set var="emaildomain" value="${emailToken[1] }"/>
					</c:if>
					<input type="text" class="form-control" name="email_id"	value="${emailid }">
					<span class="input-group-text">@</span>
					<input type="text" class="form-control" name="email_domain"	value="${emaildomain }">
					<select class="form-select"	name="domain_selector" id="domain_selector">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="nate.com">nate.com</option>
					</select>
				</div>
			</div>
			<div class="col-md-4">
				<label>연락처 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<div class="input-group">
					<c:set var="hpToken" value="${fn:split(spaceBean.hp, '-')}"/>
					<input type="text" class="form-control" name="hp1" value="${hpToken[0] }">
					<span class="input-group-text">-</span> <input type="text"
						class="form-control" name="hp2" value="${hpToken[1] }"> <span
						class="input-group-text">-</span> <input type="text"
						class="form-control" name="hp3" value="${hpToken[2] }">
				</div>
				<p>
					<small class="text-muted"> <form:errors cssClass="err"
							path="hp" />
					</small>
				</p>
			</div>
			<div class="divider">
				<div class="divider-text">이용 정보</div>
			</div>
			<div class="col-md-4">
				<label>이용시간 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<div class="input-group mb-3">
					<select class="form-select" name="operatingtime">
						<c:forEach var="i" begin="0" end="24">
							<option value="${i}"
							<c:if test="${spaceBean.operatingtime eq i }">selected</c:if>
							>
								<fmt:formatNumber value="${i }" pattern="00" />
							</option>
						</c:forEach>
					</select> <span class="input-group-text">시 부터</span> <select
						class="form-select" name="operatingendtime">
						<c:forEach var="i" begin="0" end="24">
							<option value="${i}"
							<c:if test="${spaceBean.operatingendtime eq i }">selected</c:if>
							>
								<fmt:formatNumber value="${i }" pattern="00" />
							</option>
						</c:forEach>
					</select> <span class="input-group-text">시 까지</span>
				</div>
				<p>
					<small class="text-muted"> <form:errors cssClass="err" />
					</small>
				</p>
			</div>
			<div class="col-md-4">
				<label>정기휴무</label>
			</div>
			<div class="col-md-8 form-group">
				<ul class="list-unstyled mb-0">
					<%
					String[] weekArr = { "월", "화", "수", "목", "금", "토", "일" };
					%>
					<c:forEach var="weekStr" items="<%=weekArr%>">
						<li class="d-inline-block me-2 mb-1">
							<div class="form-check">
								<div class="custom-control custom-checkbox">
									<input type="checkbox"
										class="form-check-input form-check-primary form-check-glow"
										name="holiday" id="${weekStr }" value="${weekStr }"
										<c:if test="${fn:contains(spaceBean.holiday, weekStr)}">
											checked
										</c:if>
										> 
									<label class="form-check-label" for="${weekStr }">${weekStr }</label>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<hr class="divider">
			<input type="hidden" name="email">
			<input type="hidden" name="hp">
			<input type="hidden" name="mainimageOrigin" value="${spaceBean.mainimage }">
			<input type="hidden" name="spaceimageOriginCount" value="${spaceImageList.size() }">
			<div class="col-sm-12 d-flex justify-content-end">
				<button type="submit" class="btn btn-primary me-1 mb-1"
					onClick="return processing()">수정</button>
				<button type="reset" class="btn btn-light-secondary me-1 mb-1">취소</button>
			</div>
		</div>
	</div>
</form:form>



<script src="./resources/assets/vendors/choices.js/choices.min.js"></script>
<script>
     document.addEventListener('DOMContentLoaded', function() {
       var textRemove = new Choices(
               document.getElementById('choices-text-remove-button'),
               {
                 delimiter: ',',
                 editItems: true,
                 maxItemCount: 5,
                 removeItemButton: true,
               }
     	);
     });
     
 	function fac_add_btn(){
 		var fac_text = $('input[id="fac_input"]').val();
		if(fac_text == ''){
			alert('시설안내를 입력하세요.');
			return;
		}else if($('select[name="facility"] option').length >= 10){
			alert('시설안내는 10개까지 입력 가능합니다.');
			return;
		}
		else{
			$('select[name="facility"]').append('<option value="'+fac_text+'">'+fac_text+'</option>');
		}
	}
 	
 	function fac_del_btn(){
 		$('select[name="facility"] option:selected').each(function(){
 			$(this).remove();
 		});
 	}
 	
 	function processing(){
 		$('select[name="facility"] option').each(function(){
 			$(this).attr('selected', 'selected');
 		});
 		//email
 		var emailStr = $('input[name="email_id"]').val()+"@"+$('input[name="email_domain"]').val();
 		$('input[name="email"]').val(emailStr);
	
 		//hp
 		var hpStr = $('input[name="hp1"]').val()+"-"+$('input[name="hp2"]').val()+"-"+$('input[name="hp3"]').val();
 		$('input[name="hp"]').val(hpStr);
 		
 		var opTime = Number($('select[name="operatingtime"]').val());
 		var opEndTime = Number($('select[name="operatingendtime"]').val());
 		if(opTime >= opEndTime){
 			alert('운영시간을 정확하게 입력해주세요.');
 			return false;
 		}
 		return true;
 	}
 	
 	var target = document.getElementById('domain_selector');
 	target.addEventListener('change', function(event){
		var selVal = $('select[name="domain_selector"] option:selected').val();
		if(selVal == ""){
			$('input[name="email_domain"]').val('');
			$('input[name="email_domain"]').removeAttr('readonly');
		}else{
			$('input[name="email_domain"]').val(selVal);
			$('input[name="email_domain"]').attr('readonly', 'readonly');
		}
 	});
 	
//   	$(function(){
// 		$('select[name="domain_selector"]').change(function(){
//  			alert(1);
//  			var selVal = $('select[name="domain_selector"] option:selected').val();
//  			if(selVal == ""){
//  				$('input[name="email_domain"]').val('');
//  				$('input[name="email_domain"]').removeAttr('readonly');
//  			}else{
//  				$('input[name="email_domain"]').val(selVal);
//  				$('input[name="email_domain"]').attr('readonly', 'readonly');
//  			}
//  		});
// 	});
</script>