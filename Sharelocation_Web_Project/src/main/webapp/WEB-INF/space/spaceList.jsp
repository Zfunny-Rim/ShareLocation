<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">



<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IPS partagé</title>
<%@ include file="/WEB-INF/views/include/head_css.jsp"%>
<%
String[] locationtype = new String[]{"파티룸", "스터디룸", "게임룸", "카페","공유주방","회의실","연습실","보컬연습실","악기연습실","녹음실","운동시설","촬영스튜디오","라이브방송","공연장","공유오피스","독립오피스","강의실","컨퍼런스"};
request.setAttribute("locationtype", locationtype);
%>
<%-- ******* CUSTOM CSS Link HERE ******* --%>
<style type="text/css">
.img-fluid1, .img-thumbnail {
	max-width: 60%;
	height: 40%;
	margin-left: 20%;
}

.search {
	align-content: center;
	align-items: center;
}
</style>
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

						<div class="row justify-content-center">
							<div class="col-10">
								<form class="m-0 p-0" action="list.sp" method="get">
									<div class="input-group ms-auto">
										<select name="whatColumn" class="input-group-text">
											<option value="%%">전체</option>
											<c:forEach var="locationtype" items="${locationtype}">
												<option value="${locationtype}">${locationtype}</option>
											</c:forEach>
										</select><input type="text" class="form-control"
											placeholder="공간을 검색하세요." name="keyword"> <input
											type="submit" value="검색" class="btn btn-outline-secondary">
									</div>
								</form>
							</div>
						</div>
						<div class="">
						<BR><BR>
						</div>


						<section id="content-types">
							<div class="row">
								<c:forEach var="space" items="${spaceLists}">
									<div class="col-xl-3 col-md-6 col-sm-12">
										<div class="card">
											<div class="card-content">
												<div class="card-body">
													<h4 class="card-title">${space.name}</h4>
													<p class="card-text">${space.contentssim}</p>
												</div>
												<img class="img-fluid1"
													src="<%=request.getContextPath()%>/resources/spaceimage/${space.mainimage}"
													alt="Card image cap">
											</div>
											<div class="card-footer d-flex justify-content-between">
												<p>
													<span>${space.address} </span>
												</p>
												<button onclick="viewDetail(${space.num})"
													class="btn btn-light-primary">detail</button>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</section>
						<!-- page info start -->
						<div class="card-body" style="align-items: center;">

							<nav aria-label="Page navigation example"
								style="align-items: center;">
								<div align="center">
									<span class="page-link" class="page-item">
										${pageInfo.pagingHtml} </span>
								</div>
							</nav>

						</div>


						<!-- page info end -->
						<%-- ******* Main Code END ******* --%>
					</section>
				</div>
			</div>
		</div>
		<BR>

		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script type="text/javascript">
function viewDetail(num){
	//alert(1);
	location.href="detailView.sp?num="+num;
}
</script>


		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>