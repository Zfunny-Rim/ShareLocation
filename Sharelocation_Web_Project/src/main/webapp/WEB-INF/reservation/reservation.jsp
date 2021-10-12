<%@page import="member.model.MemberBean"%>
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
.img-fluid1, .img-thumbnail {
	max-width: 70%;
	height: auto;
	margin-left: 20%;
}

.parent {
	width: 90%;
	margin: 10px auto;
}

.first {
	border: 1px solid black;
	float: left;
	width: 30%;
	box-sizing: border-box;
}

.second {
	border: 1px solid black;
	float: left;
	margin-left: 5%;
	width: 30%;
	box-sizing: border-box;
}

.third {
	border: 1px solid black;
	float: right;
	width: 30%;
	box-sizing: border-box;
}
.card-header {
    padding: 1.5rem;
    margin-bottom: 0;
    /* background-color: #fff; */
    /* border-bottom: 1px solid rgba(0,0,0,.125); */
    float: right;
}

</style>
<%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body class="pc">
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp"%>
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp"%>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
		<div id="main" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">
						<%-- ******* Main Code HERE ******* --%>
						<form action="reservInsert.rv" method="post">
						<h2 data-v-744e58ae="" class="heading--new" align="center">예약하기</h2>
						<!-- 예약 공간 시작-->
							<p class="text-subtitle text-muted">예약 공간</p>
							<div class="card">
								<div class="card-content">
									<img src="assets/images/samples/motorcycle.jpg"
										class="card-img-top img-fluid" alt="singleminded">
									<div class="card-body">
										<h5 class="card-title">${spacebean.name }</h5>
										<p class="card-text">${spacebean.contentscom }</p>
									</div>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">공간유형 : ${spacebean.type }</li>
									<li class="list-group-item">예약인원 :
										최소${detailSpacebean.minperson }명~최대${detailSpacebean.maxperson }명</li>
								</ul>
							</div>
							<!-- 예약 공간 끜-->
							
							<!-- 접히는거 시작 -->
							<div class="card-header"
								style="width: auto; align-content: center;">
								<div class="accordion" id="cardAccordion" style="width: auto">
									<div class="card" style="width: auto">
										<div class="card-header" id="headingOne"
											data-bs-toggle="collapse" data-bs-target="#collapseOne"
											aria-expanded="false" aria-controls="collapseOne"
											role="button">
											<span class="collapsed collapse-title">결제 예정 금액</span>
										</div>
										<div id="collapseOne" class="collapse pt-1"
											aria-labelledby="headingOne" data-parent="#cardAccordion">
											<div class="card-body">
												<!-- reservation 넘어가기 -->

												<div class="card-body" style="width: auto">
													<!-- Table with outer spacing -->
													<div class="table-responsive">
														
															<input type="hidden" name="spacenum"
																value="${spacebean.num}"> <input type="hidden"
																name="detailspacenum" value="${detailSpacebean.num}">
															<table class="table table-lg" style="width: auto;">
																<tbody>
																	<tr>
																		<td class="text-bold-500">예약날짜</td>
																		<td align="center">${reservationbean.applicationdate}</td>

																	</tr>
																	<tr>
																		<td class="text-bold-500">예약시간</td>
																		<td align="center">${reservationbean.checkin}시~${reservationbean.checkout}시</td>
																	</tr>
																	<tr>
																		<td class="text-bold-500">예약인원</td>
																		<td align="center">${reservationbean.person}</td>
																	</tr>
																	<tr>
																		<td class="text-bold-500" align="center" colspan="2">총
																			가격:${reservationbean.amounts}</td>
																	</tr>
																	<tr>
																		<td colspan="2" class="text-bold-500" align="center"><input
																			type="submit" class="btn btn-secondary"
																			value="예약신청하기"></td>
																	</tr>
																</tbody>
															</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<!-- 	  접히는거 끝 -->
							
							
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
														<td align="center">${reservationbean.applicationdate}
															${reservationbean.checkin}시~${reservationbean.checkout}시</td>
													</tr>
													<tr>
														<td class="text-bold-500">예약인원</td>
														<td align="center">${reservationbean.person}</td>
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
												<div class="form-body">
													<div class="row">
														<div class="col-md-4">
															<label><font style="vertical-align: inherit;"><font
																	style="vertical-align: inherit;">예약자</font></font></label>
														</div>
														<div class="col-md-8 form-group">
															<%
															MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
															String nickname = loginInfo.getNickname();
															String hp = loginInfo.getHp();
															String email = loginInfo.getEmail();
															int membernum = loginInfo.getNum();
															%>
															<%=nickname%>
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
																				<%=hp%>
																			</div>
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
															<%=email%>
														</div>
														<div class="col-md-4">
															<label><font style="vertical-align: inherit;"><font
																	style="vertical-align: inherit;">요청사항</font></font></label>
														</div>
														<div class="col-md-8 form-group">
															<textarea class="form-control" name="cusrequest"
																placeholder="남기고 싶은말을 적어주세요. (최대 500자)"
																id="floatingTextarea"></textarea>
															<form:errors cssClass="err" path="cusrequest" />
														</div>
														<p>
															<font color="blue"> 예약자 정보로 알림톡과 이메일이 발송됩니다. 정확한
																정보인지 확인해주세요. </font>
														</p>
													</div>
												</div>
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
															<td>${balance.company}</td>
														</tr>
														<tr>
															<td class="text-bold-500">대표자명</td>
															<td>${balance.name }</td>
														</tr>
														<tr>
															<td class="text-bold-500">소재지</td>
															<td>${balance.address }</td>
														</tr>
														<tr>
															<td class="text-bold-500">사업자번호</td>
															<td>${balance.call }</td>
														</tr>
														<tr>
															<td class="text-bold-500">연락처</td>
															<td>${balance.hp }</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 호스트 정보 끝-->
						</form>
					</section>
				</div>
			</div>
		</div>
						<%-- ******* Main Code END ******* --%>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>

		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>