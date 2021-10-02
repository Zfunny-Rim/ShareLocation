<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<div class="col-md-4">
								<div class="card">
	                                <div class="card-content">
	                                    <img class="img-fluid w-100" src="./resources/assets/images/samples/banana.jpg" alt="Card image cap">
	                                    <div class="card-body">
	                                        <h4 class="card-title">IPS 파티룸</h4>
	                                        <p class="card-text">
	                                        	현재 상태 - 등록중(/검수중/운영중)<br>
	                                            <a href="detailSpaceList.ho?spaceNum=11">세부공간 등록하기</a><br>
	                                            정산정보 등록하기<br>
	                                        </p>
	                                    </div>
	                                </div>
	                                <div class="card-footer d-flex justify-content-between">
	                                    <button class="btn btn-light-primary" onClick="location.href='spaceManage.ho'">공간 관리하기</button>
	                                    <button class="btn btn-light-danger">삭제</button>
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