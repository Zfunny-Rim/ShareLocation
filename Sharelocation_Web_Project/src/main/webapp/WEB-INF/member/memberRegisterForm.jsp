<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/tagLib.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IPS partagé</title>
    <%@ include file="/WEB-INF/views/include/head_css.jsp" %>
    <%-- ******* CUSTOM CSS Link HERE ******* --%>
    <style type="text/css">
    	.err{color:red; font-weight: bold; font-size:11px;}
    	.required{color:red;}
    </style>
    <%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp" %>
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp" %>
        <div id="main" style="padding-top:0px;">
            <div id="main-content">
                <div class="page-heading">
                    <section class="section">
                    	<%-- ******* Main Code HERE ******* --%>
					<section id="basic-vertical-layouts">
	                    <div class="row justify-content-md-center">
	                        <div class="col-md-8 col-12">
	                            <div class="card">
	                                <div class="card-header">
	                                    <h4 class="card-title">회원가입</h4>
	                                </div>
	                                <div class="card-content">
	                                    <div class="card-body">
	                                    <%@include file="./../common/common.jsp"%>
	                                        <form:form commandName="memberBean" class="form form-vertical" action="register.member" method="post">
	                                            <div class="form-body">
	                                                <div class="row">
	                                                            <label>아이디<span class="required">*</span></label>
	                                                        <div class="col-md-10 form-group">
	                                                            <input type="text" class="form-control" name="id" placeholder="ID">
	                                                        	<form:errors cssClass="err" path="id"/>
	                                                        </div>
	                                                        <div class="col-md-2 form-group">
<<<<<<< HEAD
	                                                        ${idLists }<br>
	                                                        <c:forEach var="mbean" items="${idLists}" varStatus="vs">
	                                                        	${vs.count}<br>
	                                                        	${mbean.id }<br>
	                                                        </c:forEach>
	                                                            <input type="button" class="form-control" value="중복체크" onClick="idCheck('${idLists }')">
=======
	                                                            <input type="button" class="form-control" value="중복체크" onClick="idCheck('${idLists}')">
