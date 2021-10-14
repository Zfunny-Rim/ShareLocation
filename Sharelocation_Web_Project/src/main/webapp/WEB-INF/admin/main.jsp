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
        <div id="main" style="padding-top:0px;">
            <div id="main-content">   
                <div class="page-heading">
                    <section class="section">
                    	<%-- ******* Main Code HERE ******* --%>
                    	<c:set var="mapKeySet" value="${dowMap.keySet() }"/>
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
							<div class="col-12 col-xl-4">
								<div class="card">
									<div class="card-header">
										<h4>정보3</h4>
									</div>
									<div class="card-body">
										정보3.
									</div>
								</div>
							</div>
							<div class="col-12 col-xl-8">
								<div class="card">
									<div class="card-header">
										<h4>최근 검수 신청</h4>
									</div>
									<div class="card-body">
									</div>
								</div>
							</div>
						</div>
						</div>
						<div class="col-12 col-lg-3">
							<div class="card">
								<div class="card-body py-4 px-5">
									<div class="d-flex align-items-center">
										<img src="./resources/assets/images/logo/ips_logo.png" class="mx-auto" height="65px">
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header">
									<h4>월별 예약 횟수(%)</h4>
								</div>
								<div class="card-body" style="position: relative;">
									<div id="piechart"></div>
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
		var barOptions = {
				  series: [
				    {
				      name: "예약횟수",
				      data: [76, 85, 101, 98, 87, 105, 91, 114, 94, 31, 19, 99],
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
        var PieOptions = {
                series: [76, 85, 101, 98, 87, 105, 91, 114, 94, 31, 19, 99],
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
        var PieDowOptions = {
                series: [1,2,3,4,5,6,7],
                chart: {
                width: 380,
                type: 'pie',
              },
              labels: ['일','월','화','수','목','금','토'],
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