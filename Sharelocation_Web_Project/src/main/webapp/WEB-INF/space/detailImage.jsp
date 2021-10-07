<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>


<center>
	<section class="section">
		<div class="card">

			<div class="card-body">
				<div class="card">
					<div class="col-12 col-md-4, parent"></div>
				</div>
			</div>
		</div>
	</section>


	<div class="page-heading">

		<section class="section">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">장소 세부 보기</h4>
				</div>
				<div class="card-body">
					<c:forEach items="${spaceimage}" var="detail">
						<img style="width: 70%; height: auto"
							src="<%=request.getContextPath()%>/resources/spaceimage/${detail.image}">
					</c:forEach>
				</div>
			</div>
		</section>
	</div>

</center>