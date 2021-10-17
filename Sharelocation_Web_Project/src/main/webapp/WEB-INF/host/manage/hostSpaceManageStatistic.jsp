<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<link rel="stylesheet" href="/resources/assets/vendors/apexcharts/apexcharts.css">
<style type="text/css">
    .cusBiPos{
   	 position: relative;top: -7px;left: -5px;
    }
    #mainCardBody{
    	padding-left: 0px;
    	padding-right: 0px;
    }
    #mainCard{
    background-color: #f2f7ff;
    }
</style>
<!-- <h3 class="card-title">통계</h3> -->
<div class="row">
<div class="col-12 col-lg-8">
<div class="row">
	<div class="col-6 col-lg-3 col-md-6">
		<div class="card cusCard">
			<div class="card-body px-3 py-4-5">
				<div class="row">
					<div class="col-md-4 px-0">
						<div class="stats-icon red">
							<i class="bi bi-person-lines-fill cusBiPos"></i>
						</div>
					</div>    
					<div class="col-md-8">
						<h6 class="text-muted font-semibold">총 예약횟수</h6>
						<h6 class="font-extrabold mb-0">${comResCount }</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-6 col-lg-3 col-md-6">
		<div class="card cusCard">
			<div class="card-body px-3 py-4-5">
				<div class="row">
					<div class="col-md-4 px-0">
						<div class="stats-icon purple">
							<i class="bi bi-cash cusBiPos"></i>
						</div>
					</div>
					<div class="col-md-8">
						<h6 class="text-muted font-semibold">총 수익</h6>
						<h6 class="font-extrabold mb-0">
						<fmt:formatNumber value="${totalIncomePrice }" pattern="#,###"/>원
						</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-6 col-lg-3 col-md-6">
		<div class="card cusCard">
			<div class="card-body px-3 py-4-5">
				<div class="row">
					<div class="col-md-4 px-0">
						<div class="stats-icon blue">
							<i class="bi bi-wallet2 cusBiPos"></i>
						</div>
					</div>    
					<div class="col-md-8">
						<h6 class="text-muted font-semibold">총 지출</h6>
						<h6 class="font-extrabold mb-0">
						<fmt:formatNumber value="${totalExpensePrice }" pattern="#,###"/>원
						</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-6 col-lg-3 col-md-6">
		<div class="card cusCard">
			<div class="card-body px-3 py-4-5">
				<div class="row">
					<div class="col-md-4 px-0">
						<div class="stats-icon green">
							<i class="bi bi-cash-stack cusBiPos"></i>
						</div>
					</div>    
					<div class="col-md-8">
						<h6 class="text-muted font-semibold">총 이윤</h6>
						<h6 class="font-extrabold mb-0">
						<fmt:formatNumber value="${profit }" pattern="#,###"/>원
						</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-12">
		<div class="card cusCard">
			<div class="card-header cusCard">
				<h4>예약 현황</h4>
			</div>
			<div class="card-body" style="position: relative;">
				<div id="mainchart"></div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-12 col-xl-12">
		<div class="card cusCard">
			<div class="card-header cusCard">
				<h4>매출 현황</h4>
				<div class="card-body" style="position: relative;">
					<div id="saleschart"></div>
				</div>
			</div>
			<div class="card-body">
			</div>
		</div>
	</div>
</div>
</div>
<div class="col-12 col-lg-4">
	<div class="card" style="border:1px solid lightgray;">
		<div class="card-body px-3 py-4-5">
			<div class="row">
				<div class="col-md-4">
					<div class="stats-icon" style="background-color: lightgray;">
