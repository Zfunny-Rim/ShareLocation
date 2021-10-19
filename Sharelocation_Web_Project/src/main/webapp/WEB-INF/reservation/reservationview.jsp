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
	
.err{color:red; font-weight: bold; font-size:11px;} 

    	
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
											<p class="card-text" style="text-align:center">
												<c:if test="${reservationbean.status eq '예약대기' }">
													<span class="badge bg-warning res-stat">${reservationbean.status }</span>
												</c:if>
												<c:if test="${reservationbean.status eq '입금대기' }">
													<span class="badge bg-info res-stat">${reservationbean.status }</span>
												</c:if>
												<c:if test="${reservationbean.status eq '예약확정' }">
													<span class="badge bg-success res-stat">${reservationbean.status }</span>
												</c:if>
												<c:if test="${reservationbean.status eq '이용완료' }">
													<span class="badge bg-primary res-stat">${reservationbean.status }</span>
												</c:if>
												<c:if test="${reservationbean.status eq '예약취소' }">
													<span class="badge bg-danger">${reservationbean.status }</span>
												</c:if>
											</p>
				<c:if test="${reservationbean.status eq '이용완료' }">
					<form action="reviewboardInsert.rv" method="get" id="reviewboardInsert">
						<input type="hidden" name="spacenum" value="${spacebean.num}"> 
						<input type="hidden" name="membernum" value="${reservationbean.membernum}">
						<input type="hidden" name="reservnum" value="${reservationbean.num}">
						<input type="hidden" name="writer" value="${loginInfo.nickname}">
						<input type="hidden" name="detailspacenum" value="${reservationbean.detailspacenum}">
						<p class="card-text" style="text-align:center">
							<button type="button" class="btn btn-outline-success"
								data-bs-toggle="modal" data-bs-target="#inlineForm">
								이용 후기쓰기</button>
						</p>
					<!-- Modal 시작 -->
					<div class="modal fade text-left" id="inlineForm"
						tabindex="-1" aria-labelledby="myModalLabel33"
						style="display: none;" aria-hidden="true">
						<div
							class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel33">이용후기 작성</h4>
								</div>
									<div class="modal-body">
										<label>서비스 </label>
										<div>
											1<input type="radio" name="servicerating" value="1">
											2<input type="radio" name="servicerating" value="2">
											3<input type="radio" name="servicerating" value="3"
												checked> 4<input type="radio"
												name="servicerating" value="4"> 5<input
												type="radio" name="servicerating" value="5">
										</div>
										<label>가성비 </label>
										<div>
											1<input type="radio" name="pricevalueration" value="1">
											2<input type="radio" name="pricevalueration" value="2">
											3<input type="radio" name="pricevalueration" value="3"
												checked> 4<input type="radio"
												name="pricevalueration" value="4"> 5<input
												type="radio" name="pricevalueration" value="5">
										</div>
										<label>청결도 </label>
										<div>
											1<input type="radio" name="cleanrating" value="1">
											2<input type="radio" name="cleanrating" value="2">
											3<input type="radio" name="cleanrating" value="3"
												checked> 4<input type="radio"
												name="cleanrating" value="4"> 5<input
												type="radio" name="cleanrating" value="5">
										</div>
									
										<p class="card-text">이용 후기</p>
										<div class="form-floating">
											<textarea class="form-control" id="contentCheck" name="content" rows="2" style="resize: none;"></textarea>
											<label for="floatingTextarea">이용후기를 남겨주세요.</label>
										</div>
									</div>
								<div class="modal-footer">
										<button type="reset" class="btn btn-light-secondary"
											data-bs-dismiss="modal">
											<span class="d-none d-sm-block">취소</span>
										</button>
										<button type="submit" class="btn btn-light-primary" onClick="return reviewcheck()">
											<span class="d-none d-sm-block">등록</span>
										</button>
<!-- 										 <input type="submit" value="등록" onClick="return reviewcheck()"> -->
								</div>
							</div>
						</div>
					</div>
					</form>
				</c:if>
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
																<td class="text-bold-500">공간분류</td>
																<td align="center">${spacebean.type }</td>
															</tr>
															<tr>
																<td class="text-bold-500">예약내용</td>
																<td align="center">
																<fmt:parseDate var="ciDate" value="${reservationbean.checkin}" pattern="yyyy-MM-dd HH:mm"/>
																<fmt:formatDate  value="${ciDate}" pattern="yyyy.MM.dd (E) HH시"/>
																~ 
																<fmt:parseDate var="coDate" value="${reservationbean.checkout }" pattern="yyyy-MM-dd HH:mm"/>
													 			<fmt:formatDate  value="${coDate}" pattern="HH시"/>
																</td>
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
																	value="${reservationbean.checkin}"
																	pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
																	value="${ciDate}" pattern="yyyy.MM.dd (E)" />
														</tr>
														<tr>

															<td class="text-bold-500">예약시간</td>
															<td align="center"><fmt:parseDate var="ciDate"
																	value="${reservationbean.checkin}"
																	pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
																	value="${ciDate}" pattern="HH시" /> ~ <fmt:parseDate
																	var="coDate" value="${reservationbean.checkout }"
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
			function reservList(spacenum) {
				//alert(num);
				location.href = "reservList.rv?spacenum=" + spacenum;
			}
			function reviewcheck(){
				if($("#contentCheck").val() == ""){
					alert("이용후기를 입력해주세요.");
					$("#contentCheck").focus();    
					return false;
				}
				return true;
			}
			
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>