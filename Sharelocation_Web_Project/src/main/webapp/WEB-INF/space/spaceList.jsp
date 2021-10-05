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
<style type="text/css">

.img-fluid1, .img-thumbnail {
    max-width: 60%;
    height: 40%;
    margin-left: 20%;
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
						
						<section id="content-types"  >
							<div class="row" >
				<c:forEach var="space" items="${spaceLists}">
								<div class="col-xl-3 col-md-6 col-sm-12" >
									<div class="card" >
										<div class="card-content">
											<div class="card-body" >
												<h4 class="card-title">${space.name}</h4>
												<p class="card-text">${space.contentssim}
												</p>
											</div>   
											<img class="img-fluid1"
												src="<%=request.getContextPath()%>/resources/spaceimage/${space.mainimage}" alt="Card image cap">
										</div>
										<div class="card-footer d-flex justify-content-between">
											<p><span>${space.address} </span></p>
											<button onclick="viewDetail(${space.num})" class="btn btn-light-primary">detail</button>
										</div>
									</div>
								</div>
				</c:forEach>		
							</div>
						</section>
						<!-- page info start -->
						
						<div class="card-body" style="align-items: center;" >
                       
                                    <nav aria-label="Page navigation example" style="align-items: center;">
                                        <ul class="pagination pagination-dark">
                                            <li class="page-item"><a class="page-link" href="#">
                                                    <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                                                </a></li>
                                             
                                            <li class="page-item"><a class="page-link" >1</a></li>
                                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item"><a class="page-link" href="#">
                                                    <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                                                </a></li>
                                        </ul>
                                    </nav>
   
                                </div>
						
							${pageInfo.pagingHtml}
								 
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