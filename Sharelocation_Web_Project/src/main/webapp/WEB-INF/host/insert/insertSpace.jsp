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
    <link rel="stylesheet" href="./resources/assets/vendors/choices.js/choices.min.css">
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
							<div class="col-md-9 col-12">
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
	                                                        <input type="text" id="first-name" class="form-control" name="name">
	                                                    </div>
	                                                    <% String[][] spaceTypeArr = {{"파티룸", "스터디룸", "게임룸", "카페", "공유주방", "회의실"},
	                                                    							{"연습실", "보컬연습실", "악기연습실", "녹음실", "운동시설"},
	                                                    							{"촬영스튜디오", "라이브방송", "공연장", "갤러리", "스몰웨딩"},
	                                                    							{"공유오피스", "독립오피스", "강의실", "세미나실", "컨퍼런스"}}; %>
	                                                    <c:forEach var="spaceTypeArr1" items="<%=spaceTypeArr%>" varStatus="vs">
	                                                    	<div class="col-md-4">
	                                                        	<label>
	                                                        		<c:if test="${vs.count eq 1 }">
	                                                        			공간 종류
	                                                        		</c:if>
	                                                        	</label>
	                                                   		</div>
	                                                   		<div class="col-md-8 form-group">
		                                                   		<c:forEach var="spaceTypeStr" items="${spaceTypeArr1 }">
		                                                   			<input type="radio" class="btn-check" name="type" 
		                                                   					id="${spaceTypeStr }" autocomplete="off" value="${spaceTypeStr }">
	                                                    			<label class="btn btn-outline-primary" for="${spaceTypeStr }">${spaceTypeStr }</label>
		                                                   		</c:forEach>
	                                                   		</div>
	                                                    </c:forEach>

	                                                    <div class="col-md-4">
	                                                        <label>공간 한줄소개</label>
	                                                    </div>
	                                                    <div class="col-md-8 form-group">
	                                                        <input type="text" id="contents_sim" class="form-control" name="contents-sim">
	                                                    </div>
	                                                    <div class="col-md-4">
	                                                        <label>공간 소개</label>
	                                                    </div>
	                                                    <div class="col-md-8 form-group">
	                                                        <textarea class="form-control" rows="3" name="contents_com"
	                                                        	style="margin-top: 0px; margin-bottom: 0px; height: 170px; resize: none;"></textarea>
	                                                    </div>
	                                                    <div class="col-md-4">
	                                                        <label>공간 태그</label>
	                                                    </div>
	                                                    <div class="col-md-8 form-group">
															<input class="form-control"	id="choices-text-remove-button" type="text"	value="" placeholder="Enter something"/>
														</div>
														<div class="col-md-4">
															<label>시설 안내</label>
														</div>
														<div class="col-md-8 form-group">
															<div class="input-group mb-2">
			                                                    <input type="text" class="form-control" placeholder="">
			                                                    <button class="btn btn-primary" type="button" id="button-addon1">추가</button>
			                                                </div>
															<fieldset class="form-group">
																<select class="form-select" id="basicSelect" multiple>
																	<option>IT</option>
																	<option>Blade Runner</option>
																	<option>Thor Ragnarok</option>
																</select>
															</fieldset>
		                                                    <div class="col-sm-12 d-flex justify-content-end">
			                                                    <button class="btn btn-sm btn-danger" type="button" id="button-addon1">선택삭제</button>
	                                                    	</div>
														</div>
														<div class="col-md-4">
	                                                        <label>사용 시 주의사항</label>
	                                                    </div>
	                                                    <div class="col-md-8 form-group">
	                                                        <textarea class="form-control" rows="3" name="warning"
	                                                        	style="margin-top: 0px; margin-bottom: 0px; height: 170px; resize: none;"></textarea>
	                                                    </div>
														<div class="col-md-4">
															<label>대표 이미지</label>
														</div>
														<div class="col-md-8 form-group">
															<input class="form-control" type="file" name="mainimage">
														</div>
														<div class="col-md-4">
															<label>이미지</label>
														</div>
														<div class="col-md-8 form-group">
															<input class="form-control" type="file" name="image" multiple="">
														</div>
														<div class="col-md-4">
															<label>주소(위치)</label>
														</div>
														<div class="col-md-8 form-group">
															<div class="input-group mb-2">
			                                                    <input type="text" class="form-control" placeholder="현재 동작하지 않음. 추후 API 추가 예정">
			                                                    <button class="btn btn-primary" type="button" id="button-addon1">주소검색</button>
			                                                </div>
		                                                    <input type="text" class="form-control" name="address" placeholder="상세주소">
														</div>
	                                                    <div class="col-md-4">
															<label>웹사이트</label>
														</div>
														<div class="col-md-8 form-group">
		                                                    <input type="text" class="form-control" name="site" placeholder="URL">
														</div>
	                                                    <div class="col-md-4">
															<label>이메일</label>
														</div>
														<div class="col-md-8 form-group">
		                                                    <div class="input-group mb-3">
			                                                    <input type="text" class="form-control" name="email_id">
			                                                    <span class="input-group-text">@</span>
			                                                    <input type="text" class="form-control" name="email_domain">
			                                                    <select class="form-select">
			                                                        <option>직접입력</option>
			                                                        <option>naver.com</option>
			                                                        <option>hanmail.net</option>
			                                                        <option>gmail.com</option>
			                                                    </select>
			                                                </div>
														</div>
	                                                    <div class="col-md-4">
															<label>연락처</label>
														</div>
														<div class="col-md-8 form-group">
		                                                    <div class="input-group mb-3">
			                                                    <input type="text" class="form-control" name="hp1" value="010">
			                                                    <span class="input-group-text">-</span>
			                                                    <input type="text" class="form-control" name="hp2">
			                                                    <span class="input-group-text">-</span>
			                                                    <input type="text" class="form-control" name="hp3">
			                                                </div>
														</div>
	                                                    <div class="col-md-4">
															<label>이용시간</label>
														</div>
														<div class="col-md-8 form-group">
		                                                    <div class="input-group mb-3">
			                                                    <select class="form-select">
			                                                        <option>직접입력</option>
			                                                        <option>naver.com</option>
			                                                        <option>hanmail.net</option>
			                                                        <option>gmail.com</option>
			                                                    </select>
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
		<%-- ******* CUSTOM Script HERE ******* --%>
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
    	</script>
		<%-- ******* CUSTOM Script END ******* --%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp" %>
	</div>
</body>
</html>