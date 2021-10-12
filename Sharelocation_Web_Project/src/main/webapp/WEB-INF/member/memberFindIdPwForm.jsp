<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<style type="text/css">
.err {
	font-size: 9pt;
	color: skyblue;
	font-weight: bold;
}
</style>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IPS partagé</title>
<%@ include file="/WEB-INF/views/include/head_css.jsp"%>
<%-- ******* CUSTOM CSS Link HERE ******* --%>

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
								<div class="col-md-6 col-12">
									<div class="card">
										<div class="card-header">
											<h4 class="card-title">계정 찾기</h4>
										</div>
										<div class="card-content">
											<div class="card-body">
												<form class="form form-vertical" action="findIdPw.member"
													method="post">
													<input type="hidden" id="hemail" name="email"> 
													<input type="hidden" id="hhp" name="hp">
													<div class="form-body">
														<div class="row">
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
															<span id="check_alert"
																style="color: red; font-weight: bold; font-size: 11px;"></span>
															<div class="col-12 d-flex justify-content-end">
																<input type="submit" class="btn btn-primary me-1 mb-1"
																	onClick="return checkEP(event)" value="찾기">
																<input type="button"
																	class="btn btn-light-secondary me-1 mb-1" onClick="javascript:history.back()" value="취소">
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
		async function checkEP(e){
			e.preventDefault();
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
			
			await  
			$.ajax({
				url : "emailHpCheck.member",
				type : "POST",
				data : {
					"email" : emailStr,
					"hp" : hpStr
				},
				dataType : "text",
				success : function(data){
					if(data == "no"){
						$("#check_alert").html("이메일과 연락처를 확인하세요.");
						return false;
					}
				},
				error : function() { /* 404, 415, 400등 이런 에러 발생 시 실행 */
					console.log("checkDuplicating error!");
				}
			});
		return true;
		}
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>