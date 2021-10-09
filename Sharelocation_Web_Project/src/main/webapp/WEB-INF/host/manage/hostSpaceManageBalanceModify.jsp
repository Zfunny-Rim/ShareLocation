<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<style type="text/css">
	.err{color:red; font-weight: bold; font-size:11px;}
	.required{color:red;}
</style>
<h4 class="card-title">정산정보 수정하기</h4>
<hr>
<form:form commandName="balanceBean" class="form form-horizontal"
	action="spaceManageBalanceModify.ho" method="post"
	enctype="multipart/form-data" name="insert_form">
	<div class="form-body">
		<div class="row">
			<div class="col-md-4">
				<label>상호명 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<input type="text" class="form-control" name="company" value="${balanceBean.company }">
				<p>
					<small class="text-muted"> <form:errors cssClass="err"
							path="company" />
					</small>
				</p>
			</div>
			<div class="col-md-4">
				<label>대표자명 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<input type="text" class="form-control" name="name"
					value="${balanceBean.name }">
				<p><small class="text-muted">
				 <form:errors cssClass="err" path="name"/>
				</small></p>
			</div>
			<div class="col-md-4">
				<label>사업장 주소 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<div class="input-group mb-2">
	                <input type="text" class="form-control" placeholder="현재 동작하지 않음. 추후 API 추가 예정">
	                <button class="btn btn-primary" type="button" id="button-addon1">주소검색</button>
          		</div>
               <input type="text" class="form-control" name="address" value="${balanceBean.address }">
               <p><small class="text-muted">
                   	<form:errors cssClass="err" path="address"/>
               </small></p>
			</div>
			<div class="col-md-4">
				<label>이메일 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<div class="input-group mb-3">
					<c:if test="${empty balanceBean.email }">
						<c:set var="emailid" value=""/>
						<c:set var="emaildomain" value=""/>
					</c:if>
					<c:if test="${not empty balanceBean.email }">
						<c:set var="emailToken" value="${fn:split(balanceBean.email,'@')}"/>
						<c:set var="emailid" value="${emailToken[0] }"/>
						<c:set var="emaildomain" value="${emailToken[1] }"/>
					</c:if>
					<input type="text" class="form-control" name="email_id"	value="${emailid }">
					<span class="input-group-text">@</span> 
					<input type="text" class="form-control" name="email_domain" value="${emaildomain }"> 
					<select class="form-select"	id="domain_selector">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="nate.com">nate.com</option>
					</select>
				</div>
				<p><small class="text-muted">
				 <form:errors cssClass="err" path="email"/>
				</small></p>
			</div>
			<div class="col-md-4">
				<label>연락처 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<div class="input-group">
					<c:set var="hpToken" value="${fn:split(balanceBean.call, '-')}"/>
					<input type="text" class="form-control" name="hp1" value="${hpToken[0] }">
					<span class="input-group-text">-</span> <input type="text"
						class="form-control" name="hp2" value="${hpToken[1] }"> <span
						class="input-group-text">-</span> <input type="text"
						class="form-control" name="hp3" value="${hpToken[2] }">
				</div>
				<p><small class="text-muted">
					<form:errors cssClass="err" path="call" />
				</small></p>
			</div>
			<div class="col-md-4">
				<label>계좌정보 <span class="required">*</span></label>
			</div>
			<div class="col-md-8 form-group">
				<div class="input-group">
					<span class="input-group-text">은행</span> 
					<% String[] bankList = {"국민은행", "신한은행", "하나은행", "외환은행", "우리은행", "농협", "카카오뱅크"}; %>
					<select class="form-control" name="bank" style="max-width: 20%;">
						<option value="">은행선택</option>
						<c:forEach var="bankStr" items="<%=bankList%>">
							<option value="${bankStr }"
								<c:if test="${bankStr eq balanceBean.bank }">selected</c:if>
							>${bankStr }</option>
						</c:forEach>
					</select>
					<span class="input-group-text">계좌번호</span> 
					<input type="text" class="form-control" name="account" value="${balanceBean.account }"/>
				</div>
				<p><small class="text-muted">
				 <form:errors cssClass="err" path="bank"/> <form:errors cssClass="err" path="account"/>
				</small></p>
			</div>
			<hr class="divider">
			<input type="hidden" name="num" value="${balanceBean.num }">
			<input type="hidden" name="spacenum" value="${spaceNum }">
			<input type="hidden" name="email">
			<input type="hidden" name="call">
			<div class="col-sm-12 d-flex justify-content-end">
				<button type="submit" class="btn btn-primary me-1 mb-1"
					onClick="return processing()">저장</button>
				<button type="reset" class="btn btn-light-secondary me-1 mb-1">취소</button>
			</div>
		</div>
	</div>
</form:form>
<script type="text/javascript">

var target = document.getElementById('domain_selector');
	target.addEventListener('change', function(event){
	var selVal = $('select[id="domain_selector"] option:selected').val();
	if(selVal == ""){
		$('input[name="email_domain"]').val('');
		$('input[name="email_domain"]').removeAttr('readonly');
	}else{
		$('input[name="email_domain"]').val(selVal);
		$('input[name="email_domain"]').attr('readonly', 'readonly');
	}
});
	
function processing(){
	//email
	var email_id = $('input[name="email_id"]').val();
	var email_domain = $('input[name="email_domain"]').val();
	if(email_id == "" || email_domain == ""){
		
	}else{
		var emailStr = $('input[name="email_id"]').val()+"@"+$('input[name="email_domain"]').val();
		$('input[name="email"]').val(emailStr);
	}
	
	//hp
	var hp1 = $('input[name="hp1"]').val();
	var hp2 = $('input[name="hp2"]').val();
	var hp3 = $('input[name="hp3"]').val();
	if(hp1 == "" ||hp2 == "" ||hp3 == "" ){
		
	}else{
		var hpStr = $('input[name="hp1"]').val()+"-"+$('input[name="hp2"]').val()+"-"+$('input[name="hp3"]').val();
		$('input[name="call"]').val(hpStr);
	}
	
}
</script>