<!-- 						<i class="bi bi-hand-thumbs-up-fill cusBiPos"></i> -->
							<div class="avatar avatar-md">
								<img src="./resources/assets/images/faces/none.jpg">
							</div>
					</div>
				</div>
				<div class="col-md-8">
					<h6 class="text-muted font-semibold">${userName }</h6>
					<h6 class="font-extrabold mb-0">${spaceName } </h6>
				</div>
			</div>
		</div>
	</div>
	<div class="card cusCard">
		<div class="card-header cusCard">
			<h4>월별 예약 비율</h4>
		</div>
		<div class="card-body" style="position: relative;">
			<div id="piechart" class="mx-auto"></div>
		</div>
	</div>
	<div class="card cusCard">
		<div class="card-header cusCard">
			<h4>요일별 예약 비율</h4>
		</div>
		<div class="card-body" style="position: relative;">
			<div id="pie-dow-chart"></div>
		</div>
	</div>
	<div class="card cusCard">
		<div class="card-header cusCard">
			<h4 class="mb-0">월별 수입 내역</h4>
		</div>
		<div class="card-body pb-3" style="position: relative;">
			<jsp:useBean id="now" class="java.util.Date"/>
			<fmt:formatDate var="curYear" value="${now }" pattern="yyyy"/>
			<fmt:formatDate var="curMonth" value="${now }" pattern="MM"/>
			<form action="spaceManageStatisticDetail.ho" method="GET">
				<input type="hidden" name="spaceNum" value="${spaceNum }">
				<div class="input-group mb-2">
					<select class="form-control" name="year">
						<c:forEach var="i" begin="${curYear-4 }" end="${curYear }">
							<option value="${i }"
							<c:if test="${i eq curYear }">selected</c:if>
							>${i }</option>
						</c:forEach>
					</select>
					<span class="input-group-text">년</span>
					<select class="form-control" name="month">
						<c:forEach var="i" begin="1" end="${curMonth }">
							<option value="${i }"
							<c:if test="${i eq curMonth }">selected</c:if>
							>${i }</option>
						</c:forEach>
					</select>
					<span class="input-group-text">월</span>
					<button class="btn btn-primary" type="submit">상세보기</button>
				</div>
				<span class="text-muted" style="font-size:12px;">최근 5년간의 기록을 조회할 수 있습니다.</span>
			</form>
		</div>
	</div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script type="text/javascript">
	var monthlyJson = '${monthlyJson}';
	monthlyJson = JSON.parse(monthlyJson);
	var barOptions = {
		series : [
				{
					name : "예약횟수",
					data : [ monthlyJson["1월"], monthlyJson["2월"],
							monthlyJson["3월"], monthlyJson["4월"],
							monthlyJson["5월"], monthlyJson["6월"],
							monthlyJson["7월"], monthlyJson["8월"],
							monthlyJson["9월"], monthlyJson["10월"],
							monthlyJson["11월"], monthlyJson["12월"] ],
				}, ],
		chart : {
			type : "bar",
			height : 350,
		},
		plotOptions : {
			bar : {
				horizontal : false,
				columnWidth : "55%",
				endingShape : "rounded",
			},
		},
		dataLabels : {
			enabled : false,
		},
		stroke : {
			show : true,
			width : 2,
			colors : [ "transparent" ],
		},
		xaxis : {
			categories : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
					"9월", "10월", "11월", "12월" ],
		},
		yaxis : {
			title : {
				text : "회",
			},
		},
		fill : {
			opacity : 1,
		},
		tooltip : {
			y : {
				formatter : function(val) {
					return val + "회";
				},
			},
		},
	};
	var bar = new ApexCharts(document.querySelector("#mainchart"), barOptions);
	bar.render();
	//
	var profitJson = '${monthlyProfitJson}';
	profitJson = JSON.parse(profitJson);
	var barProfitOptions = {
			series : [
					{
						name : "이윤",
						data : [ profitJson["1월"], profitJson["2월"],
							profitJson["3월"], profitJson["4월"],
							profitJson["5월"], profitJson["6월"],
							profitJson["7월"], profitJson["8월"],
							profitJson["9월"], profitJson["10월"],
							profitJson["11월"], profitJson["12월"] ],
					}, ],
			chart : {
				type : "bar",
				height : 350,
			},
			plotOptions : {
				bar : {
					horizontal : false,
					columnWidth : "55%",
					endingShape : "rounded",
				},
			},
			dataLabels : {
				enabled : false,
			},
			stroke : {
				show : true,
				width : 2,
				colors : [ "transparent" ],
			},
			xaxis : {
				categories : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
			},
			yaxis : {
				title : {
					text : "원",
				},
			},
			fill : {
				opacity : 1,
			},
			tooltip : {
				y : {
					formatter : function(val) {
						return val + "원";
					},
				},
			},
		};
	var saleBar = new ApexCharts(document.querySelector("#saleschart"), barProfitOptions);
	saleBar.render();
	//
	var PieOptions = {
	            series: [monthlyJson["1월"], monthlyJson["2월"], monthlyJson["3월"], monthlyJson["4월"],
			    	  monthlyJson["5월"], monthlyJson["6월"], monthlyJson["7월"], monthlyJson["8월"],
		    		  monthlyJson["9월"], monthlyJson["10월"], monthlyJson["11월"], monthlyJson["12월"]],
	            chart: {
	            type: 'pie',
	          },
	          labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	          legend:{
	        	show: false
	          },
	          responsive: [{
	            breakpoint: 200,
	            options: {
	              chart: {
	                width: 150
	              },
	              legend: {
	                show: false
	              }
	            }
	          }]
	          };
	var chart = new ApexCharts(document.querySelector("#piechart"), PieOptions);
    chart.render();
    //
  	 var dowJson = '${dowJson}';
       dowJson = JSON.parse(dowJson);
       var PieDowOptions = {
               series: [dowJson["월"],dowJson["화"],dowJson["수"],dowJson["목"],dowJson["금"],dowJson["토"],dowJson["일"]],
               chart: {
               type: 'pie',
             },
             labels: ["월","화","수","목","금","토","일"],
             legend:{
           	  show: false
           	 },
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
    var dowPie = new ApexCharts(document.querySelector("#pie-dow-chart"), PieDowOptions);
	dowPie.render();
</script>