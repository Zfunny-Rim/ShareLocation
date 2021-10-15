<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<link rel="stylesheet" href="/resources/assets/vendors/apexcharts/apexcharts.css">
<style type="text/css">
    .cusBiPos{
   	 position: relative;top: -7px;left: -5px;
    }
</style>
<div class="row">
<div class="col-12 col-lg-9">
<div class="row">
<div class="col-6 col-lg-3 col-md-6">
	<div class="card">
		<div class="card-body px-3 py-4-5">
			<div class="row">
				<div class="col-md-4">
					<div class="stats-icon red">
						<i class="bi bi-person-lines-fill cusBiPos"></i>
					</div>
				</div>    
				<div class="col-md-8">
					<h6 class="text-muted font-semibold">총 예약횟수</h6>
					<h6 class="font-extrabold mb-0">0</h6>
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
						<i class="bi bi-cash cusBiPos"></i>
					</div>
				</div>
				<div class="col-md-8">
					<h6 class="text-muted font-semibold">총 수익</h6>
					<h6 class="font-extrabold mb-0">0</h6>
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
						<i class="bi bi-wallet2 cusBiPos"></i>
					</div>
				</div>    
				<div class="col-md-8">
					<h6 class="text-muted font-semibold">총 지출</h6>
					<h6 class="font-extrabold mb-0">0</h6>
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
						<i class="bi bi-cash-stack cusBiPos"></i>
					</div>
				</div>    
				<div class="col-md-8">
					<h6 class="text-muted font-semibold">총 이윤</h6>
					<h6 class="font-extrabold mb-0">0</h6>
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
	<div class="col-12 col-xl-12">
		<div class="card">
			<div class="card-header">
				<h4>최근 검수 신청</h4>
				<div class="card-body">
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
					<h6 class="text-muted font-semibold">공간명</h6>
					<h6 class="font-extrabold mb-0">무엇 </h6>
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
</script>