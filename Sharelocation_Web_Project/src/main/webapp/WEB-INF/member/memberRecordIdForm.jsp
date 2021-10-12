<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="ko">
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
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
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
	                                    <h4 class="card-title">비밀번호변경</h4>
	                                </div>
	                                <div class="card-content">
	                                    <div class="card-body">
	                                        <form class="form form-vertical" action="record.member" method="post">
	                                        <input type="hidden" name="id" value="${id }">
	                                            <div class="form-body">
	                                                <div class="row">
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label>ID:${id}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="contact-info-vertical">새로운 비밀번호</label>
	                                                            <input type="password" class="form-control" id=newpassword name="password" placeholder="Password">
	                                                        </div>
	                                                    </div>
	                                                    <span id="pw_check_alert" style="color: red; font-weight: bold; font-size: 11px;"></span>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="contact-info-vertical">비밀번호 확인</label>
	                                                            <input type="password" class="form-control" id="renewpassword" name="repassword" placeholder="repassword">
	                                                        </div>
	                                                    </div>
	                                                    <span id="repw_check_alert" style="color: red; font-weight: bold; font-size: 11px;"></span>
	                                                    <div class="col-12 d-flex justify-content-end">
	                                                        <input type="submit" class="btn btn-primary me-1 mb-1" onClick="return processing()" value="확인">
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
		function processing(){
			
			if($("#newpassword").val() == ""){
				$("#pw_check_alert").html("새로운 비밀번호를 입력하세요.");
				$("#newpassword").focus();
				return false;
			}
			if($("#renewpassword").val() == ""){
				$("#repw_check_alert").html("비밀번호 확인을 입력하세요.");
				$("#renewpassword").focus();
				return false;
			}
			if($("#newpassword").val() != $("#renewpassword").val()){
				$("#repw_check_alert").html("비밀번호가 다릅니다.");
				$("#newpassword").focus();
				return false;
			}
				return true;
		}
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>