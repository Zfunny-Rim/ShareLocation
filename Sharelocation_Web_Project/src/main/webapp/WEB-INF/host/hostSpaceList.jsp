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
                    	<div class="row justify-content-md-center mb-2">
                    		<div class="col-md-9 col-12">
                    			<div class="row">
		                    		<div class="col-6 col-md-6 order-md-1 order-last">
		                                <h3>공간 관리하기</h3>
		                            </div>
		                        </div>
		                    </div>
		                </div>
                    	<div class="row justify-content-md-center">
							<div class="col-md-9 col-12">
	                            <div class="card">
	                                <div class="card-header">
	                                    <h4 class="card-title">공간 관리하기</h4>
	                                    <c:if test="${spList.size() eq 0 }">
	                                   	 	<p class="card-text">등록된 공간이 없습니다.</p>
										</c:if>
	                                    <c:if test="${spList.size() ne 0 }">
	                                   	 	<p class="card-text">등록된 공간이 ${spList.size() } 개 있습니다.</p>
										</c:if>
	                                </div>
									<div class="card-content">
										<div class="card-body">
											<div class="container">
		                                   		 <div class="row row-cols-3">
		                                   		 	<c:forEach var="space" items="${spList }" varStatus="vs">
			                                   		 	<div class="col">
				                                   		 	<div class="card bg-light">
								                                <div class="card-content">
								                                    <img class="img-fluid card-img-top w-100" src="<%=request.getContextPath()%>/resources/spaceimage/${space.mainimage}">
								                                    <div class="card-body">
								                                    	<div class="row">
								                                    		<div class="col-md-8"><h4 class="card-title">${space.name }</h4></div>
								                                    		<div class="col-md-4" style="text-align:right;"><span class="badge bg-warning m-0">${space.status }</span></div>
								                                    	</div>
								                                        <p class="card-text">
								                                          	<c:set var="tagList" value="${fn:split(space.tag, ',')}"/>
								                                          	<c:forEach var="tagToken" items="${tagList }">
								                                          		<span class="badge bg-light-info" style="font-weight: normal; font-size:12px;">#${tagToken }</span>
								                                          	</c:forEach>
								                                        </p>
								                                        <p class="card-text">
								                                        	<small class="text-muted">등록일 : ${space.regdate } </small>
								                                        </p>
								                                    </div>
								                                </div>
								                                <div class="card-footer d-flex justify-content-between bg-light">
								                                    <button class="btn btn-light-primary" onClick="location.href='spaceManage.ho?spaceNum=${space.num}'">공간 관리하기</button>
								                                    <button class="btn btn-light-danger">삭제</button>
								                                </div>
								                            </div>
			                                   		 	</div>
		                                   		 	</c:forEach>
		                                   		 </div>
		                                  	</div>
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