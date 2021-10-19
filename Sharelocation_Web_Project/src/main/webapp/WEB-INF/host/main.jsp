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
        <div id="" style="padding-top:0px;">
            <div id="main-content">
                <div class="page-heading">
                    <section class="section">
                    	<%-- ******* Main Code HERE ******* --%>
						<div class="page-heading">
							<section class="section">
							<div class="row justify-content-center">
								<div class="col-8">
								<div class="card">
	                                <div class="card-body">
	                                    <div class="card-body">
	                                    <div class="main-image mx-auto mb-3">
					                       <img src="./resources/assets/images/bg/banner1.jpg" class="img-fluid">
					                       <img src="./resources/assets/images/bg/banner2.jpg" class="img-fluid">
					                       <img src="./resources/assets/images/bg/banner3.jpg" class="img-fluid">
				                    	</div>  
	                                    	<button class="btn btn-primary" onClick="location.href='insertSpace.ho'">공간 등록하기</button>
	                                    </div>
	                                </div>
	                            </div>
								</div>
							</div>
							</section>
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