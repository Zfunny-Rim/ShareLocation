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
		<div id="main" style="padding-top: 0px;">
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
												<form class="form form-vertical" action="register.member"
													method="post">
													<input type="hidden" id="hemail" name="email"> <input
														type="hidden" id="hhp" name="hp">
													<div class="form-body">
														<div class="row">
															<label>아이디<span class="required">*</span></label>
															<div class="col-md-10 form-group">
																<input type="text" class="form-control" id="problem_id"
																	name="id" placeholder="ID">
															</div>
															<div class="col-md-2 form-group">
																<input type="button" class="form-control" id="id_button"
																	onclick="id_check(event)" value="중복확인">
															</div>
															<span id="id_check_alert"
																style="color: red; font-weight: bold; font-size: 11px;"></span>
															<div class="col-12">
																<div class="form-group">
																	<label>비밀번호<span class="required">*</span></label> <input
																		type="password" id="inputpassword"
																		class="form-control" name="password"
																		placeholder="Password">
																</div>
															</div>
															<div class="col-12">
																<div class="form-group">
																	<label>비밀번호확인<span class="required">*</span></label> <input
																		type="password" id="repassword" class="form-control"
																		name="repassword" placeholder="비밀번호확인">
																</div>
															</div>
															<div class="col-12">
																<label>닉네임<span class="required">*</span></label>
															</div>
															<div class="col-md-10 form-group">
																<input type="text" id="problem_nickname"
																	class="form-control" name="nickname"
																	placeholder="Nickname">
															</div>
															<div class="col-md-2 form-group">
																<input type="button" class="form-control"
																	id="nickname_button" onclick="nickname_check(event)"
																	value="중복확인">
															</div>
															<span id="nickname_check_alert"
																style="color: red; font-weight: bold; font-size: 11px;"></span>
															<div class="col-12">
																<label>이름<span class="required">*</span></label>
															</div>
															<div class="col-md-12 form-group">
																<input type="text" id="problem_name"
																	class="form-control" name="name" placeholder="name">
															</div>
															<div class="col-12">
																<label>이메일<span class="required">*</span></label>
															</div>
															<div class="form-group">
																<div class="input-group mb-3">
																	<input type="text" class="form-control" id="firstemail"
																		name="email_id" placeholder="아이디"> <span
																		class="input-group-text">@</span> <select
																		class="form-select" id="secondemail"
																		name="domain_selector">
																		<option value="">선택</option>
																		<option value="naver.com">naver.com</option>
																		<option value="hanmail.net">hanmail.net</option>
																		<option value="gmail.com">gmail.com</option>
																		<option value="daum.net">daum.net</option>
																	</select>
																</div>
															</div>
															<div class="col-12">
																<div class="form-group">
																	<label>주소<span class="required">*</span></label> <input
																		type="text" id="address" class="form-control"
																		name="address" placeholder="Address">
																</div>
															</div>
															<div class="col-md-4">
																<label>연락처 <span class="required">*</span></label>
															</div>
															<div class="col-md-8 form-group">
																<div class="input-group">
																	<input type="text" class="form-control" id="hp1"
																		name="hp1" placeholder="010"> <span
																		class="input-group-text">-</span> <input type="text"
																		class="form-control" id="hp2" name="hp2"
																		placeholder="1234"> <span
																		class="input-group-text">-</span> <input type="text"
																		class="form-control" id="hp3" name="hp3"
																		placeholder="5678">
																</div>
															</div>
															<div class="col-12">
																<div class="form-group">
																	<label>생일<span class="required">*</span></label> <input
																		type="date" id="birth" class="form-control"
																		name="birth">
																</div>
															</div>
															<div class="col-12">
																<div class="form-check">
																	<label>성별<span class="required">*</span></label>
																	<div class="checkbox">
																		<input type="checkbox" id="checkbox3" name="gender"
																			value="남" class="form-check-input" checked> <label
																			for="checkbox3">Male</label>
																	</div>
																	<div class="checkbox">
																		<input type="checkbox" id="checkbox3" name="gender"
																			value="여" class="form-check-input"> <label
																			for="checkbox3">Female</label>
																	</div>
																</div>
															</div>
															<div class="col-12">
																<div class="form-check">
																	<label>방문목적<span class="required">*</span></label>
																	<div class="checkbox">
																		<input type="checkbox" id="checkbox3" name="type"
																			value="guest" class="form-check-input" checked>Guest
																	</div>
																	<div class="checkbox">
																		<input type="checkbox" id="checkbox3" name="type"
																			value="host" class="form-check-input">Host
																	</div>
																</div>
															</div>
															<div class="col-12 d-flex justify-content-end">
																<input type="submit" class="btn btn-primary me-1 mb-1"
																	onClick="return processing()" value="가입하기"> <input
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
			let checkId = false;
			let checkNickName = false;

			//아이디 중복체크
			async
			function id_check(e) {
				e.preventDefault();
				var problem_id = $('#problem_id').val();

				if (problem_id == "") {
					$("#id_check_alert").html("아이디를 입력하세요.");
					$('input[id="problem_id"]').focus();
					return false;
				}

				$.ajax({
					url : "idcheck.member",
					type : "POST",
					data : {
						"problem_id" : problem_id
					},
					dataType : "text",
					success : function(data) {
						if (data == "no") {
							$("#id_check_alert").html("사용 가능한 아이디입니다.");
							checkId = true;
						} else {
							$("#id_check_alert").html("이미 사용중인 아이디입니다.");
							$('input[id="problem_id"]').val("");
							$('input[id="problem_id"]').focus();
							checkId = false;
							return false;
						}
					},
					error : function() { /* 404, 415, 400등 이런 에러 발생 시 실행 */
						console.log("checkDuplicating error!");
					}
				});
			}

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

				if (checkId == false) {
					alert("아이디 중복체크는 필수입니다.");
					$("#id_button").focus();
					return false;
				}
				if (checkNickName == false) {
					alert("닉네임 중복체크는 필수입니다.");
					$("#nickname_button").focus();
					return false;
				}
				if ($("#inputpassword").val() == "") {
					alert("비밀번호를 입력하세요");
					$('input[id="inputpassword"]').focus();//포커스는 되는데 거기로 이동이 안된다
					return false;
				}
				if ($("#inputpassword").val() != $("#repassword").val()) {
					alert("비밀번호를 확인하세요.");
					$('input[id="repassword"]').val("");
					$('input[id="repassword"]').focus();
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
					alert("이메일을 선택해주세요");
					$("#secondemail").focus();    
					return false;
				}
				   
				var emailStr = $("#firstemail").val() + "@"
						+ $("#secondemail").val();
				$("#hemail").val(emailStr);
				
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