>>>>>>> branch 'master' of https://github.com/Zfunny-Rim/ShareLocation.git
	                                                        </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label>비밀번호<span class="required">*</span></label>
	                                                            <input type="password" id="first-name-vertical" class="form-control" name="password" placeholder="Password">
	                                                        	<form:errors cssClass="err" path="password"/>
	                                                        </div>
	                                                        <div class="form-group">
	                                                            <label>비밀번호확인<span class="required">*</span></label>
	                                                            <input type="password" id="first-name-vertical" class="form-control" name="repassword" placeholder="비밀번호확인">
	                                                        	<form:errors cssClass="err" path="password"/>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label>닉네임<span class="required">*</span></label>
	                                                            <input type="text" id="first-name-vertical" class="form-control" name="nickname" placeholder="Nickname">
	                                                        	<form:errors cssClass="err" path="nickname"/>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
															<label>이메일<span class="required">*</span></label>
														</div>
														<div class="form-group">
		                                                    <div class="input-group mb-3">
			                                                    <input type="text" class="form-control" name="email_id" placeholder="아이디">
			                                                    <span class="input-group-text">@</span>
			                                                    <input type="text" class="form-control" name="email_domain" placeholder="직접입력">
			                                                    <select class="form-select" name="domain_selector">
			                                                        <option value="">선택</option>
			                                                        <option value="naver.com">naver.com</option>
			                                                        <option value="hanmail.net">hanmail.net</option>
			                                                        <option value="gmail.com">gmail.com</option>
			                                                    </select>
			                                                </div>
														</div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label>주소<span class="required">*</span></label>
	                                                            <input type="text" id="first-name-vertical" class="form-control" name="address" placeholder="Address">
	                                                        	<form:errors cssClass="err" path="address"/>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-md-4">
															<label>연락처 <span class="required">*</span></label>
														</div>
														<div class="col-md-8 form-group">
		                                                    <div class="input-group">
			                                                    <input type="text" class="form-control" name="hp1" placeholder="010">
			                                                    <span class="input-group-text">-</span>
			                                                    <input type="text" class="form-control" name="hp2" placeholder="1234">
			                                                    <span class="input-group-text">-</span>
			                                                    <input type="text" class="form-control" name="hp3" placeholder="5678">
			                                                </div>
			                                                <p><small class="text-muted">
		                                                        	<form:errors cssClass="err" path="hp"/>
		                                                        </small></p>
														</div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label>생일<span class="required">*</span></label>
	                                                            <input type="date" id="first-name-vertical" class="form-control" name="birth">
	                                                        	<form:errors cssClass="err" path="birth"/>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12" style="float:left;">
	                                                        <div class="form-check">
	                                                            <label>성별<span class="required">*</span></label>
	                                                            <div class="checkbox">
	                                                                <input type="checkbox" id="checkbox3" name="gender" value="남" class="form-check-input" checked>
	                                                                <label for="checkbox3">Male</label>
	                                                            </div>
	                                                            <div>
	                                                                <input type="checkbox" id="checkbox3" name="gender" value="여" class="form-check-input">
	                                                                <label for="checkbox3">Female</label>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-check">
	                                                            <label>방문목적<span class="required">*</span></label>
	                                                            <div class="checkbox">
	                                                                <input type="checkbox" id="checkbox3" name="type" value="guest" class="form-check-input" checked>Guest
	                                                            </div>
	                                                            <div class="checkbox">
	                                                                <input type="checkbox" id="checkbox3" name="type" value="host" class="form-check-input">Host
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12 d-flex justify-content-end">
	                                                        <button type="submit" class="btn btn-primary me-1 mb-1" onClick="return processing()">가입하기</button>  
	                                                        <button type="button" class="btn btn-light-secondary me-1 mb-1" onClick="javascript:history.back()">취소</button>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </form:form>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </section>
                    	<%-- ******* Main Code END ******* --%>
                    </section>
                </div>
            </div>
        </div>
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp" %>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script>
		
		duplicate = false;
		
		function idCheck(idLists){
<<<<<<< HEAD
			alert(idLists);  
=======
			alert(idLists);
>>>>>>> branch 'master' of https://github.com/Zfunny-Rim/ShareLocation.git
			duplicate = true;
			
			if($('input[id="id"]').val().indexOf(idLists)){
				alert("이미 사용중인 아이디입니다.");
				$('input[id="id"]').val("");
			}
			else{
				alert("사용 가능한 아이디입니다.");
			}
		}
		
		if($(input[name="password"]).val()!=$(input[name="repassword"]).val()){
			alert("비번이 일치하지 않습니다.")
			$(input[name="password"]).select();
			return false;
		}
		
		function processing(){
			
			if(duplicate == false){
				alert("아이디 중복체크는 필수입니다.");
				return false;
			}
			
	  		$('select[name="facility"] option').each(function(){
	  			$(this).attr('selected', 'selected');
	  		});
	  		//email
	  		var emailStr = $('input[name="email_id"]').val()+"@"+$('input[name="email_domain"]').val();
	  		$('input[name="email"]').val(emailStr);
			
		   //hp
	  		var hpStr = $('input[name="hp1"]').val()+"-"+$('input[name="hp2"]').val()+"-"+$('input[name="hp3"]').val();
	  		$('input[name="hp"]').val(hpStr);
	  		
	  		return true;
	  	}
	  	
	  	$(function(){
	  		$('select[name="domain_selector"]').change(function(){
	  			var selVal = $('select[name="domain_selector"] option:selected').val();
	  			if(selVal == ""){
	  				$('input[name="email_domain"]').val('');
	  				$('input[name="email_domain"]').removeAttr('readonly');
	  			}else{
	  				$('input[name="email_domain"]').val(selVal);
	  				$('input[name="email_domain"]').attr('readonly', 'readonly');
	  			}
	  		});
	  	});
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>