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
	                    <div class="row justify-content-md-center">
	                        <div class="col-md-8 col-12">
	                            <div class="card">
	                                <div class="card-header">
	                                    <h4 class="card-title">MyPage</h4>
	                                </div>
	                                <div class="card-content">
	                                    <div class="card-body">
	                                    <%@include file="./../common/common.jsp"%>
	                                        <form class="form form-vertical" action="update.member" method="get">
	                                        <input type="hidden" name="id" value="${member.id }">
	                                            <div class="form-body">
	                                                <div class="row">
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="first-name-vertical">ID:${member.id }</label>
	                                                            <input type="hidden" id="id" value="${member.id }">
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="first-name-vertical">Password:${member.password }</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="first-name-vertical">name:${member.name }</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="first-name-vertical">Nickname:${member.nickname }</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="email-id-vertical">Email:${member.email }</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="email-id-vertical">Address${member.address }</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="contact-info-vertical">Phone Number:${member.hp }</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-group">
	                                                            <label for="password-vertical">Birth:${member.birth }</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-check">
	                                                            <label for="first-name-vertical">Gender:${member.gender }</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12">
	                                                        <div class="form-check">
	                                                            <label for="first-name-vertical">Type:${member.type }</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-12 d-flex justify-content-center">
	                                                        <button type="submit" class="btn btn-primary me-1 mb-1">수정하기</button>
	                                                        <button type="button" class="btn btn-light-secondary me-1 mb-1" onClick="location.href='delete.member'">탈퇴하기</button>
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
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp" %>
		<%-- ******* CUSTOM Script HERE ******* --%>
		
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>