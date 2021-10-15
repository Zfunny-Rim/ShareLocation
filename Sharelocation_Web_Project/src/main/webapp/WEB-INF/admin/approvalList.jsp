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
	tr:hover{
		cursor: pointer;
	}
	</style>
    <%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp" %>
		<%@ include file="/WEB-INF/views/include/body_sidebar_admin.jsp" %>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
        <div id="main" style="padding-top:0px;">
        <div id="main-content">   
        <div class="page-heading">
        <section class="section">
	         <%-- ******* Main Code HERE ******* --%>
	        <div class="row justify-content-center">
	        <div class="col-9">
			<div class="card">
			<div class="card-content">
			<div class="card-body">
				<h4 class="title">검수신청 내역</h4>
				<c:if test="${empty approvalList }">
					검수 신청한 공간이 없습니다.
				</c:if>
				<c:if test="${not empty approvalList }">
					검수신청 내역이 총 ${approvalList.size() }개 있습니다.
				</c:if>
				<div class="row justify-content-center my-3">
				<div class="col-10">
				<div class="table-responsive">
					<table class="table table-hover mb-0">
						<tr>
							<th>번호</th>	
							<th>호스트 이름</th>	
							<th>분류</th>	
							<th>공간명</th>	
							<th>영업시간</th>	
							<th>연락처</th>	
							<th>등록일</th>	
							<th>현재 상태</th>	
						</tr>
						<c:forEach var="appBean" items="${approvalList }">
						<tr onClick="goViewPage('${appBean.num}')">
							<td>${appBean.num }</td>
							<td>${appBean.mnickname }</td>
							<td>${appBean.type }</td>
							<td>${appBean.name }</td>
							<td>${appBean.operatingtime }~${appBean.operatingendtime }</td>
							<td>${appBean.hp }</td>
							<td>${appBean.regdate }</td>
							<td>${appBean.status }</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				</div>
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
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp" %>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script type="text/javascript">
			function goViewPage(num){
				location.href='approvalView.admin?spaceNum='+num;
			}
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>