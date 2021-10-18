<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IPS partagé</title>
<%@ include file="/WEB-INF/views/include/head_css.jsp"%>
</head>
<body>
	<%-- ******* CUSTOM CSS Link HERE ******* --%>
	<%-- ******* CUSTOM CSS Link END ******* --%>





	<%-- ******* Main Code HERE ******* --%>




	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp"%>
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp"%>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
		<div id="" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">
						<%-- ******* Main Code HERE ******* --%>

						<div class="main">
							<div class="col-lg-12" style="align-items: center;">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">판매자 수입 지출 현황</h4>
									</div>
									<div class="card-content">
										<div class="card-body">
											<p>(Unit 이름)지출 및 수입 현황</p>
											<ul class="list-group">
												<li class="list-group-item active">대여 price * 대여 횟수</li>
												<li class="list-group-item">총 대여 수입</li>
	
												<li class="list-group-item">비용 리스트</li>
												<li class="list-group-item">청소비 price * 0.01%*대여횟수</li>
												<li class="list-group-item">광고비용(파워링크) adprice(고정) * 1 (한달 한경우) </li>
												<li class="list-group-item">시설유지 비용 price * 0.01%(예상 금액입력)</li>
												<li class="list-group-item">Tax(부가가치세) price * 대여 횟수 *	10%</li>
												<li class="list-group-item">총 비용</li>
												
												<li class="list-group-item">총 이윤(수입 - 비용) </li>
												<li class="list-group-item">회차별 이윤(총 이윤 / 횟수)</li>
											</ul>
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

		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>