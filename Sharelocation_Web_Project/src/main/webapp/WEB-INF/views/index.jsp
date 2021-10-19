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
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp" %>
        <div id="" style="padding-top:0px;">
            <div id="main-content">
                <div class="page-heading">
                    <section class="section">
                    <div class="row justify-content-center">
					<div class="col-8">
					<div class="card">
					<div class="card-body">
                    	<%-- ******* Main Code HERE ******* --%>
                    	<div class="card">
	                    	<div class="card-content">
		                    	<div class="main-image mx-auto">
			                       <a href="list.sp"><img src="./resources/assets/images/bg/host_image.jpg" class="card-img-top img-fluid">	</a>
		                    	</div>   
	                    	</div>
	                    	<div class="card-body">
								<div class="row justify-content-center mb-4">
									<div class="col-6">
										<h2 class="card-title" style="text-align:center;font-size:30px;">
											공간을 검색해보세요.
										</h2>
									</div>
								</div>
								<div class="row justify-content-center">
									<div class="col-10">
										<form class="m-0 p-0" action="list.sp" method="get">
											<div class="input-group ms-auto">
												<select name="whatColumn" class="input-group-text">
													<option value="%%">전체종류</option>
													<c:forEach var="locationtype" items="${locationtype}">
														<option value="${locationtype}">${locationtype}</option>
													</c:forEach>
												</select> <select name="area" class="input-group-text">
													<option value="%%">전체지역</option>
													<c:forEach var="area" items="${area}">
														<option value="${area}">${area}</option>
													</c:forEach>
												</select> <input type="text" class="form-control"
													placeholder="공간을 검색하세요." name="keyword"> <input
													type="submit" value="검색"
													class="btn btn-outline-secondary">
											</div>
										</form>
									</div>
								</div>
							</div>
                    	</div>
                    	<%-- ******* Main Code END ******* --%>
                   	</div>
                   	</div>
                   	</div>
                   	</div>
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