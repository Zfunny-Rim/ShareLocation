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
		<div id="" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">
						<%-- ******* Main Code HERE ******* --%>
						<form:form commandName="" action="reservInsert.rv" method="post">
							<input type="hidden" name="spacenum" value="${spacebean.num}"> 
							<input type="hidden" name="detailspacenum" value="${detailSpacebean.num}">
							<h2 data-v-744e58ae="" class="heading--new" align="center">예약하기</h2>
							<!-- 예약 공간 시작-->
							<p class="text-subtitle text-muted">예약 공간</p>
							<div class="card">
                                <div class="card-content">
                                   <img src="<%=request.getContextPath()%>/resources/spaceimage/${spacebean.mainimage}"
										class="img-fluid1, first" alt="singleminded">
                                    <div class="card-body">
                                        <h5 class="card-title">${spacebean.name }</h5>
                                        <p class="card-text">
                                           ${spacebean.contentscom }
                                        </p>
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
														<table class="table table-lg" style="width: auto;">
															<tbody>
																<tr>
																	<td class="text-bold-500">예약날짜</td>
																	<td align="center"><input type="text" id="textbox"
																		disabled></td>

																</tr>
																<tr>
																	<td class="text-bold-500">예약시간</td>
																	<td align="center">
																		<div class="input-group mb-3">
																<select class="form-select" id="selectText1" disabled>

																	<option value="0">00</option>

																	<option value="1">01</option>

																	<option value="2">02</option>

																	<option value="3">03</option>

																	<option value="4">04</option>

																	<option value="5">05</option>

																	<option value="6">06</option>

																	<option value="7">07</option>

																	<option value="8">08</option>

																	<option value="9">09</option>

																	<option value="10">10</option>

																	<option value="11">11</option>

																	<option value="12">12</option>

																	<option value="13">13</option>

																	<option value="14">14</option>

																	<option value="15">15</option>

																	<option value="16">16</option>

																	<option value="17">17</option>

																	<option value="18">18</option>

																	<option value="19">19</option>

																	<option value="20">20</option>

																	<option value="21">21</option>

																	<option value="22">22</option>

																	<option value="23">23</option>

																	<option value="24">24</option>

																</select> <span class="input-group-text">시 부터</span> 
																<select class="form-select" id="selectText2" disabled>

																	<option value="0">00</option>

																	<option value="1">01</option>

																	<option value="2">02</option>

																	<option value="3">03</option>

																	<option value="4">04</option>

																	<option value="5">05</option>

																	<option value="6">06</option>

																	<option value="7">07</option>

																	<option value="8">08</option>

																	<option value="9">09</option>

																	<option value="10">10</option>

																	<option value="11">11</option>

																	<option value="12">12</option>

																	<option value="13">13</option>

																	<option value="14">14</option>

																	<option value="15">15</option>

																	<option value="16">16</option>

																	<option value="17">17</option>

																	<option value="18">18</option>

																	<option value="19">19</option>

																	<option value="20">20</option>

																	<option value="21">21</option>

																	<option value="22">22</option>

																	<option value="23">23</option>

																	<option value="24">24</option>

																</select> <span class="input-group-text">시 까지</span>
															</div>
																	</td>
																</tr>
																<tr>
																	<td class="text-bold-500">예약인원</td>
																	<td align="center"><input type="text"
																		id="textboxperson" disabled>명</td>
																</tr>
																<tr>
																	<td class="text-bold-500">결제방식</td>
																	<td align="center">
																		<select class="form-select" id="basicSelect" name="paymenttype">
                                                        					<option value="">선택</option>
                                                        					<option value="현장결제">현장결제</option>
                                                        					<option value="무통장입금">무통장입금</option>
                                                    					</select>
																	</td>
																</tr>
																<tr>
																	<td class="text-bold-500" align="center" colspan="2" >
																		총 가격:
																		<span id="priceText">
																		${detailSpacebean.price}
																		</span>
																	</td>
																</tr>
																<tr>
																	<td colspan="2" class="text-bold-500" align="center"><input
																		type="submit" class="btn btn-secondary" value="예약신청하기"></td>
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
							<div class="col-md-7 col-12">
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
														<td align="center">
														<input type="date" name="reservationdate" id="textdate"></td>
													</tr>
													<tr>
														<td class="text-bold-500">예약시간</td>
														<td>
															<div class="input-group mb-3">
																<input type="hidden" name="operatingtime" value="${spacebean.operatingtime }">
																<select class="form-select" name="checkintime" id="selectTextTime1" >

																	<option value="0">00</option>

																	<option value="1">01</option>

																	<option value="2">02</option>

																	<option value="3">03</option>

																	<option value="4">04</option>

																	<option value="5">05</option>

																	<option value="6">06</option>

																	<option value="7">07</option>

																	<option value="8">08</option>

																	<option value="9">09</option>

																	<option value="10">10</option>

																	<option value="11">11</option>

																	<option value="12">12</option>

																	<option value="13">13</option>

																	<option value="14">14</option>

																	<option value="15">15</option>

																	<option value="16">16</option>

																	<option value="17">17</option>

																	<option value="18">18</option>

																	<option value="19">19</option>

																	<option value="20">20</option>

																	<option value="21">21</option>

																	<option value="22">22</option>

																	<option value="23">23</option>

																	<option value="24">24</option>

																</select> <span class="input-group-text">시 부터</span> 
																<input type="hidden" name="operatingendtime" value="${spacebean.operatingendtime }">
																<select class="form-select" name="checkouttime" id="selectTextTime2">

																	<option value="0">00</option>

																	<option value="1">01</option>

																	<option value="2">02</option>

																	<option value="3">03</option>

																	<option value="4">04</option>

																	<option value="5">05</option>

																	<option value="6">06</option>

																	<option value="7">07</option>

																	<option value="8">08</option>

																	<option value="9">09</option>

																	<option value="10">10</option>

																	<option value="11">11</option>

																	<option value="12">12</option>

																	<option value="13">13</option>

																	<option value="14">14</option>

																	<option value="15">15</option>

																	<option value="16">16</option>

																	<option value="17">17</option>

																	<option value="18">18</option>

																	<option value="19">19</option>

																	<option value="20">20</option>

																	<option value="21">21</option>

																	<option value="22">22</option>

																	<option value="23">23</option>

																	<option value="24">24</option>

																</select> <span class="input-group-text">시 까지</span>
															</div>
														</td>
													</tr>
													<tr>
														<td class="text-bold-500">예약인원</td>
														<td align="center">
															<div class="row align-items-center">
																<div class="col-lg-8 col-8">
																	<input type="number" class="form-control" name="person"
																		value="0" id="testperson">
																</div>
															</div>
														</td>
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
															<td>${balance.account }</td>
														</tr>
														<tr>
															<td class="text-bold-500">연락처</td>
															<td>${balance.call }</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 호스트 정보 끝-->
						</form:form>
					</section>
				</div>
			</div>
		</div>
		<%-- ******* Main Code END ******* --%>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script type="text/javascript">
	    var intValprice;
	      var checkoutTime;
	      var checkinTime;
	      var priceVal;
	      var intAmount;
	      var cTime;
	      var intcheckinTime;
	      var intcheckoutTime;
	      $(function(){
	         $('#textdate').change(function(){
	            //alert(1);
	            var dateVal = $(this).val();
	            $('#textbox').val(dateVal);
	         });
	         $('#testperson').change(function(){
	            var personVal = $(this).val();
	            $('#textboxperson').val(personVal);
	             intValperson = parseInt(personVal);
	            
	             priceVal = "${detailSpacebean.price}";
	            intValprice = parseInt(priceVal);
	            
	             intAmount = intValperson*intValprice;
	            //alert(intAmount);
	            // alert(intAmount+cTime);
	             $('#priceText').text(intAmount+cTime);
	         });
	         $('#selectTextTime1').change(function(){
	            var checkinTime = $(this).val();
	            $('#selectText1').val(checkinTime);
	             intcheckinTime = parseInt(checkinTime);
	            //alert(intcheckinTime);
	         });
	         $('#selectTextTime2').change(function(){
	            var checkoutTime = $(this).val();
	            $('#selectText2').val(checkoutTime);
	             intcheckoutTime = parseInt(checkoutTime);
	             cTime=(intcheckoutTime-intcheckinTime)*intValprice;
	            // alert(parseInt(intAmount+cTime));
	             $('#priceText').text(intAmount+cTime);
	         });
	         
	      });
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>