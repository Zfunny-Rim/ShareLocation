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
    <link rel="stylesheet" href="/resources/assets/vendors/apexcharts/apexcharts.css">
    <style type="text/css">
    .cusBiPos{
   	 position: relative;top: -7px;left: -5px;
    }
    </style>
    <%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp" %>
		<%@ include file="/WEB-INF/views/include/body_sidebar_admin.jsp" %>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
        <div id="" style="padding-top:0px;">
            <div id="main-content">   
                <div class="page-heading">
                    <section class="section">
                    	<%-- ******* Main Code HERE ******* --%>
						<h3>운영 통계</h3>
						<div class="row">
						<div class="col-12 col-lg-9">
						<div class="row">
						<div class="col-6 col-lg-3 col-md-6">
							<div class="card">
								<div class="card-body px-3 py-4-5">
									<div class="row">
										<div class="col-md-4">
											<div class="stats-icon red">
												<i class="bi bi-people-fill cusBiPos"></i>
											</div>
										</div>    
										<div class="col-md-8">
											<h6 class="text-muted font-semibold">총 회원</h6>
											<h6 class="font-extrabold mb-0">${totalMemberCount }</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6 col-lg-3 col-md-6">
							<div class="card">
								<div class="card-body px-3 py-4-5">
									<div class="row">
										<div class="col-md-4">
											<div class="stats-icon purple">
												<i class="bi bi-person-check-fill cusBiPos"></i>
											</div>
										</div>
										<div class="col-md-8">
											<h6 class="text-muted font-semibold">호스트</h6>
											<h6 class="font-extrabold mb-0">${hostMemberCount }</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6 col-lg-3 col-md-6">
							<div class="card">
								<div class="card-body px-3 py-4-5">
									<div class="row">
										<div class="col-md-4">
											<div class="stats-icon blue">
												<i class="bi bi-house-door-fill cusBiPos"></i>
											</div>
										</div>    
										<div class="col-md-8">
											<h6 class="text-muted font-semibold">등록된 공간</h6>
											<h6 class="font-extrabold mb-0">${totalSpaceCount }</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6 col-lg-3 col-md-6">
							<div class="card">
								<div class="card-body px-3 py-4-5">
									<div class="row">
										<div class="col-md-4">
											<div class="stats-icon green">
												<i class="bi bi-journal-text cusBiPos"></i>
											</div>
										</div>    
										<div class="col-md-8">
											<h6 class="text-muted font-semibold">예약횟수</h6>
											<h6 class="font-extrabold mb-0">${completeReservationCount }</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h4>최근 예약 동향</h4>
									</div>
									<div class="card-body" style="position: relative;">
										<div id="mainchart"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
