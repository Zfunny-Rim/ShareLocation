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
    <style type="text/css">
    .clickable:hover{
    	cursor:pointer;
    }
    </style>
    <%-- ******* CUSTOM CSS Link END ******* --%>
</head>
<%
String[] locationtype = new String[]{"파티룸", "스터디룸", "게임룸", "카페", "공유주방", "회의실", "연습실", "보컬연습실", "악기연습실", "녹음실", "운동시설",
		"촬영스튜디오", "라이브방송", "공연장", "공유오피스", "독립오피스", "강의실", "컨퍼런스"};
request.setAttribute("locationtype", locationtype);
String[] area = new String[]{"서울", "인천", "부산", "광주", "대구", "대전", "울산", "제주", "강원도", "경남", "경북", "전남", "전북"};
request.setAttribute("area", area);
%>
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
			                       <a href="list.sp"><img src="./resources/assets/images/bg/main.jpg" class="card-img-top img-fluid">	</a>
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
							<div class="card-body">
								<h4>최근 등록된 공간</h4>
								<div class="row">
									<c:forEach var="space" items="${spaceList}">
										<div class="col-xl-4 col-md-6 col-sm-12">
											<div class="card bg-light clickable" onClick="viewDetail(${space.num})">
				                                <div class="card-content">
				                                    <img class="img-fluid card-img-top w-100" style="height:220px;" src="<%=request.getContextPath()%>/resources/spaceimage/${space.mainimage}">
				                                    <div class="card-body">
				                                    	<div class="row">
				                                    		<div class="col-md-8"><h4 class="card-title">${space.name }</h4></div>
				                                    		<div class="col-md-4" style="text-align:right;">
				                                    		</div>
				                                    	</div>
				                                        <p class="card-text">
				                                          	<c:set var="tagList" value="${fn:split(space.tag, ',')}"/>
				                                          	<c:forEach var="tagToken" items="${tagList }">
				                                          		<span class="badge bg-light-info" style="font-weight: normal; font-size:12px;">#${tagToken }</span>
				                                          	</c:forEach>
				                                        </p>
				                                        <p class="card-text">
				                                        	<span style="font-size:15px">${space.contentssim }</span>
				                                        </p>
				                                        <p class="card-text">
				                                        	<small class="text-muted"> ${space.address } </small>
				                                        </p>
				                                    </div>
				                                </div>
				                            </div>
										</div>
									</c:forEach>
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
		<script type="text/javascript">
			function viewDetail(num){
				location.href="detailView.sp?num="+num;
			}
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>