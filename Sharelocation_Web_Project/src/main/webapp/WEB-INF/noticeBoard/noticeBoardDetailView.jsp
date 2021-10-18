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
.link-class:hover {
	text-decoration: underline;
	cursor: pointer;
}
</style>

<%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp"%>
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp"%>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
		<div id="" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">
						<%-- ******* Main Code HERE ******* --%>


						<div class="row justify-content-md-center">
							<div class="col-9">
								<div class="card">
									<div class="card-content">
										<div class="card-body">
											<div class="col-12 py-2 border rounded-3 border-secondary">
												<h3>${nbBean.subject}</h3>
												<hr>
												${nbBean.content}
								
											</div>
											<div class="d-flex justify-content-end">
											<c:if test="${id eq 'admin'}"> 
												<button class="btn btn-sm btn-outline-success" onclick="updateNotice(${nbBean.num})">수  정</button>
												<button class="btn btn-sm btn-outline-success" onclick="deleteNotice(${nbBean.num})">삭  제</button>
											</c:if>
												<button class="btn btn-sm btn-outline-success" onclick="listNotice()">목  록</button>
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
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script type="text/javascript">
		function deleteNotice(num){
			//alert();
			location.href="deleteNotice.nb?num="+num;
		}
		
		function listNotice(){
			//alert();
			location.href="noticeBoardList.nb";
		}
		
		 function updateNotice(num){
			location.href="updateNotice.nb?num="+num;
		} 
		
		</script>

		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>