<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
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
		<%@ include file="/WEB-INF/views/include/body_sidebar_host.jsp" %>
        <div id="main" style="padding-top:0px;">
            <div id="main-content">
                <div class="page-heading">
                    <section class="section">
                    	<%-- ******* Main Code HERE ******* --%>
                    	
                    	<div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>공간 등록하기</h3>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item active" aria-current="page"><b>공간정보 입력</b></li>
                                        <li class="breadcrumb-item ">세부공간정보 입력</li>
                                        <li class="breadcrumb-item ">가격정보 입력</li>
                                        <li class="breadcrumb-item ">정산정보 입력</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                        
                    	<div class="row justify-content-md-center">
							<div class="col-md-8 col-12">
	                            <div class="card">
	                                <div class="card-header">
	                                    <h4 class="card-title">공간정보 입력</h4>
	                                </div>
	                                <div class="card-content">
	                                    <div class="card-body">
	                                        <form class="form form-horizontal">
	                                            <div class="form-body">
	                                                <div class="row">
	                                                    <div class="col-md-4">
	                                                        <label>공간 이름</label>
	                                                    </div>
	                                                    <div class="col-md-8 form-group">
	                                                        <input type="text" id="first-name" class="form-control" name="name" placeholder="First Name">
	                                                    </div>
	                                                    <% String[][] spaceTypeArr = {{"파티룸", "스터디룸", "강의실", "카페", "공유주방", "회의실"},
	                                                    							{"연습실", "보컬연습실", "악기연습실", "녹음실", "운동시설"},
	                                                    							{"촬영스튜디오", "라이브방송", "공연장", "갤러리", "스몰웨딩"}}; %>
	                                                    <div class="col-md-4">
	                                                        <label>공간 종류</label>
	                                                    </div>
	                                                    <div class="col-md-8 form-group">
	                                                    	<input type="radio" class="btn-check" name="type" id="partyRoom" autocomplete="off" value="파티룸">
	                                                    	<label class="btn btn-outline-primary" for="partyRoom">파티룸</label>
	                                                    	
	                                                    	<input type="radio" class="btn-check" name="type" id="studyRoom" autocomplete="off" value="스터디룸">
	                                                    	<label class="btn btn-outline-primary" for="studyRoom">스터디룸</label>
	                                                    	
	                                                    	<input type="radio" class="btn-check" name="type" id="lectureRoom" autocomplete="off" value="강의실">
	                                                    	<label class="btn btn-outline-primary" for="lectureRoom">강의실</label>

	                                                    	<input type="radio" class="btn-check" name="type" id="caffe" autocomplete="off" value="카페">
	                                                    	<label class="btn btn-outline-primary" for="caffe">카페</label>
	                                                    </div>
	                                                    <div class="col-md-4">
	                                                        <label></label>
	                                                    </div>
	                                                    <div class="col-md-8 form-group">
	                                                    	<input type="radio" class="btn-check" name="type" id="partyRoom" autocomplete="off" value="파티룸">
	                                                    	<label class="btn btn-outline-primary" for="partyRoom">파티룸</label>
	                                                    	
	                                                    	<input type="radio" class="btn-check" name="type" id="studyRoom" autocomplete="off" value="스터디룸">
	                                                    	<label class="btn btn-outline-primary" for="studyRoom">스터디룸</label>
	                                                    	
	                                                    	<input type="radio" class="btn-check" name="type" id="lectureRoom" autocomplete="off" value="강의실">
	                                                    	<label class="btn btn-outline-primary" for="lectureRoom">강의실</label>

	                                                    	<input type="radio" class="btn-check" name="type" id="caffe" autocomplete="off" value="카페">
	                                                    	<label class="btn btn-outline-primary" for="caffe">카페</label>
	                                                    </div>
	                                                    <div class="col-md-4">
	                                                        <label>Mobile</label>
	                                                    </div>
	                                                    <div class="col-md-8 form-group">
	                                                        <input type="number" id="contact-info" class="form-control" name="contact" placeholder="Mobile">
	                                                    </div>
	                                                    <div class="col-md-4">
	                                                        <label>Password</label>
	                                                    </div>
	                                                    <div class="col-md-8 form-group">
	                                                        <input type="password" id="password" class="form-control" name="password" placeholder="Password">
	                                                    </div>
	                                                    <div class="col-12 col-md-8 offset-md-4 form-group">
	                                                        <div class="form-check">
	                                                            <div class="checkbox">
	                                                                <input type="checkbox" id="checkbox1" class="form-check-input" checked="">
	                                                                <label for="checkbox1">Remember Me</label>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-sm-12 d-flex justify-content-end">
	                                                        <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
	                                                        <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </form>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                        </div>
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