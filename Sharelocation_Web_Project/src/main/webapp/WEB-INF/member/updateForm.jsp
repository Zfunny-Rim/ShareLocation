
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/tagLib.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IPS partagé</title>
<%@ include file="/WEB-INF/views/include/head_css.jsp"%>
<%-- ******* CUSTOM CSS Link HERE ******* --%>
<style type="text/css">
.required {
	color: red;
}
</style>
<%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp"%>
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp"%>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
		<div id="" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">
						<%-- ******* Main Code HERE ******* --%>
						<section id="basic-vertical-layouts">
							<div class="row justify-content-md-center">
								<div class="col-md-8 col-12">
									<div class="card">
										<div class="card-header">
											<h4 class="card-title">회원수정</h4>
										</div>
										<div class="card-content">
											<div class="card-body">
												<form class="form form-vertical" action="update.member"
													method="post">
													<input type="hidden" id="hemail" name="email"> 
													<input type="hidden" id="hhp" name="hp">
													<input type="hidden" name="id" value="${member.id }">
													<input type="hidden" name="password" value="${member.password }">
													<div class="form-body">
														<div class="row">
															<label>아이디<span class="required">*</span></label>
															<label>${member.id }</label>
															<br><br>
															<div class="col-12">
																<label>닉네임<span class="required">*</span></label>
															</div>
															<div class="col-md-10 form-group">
																<input type="text" id="problem_nickname"
																	class="form-control" name="nickname"
																	value="${member.nickname }">
															</div>
															<div class="col-md-2 form-group">
																<input type="button" class="form-control"
																	id="nickname_button" onclick="nickname_check(event)"
																	value="중복확인">
															</div>
															<span id="nickname_check_alert"
																style="color: red; font-weight: bold; font-size: 11px;"></span>
															<br>
															<div class="col-12">
																<label>이름<span class="required">*</span></label>
															</div>
															<div class="col-md-12 form-group">
																<input type="text" id="problem_name"
																	class="form-control" name="name" value="${member.name }">
															</div>
															<br><br><br>  
															<div class="col-md-8 form-group">
															<label>이메일<span class="required">*</span></label>
		                                                    <div class="input-group mb-3">
			                                                    <input type="text" class="form-control" id="firstemail" name="email_id" value="${email_id }">
			                                                    <span class="input-group-text">@</span>
			                                                    <input type="text" class="form-control" id="secondemail" name="email_domain" value="${email_domain }">
			                                                    <select class="form-select" name="domain_selector" id="thirdemail">
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
															<br><br>
															<div class="col-12">
																<div class="form-group">
																	<label>주소<span class="required">*</span></label> <input
																		type="text" id="address" class="form-control"
																		name="address" value="${member.address}" >
																</div>
															</div>
															<br><br><br><br>
															<div class="col-md-4">
																<label>연락처 <span class="required">*</span></label>
															</div>
															<div class="col-md-8 form-group">
																<div class="input-group">
																	<input type="text" class="form-control" id="hp1"
																		name="hp1" value="${hp1 }" > <span
																		class="input-group-text">-</span> <input type="text"
																		class="form-control" id="hp2" name="hp2"
																		value="${hp2 }"> <span
																		class="input-group-text">-</span> <input type="text"
																		class="form-control" id="hp3" name="hp3"
																		value="${hp3 }">   
																</div>
															</div>
															<br><br><br>
															<div class="col-12">
																<div class="form-group">
																	<label>생일<span class="required">*</span></label> 
																	<fmt:parseDate var="fmtDate" value="${member.birth}" pattern="yyyy-MM-dd"/>
																	<fmt:formatDate var="regDate" value="${fmtDate}" pattern="yyyy-MM-dd"/>
																	<input
																		type="date" id="birth" class="form-control"
																		name="birth" value="${regDate }">
																</div>
															</div>
																<br><br><br><br>
															<div class="col-12">
																	<label>성별<span class="required">*</span></label><br>
																	<input
																	class="form-check-input" type="radio" name="gender"
																	value="남" id="flexRadioDefault2" 
																	<c:if test="${member.gender=='남'}">checked</c:if>>
																남자 &nbsp;&nbsp;&nbsp;&nbsp;<input class="form-check-input" type="radio"
																	name="gender" value="여" id="flexRadioDefault2"
																	<c:if test="${member.gender=='여'}">checked</c:if>>
																여자
															</div>
															<br><br><br>
															<div class="col-12">
																<label>방문목적<span class="required">*</span></label><br> <input
																	class="form-check-input" type="radio" name="type"
																	value="guest" id="flexRadioDefault2" 
																	<c:if test="${member.type=='guest'}">checked</c:if>>
																Guest &nbsp;&nbsp;<input class="form-check-input" type="radio"
																	name="type" value="host" id="flexRadioDefault2"
																	<c:if test="${member.type=='host'}">checked</c:if>>
																Host
															</div>
															<div class="col-12 d-flex justify-content-end">
																<input type="submit" class="btn btn-primary me-1 mb-1"
																	onClick="return processing()" value="수정하기"> <input
																	type="button" class="btn btn-light-secondary me-1 mb-1"
																	onClick="javascript:history.back()" value="취소">
															</div>
														</div>
													</div>
												</form>
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
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script>
		$(function(){
	  		$("#thirdemail").change(function(){
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
		<script>
			let checkNickName = false;

			//닉네임 중복체크
			async
			function nickname_check(e) {
				e.preventDefault();
				var problem_nickname = $('#problem_nickname').val();

				if (problem_nickname == "") {
					$("#nickname_check_alert").html("닉네임를 입력하세요.");
					$('input[id="problem_nickname"]').focus();
					return false;
				}

				$
						.ajax({
							url : "nicknamecheck.member",
							type : "POST",
							data : {
								"problem_nickname" : problem_nickname
							},
							dataType : "text",
							success : function(data) {
								if (data == "no") {
									$("#nickname_check_alert").html(
											"사용 가능한 닉네임 입니다.");
									checkNickName = true;
								} else {
									$("#nickname_check_alert").html(
											"이미 사용중인 닉네임 입니다.");
									$('input[id="problem_nickname"]').val("");
									$('input[id="problem_nickname"]').focus();
									checkNickName = false;
									return false;
								}
							},
							error : function() { /* 404, 415, 400등 이런 에러 발생 시 실행 */
								console.log("checkDuplicating error!");
							}
						});
			}
			
			async
			function processing() {

				if (checkNickName == false) {
					alert("닉네임 중복체크는 필수입니다.");
					$("#nickname_button").focus();
					return false;
				}
				
				if($("#problem_name").val() == ""){
					alert("이름을 입력하세요");
					$("#problem_name").focus();    
					return false;
				}
				
				//email
				if($("#firstemail").val() == ""){
					alert("이메일을 입력하세요");
					$("#firstemail").focus();    
					return false;
				}
				if($("#secondemail").val() == ""){
					alert("이메일을 선택하거나 입력해주세요");
					$("#secondemail").focus();    
					return false;
				}
				
				var emailStr = $("#firstemail").val()+"@"+$("#secondemail").val();
		  		$("#hemail").val(emailStr);
				
		  		//주소
				if($("#address").val()==""){
					alert("주소를 입력하세요.")
					$("#address").focus();
					return false;
				}
				
				//hp
				if($("#hp1").val()==""){
					alert("전화번호를 입력하세요.");  
					$("#hp1").focus();
					return false;
				}
				if($("#hp2").val()==""){
					alert("전화번호를 입력하세요.");  
					$("#hp2").focus();
					return false;
				}
				if($("#hp3").val()==""){
					alert("전화번호를 입력하세요.");  
					$("#hp3").focus();
					return false;
				}
				
				var hpStr = $('input[name="hp1"]').val() + "-" + $("#hp2").val() + "-" + $("#hp3").val();
				$("#hhp").val(hpStr);
				
				if($("#birth").val()==""){
					alert("생일을 선택하세요");
					$("#birth").focus();
					return false;
				}
				return true;
			}
			
			
			
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>