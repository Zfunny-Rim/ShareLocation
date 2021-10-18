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
.apexcharts-legend {
	display: flex;
	overflow: auto;
	padding: 0 10px;
}

.apexcharts-legend.position-bottom, .apexcharts-legend.position-top {
	flex-wrap: wrap
}

.apexcharts-legend.position-right, .apexcharts-legend.position-left {
	flex-direction: column;
	bottom: 0;
}

.apexcharts-legend.position-bottom.apexcharts-align-left,
	.apexcharts-legend.position-top.apexcharts-align-left,
	.apexcharts-legend.position-right, .apexcharts-legend.position-left {
	justify-content: flex-start;
}

.apexcharts-legend.position-bottom.apexcharts-align-center,
	.apexcharts-legend.position-top.apexcharts-align-center {
	justify-content: center;
}

.apexcharts-legend.position-bottom.apexcharts-align-right,
	.apexcharts-legend.position-top.apexcharts-align-right {
	justify-content: flex-end;
}

.apexcharts-legend-series {
	cursor: pointer;
	line-height: normal;
}

.apexcharts-legend.position-bottom .apexcharts-legend-series,
	.apexcharts-legend.position-top .apexcharts-legend-series {
	display: flex;
	align-items: center;
}

.apexcharts-legend-text {
	position: relative;
	font-size: 14px;
}

.apexcharts-legend-text *, .apexcharts-legend-marker * {
	pointer-events: none;
}

.apexcharts-legend-marker {
	position: relative;
	display: inline-block;
	cursor: pointer;
	margin-right: 3px;
	border-style: solid;
}

.apexcharts-legend.apexcharts-align-right .apexcharts-legend-series,
	.apexcharts-legend.apexcharts-align-left .apexcharts-legend-series {
	display: inline-block;
}

.apexcharts-legend-series.apexcharts-no-click {
	cursor: auto;
}

.apexcharts-legend .apexcharts-hidden-zero-series, .apexcharts-legend .apexcharts-hidden-null-series
	{
	display: none !important;
}

.apexcharts-inactive-legend {
	opacity: 0.45;
}
</style>

