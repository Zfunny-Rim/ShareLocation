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
						<!-- 예약 공간 시작-->
							<div class="card">
								<div class="card-content">
									<div class="card-body">
										<h5 class="card-title" align="center">${spacebean.name },${detailSpacebean.name }</h5>
										<p class="card-text" align="center">예약이 확정되었습니다.</p>
									</div>
								</div>
								<ul class="list-group list-group-flush">
<!-- 									<li class="list-group-item"></li> -->
									<li class="list-group-item">
										</li>
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
											<span class="collapsed collapse-title">결제 금액</span>
										</div>
										<div id="collapseOne" class="collapse pt-1"
											aria-labelledby="headingOne" data-parent="#cardAccordion">
											<div class="card-body">
												<!-- reservation 넘어가기 -->

												<div class="card-body" style="width: auto">
													<!-- Table with outer spacing -->
													<div class="table-responsive">
															<table class="table table-lg" style="width: auto;">
																<tbody>
																	<tr>
																		<td class="text-bold-500">예약날짜</td>
																		<td align="center">${reservationdate}</td>
																		<td rowspan="5">
																			<fmt:formatNumber value="${reservationbean.amounts}" pattern="###,###"/>원
																		</td>
																	</tr>
																	<tr>
																		
																		<td class="text-bold-500">예약시간</td>
																		<td align="center">
																			<fmt:parseDate var="ciDate" value="${reservationBean.checkin}" pattern="yyyy-MM-dd HH:mm"/>
																			<fmt:formatDate  value="${ciDate}" pattern="MM월 dd일 HH시"/>
																			~ 
																			<fmt:parseDate var="coDate" value="${reservationBean.checkout }" pattern="yyyy-MM-dd HH:mm"/>
																			<fmt:formatDate  value="${coDate}" pattern="dd일 HH시"/>
																		</td>
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
																		<td align="center">
																			<fmt:formatNumber value="${reservationbean.amounts}" pattern="###,###"/>원
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
							</div>
							
							<!-- 	  접히는거 끝 -->
							
							
							<!-- 예약 내용 시작-->
							<div class="col-md-7 col-12">
								<div class="card">
									<div class="card-header">
										<div
											class="card-header border-bottom d-flex justify-content-between align-items-center">
											<h4 class="card-title d-flex" align="left">
												<i class="bx bx-check font-medium-5 pl-25 pr-75"></i>예약 내용
											</h4>
										</div>
									</div>
									<div class="card-content">
										<div class="card-body">
											<table class="table table-lg" style="width: auto;">
												<tbody>
													<tr>
														<td class="text-bold-500">신청일</td>
														<td align="center">
															<c:set var="today" value="<%=new java.util.Date()%>" />
															<c:set var="date">
																<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
															</c:set>
															<c:out value="${date}" />
														</td>
													</tr>
													<tr>
														<td class="text-bold-500">예약공간</td>
														<td align="center">${spacebean.name },${detailSpacebean.name }</td>
													</tr>
													<tr>
														<td class="text-bold-500">예약내용</td>
														<td align="center">
															<fmt:parseDate var="ciDate" value="${reservationBean.checkin}" pattern="yyyy-MM-dd HH:mm"/>
															<fmt:formatDate  value="${ciDate}" pattern="MM월 dd일 HH시"/>
															~ 
															<fmt:parseDate var="coDate" value="${reservationBean.checkout }" pattern="yyyy-MM-dd HH:mm"/>
															<fmt:formatDate  value="${coDate}" pattern="dd일 HH시"/>
														</td>
													</tr>
													<tr>
														<td class="text-bold-500">예약인원</td>
														<td align="center">${reservationbean.person}명</td>
													</tr>
													<tr>
														<td class="text-bold-500">요청사항</td>
															<c:if test = "${empty reservationbean.cusrequest}">
																<td align="center">
      														  		 없음.
																</td>
   														   </c:if>
   														   <c:if test = "${not empty reservationbean.cusrequest}">
																<td align="center">
      														  		${reservationbean.cusrequest}
																</td>
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
							<!-- 예약 내용 끝 -->

							<!-- 예약자 정보 시작 -->
							<div class="col-md-7 col-12">
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
															<%=hp%>
														</div>
														<div class="col-md-4">
															<label><font style="vertical-align: inherit;"><font
																	style="vertical-align: inherit;">이메일</font></font></label>
														</div>
														<div class="col-md-8 form-group">
															<%=email%>
														</div>
													</div>
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