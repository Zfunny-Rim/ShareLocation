<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

 <style type="text/css">
	.err{
		font-size:9pt;
		color:skyblue;
		font-weight:bold;
	}
</style>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IPS partagé</title>
    <%@ include file="/WEB-INF/views/include/head_css.jsp" %>
    <%-- ******* CUSTOM CSS Link HERE ******* --%>
    
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
	                    <div class="row match-height">
	                        <div class="col-md-6 col-12">
	                            <div class="card">
	                                <div class="card-header">
	                                    <h4 class="card-title">회원수정</h4>
	                                </div>
	                                <div class="card-content">
	                                    <div class="card-body">
	                                    <%@include file="./../common/common.jsp"%>
	                                        <form:form commandName="member" class="form form-vertical" action="register.member" method="post">
	                                            <div class="form-body">
	                                                <div class="row">
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="first-name-vertical">ID : ${member.id }</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="first-name-vertical">Password</label>
	                                                            <input type="password" id="first-name-vertical" class="form-control" name="password" value="${member.password }">
	                                                        	<form:errors cssClass="err" path="password"/>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="first-name-vertical">Nickname</label>
	                                                            <input type="text" id="first-name-vertical" class="form-control" name="nickname" value="${member.nickname }">
	                                                        	<form:errors cssClass="err" path="nickname"/>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="email-id-vertical">Email</label>
	                                                            <input type="email" id="email-id-vertical" class="form-control" name="email" value="${member.email }">
	                                                        	<form:errors cssClass="err" path="email"/>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="email-id-vertical">Address</label>
	                                                            <input type="text" id="first-name-vertical" class="form-control" name="address" value="${member.address }">
	                                                        	<form:errors cssClass="err" path="address"/>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="contact-info-vertical">Phone Number</label>
	                                                            <input type="text" id="first-name-vertical" class="form-control" name="hp" value="${member.hp }">
	                                                        	<form:errors cssClass="err" path="hp"/>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="password-vertical">Birth</label>
	                                                            <input type="date" id="first-name-vertical" class="form-control" name="birth" value="${member.birth }">
	                                                        	<form:errors cssClass="err" path="birth"/>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-check">
	                                                            <label for="first-name-vertical">Gender</label>
	                                                            <div class="checkbox">
	                                                                <input type="checkbox" id="checkbox3" name="gender" value="남자" class="form-check-input" <c:if test="${member.gender == '남' }">checked</c:if>>
	                                                                <label for="checkbox3">Male</label>
	                                                            </div>
	                                                            <div>
	                                                                <input type="checkbox" id="checkbox3" name="gender" value="여자" class="form-check-input" <c:if test="${member.gender == '여' }">checked</c:if>>
	                                                                <label for="checkbox3">Female</label>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-check">
	                                                            <label for="first-name-vertical">Type</label>
	                                                            <div class="checkbox">
	                                                                <input type="checkbox" id="checkbox3" name="type" value="guest" class="form-check-input" <c:if test="${member.type == 'guest' }">checked</c:if>>Guest
	                                                            </div>
	                                                            <div class="checkbox">
	                                                                <input type="checkbox" id="checkbox3" name="type" value="host" class="form-check-input" <c:if test="${member.type == 'host' }">checked</c:if>>Host
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12 d-flex justify-content-end">
	                                                        <button type="submit" class="btn btn-primary me-1 mb-1">수정하기</button>
	                                                        <button type="reset" class="btn btn-light-secondary me-1 mb-1">취소</button>
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
		
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>