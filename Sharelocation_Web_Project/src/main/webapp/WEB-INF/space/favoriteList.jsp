<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
					
					<div id="main-content">
                <div class="page-heading">
                    <section class="section">
                    	
                    	<div class="row justify-content-md-center mb-2">
                    		<div class="col-md-9 col-12">
                    			<div class="row">
		                    		<div class="col-6 col-md-6 order-md-1 order-last">
		                                <h3>찜한 내용</h3>
		                            </div>
		                        </div>
		                    </div>
		                </div>
                    	<div class="row justify-content-md-center">
							<div class="col-md-9 col-12">
	                            <div class="card">
	                                <div class="card-header">
										
	                                </div>
									<div class="card-content">
										<div class="card-body">
											<div class="container">
		                                   		 <div class="row row-cols-3">
		                                   		 	
			                                   		 	<div class="col">
				                                   		 	<div class="card bg-light">
								                                <div class="card-content">
								                                    <img class="img-fluid card-img-top w-100" style="height:220px;" src="/sharelocation/resources/spaceimage/1633240277767_1_IMG_486.JPG">
								                                    <div class="card-body">
								                                    	<div class="row">
								                                    		<div class="col-md-8"><h4 class="card-title">TEST</h4></div>
								                                    		<div class="col-md-4" style="text-align:right;">
								                                    			
								                                    			
								                                    			
									                                    			<span class="badge bg-success m-0">운영중</span>
								                                    			
								                                    		</div>
								                                    	</div>
								                                        <p class="card-text">
								                                          	
								                                          	
								                                          		<span class="badge bg-light-info" style="font-weight: normal; font-size:12px;">#태그1</span>
								                                          	
								                                          		<span class="badge bg-light-info" style="font-weight: normal; font-size:12px;">#태그2</span>
								                                          	
								                                          		<span class="badge bg-light-info" style="font-weight: normal; font-size:12px;">#태그3</span>
								                                          	
								                                        </p>
								                                        <p class="card-text">
								                                        	<small class="text-muted">등록일 : 2021-10-09 00:46:43.0 </small>
								                                        </p>
								                                    </div>
								                                </div>
								                                <div class="card-footer d-flex justify-content-between bg-light">
								                                    <button class="btn btn-light-primary" onclick="location.href='spaceManage.ho?spaceNum=1'">공간 관리하기</button>
								                                    <button class="btn btn-light-danger" onclick="deleteSpace(1, 'TEST')">삭제</button>
								                                </div>
								                            </div>
			                                   		 	</div>
		                                   		 	
		                                   		 	
		                                   		 </div>
		                                  	</div>
										</div>
									</div>
								</div>
	                        </div>
	                    </div>

                    	
                    </section>
                </div>
            </div>
					


						<%-- ******* Main Code END ******* --%>
					</section>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>

		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>
