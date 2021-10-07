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
                    	<div class="row justify-content-md-center">
							<div class="col-12">
	                            <div class="card mb-2">
	                            	<div class="card-content">
	                            		<div class="card-body">
		                            		<nav class="nav nav-pills flex-column flex-sm-row">
											  <a class="flex-sm-fill text-sm-center nav-link bg-light border border-white" id="Home"
											   href="spaceManage.ho?spaceNum=${spaceBean.num }">관리 홈</a>
											  <a class="flex-sm-fill text-sm-center nav-link bg-light border border-white" id="Modify"
											   href="spaceManageModify.ho?spaceNum=${spaceBean.num }">공간정보 수정</a>
											  <a class="flex-sm-fill text-sm-center nav-link bg-light border border-white" id="Detail"
											   href="spaceManageDetailSpace.ho?spaceNum=${spaceBean.num }">세부공간 관리</a>
											  <a class="flex-sm-fill text-sm-center nav-link bg-light border border-white" id="Balance"
											   href="#">정산정보 수정</a>
											  <a class="flex-sm-fill text-sm-center nav-link bg-light border border-white" id="Review"
											   href="#">후기 관리</a>
											  <a class="flex-sm-fill text-sm-center nav-link bg-light border border-white" id="Statistics"
											   href="#">통계</a>
											  <a class="flex-sm-fill text-sm-center nav-link bg-light border border-white" id="Reservation"
											   href="#">예약 관리</a>
											  <a class="flex-sm-fill text-sm-center nav-link bg-light border border-white" id="AD"
											   href="#">광고 관리</a>
											</nav>
	                            		</div>
	                            	</div>
	                            </div>
	                        </div>
	                        <div class="col-12">
	                       		<div class="card">
	                      	      	<div class="card-content">	
	                            		<div class="card-body">
	                            			<jsp:include page="/WEB-INF/host/manage/hostSpaceManage${getPage }.jsp"/>
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
		 $(document).ready(function(){
			var pageName = '<%=request.getAttribute("getPage")%>';
			var nav = document.getElementById(pageName);
			nav.classList.remove('bg-light');
			nav.classList.remove('border');
			nav.classList.remove('border-white');
			nav.classList.add('active');
		 });
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>