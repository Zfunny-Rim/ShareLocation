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

<%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body class="pc">
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp"%>
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp"%>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>

		<h2 data-v-744e58ae="" class="heading--new" align="center">예약하기</h2>

		<!-- 예약 정보 시작-->
		<div class="col-md-6 col-12">
			<div class="card">
				<div class="card-header">
					<div
						class="card-header border-bottom d-flex justify-content-between align-items-center">
						<h4 class="card-title d-flex">
							<i class="bx bx-check font-medium-5 pl-25 pr-75"></i>예약정보
						</h4>
					</div>
				</div>
				<div class="card-content">
					<div class="card-body">
						<table class="table table-lg" style="width: auto;">
							<tbody>
								<tr>
									<td class="text-bold-500">예약 날짜</td>
									<td align="center">$15/hr</td>
								</tr>
								<tr>
									<td class="text-bold-500">예약인원</td>
									<td align="center">2명</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<p class="meetspace-reserve-help">호스트 확인 후 예약이 가능합니다.</p>
		<!-- 예약 정보 끝 -->

		<!-- 예약자 정보 시작 -->
		<div class="col-md-6 col-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">예약자 정보</font></font>
					</h4>
				</div>
				<div class="card-content">
					<div class="card-body">
						<form class="form form-horizontal">
							<div class="form-body">
								<div class="row">
									<div class="col-md-4">
										<label><font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">예약자</font></font></label>
									</div>
									<div class="col-md-8 form-group">
										<input type="text" id="first-name" class="form-control"
											name="fname">
									</div>
									<div class="col-md-4">
										<label><font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">연락처</font></font></label>
									</div>
									<div class="col-md-8 form-group">
										<dl class="flex_box">
											<dd>
												<div>
													<div>
														<div>
															<select id="phone1" title="휴대폰 앞자리"><option
																	value="010">010</option>
																<option value="011">011</option>
																<option value="016">016</option>
																<option value="017">017</option>
																<option value="018">018</option>
																<option value="019">019</option></select>
														</div>
													</div>
													<div class="col4">
														<input id="phone2" type="tel" title="휴대폰 중간자리"
															required="required" maxlength="4"
															onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													</div>
													<div class="col4">
														<input id="phone3" type="tel" title="휴대폰 뒷자리"
															required="required" maxlength="4"
															onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													</div>
												</div>
											</dd>
										</dl>
									</div>
									<div class="col-md-4">
										<label><font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">이메일</font></font></label>
									</div>
									<div class="col-md-8 form-group">
										<input type="email" id="email-id" class="form-control"
											name="email-id" placeholder="이메일">
									</div>
									<div class="col-md-4">
										<label><font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">사용목적</font></font></label>
									</div>
									<div class="col-md-8 form-group">
										<input type="email" id="email-id" class="form-control"
											name="email-id" placeholder="사용목적을 적어주세요!">
									</div>
									<div class="col-md-4">
										<label><font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">요청사항</font></font></label>
									</div>
									<div class="col-md-8 form-group">
										<textarea class="form-control"
											placeholder="남기고 싶은말을 적어주세요. (최대 500자)" id="floatingTextarea"></textarea>
									</div>
									<p>
										<font color="blue"> 예약자 정보로 알림톡과 이메일이 발송됩니다. 정확한 정보인지
											확인해주세요. </font>
									</p>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 예약자 정보 끝 -->
	
		<!-- 호스트 정보 시작 -->
		<div class="col-12 col-md-6">
			<div class="card">
				<div class="card-header" bgColor="yellow">
					<h4 class="card-title">호스트 정보</h4>
				</div>
				<div class="card-content">
					<div class="card-body">
						<!-- Table with outer spacing -->
						<div class="table-responsive">
							<table class="table table-lg">
								<tbody>
									<tr>
										<td class="text-bold-500">공간상호</td>
										<td>${space.company}</td>
									</tr>
									<tr>
										<td class="text-bold-500">대표자명</td>
										<td>${space.name }</td>
									</tr>
									<tr>
										<td class="text-bold-500">소재지</td>
										<td>${space.address }</td>
									</tr>
									<tr>
										<td class="text-bold-500">사업자번호</td>
										<td>${space.call }</td>
									</tr>
									<tr>
										<td class="text-bold-500">연락처</td>
										<td>${space.hp }</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 호스트 정보 끝-->
		
		<!-- 예약시 주의사항 시작 -->
		<div class="col-12 col-md-6">
			<div class="card">
				<div class="card-header" bgColor="yellow">
					<h4 class="card-title">예약시 주의사항</h4>
				</div>
				<div class="card-content">
					<div class="card-body">
						<!-- Table with outer spacing -->
						<div class="table-responsive">
							<table class="table table-lg">
								<tbody>
								<c:forEach var="space" items="${lists }">
									<tr>
										<td class="text-bold-500">공간상호</td>
										<td>${space.warning}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 예약시 주의사항 끝 -->
		<div class="card-header" style="width: auto; align-content: center;">
			<div class="accordion" id="cardAccordion" style="width: auto">
				<div class="card" style="width: auto">
					<div class="card-header" id="headingOne" data-bs-toggle="collapse"
						data-bs-target="#collapseOne" aria-expanded="false"
						aria-controls="collapseOne" role="button">
						<span class="collapsed collapse-title">결제 예정 금액</span>
					</div>
					<div id="collapseOne" class="collapse pt-1"
						aria-labelledby="headingOne" data-parent="#cardAccordion">
						<div class="card-body">
							<!-- reservation 넘어가기 -->

							<div class="card-body" style="width: auto">
								<!-- Table with outer spacing -->
								<div class="table-responsive">
									<form action="/reservInsert.rv">
										<table class="table table-lg" style="width: auto;">

											<tbody>
												<tr>
													<td class="text-bold-500">예약날짜</td>
													<td align="center">2021/10/02</td>

												</tr>
												<tr>
													<td class="text-bold-500">예약시간</td>
													<td align="center">2시간</td>
												</tr>
												<tr>
													<td class="text-bold-500">예약인원</td>
													<td align="center">2명</td>
												</tr>
												<tr>
													<td colspan="2" class="text-bold-500" align="center"><input
														type="submit" class="btn btn-secondary" value="예약신청하기"></td>
												</tr>

											</tbody>
										</table>
									</form>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 	  접히는거 끝 -->
		<div class="dimmed" data-v-5abc2650=""></div>
		<div class="dimmed" style="display: none;" data-v-5abc2650=""></div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
</body>