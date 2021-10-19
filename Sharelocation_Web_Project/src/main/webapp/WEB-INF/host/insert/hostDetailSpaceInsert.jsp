<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
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
		<%@ include file="/WEB-INF/views/include/body_sidebar_host.jsp" %>
        <div id="" style="padding-top:0px;">
            <div id="main-content">
                <div class="page-heading">
                    <section class="section">
                    	<%-- ******* Main Code HERE ******* --%>
                    	<div class="row justify-content-md-center mb-2">
                    		<div class="col-md-9 col-12">
                    			<div class="row">
		                    		<div class="col-6 col-md-6 order-md-1 order-last">
		                                <h3>세부공간 등록하기</h3>
		                            </div>
		                            <div class="col-6 col-md-6 order-md-2 order-first">
		                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
		                                    <ol class="breadcrumb">
		                                        <li class="breadcrumb-item ">공간정보 입력</li>
		                                        <li class="breadcrumb-item active" aria-current="page"><b>세부공간정보 입력</b></li>
		                                        <li class="breadcrumb-item ">정산정보 입력</li>
		                                    </ol>
		                                </nav>
		                            </div>
		                        </div>
		                    </div>
		                </div>
                    	<div class="row justify-content-md-center">
							<div class="col-md-9 col-12">
	                            <div class="card">
	                                <div class="card-header">
	                                    <h4 class="card-title">세부공간정보 입력</h4>
	                                </div>
	                                <div class="card-content">
	                                    <div class="card-body">
											<form:form commandName="detailSpaceBean" class="form form-horizontal" action="detailSpaceInsert.ho"
												method="post" enctype="multipart/form-data"	name="insert_form">
												<div class="form-body">
													<div class="row">
														<div class="divider">
															<div class="divider-text">기본 정보</div>
														</div>
														<div class="col-md-4">
															<label>세부공간 이름 <span class="required">*</span></label>
														</div>
														<div class="col-md-8 form-group">
															<input type="text" class="form-control" name="name"	value="101호">
															<p><small class="text-muted">
																<form:errors cssClass="err" path="name" />
															</small></p>
														</div>
														<div class="col-md-4">
															<label>세부공간 소개 <span class="required">*</span></label>
														</div>
														<div class="col-md-8 form-group">
															<input type="text" class="form-control" name="contents"	value="간단한 세부공간 소개입니다.">
															<p><small class="text-muted">
																<form:errors cssClass="err" />
															</small></p>
														</div>
														<div class="col-md-4">
															<label>대표 이미지 <span class="required">*</span></label>
														</div>
														<div class="col-md-8 form-group">
															<input class="form-control" type="file" name="mainimagefile">
															<p><small class="text-muted">
		                                                        	<form:errors cssClass="err" path="mainimage"/>
		                                                        </small></p>
														</div>
														<div class="col-md-4">
															<label>최소 예약시간 <span class="required">*</span></label>
														</div>
														<div class="col-md-8 form-group">
															<input type="number" class="form-control" name="mintime" value="1">
															<p><small class="text-muted">
																<form:errors cssClass="err"/>
															</small></p>
														</div>
														<div class="col-md-6">
				                                            <div class="row align-items-center">
				                                                <div class="col-lg-4 col-4">
				                                                    <label>최소 인원 <span class="required">*</span></label>
				                                                </div>
				                                                <div class="col-lg-8 col-8">
				                                                    <input type="number" class="form-control" name="minperson" value="1">
				                                                    <form:errors cssClass="err" />
				                                                </div>
				                                            </div>
				                                        </div>
				                                       
				                                        <div class="col-md-6">
				                                            <div class="row align-items-center">
				                                                <div class="col-lg-4 col-4">
				                                                    <label>최대 인원<span class="required">*</span></label>
				                                                </div>
				                                                <div class="col-lg-8 col-8">
				                 	                               <input type="number" class="form-control" name="maxperson" value="8">
				                 	                               <form:errors cssClass="err" />
				                                                </div>
				                                            </div>
				                                        </div>
				                                        <div class="divider">
															<div class="divider-text">가격/옵션 정보</div>
														</div>
														<div class="col-md-4">
															<label>가격단위 설정 <span class="required">*</span></label>
														</div>
														<div class="col-md-8 form-group">
															<input class="form-check-input" type="radio" name="priceunit" id="priceunitTime" value="시간" checked>
															<label class="form-check-label" for="priceunitTime">시간당</label>
															<input class="form-check-input" type="radio" name="priceunit" id="priceunitPackage" value="공간">
															<label class="form-check-label" for="priceunitPackage">공간당</label>
															<p><small class="text-muted">
		                                                        	<form:errors cssClass="err" />
		                                                        </small></p>
														</div>
														<div class="col-md-4">
															<label>인원당 가격 <span class="required">*</span></label>
														</div>
														<div class="col-md-8 form-group">
															<div class="input-group">
																<input type="number" class="form-control" name="price" value="10000">
			                                                    <span class="input-group-text" id="priceUnitLabel">￦/시간</span>
			                                                    <form:errors cssClass="err" />
			                                                </div>
														</div>
														
														<hr class="divider">
														<input type="hidden" name="spacenum" value="${spaceNum }">
	                                                    <div class="col-sm-12 d-flex justify-content-end">
	                                                        <button type="submit" class="btn btn-primary me-1 mb-1">저장</button>
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
							
                    	<%-- ******* Main Code END ******* --%>
                    </section>
                </div>
            </div>
        </div>
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp" %>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script type="text/javascript">
		$(document).ready(function(){
			$('input[name="priceunit"]').change(function(){
				$('#priceUnitLabel').empty();
				if($(this).val() == '시간'){
					$('#priceUnitLabel').append('￦/시간');
				}else if($(this).val() == '공간'){
					$('#priceUnitLabel').append('￦/공간');
				}
			});
		});
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>