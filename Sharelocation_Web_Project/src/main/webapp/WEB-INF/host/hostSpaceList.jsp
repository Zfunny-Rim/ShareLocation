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
        <div id="" style="padding-top:0px;">
            <div id="main-content">
                <div class="page-heading">
                    <section class="section">
                    	<%-- ******* Main Code HERE ******* --%>
                    	<div class="row justify-content-md-center">
							<div class="col-md-8 col-12">
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
								                                    <img class="img-fluid card-img-top w-100" style="height:220px;" src="<%=request.getContextPath()%>/resources/spaceimage/${space.mainimage}">
								                                    <div class="card-body">
								                                    	<div class="row">
								                                    		<div class="col-md-8"><h4 class="card-title">${space.name }</h4></div>
								                                    		<div class="col-md-4" style="text-align:right;">
								                                    			<c:if test="${space.status eq '등록대기'}">
									                                    			<span class="badge bg-warning m-0">${space.status }</span>
								                                    			</c:if>
								                                    			<c:if test="${space.status eq '검수대기'}">
									                                    			<span class="badge bg-info m-0">${space.status }</span>
								                                    			</c:if>
								                                    			<c:if test="${space.status eq '검수반려'}">
									                                    			<span class="badge bg-danger m-0">${space.status }</span>
								                                    			</c:if>
								                                    			<c:if test="${(space.status eq '운영중')}">
									                                    			<span class="badge bg-success m-0">${space.status }</span>
								                                    			</c:if>
								                                    		</div>
								                                    	</div>
								                                        <p class="card-text">
								                                          	<c:set var="tagList" value="${fn:split(space.tag, ',')}"/>
								                                          	<c:forEach var="tagToken" items="${tagList }">
								                                          		<span class="badge bg-light-info" style="font-weight: normal; font-size:12px;">#${tagToken }</span>
								                                          	</c:forEach>
								                                        </p>
								                                        <div class="d-flex justify-content-between">
								                                        	<div class="left-side">
									                                        	<p class="card-text">
									                                        	분류 : ${space.type }<br>
									                                        	<small class="text-muted">
									                                        	<span style="font-weight: bold; margin-bottom:15px;"></span>등록일 : 
									                                        	<fmt:parseDate var="regDate" value="${space.regdate }" pattern="yyyy-MM-dd"/>
									                                        	<fmt:formatDate value="${regDate }" pattern="yyyy년 MM월 dd일"/>
									                                        	</small>
									                                        	</p>
								                                        	</div>
								                                        	<div class="right-side">
<%-- 								                                        		<span class="badge bg-primary">${space.type }</span> --%>
								                                        	</div>
								                                        </div>
								                                        
								                                    </div>
								                                </div>
								                                <div class="card-footer d-flex justify-content-between bg-light">
								                                    <button class="btn btn-light-primary" onClick="location.href='spaceManage.ho?spaceNum=${space.num}'">공간 관리하기</button>
								                                    <button class="btn btn-light-danger" onClick="deleteSpace(${space.num}, '${space.name }')">삭제</button>
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
		<script type="text/javascript">
			function deleteSpace(num, name){
				result = confirm(name + " 공간을 삭제하시겠습니까? 관련된 모든 정보가 삭제됩니다.");
				if(result){
					location.href='spaceDelete.ho?spaceNum='+num
				}
			}
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>