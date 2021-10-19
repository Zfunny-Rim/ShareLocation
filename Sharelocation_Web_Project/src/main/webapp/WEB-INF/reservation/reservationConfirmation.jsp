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
		<div id="" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">
						<%-- ******* Main Code HERE ******* --%>
						<div class="row justify-content-center">
							<div class="col-8">
								<!-- 예약 공간 시작-->
								<div class="card">
									<div class="card-content">
										<div class="card-body">
											<h5 class="card-title" align="center">${spacebean.name } - ${detailSpacebean.name }</h5>
											<p class="card-text" align="center">예약대기 상태가 되었습니다.
											<br>호스트가 예약을 확인 후에 입금 요청을 할것입니다.</p>
											<p class="card-text" style="text-align:center">
												<button class="btn btn-outline-success"
												 onClick="location.href='reservList.rv'"
												>예약목록 보기</button>
												<button class="btn btn-outline-primary"
												 onClick="location.href='detailView.sp?num=${spacebean.num}'"
												>공간정보 보기</button>
											</p>
										</div>
									</div>
								</div>
								<!-- 예약 내용 시작-->
								<div class="row">
									<div class="col-7">
										<div class="card">
											<div class="card-content">
												<div class="card-body">
													<h4>예약 내역</h4>
													<table class="table table-lg">
														<tbody>
															<tr>
																<td class="text-bold-500">신청일</td>
																<td align="center"><c:set var="today"
																		value="<%=new java.util.Date()%>" /> <c:set
																		var="date">
																		<fmt:formatDate value="${today}"
																			pattern="yyyy.MM.dd (E)" />
																	</c:set> <c:out value="${date}" /></td>
															</tr>
															<tr>
																<td class="text-bold-500">예약공간</td>
																<td align="center">${spacebean.name },${detailSpacebean.name }</td>
															</tr>
															<tr>
																<td class="text-bold-500">예약내용</td>
																<td align="center"><fmt:parseDate var="ciDate"
																		value="${reservationBean.checkin}"
																		pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
																		value="${ciDate}" pattern="yyyy.MM.dd (E) HH시" /> ~ <fmt:parseDate
																		var="coDate" value="${reservationBean.checkout }"
																		pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
																		value="${coDate}" pattern="HH시" /></td>
															</tr>
															<tr>
																<td class="text-bold-500">예약인원</td>
																<td align="center">${reservationbean.person}명</td>
															</tr>
															<tr>
																<td class="text-bold-500">요청사항</td>
																<c:if test="${empty reservationbean.cusrequest}">
																	<td align="center">없음.</td>
																</c:if>
																<c:if test="${not empty reservationbean.cusrequest}">
																	<td align="center">${reservationbean.cusrequest}</td>
																</c:if>
															</tr>
															<tr>
																<td class="text-bold-500">사용목적</td>
																<td align="center">${spacebean.type }</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<div class="col-5">
										<div class="card">
											<div class="card-body">
												<h4>결제 금액</h4>
												<table class="table table-lg mx-auto">
													<tbody>
														<tr>
															<td class="text-bold-500">예약날짜</td>
															<td align="center"><fmt:parseDate var="ciDate"
																	value="${reservationBean.checkin}"
																	pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
																	value="${ciDate}" pattern="yyyy.MM.dd (E)" />
														</tr>
														<tr>

															<td class="text-bold-500">예약시간</td>
															<td align="center"><fmt:parseDate var="ciDate"
																	value="${reservationBean.checkin}"
																	pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
																	value="${ciDate}" pattern="HH시" /> ~ <fmt:parseDate
																	var="coDate" value="${reservationBean.checkout }"
																	pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
																	value="${coDate}" pattern="HH시" /></td>
														</tr>
														<tr>
															<td class="text-bold-500">예약인원</td>
															<td align="center">${reservationbean.person}명</td>
														</tr>
														<tr>
															<td class="text-bold-500">결제정보</td>
															<td align="center">${reservationbean.paymenttype }</td>
														</tr>
														<tr>
															<td class="text-bold-500">결제금액</td>
															<td align="center"><fmt:formatNumber
																	value="${reservationbean.amounts}" pattern="###,###" />원
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<!-- 예약 내용 끝 -->
								<!-- 예약자 정보 시작 -->
								<div class="col-md-7">
									<div class="card">
										<div class="card-body">
											<h4>예약자 정보</h4>
											<table class="table table-lg mx-auto">
												<tbody>
													<tr>
														<td class="text-bold-500">예약자 이름</td>
														<td align="center">${memberbean.name }</td>
													</tr>
													<tr>
														<td class="text-bold-500">연락처</td>
														<td align="center">${memberbean.hp }</td>
													</tr>
													<tr>
														<td class="text-bold-500">이메일</td>
														<td align="center">${memberbean.email }</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 예약자 정보 끝 -->
					</section>
				</div>
			</div>
		</div>
							
						<%-- ******* Main Code END ******* --%>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script type="text/javascript">
		function reservList(spacenum){
				//alert(num);
 				location.href="reservList.rv?spacenum="+spacenum;
			}
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>