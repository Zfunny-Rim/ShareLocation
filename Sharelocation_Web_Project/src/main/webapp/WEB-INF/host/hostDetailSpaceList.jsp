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
	                                    <h4 class="card-title">세부 공간 리스트</h4>
	                                </div>
	                                <div class="card-content">
	                                    <div class="card-body">
		                                    <c:if test="${dspBeanList.size() eq 0 }">
												등록된 세부공간이 없습니다.
											</c:if>
											<c:if test="${ dspBeanList.size() ne 0 }">
												등록된 세부공간이 ${dspBeanList.size() }개 있습니다.
											</c:if>
	                                    </div>
	                                    <div class="card-footer d-flex justify-content-between">
	                                    		<button class="btn btn-light-primary" onClick="location.href='detailSpaceInsert.ho?spaceNum=11'">세부공간 추가하기</button>
												<button class="btn btn-primary">다음</button>
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