<!-- 							<div class="col-12 col-xl-4"> -->
<!-- 								<div class="card"> -->
<!-- 									<div class="card-header"> -->
<!-- 										<h4>정보3</h4> -->
<!-- 									</div> -->
<!-- 									<div class="card-body"> -->
<!-- 										정보3. -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="col-12 col-xl-12">
								<div class="card">
									<div class="card-header">
										<h4>최근 검수 신청</h4>
										<div class="card-body">
											<c:if test="${empty approvalList }">
												검수 신청한 공간이 없습니다.
											</c:if>
											<c:if test="${not empty approvalList }">
												<b>최근 ${approvalList.size() }건의 검수신청 입니다.</b>
											</c:if>
											<div class="row justify-content-center my-3">
											<div class="col-10">
											<div class="table-responsive">
												<table class="table table-hover mb-3">
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
											<div class="d-flex justify-content-end">
												<button class="btn btn-outline-success">검수신청 전체보기</button>
											</div>
											</div>
											</div>
										</div>
									</div>
									<div class="card-body">
									</div>
								</div>
							</div>
						</div>
						</div>
						<div class="col-12 col-lg-3">
							<div class="card">
								<div class="card-body px-3 py-4-5">
									<div class="row">
										<div class="col-md-4">
											<div class="stats-icon blue">
												<i class="bi bi-hand-thumbs-up-fill cusBiPos"></i>
											</div>
										</div>
										<div class="col-md-8">
											<h6 class="text-muted font-semibold">인기 분류</h6>
											<h6 class="font-extrabold mb-0">${trBean.type } : 총 ${trBean.count }회 </h6>
										</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header">
									<h4>월별 예약 비율</h4>
								</div>
								<div class="card-body" style="position: relative;">
									<div id="piechart"></div>
								</div>
							</div>
							<div class="card">
								<div class="card-header">
									<h4>요일별 예약 비율</h4>
								</div>
								<div class="card-body" style="position: relative;">
									<div id="pie-dow-chart"></div>
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
<!-- 		<script src="./resources/asset/vendors/apexcharts/apexcharts.js"></script> -->
		<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
		<script type="text/javascript">
		var monthlyJson = '${monthlyJson}';
		monthlyJson = JSON.parse(monthlyJson);
		var barOptions = {
				  series: [
				    {
				      name: "예약횟수",
				      data: [monthlyJson["1월"], monthlyJson["2월"], monthlyJson["3월"], monthlyJson["4월"],
				    	  monthlyJson["5월"], monthlyJson["6월"], monthlyJson["7월"], monthlyJson["8월"],
				    		  monthlyJson["9월"], monthlyJson["10월"], monthlyJson["11월"], monthlyJson["12월"]],
				    },
				  ],
				  chart: {
				    type: "bar",
				    height: 350,
				  },
				  plotOptions: {
				    bar: {
				      horizontal: false,
				      columnWidth: "55%",
				      endingShape: "rounded",
				    },
				  },
				  dataLabels: {
				    enabled: false,
				  },
				  stroke: {
				    show: true,
				    width: 2,
				    colors: ["transparent"],
				  },
				  xaxis: {
				    categories: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				  },
				  yaxis: {
				    title: {
				      text: "회",
				    },
				  },
				  fill: {
				    opacity: 1,
				  },
				  tooltip: {
				    y: {
				      formatter: function(val) {
				        return  val + "회";
				      },
				    },
				  },
				};
        var dowJson = '${dowJson}';
        dowJson = JSON.parse(dowJson);
        var keySet = Object.keys(dowJson);
        var valueSet = Object.values(dowJson);
        var PieDowOptions = {
                series: [dowJson["월"],dowJson["화"],dowJson["수"],dowJson["목"],dowJson["금"],dowJson["토"],dowJson["일"]],
                chart: {
                width: 380,
                type: 'pie',
              },
              labels: ["월","화","수","목","금","토","일"],
              responsive: [{
                breakpoint: 480,
                options: {
                  chart: {
                    width: 200
                  },
                  legend: {
                    position: 'bottom'
                  }
                }
              }]
              };
        
        var PieOptions = {
                series: [monthlyJson["1월"], monthlyJson["2월"], monthlyJson["3월"], monthlyJson["4월"],
			    	  monthlyJson["5월"], monthlyJson["6월"], monthlyJson["7월"], monthlyJson["8월"],
		    		  monthlyJson["9월"], monthlyJson["10월"], monthlyJson["11월"], monthlyJson["12월"]],
                chart: {
                width: 380,
                type: 'pie',
              },
              labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
              responsive: [{
                breakpoint: 480,
                options: {
                  chart: {
                    width: 200
                  },
                  legend: {
                    position: 'bottom'
                  }
                }
              }]
              };

            var chart = new ApexCharts(document.querySelector("#piechart"), PieOptions);
            chart.render();
			var bar = new ApexCharts(document.querySelector("#mainchart"), barOptions);
			bar.render();
			var dowPie = new ApexCharts(document.querySelector("#pie-dow-chart"), PieDowOptions);
			dowPie.render();
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>