<%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp"%>
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp"%>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
		<div id="main" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">
						<%-- ******* Main Code HERE ******* --%>
						<div id="main">
							<header class="mb-3">
								<a href="#" class="burger-btn d-block d-xl-none"> <i
									class="bi bi-justify fs-3"></i>
								</a>
							</header>

							<div class="page-heading">
								<h3>월별 매출 현황</h3>
							</div>
							<div class="page-content">
								<section class="row">
									<div class="col-12 col-lg-9">
										<div class="row">
											<div class="col-6 col-lg-3 col-md-6">
												<div class="card">
													<div class="card-body px-3 py-4-5">
														<div class="row">
															<div class="col-md-4">
																<div class="stats-icon purple">
																	<i class="iconly-boldShow"></i>
																</div>
															</div>
															<div class="col-md-8">
																<h6 class="text-muted font-semibold">방문 횟수</h6>
																<h6 class="font-extrabold mb-0">112.000</h6>
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
																	<i class="iconly-boldProfile"></i>
																</div>
															</div>
															<div class="col-md-8">
																<h6 class="text-muted font-semibold">총 수익</h6>
																<h6 class="font-extrabold mb-0">183.000</h6>
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
																	<i class="iconly-boldAdd-User"></i>
																</div>
															</div>
															<div class="col-md-8">
																<h6 class="text-muted font-semibold">총 지출</h6>
																<h6 class="font-extrabold mb-0">80.000</h6>
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
																<div class="stats-icon red">
																	<i class="iconly-boldBookmark"></i>
																</div>
															</div>
															<div class="col-md-8">
																<h6 class="text-muted font-semibold">이윤</h6>
																<h6 class="font-extrabold mb-0">112</h6>
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
														<h4>최근 매출 동향(업체 매출 매월)</h4>
														<h4>최근 이윤 동향(업체 매출 매월)</h4>
													</div>
													<div class="card-body" style="position: relative;">
														<div id="chart-profile-visit" style="min-height: 315px;">
															<div id="apexchartsb2nj5rvs"
																class="apexcharts-canvas apexchartsb2nj5rvs apexcharts-theme-light"
																style="width: 779px; height: 300px;">
																<svg id="SvgjsSvg2376" width="779" height="300"
																	xmlns="http://www.w3.org/2000/svg" version="1.1"
																	xmlns:xlink="http://www.w3.org/1999/xlink"
																	xmlns:svgjs="http://svgjs.com/svgjs"
																	class="apexcharts-svg" xmlns:data="ApexChartsNS"
																	transform="translate(0, 0)"
																	style="background: transparent;">
																	<g id="SvgjsG2378"
																		class="apexcharts-inner apexcharts-graphical"
																		transform="translate(39.25, 30)">
																	<defs id="SvgjsDefs2377">
																	<linearGradient id="SvgjsLinearGradient2382" x1="0"
																		y1="0" x2="0" y2="1">
																	<stop id="SvgjsStop2383" stop-opacity="0.4"
																		stop-color="rgba(216,227,240,0.4)" offset="0"></stop>
																	<stop id="SvgjsStop2384" stop-opacity="0.5"
																		stop-color="rgba(190,209,230,0.5)" offset="1"></stop>
																	<stop id="SvgjsStop2385" stop-opacity="0.5"
																		stop-color="rgba(190,209,230,0.5)" offset="1"></stop></linearGradient>
																	<clipPath id="gridRectMaskb2nj5rvs">
																	<rect id="SvgjsRect2387" width="733.75"
																		height="232.348" x="-2" y="0" rx="0" ry="0"
																		opacity="1" stroke-width="0" stroke="none"
																		stroke-dasharray="0" fill="#fff"></rect></clipPath>
																	<clipPath id="gridRectMarkerMaskb2nj5rvs">
																	<rect id="SvgjsRect2388" width="733.75"
																		height="236.348" x="-2" y="-2" rx="0" ry="0"
																		opacity="1" stroke-width="0" stroke="none"
																		stroke-dasharray="0" fill="#fff"></rect></clipPath></defs>
																	<rect id="SvgjsRect2386" width="42.56875"
																		height="232.348" x="0" y="0" rx="0" ry="0" opacity="1"
																		stroke-width="0" stroke-dasharray="3"
																		fill="url(#SvgjsLinearGradient2382)"
																		class="apexcharts-xcrosshairs" y2="232.348"
																		filter="none" fill-opacity="0.9"></rect>
																	<g id="SvgjsG2404" class="apexcharts-xaxis"
																		transform="translate(0, 0)">
																	<g id="SvgjsG2405" class="apexcharts-xaxis-texts-g"
																		transform="translate(0, -4)">
																	<text id="SvgjsText2407"
																		font-family="Helvetica, Arial, sans-serif"
																		x="30.40625" y="261.348" text-anchor="middle"
																		dominant-baseline="auto" font-size="12px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-xaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2408">Jan</tspan>
																	<title>Jan</title></text>
																	<text id="SvgjsText2410"
																		font-family="Helvetica, Arial, sans-serif"
																		x="91.21875" y="261.348" text-anchor="middle"
																		dominant-baseline="auto" font-size="12px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-xaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2411">Feb</tspan>
																	<title>Feb</title></text>
																	<text id="SvgjsText2413"
																		font-family="Helvetica, Arial, sans-serif"
																		x="152.03125" y="261.348" text-anchor="middle"
																		dominant-baseline="auto" font-size="12px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-xaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2414">Mar</tspan>
																	<title>Mar</title></text>
																	<text id="SvgjsText2416"
																		font-family="Helvetica, Arial, sans-serif"
																		x="212.84375" y="261.348" text-anchor="middle"
																		dominant-baseline="auto" font-size="12px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-xaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2417">Apr</tspan>
																	<title>Apr</title></text>
																	<text id="SvgjsText2419"
																		font-family="Helvetica, Arial, sans-serif"
																		x="273.65625" y="261.348" text-anchor="middle"
																		dominant-baseline="auto" font-size="12px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-xaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2420">May</tspan>
																	<title>May</title></text>
																	<text id="SvgjsText2422"
																		font-family="Helvetica, Arial, sans-serif"
																		x="334.46875" y="261.348" text-anchor="middle"
																		dominant-baseline="auto" font-size="12px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-xaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2423">Jun</tspan>
																	<title>Jun</title></text>
																	<text id="SvgjsText2425"
																		font-family="Helvetica, Arial, sans-serif"
																		x="395.28125" y="261.348" text-anchor="middle"
																		dominant-baseline="auto" font-size="12px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-xaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2426">Jul</tspan>
																	<title>Jul</title></text>
																	<text id="SvgjsText2428"
																		font-family="Helvetica, Arial, sans-serif"
																		x="456.09375" y="261.348" text-anchor="middle"
																		dominant-baseline="auto" font-size="12px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-xaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2429">Aug</tspan>
																	<title>Aug</title></text>
																	<text id="SvgjsText2431"
																		font-family="Helvetica, Arial, sans-serif"
																		x="516.90625" y="261.348" text-anchor="middle"
																		dominant-baseline="auto" font-size="12px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-xaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2432">Sep</tspan>
																	<title>Sep</title></text>
																	<text id="SvgjsText2434"
																		font-family="Helvetica, Arial, sans-serif"
																		x="577.71875" y="261.348" text-anchor="middle"
																		dominant-baseline="auto" font-size="12px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-xaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2435">Oct</tspan>
																	<title>Oct</title></text>
																	<text id="SvgjsText2437"
																		font-family="Helvetica, Arial, sans-serif"
																		x="638.53125" y="261.348" text-anchor="middle"
																		dominant-baseline="auto" font-size="12px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-xaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2438">Nov</tspan>
																	<title>Nov</title></text>
																	<text id="SvgjsText2440"
																		font-family="Helvetica, Arial, sans-serif"
																		x="699.34375" y="261.348" text-anchor="middle"
																		dominant-baseline="auto" font-size="12px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-xaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2441">Dec</tspan>
																	<title>Dec</title></text></g>
																	<line id="SvgjsLine2442" x1="0" y1="233.348"
																		x2="729.75" y2="233.348" stroke="#e0e0e0"
																		stroke-dasharray="0" stroke-width="1"></line></g>
																	<g id="SvgjsG2455" class="apexcharts-grid">
																	<g id="SvgjsG2456"
																		class="apexcharts-gridlines-horizontal">
																	<line id="SvgjsLine2471" x1="0" y1="0" x2="729.75"
																		y2="0" stroke="#e0e0e0" stroke-dasharray="0"
																		class="apexcharts-gridline"></line>
																	<line id="SvgjsLine2472" x1="0" y1="58.087" x2="729.75"
																		y2="58.087" stroke="#e0e0e0" stroke-dasharray="0"
																		class="apexcharts-gridline"></line>
																	<line id="SvgjsLine2473" x1="0" y1="116.174"
																		x2="729.75" y2="116.174" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-gridline"></line>
																	<line id="SvgjsLine2474" x1="0" y1="174.26100000000002"
																		x2="729.75" y2="174.26100000000002" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-gridline"></line>
																	<line id="SvgjsLine2475" x1="0" y1="232.348"
																		x2="729.75" y2="232.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-gridline"></line></g>
																	<g id="SvgjsG2457"
																		class="apexcharts-gridlines-vertical"></g>
																	<line id="SvgjsLine2458" x1="0" y1="233.348" x2="0"
																		y2="239.348" stroke="#e0e0e0" stroke-dasharray="0"
																		class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2459" x1="60.8125" y1="233.348"
																		x2="60.8125" y2="239.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2460" x1="121.625" y1="233.348"
																		x2="121.625" y2="239.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2461" x1="182.4375" y1="233.348"
																		x2="182.4375" y2="239.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2462" x1="243.25" y1="233.348"
																		x2="243.25" y2="239.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2463" x1="304.0625" y1="233.348"
																		x2="304.0625" y2="239.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2464" x1="364.875" y1="233.348"
																		x2="364.875" y2="239.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2465" x1="425.6875" y1="233.348"
																		x2="425.6875" y2="239.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2466" x1="486.5" y1="233.348"
																		x2="486.5" y2="239.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2467" x1="547.3125" y1="233.348"
																		x2="547.3125" y2="239.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2468" x1="608.125" y1="233.348"
																		x2="608.125" y2="239.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2469" x1="668.9375" y1="233.348"
																		x2="668.9375" y2="239.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2470" x1="729.75" y1="233.348"
																		x2="729.75" y2="239.348" stroke="#e0e0e0"
																		stroke-dasharray="0" class="apexcharts-xaxis-tick"></line>
																	<line id="SvgjsLine2477" x1="0" y1="232.348"
																		x2="729.75" y2="232.348" stroke="transparent"
																		stroke-dasharray="0"></line>
																	<line id="SvgjsLine2476" x1="0" y1="1" x2="0"
																		y2="232.348" stroke="transparent" stroke-dasharray="0"></line></g>
																	<g id="SvgjsG2478" class="apexcharts-yaxis-annotations"></g>
																	<g id="SvgjsG2479" class="apexcharts-xaxis-annotations"></g>
																	<g id="SvgjsG2480" class="apexcharts-point-annotations"></g>
																	<g id="SvgjsG2389"
																		class="apexcharts-bar-series apexcharts-plot-series">
																	<g id="SvgjsG2390" class="apexcharts-series" rel="1"
																		seriesName="sales" data:realIndex="0">
																	<path id="SvgjsPath2392"
																		d="M 9.121875 232.348L 9.121875 167.00012500000003L 51.690625 167.00012500000003L 51.690625 167.00012500000003L 51.690625 232.348L 51.690625 232.348z"
																		fill="rgba(67,94,190,1)" fill-opacity="1"
																		stroke-opacity="1" stroke-linecap="square"
																		stroke-width="0" stroke-dasharray="0"
																		class="apexcharts-bar-area" index="0"
																		clip-path="url(#gridRectMaskb2nj5rvs)"
																		pathTo="M 9.121875 232.348L 9.121875 167.00012500000003L 51.690625 167.00012500000003L 51.690625 167.00012500000003L 51.690625 232.348L 51.690625 232.348z"
																		pathFrom="M 9.121875 232.348L 9.121875 232.348L 51.690625 232.348L 51.690625 232.348L 51.690625 232.348L 9.121875 232.348"
																		cy="167.00012500000003" cx="69.934375" j="0" val="9"
																		barHeight="65.347875" barWidth="42.56875"></path>
																	<path id="SvgjsPath2393"
																		d="M 69.934375 232.348L 69.934375 87.13049999999998L 112.50312500000001 87.13049999999998L 112.50312500000001 87.13049999999998L 112.50312500000001 232.348L 112.50312500000001 232.348z"
																		fill="rgba(67,94,190,1)" fill-opacity="1"
																		stroke-opacity="1" stroke-linecap="square"
																		stroke-width="0" stroke-dasharray="0"
																		class="apexcharts-bar-area" index="0"
																		clip-path="url(#gridRectMaskb2nj5rvs)"
																		pathTo="M 69.934375 232.348L 69.934375 87.13049999999998L 112.50312500000001 87.13049999999998L 112.50312500000001 87.13049999999998L 112.50312500000001 232.348L 112.50312500000001 232.348z"
																		pathFrom="M 69.934375 232.348L 69.934375 232.348L 112.50312500000001 232.348L 112.50312500000001 232.348L 112.50312500000001 232.348L 69.934375 232.348"
																		cy="87.13049999999998" cx="130.746875" j="1" val="20"
																		barHeight="145.21750000000003" barWidth="42.56875"></path>
																	<path id="SvgjsPath2394"
																		d="M 130.746875 232.348L 130.746875 14.521749999999997L 173.31562499999998 14.521749999999997L 173.31562499999998 14.521749999999997L 173.31562499999998 232.348L 173.31562499999998 232.348z"
																		fill="rgba(67,94,190,1)" fill-opacity="1"
																		stroke-opacity="1" stroke-linecap="square"
																		stroke-width="0" stroke-dasharray="0"
																		class="apexcharts-bar-area" index="0"
																		clip-path="url(#gridRectMaskb2nj5rvs)"
																		pathTo="M 130.746875 232.348L 130.746875 14.521749999999997L 173.31562499999998 14.521749999999997L 173.31562499999998 14.521749999999997L 173.31562499999998 232.348L 173.31562499999998 232.348z"
																		pathFrom="M 130.746875 232.348L 130.746875 232.348L 173.31562499999998 232.348L 173.31562499999998 232.348L 173.31562499999998 232.348L 130.746875 232.348"
																		cy="14.521749999999997" cx="191.559375" j="2" val="30"
																		barHeight="217.82625000000002" barWidth="42.56875"></path>
																	<path id="SvgjsPath2395"
																		d="M 191.559375 232.348L 191.559375 87.13049999999998L 234.12812499999998 87.13049999999998L 234.12812499999998 87.13049999999998L 234.12812499999998 232.348L 234.12812499999998 232.348z"
																		fill="rgba(67,94,190,1)" fill-opacity="1"
																		stroke-opacity="1" stroke-linecap="square"
																		stroke-width="0" stroke-dasharray="0"
																		class="apexcharts-bar-area" index="0"
																		clip-path="url(#gridRectMaskb2nj5rvs)"
																		pathTo="M 191.559375 232.348L 191.559375 87.13049999999998L 234.12812499999998 87.13049999999998L 234.12812499999998 87.13049999999998L 234.12812499999998 232.348L 234.12812499999998 232.348z"
																		pathFrom="M 191.559375 232.348L 191.559375 232.348L 234.12812499999998 232.348L 234.12812499999998 232.348L 234.12812499999998 232.348L 191.559375 232.348"
																		cy="87.13049999999998" cx="252.371875" j="3" val="20"
																		barHeight="145.21750000000003" barWidth="42.56875"></path>
																	<path id="SvgjsPath2396"
																		d="M 252.371875 232.348L 252.371875 159.73925L 294.940625 159.73925L 294.940625 159.73925L 294.940625 232.348L 294.940625 232.348z"
																		fill="rgba(67,94,190,1)" fill-opacity="1"
																		stroke-opacity="1" stroke-linecap="square"
																		stroke-width="0" stroke-dasharray="0"
																		class="apexcharts-bar-area" index="0"
																		clip-path="url(#gridRectMaskb2nj5rvs)"
																		pathTo="M 252.371875 232.348L 252.371875 159.73925L 294.940625 159.73925L 294.940625 159.73925L 294.940625 232.348L 294.940625 232.348z"
																		pathFrom="M 252.371875 232.348L 252.371875 232.348L 294.940625 232.348L 294.940625 232.348L 294.940625 232.348L 252.371875 232.348"
																		cy="159.73925" cx="313.184375" j="4" val="10"
																		barHeight="72.60875000000001" barWidth="42.56875"></path>
																	<path id="SvgjsPath2397"
																		d="M 313.184375 232.348L 313.184375 87.13049999999998L 355.753125 87.13049999999998L 355.753125 87.13049999999998L 355.753125 232.348L 355.753125 232.348z"
																		fill="rgba(67,94,190,1)" fill-opacity="1"
																		stroke-opacity="1" stroke-linecap="square"
																		stroke-width="0" stroke-dasharray="0"
																		class="apexcharts-bar-area" index="0"
																		clip-path="url(#gridRectMaskb2nj5rvs)"
																		pathTo="M 313.184375 232.348L 313.184375 87.13049999999998L 355.753125 87.13049999999998L 355.753125 87.13049999999998L 355.753125 232.348L 355.753125 232.348z"
																		pathFrom="M 313.184375 232.348L 313.184375 232.348L 355.753125 232.348L 355.753125 232.348L 355.753125 232.348L 313.184375 232.348"
																		cy="87.13049999999998" cx="373.996875" j="5" val="20"
																		barHeight="145.21750000000003" barWidth="42.56875"></path>
																	<path id="SvgjsPath2398"
																		d="M 373.996875 232.348L 373.996875 14.521749999999997L 416.565625 14.521749999999997L 416.565625 14.521749999999997L 416.565625 232.348L 416.565625 232.348z"
																		fill="rgba(67,94,190,1)" fill-opacity="1"
																		stroke-opacity="1" stroke-linecap="square"
																		stroke-width="0" stroke-dasharray="0"
																		class="apexcharts-bar-area" index="0"
																		clip-path="url(#gridRectMaskb2nj5rvs)"
																		pathTo="M 373.996875 232.348L 373.996875 14.521749999999997L 416.565625 14.521749999999997L 416.565625 14.521749999999997L 416.565625 232.348L 416.565625 232.348z"
																		pathFrom="M 373.996875 232.348L 373.996875 232.348L 416.565625 232.348L 416.565625 232.348L 416.565625 232.348L 373.996875 232.348"
																		cy="14.521749999999997" cx="434.809375" j="6" val="30"
																		barHeight="217.82625000000002" barWidth="42.56875"></path>
																	<path id="SvgjsPath2399"
																		d="M 434.809375 232.348L 434.809375 87.13049999999998L 477.378125 87.13049999999998L 477.378125 87.13049999999998L 477.378125 232.348L 477.378125 232.348z"
																		fill="rgba(67,94,190,1)" fill-opacity="1"
																		stroke-opacity="1" stroke-linecap="square"
																		stroke-width="0" stroke-dasharray="0"
																		class="apexcharts-bar-area" index="0"
																		clip-path="url(#gridRectMaskb2nj5rvs)"
																		pathTo="M 434.809375 232.348L 434.809375 87.13049999999998L 477.378125 87.13049999999998L 477.378125 87.13049999999998L 477.378125 232.348L 477.378125 232.348z"
																		pathFrom="M 434.809375 232.348L 434.809375 232.348L 477.378125 232.348L 477.378125 232.348L 477.378125 232.348L 434.809375 232.348"
																		cy="87.13049999999998" cx="495.621875" j="7" val="20"
																		barHeight="145.21750000000003" barWidth="42.56875"></path>
																	<path id="SvgjsPath2400"
																		d="M 495.621875 232.348L 495.621875 159.73925L 538.190625 159.73925L 538.190625 159.73925L 538.190625 232.348L 538.190625 232.348z"
																		fill="rgba(67,94,190,1)" fill-opacity="1"
																		stroke-opacity="1" stroke-linecap="square"
																		stroke-width="0" stroke-dasharray="0"
																		class="apexcharts-bar-area" index="0"
																		clip-path="url(#gridRectMaskb2nj5rvs)"
																		pathTo="M 495.621875 232.348L 495.621875 159.73925L 538.190625 159.73925L 538.190625 159.73925L 538.190625 232.348L 538.190625 232.348z"
																		pathFrom="M 495.621875 232.348L 495.621875 232.348L 538.190625 232.348L 538.190625 232.348L 538.190625 232.348L 495.621875 232.348"
																		cy="159.73925" cx="556.434375" j="8" val="10"
																		barHeight="72.60875000000001" barWidth="42.56875"></path>
																	<path id="SvgjsPath2401"
																		d="M 556.434375 232.348L 556.434375 87.13049999999998L 599.0031250000001 87.13049999999998L 599.0031250000001 87.13049999999998L 599.0031250000001 232.348L 599.0031250000001 232.348z"
																		fill="rgba(67,94,190,1)" fill-opacity="1"
																		stroke-opacity="1" stroke-linecap="square"
																		stroke-width="0" stroke-dasharray="0"
																		class="apexcharts-bar-area" index="0"
																		clip-path="url(#gridRectMaskb2nj5rvs)"
																		pathTo="M 556.434375 232.348L 556.434375 87.13049999999998L 599.0031250000001 87.13049999999998L 599.0031250000001 87.13049999999998L 599.0031250000001 232.348L 599.0031250000001 232.348z"
																		pathFrom="M 556.434375 232.348L 556.434375 232.348L 599.0031250000001 232.348L 599.0031250000001 232.348L 599.0031250000001 232.348L 556.434375 232.348"
																		cy="87.13049999999998" cx="617.246875" j="9" val="20"
																		barHeight="145.21750000000003" barWidth="42.56875"></path>
																	<path id="SvgjsPath2402"
																		d="M 617.246875 232.348L 617.246875 14.521749999999997L 659.8156250000001 14.521749999999997L 659.8156250000001 14.521749999999997L 659.8156250000001 232.348L 659.8156250000001 232.348z"
																		fill="rgba(67,94,190,1)" fill-opacity="1"
																		stroke-opacity="1" stroke-linecap="square"
																		stroke-width="0" stroke-dasharray="0"
																		class="apexcharts-bar-area" index="0"
																		clip-path="url(#gridRectMaskb2nj5rvs)"
																		pathTo="M 617.246875 232.348L 617.246875 14.521749999999997L 659.8156250000001 14.521749999999997L 659.8156250000001 14.521749999999997L 659.8156250000001 232.348L 659.8156250000001 232.348z"
																		pathFrom="M 617.246875 232.348L 617.246875 232.348L 659.8156250000001 232.348L 659.8156250000001 232.348L 659.8156250000001 232.348L 617.246875 232.348"
																		cy="14.521749999999997" cx="678.059375" j="10"
																		val="30" barHeight="217.82625000000002"
																		barWidth="42.56875"></path>
																	<path id="SvgjsPath2403"
																		d="M 678.059375 232.348L 678.059375 87.13049999999998L 720.6281250000001 87.13049999999998L 720.6281250000001 87.13049999999998L 720.6281250000001 232.348L 720.6281250000001 232.348z"
																		fill="rgba(67,94,190,1)" fill-opacity="1"
																		stroke-opacity="1" stroke-linecap="square"
																		stroke-width="0" stroke-dasharray="0"
																		class="apexcharts-bar-area" index="0"
																		clip-path="url(#gridRectMaskb2nj5rvs)"
																		pathTo="M 678.059375 232.348L 678.059375 87.13049999999998L 720.6281250000001 87.13049999999998L 720.6281250000001 87.13049999999998L 720.6281250000001 232.348L 720.6281250000001 232.348z"
																		pathFrom="M 678.059375 232.348L 678.059375 232.348L 720.6281250000001 232.348L 720.6281250000001 232.348L 720.6281250000001 232.348L 678.059375 232.348"
																		cy="87.13049999999998" cx="738.871875" j="11" val="20"
																		barHeight="145.21750000000003" barWidth="42.56875"></path></g>
																	<g id="SvgjsG2391" class="apexcharts-datalabels"
																		data:realIndex="0"></g></g>
																	<line id="SvgjsLine2481" x1="0" y1="0" x2="729.75"
																		y2="0" stroke="#b6b6b6" stroke-dasharray="0"
																		stroke-width="1" class="apexcharts-ycrosshairs"></line>
																	<line id="SvgjsLine2482" x1="0" y1="0" x2="729.75"
																		y2="0" stroke-dasharray="0" stroke-width="0"
																		class="apexcharts-ycrosshairs-hidden"></line></g>
																	<g id="SvgjsG2443" class="apexcharts-yaxis" rel="0"
																		transform="translate(9.25, 0)">
																	<g id="SvgjsG2444" class="apexcharts-yaxis-texts-g">
																	<text id="SvgjsText2445"
																		font-family="Helvetica, Arial, sans-serif" x="20"
																		y="31.4" text-anchor="end" dominant-baseline="auto"
																		font-size="11px" font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-yaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2446">32</tspan></text>
																	<text id="SvgjsText2447"
																		font-family="Helvetica, Arial, sans-serif" x="20"
																		y="89.48700000000001" text-anchor="end"
																		dominant-baseline="auto" font-size="11px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-yaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2448">24</tspan></text>
																	<text id="SvgjsText2449"
																		font-family="Helvetica, Arial, sans-serif" x="20"
																		y="147.574" text-anchor="end" dominant-baseline="auto"
																		font-size="11px" font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-yaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2450">16</tspan></text>
																	<text id="SvgjsText2451"
																		font-family="Helvetica, Arial, sans-serif" x="20"
																		y="205.66100000000003" text-anchor="end"
																		dominant-baseline="auto" font-size="11px"
																		font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-yaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2452">8</tspan></text>
																	<text id="SvgjsText2453"
																		font-family="Helvetica, Arial, sans-serif" x="20"
																		y="263.748" text-anchor="end" dominant-baseline="auto"
																		font-size="11px" font-weight="400" fill="#373d3f"
																		class="apexcharts-text apexcharts-yaxis-label "
																		style="font-family: Helvetica, Arial, sans-serif;">
																	<tspan id="SvgjsTspan2454">0</tspan></text></g></g>
																	<g id="SvgjsG2379" class="apexcharts-annotations"></g></svg>
																<div class="apexcharts-legend"
																	style="max-height: 150px;"></div>
																<div class="apexcharts-tooltip apexcharts-theme-light">
																	<div class="apexcharts-tooltip-title"
																		style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div>
																	<div class="apexcharts-tooltip-series-group"
																		style="order: 1;">
																		<span class="apexcharts-tooltip-marker"></span>
																		<div class="apexcharts-tooltip-text"
																			style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
																			<div class="apexcharts-tooltip-y-group">
																				<span class="apexcharts-tooltip-text-label"></span><span
																					class="apexcharts-tooltip-text-value"></span>
																			</div>
																			<div class="apexcharts-tooltip-z-group">
																				<span class="apexcharts-tooltip-text-z-label"></span><span
																					class="apexcharts-tooltip-text-z-value"></span>
																			</div>
																		</div>
																	</div>
																</div>
																<div
																	class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
																	<div class="apexcharts-yaxistooltip-text"></div>
																</div>
																<div class="apexcharts-toolbar"
																	style="top: 0px; right: 3px;">
																	<div class="apexcharts-menu-icon" title="Menu">
																		<svg xmlns="http://www.w3.org/2000/svg" width="24"
																			height="24" viewBox="0 0 24 24">
																			<path fill="none" d="M0 0h24v24H0V0z"></path>
																			<path
																				d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"></path></svg>
																	</div>
																	<div class="apexcharts-menu">
																		<div class="apexcharts-menu-item exportSVG"
																			title="Download SVG">Download SVG</div>
																		<div class="apexcharts-menu-item exportPNG"
																			title="Download PNG">Download PNG</div>
																		<div class="apexcharts-menu-item exportCSV"
																			title="Download CSV">Download CSV</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="resize-triggers">
															<div class="expand-trigger">
																<div style="width: 828px; height: 340px;"></div>
															</div>
															<div class="contract-trigger"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12 col-xl-4">
												<div class="card">
													<div class="card-header">
														<h4>Profile Visit</h4>
													</div>
													  원그래프로 타입별 방문 퍼센트(파티룸) (원형 그래프) 업계현황
												</div>
											</div>
											<div class="col-12 col-xl-8">
												<div class="card">
													<div class="card-header">
														<h4>최근 손님 리뷰</h4>
													</div>
													<div class="card-body">
														<div class="table-responsive">
															<table class="table table-hover table-lg">
																<thead>
																	<tr>
																		<th>Name</th>
																		<th>Comment</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td class="col-3">
																			<div class="d-flex align-items-center">
																				<div class="avatar avatar-md">
																					<img src="assets/images/faces/5.jpg">
																				</div>
																				<p class="font-bold ms-3 mb-0">Si Cantik</p>
																			</div>
																		</td>
																		<td class="col-auto">
																			<p class=" mb-0">Congratulations on your
																				graduation!</p>
																		</td>
																	</tr>
																	<tr>
																		<td class="col-3">
																			<div class="d-flex align-items-center">
																				<div class="avatar avatar-md">
																					<img src="assets/images/faces/2.jpg">
																				</div>
																				<p class="font-bold ms-3 mb-0">Si Ganteng</p>
																			</div>
																		</td>
																		<td class="col-auto">
																			<p class=" mb-0">Wow amazing design! Can you make
																				another tutorial for this design?</p>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-12 col-lg-3">
										<div class="card">
											<div class="card-body py-4 px-5">
												<div class="d-flex align-items-center">
													<div class="avatar avatar-xl">
														<img src="assets/images/faces/1.jpg" alt="Face 1">
													</div>
													<div class="ms-3 name">
														<h5 class="font-bold">운영자 이름</h5>
														<h6 class="text-muted mb-0">숙박업체 이름</h6>
													</div>
												</div>
											</div>
										</div>
										
										<div class="card">
											<div class="card-header">
												<h4>월별 매출 현황(퍼센트)</h4>
											</div>
											<div class="card-body" style="position: relative;">
												<div id="chart-visitors-profile"
													style="min-height: 220.7px;">
													<div id="apexchartsjyh84f3xj"
														class="apexcharts-canvas apexchartsjyh84f3xj apexcharts-theme-light"
														style="width: 212px; height: 220.7px;">
														<svg id="SvgjsSvg2680" width="212" height="220.7"
															xmlns="http://www.w3.org/2000/svg" version="1.1"
															xmlns:xlink="http://www.w3.org/1999/xlink"
															xmlns:svgjs="http://svgjs.com/svgjs"
															class="apexcharts-svg" xmlns:data="ApexChartsNS"
															transform="translate(0, 0)"
															style="background: transparent;">
															<foreignObject x="0" y="0" width="212" height="220.7">
															<div
																class="apexcharts-legend apexcharts-align-center position-bottom"
																xmlns="http://www.w3.org/1999/xhtml"
																style="inset: auto 0px 1px; position: absolute; max-height: 175px;">
																<div class="apexcharts-legend-series" rel="1"
																	seriesname="Male" data:collapsed="false"
																	style="margin: 2px 5px;">
																	<span class="apexcharts-legend-marker" rel="1"
																		data:collapsed="false"
																		style="background: rgb(67, 94, 190) !important; color: rgb(67, 94, 190); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span
																		class="apexcharts-legend-text" rel="1" i="0"
																		data:default-text="Male" data:collapsed="false"
																		style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Male</span>
																</div>
																<div class="apexcharts-legend-series" rel="2"
																	seriesname="Female" data:collapsed="false"
																	style="margin: 2px 5px;">
																	<span class="apexcharts-legend-marker" rel="2"
																		data:collapsed="false"
																		style="background: rgb(85, 198, 232) !important; color: rgb(85, 198, 232); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span
																		class="apexcharts-legend-text" rel="2" i="1"
																		data:default-text="Female" data:collapsed="false"
																		style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Female</span>
																</div>
															</div>
														
      
      </foreignObject>
															<g id="SvgjsG2682"
																class="apexcharts-inner apexcharts-graphical"
																transform="translate(12, 0)">
															<defs id="SvgjsDefs2681">
															<clipPath id="gridRectMaskjyh84f3xj">
															<rect id="SvgjsRect2684" width="196" height="289" x="-3"
																y="-1" rx="0" ry="0" opacity="1" stroke-width="0"
																stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath>
															<clipPath id="gridRectMarkerMaskjyh84f3xj">
															<rect id="SvgjsRect2685" width="194" height="291" x="-2"
																y="-2" rx="0" ry="0" opacity="1" stroke-width="0"
																stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath>
															<filter id="SvgjsFilter2694" filterUnits="userSpaceOnUse"
																width="200%" height="200%" x="-50%" y="-50%">
															<feFlood id="SvgjsFeFlood2695" flood-color="#000000"
																flood-opacity="0.45" result="SvgjsFeFlood2695Out"
																in="SourceGraphic"></feFlood>
															<feComposite id="SvgjsFeComposite2696"
																in="SvgjsFeFlood2695Out" in2="SourceAlpha" operator="in"
																result="SvgjsFeComposite2696Out"></feComposite>
															<feOffset id="SvgjsFeOffset2697" dx="1" dy="1"
																result="SvgjsFeOffset2697Out"
																in="SvgjsFeComposite2696Out"></feOffset>
															<feGaussianBlur id="SvgjsFeGaussianBlur2698"
																stdDeviation="1 " result="SvgjsFeGaussianBlur2698Out"
																in="SvgjsFeOffset2697Out"></feGaussianBlur>
															<feMerge id="SvgjsFeMerge2699"
																result="SvgjsFeMerge2699Out" in="SourceGraphic">
															<feMergeNode id="SvgjsFeMergeNode2700"
																in="SvgjsFeGaussianBlur2698Out"></feMergeNode>
															<feMergeNode id="SvgjsFeMergeNode2701"
																in="[object Arguments]"></feMergeNode></feMerge>
															<feBlend id="SvgjsFeBlend2702" in="SourceGraphic"
																in2="SvgjsFeMerge2699Out" mode="normal"
																result="SvgjsFeBlend2702Out"></feBlend></filter>
															<filter id="SvgjsFilter2707" filterUnits="userSpaceOnUse"
																width="200%" height="200%" x="-50%" y="-50%">
															<feFlood id="SvgjsFeFlood2708" flood-color="#000000"
																flood-opacity="0.45" result="SvgjsFeFlood2708Out"
																in="SourceGraphic"></feFlood>
															<feComposite id="SvgjsFeComposite2709"
																in="SvgjsFeFlood2708Out" in2="SourceAlpha" operator="in"
																result="SvgjsFeComposite2709Out"></feComposite>
															<feOffset id="SvgjsFeOffset2710" dx="1" dy="1"
																result="SvgjsFeOffset2710Out"
																in="SvgjsFeComposite2709Out"></feOffset>
															<feGaussianBlur id="SvgjsFeGaussianBlur2711"
																stdDeviation="1 " result="SvgjsFeGaussianBlur2711Out"
																in="SvgjsFeOffset2710Out"></feGaussianBlur>
															<feMerge id="SvgjsFeMerge2712"
																result="SvgjsFeMerge2712Out" in="SourceGraphic">
															<feMergeNode id="SvgjsFeMergeNode2713"
																in="SvgjsFeGaussianBlur2711Out"></feMergeNode>
															<feMergeNode id="SvgjsFeMergeNode2714"
																in="[object Arguments]"></feMergeNode></feMerge>
															<feBlend id="SvgjsFeBlend2715" in="SourceGraphic"
																in2="SvgjsFeMerge2712Out" mode="normal"
																result="SvgjsFeBlend2715Out"></feBlend></filter></defs>
															<g id="SvgjsG2686" class="apexcharts-pie">
															<g id="SvgjsG2687" transform="translate(0, 0) scale(1)">
															<circle id="SvgjsCircle2688" r="26.004878048780487"
																cx="95" cy="95" fill="transparent"></circle>
															<g id="SvgjsG2689" class="apexcharts-slices">
															<g id="SvgjsG2690"
																class="apexcharts-series apexcharts-pie-series"
																seriesName="Male" rel="1" data:realIndex="0">
															<path id="SvgjsPath2691"
																d="M 95 8.317073170731703 A 86.6829268292683 86.6829268292683 0 1 1 12.559637587488396 121.78649751240398 L 70.26789127624652 103.0359492537212 A 26.004878048780487 26.004878048780487 0 1 0 95 68.99512195121952 L 95 8.317073170731703 z"
																fill="rgba(67,94,190,1)" fill-opacity="1"
																stroke-opacity="1" stroke-linecap="butt"
																stroke-width="2" stroke-dasharray="0"
																class="apexcharts-pie-area apexcharts-donut-slice-0"
																index="0" j="0" data:angle="252" data:startAngle="0"
																data:strokeWidth="2" data:value="70"
																data:pathOrig="M 95 8.317073170731703 A 86.6829268292683 86.6829268292683 0 1 1 12.559637587488396 121.78649751240398 L 70.26789127624652 103.0359492537212 A 26.004878048780487 26.004878048780487 0 1 0 95 68.99512195121952 L 95 8.317073170731703 z"
																stroke="#ffffff"></path></g>
															<g id="SvgjsG2703"
																class="apexcharts-series apexcharts-pie-series"
																seriesName="Female" rel="2" data:realIndex="1">
															<path id="SvgjsPath2704"
																d="M 12.559637587488396 121.78649751240398 A 86.6829268292683 86.6829268292683 0 0 1 94.98487097529244 8.317074490988176 L 94.99546129258773 68.99512234729646 A 26.004878048780487 26.004878048780487 0 0 0 70.26789127624652 103.0359492537212 L 12.559637587488396 121.78649751240398 z"
																fill="rgba(85,198,232,1)" fill-opacity="1"
																stroke-opacity="1" stroke-linecap="butt"
																stroke-width="2" stroke-dasharray="0"
																class="apexcharts-pie-area apexcharts-donut-slice-1"
																index="0" j="1" data:angle="108" data:startAngle="252"
																data:strokeWidth="2" data:value="30"
																data:pathOrig="M 12.559637587488396 121.78649751240398 A 86.6829268292683 86.6829268292683 0 0 1 94.98487097529244 8.317074490988176 L 94.99546129258773 68.99512234729646 A 26.004878048780487 26.004878048780487 0 0 0 70.26789127624652 103.0359492537212 L 12.559637587488396 121.78649751240398 z"
																stroke="#ffffff"></path></g>
															<g id="SvgjsG2692" class="apexcharts-datalabels">
															<text id="SvgjsText2693"
																font-family="Helvetica, Arial, sans-serif"
																x="140.5831746025748" y="128.11811491026444"
																text-anchor="middle" dominant-baseline="auto"
																font-size="12px" font-weight="600" fill="#ffffff"
																class="apexcharts-text apexcharts-pie-label"
																filter="url(#SvgjsFilter2694)"
																style="font-family: Helvetica, Arial, sans-serif;">70.0%</text></g>
															<g id="SvgjsG2705" class="apexcharts-datalabels">
															<text id="SvgjsText2706"
																font-family="Helvetica, Arial, sans-serif"
																x="49.416825397425214" y="61.88188508973556"
																text-anchor="middle" dominant-baseline="auto"
																font-size="12px" font-weight="600" fill="#ffffff"
																class="apexcharts-text apexcharts-pie-label"
																filter="url(#SvgjsFilter2707)"
																style="font-family: Helvetica, Arial, sans-serif;">30.0%</text></g></g></g></g>
															<line id="SvgjsLine2716" x1="0" y1="0" x2="190" y2="0"
																stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1"
																class="apexcharts-ycrosshairs"></line>
															<line id="SvgjsLine2717" x1="0" y1="0" x2="190" y2="0"
																stroke-dasharray="0" stroke-width="0"
																class="apexcharts-ycrosshairs-hidden"></line></g>
															<g id="SvgjsG2683" class="apexcharts-annotations"></g></svg>
														<div class="apexcharts-tooltip apexcharts-theme-dark">
															<div class="apexcharts-tooltip-series-group"
																style="order: 1;">
																<span class="apexcharts-tooltip-marker"
																	style="background-color: rgb(67, 94, 190);"></span>
																<div class="apexcharts-tooltip-text"
																	style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
																	<div class="apexcharts-tooltip-y-group">
																		<span class="apexcharts-tooltip-text-label"></span><span
																			class="apexcharts-tooltip-text-value"></span>
																	</div>
																	<div class="apexcharts-tooltip-z-group">
																		<span class="apexcharts-tooltip-text-z-label"></span><span
																			class="apexcharts-tooltip-text-z-value"></span>
																	</div>
																</div>
															</div>
															<div class="apexcharts-tooltip-series-group"
																style="order: 2;">
																<span class="apexcharts-tooltip-marker"
																	style="background-color: rgb(85, 198, 232);"></span>
																<div class="apexcharts-tooltip-text"
																	style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
																	<div class="apexcharts-tooltip-y-group">
																		<span class="apexcharts-tooltip-text-label"></span><span
																			class="apexcharts-tooltip-text-value"></span>
																	</div>
																	<div class="apexcharts-tooltip-z-group">
																		<span class="apexcharts-tooltip-text-z-label"></span><span
																			class="apexcharts-tooltip-text-z-value"></span>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="resize-triggers">
													<div class="expand-trigger">
														<div style="width: 261px; height: 246px;"></div>
													</div>
													<div class="contract-trigger"></div>
												</div>
											</div>
										</div>
									</div>
								</section>
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