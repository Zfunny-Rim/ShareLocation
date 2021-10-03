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
						
						<section id="content-types"  >
							<div class="row" >
				<c:forEach var="space" items="${spaceLists}">
								<div class="col-xl-4 col-md-6 col-sm-12" >
									<div class="card" >
										<div class="card-content">
											<div class="card-body" >
												<h4 class="card-title">${space.name}</h4>
<<<<<<< HEAD
												<p class="card-text">${space.contentssim}
=======
												<p class="card-text">${space.contentsSim}
>>>>>>> branch 'Park' of https://github.com/Zfunny-Rim/ShareLocation.git
												</p>
											</div>   
											<img class="img-fluid w-100"
												src="./resources/assets/images/samples/banana.jpg" alt="Card image cap">
										</div>
										<div class="card-footer d-flex justify-content-between">
											<p><span>${space.address}</span></p>
											<button onclick="viewDetail(${space.num})" class="btn btn-light-primary">detail</button>
										</div>
									</div>
								</div>
				</c:forEach>		
							</div>
						</section>

						<%-- ******* Main Code END ******* --%>
					</section>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>
<script type="text/javascript">
function viewDetail(num){
	//alert(1);
	location.href="detailView.sp?num="+num;
}
<<<<<<< HEAD
=======


>>>>>>> branch 'Park' of https://github.com/Zfunny-Rim/ShareLocation.git
</script>


		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>