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
th{
	background-color:lightgray !important;
	text-align:center;  
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
						<section id="basic-vertical-layouts">
							<div class="row justify-content-md-center">
								<div class="col-md-8 col-12">
									<div class="card">
										<div class="card-content">
											<div class="card-body">
											<h4 class="card-title">상세보기</h4>
											<table class="table table-bordered">
												<tr>
													<th style="width:15%;">글번호</th>
													<td style="width:30%">${nbBean.num }</td>
													<th>작성일</th>
													<td>
														<fmt:parseDate var="parseRegDate" value="${nbBean.regdate }" pattern="yyyy-MM-dd"/>
														<fmt:formatDate value="${parseRegDate }" pattern="yyyy/MM/dd"/>
													</td>
												</tr>
												<tr>
													<th style="width:15%;">작성자</th>
													<td colspan="3">${nbBean.writer }</td>
												</tr>
												<tr>
													<th>제목</th>
													<td colspan="3">${nbBean.subject }</td>
												</tr>
												<tr>
													<th>내용</th>
													<td colspan="3">
														${nbBean.content }
													</td>
												</tr>
											</table>
											<div class="col-12 d-flex justify-content-start">
												<c:if test="${nbBean.writer eq loginInfo.nickname }">
													<input class="btn btn-primary me-1 mb-1" type="button" value="글수정" onClick="updateNotice(${nbBean.num})">
												</c:if>
												<c:if test="${(nbBean.writer eq loginInfo.nickname) or (loginInfo.type eq 'admin') }">
													<input class="btn btn-primary me-1 mb-1" type="button" value="글삭제" onclick="deleteNotice(${nbBean.num})">
												</c:if>
													<input class="btn btn-primary me-1 mb-1" type="button" value="글목록"  onclick="listNotice()">								
											</div>
											</div>
										</div>
									</div>
								</div>
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