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
					<div class="row justify-content-center">
					<div class="col-8">
					<%-- ******* Main Code HERE ******* --%>
					<div class="card">
					<div class="card-body">
					<h4>예약하기</h4>
						<div class="row">
							<div class="col-5 px-5">
							<img src="<%=request.getContextPath()%>/resources/spaceimage/${spacebean.mainimage}"
										class="img-fluid w-100 first" style="height: 250px">
							</div>
							<div class="col-7">
								<h4>${spacebean.name }</h4>
								<table class="table">
									<tr>
										<th>공간설명</th>
										<td>${spacebean.contentssim }</td>
									</tr>
									<tr>
										<th>분류</th>
										<td>${spacebean.type }</td>
									</tr>
									<tr>
										<th>세부공간 이름</th>
										<td>${detailSpacebean.name }</td>
									</tr>
									<tr>
										<th>세부공간 설명</th>
										<td>${detailSpacebean.contents }</td>
									</tr>
									<tr>
										<th>예약시간</th>
										<td>최소 ${detailSpacebean.mintime } 시간부터</td>
									</tr>
									<tr>
										<th>수용인원</th>
										<td>최소 ${detailSpacebean.minperson } 명 ~ 최대 ${detailSpacebean.maxperson } 명</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-6">
					<div class="card">
						<div class="card-body">
						<h5>호스트 정보</h5>
						<table class="table mb-5">
							<tbody>
								<tr>
									<th>공간상호</th>
									<td>${balance.company}</td>
								</tr>
								<tr>
									<th>대표자명</th>
									<td>${balance.name }</td>
								</tr>
								<tr>
									<th>소재지</th>
									<td>${balance.address }</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>${balance.call }</td>
								</tr>
							</tbody>
						</table>
						<h5>예약자 정보</h5>
						<table class="table">
							<tbody>
							<tr>
								<th>예약자 이름</th>
								<td>${loginInfo.name}</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${loginInfo.hp }</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${loginInfo.email }</td>
							</tr>
							</tbody>
						</table>
						</div>
					</div>
					</div>
					<div class="col-6">
					<div class="card">
					<div class="card-body">
						<h5>예약 정보 입력</h5>
							<form action="reservInsert.rv" method="post">
							<table class="table">
								<tbody>
									<tr>
										<th>예약인원</th>
										<td align="center">
											<input type="number" class="form-control" name="person"
												value="${detailSpacebean.minperson }" id="selectPerson">
										</td>
									</tr>
									<tr>
										<th>예약날짜</th>
										<td>
										<jsp:useBean id="now" class="java.util.Date" />
										<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
										<input type="date"
											name="reservationdate" id="textdate" value="${today}"></td>
									</tr>
									<tr>
										<th>예약시간</th>
										<td>
											<div class="input-group mb-3">
												<input type="hidden" name="operatingtime" value="${spacebean.operatingtime }">
												<select class="form-select" name="checkintime" id="selectTextTime1">
													<c:forEach var="i" begin="${spacebean.operatingtime }" end="${spacebean.operatingendtime }">
														<option value="${i}">${i }</option>
													</c:forEach>
												</select> 
												<span class="input-group-text">시 부터</span> 
												<input type="hidden" name="operatingendtime" value="${spacebean.operatingendtime }">
												<select class="form-select" name="checkouttime" id="selectTextTime2">
													<c:forEach var="i" begin="${spacebean.operatingtime }" end="${spacebean.operatingendtime }" varStatus="vs">
														<option value="${i}"
														<c:if test="${vs.count eq 2 }">selected</c:if>
														>${i }</option>
													</c:forEach>
												</select>
												<span class="input-group-text">시 까지</span>
											</div>
										</td>
									</tr>
									<tr>
										<th>결제종류</th>
										<td>
											<select name="paymenttype">
												<option value="무통장입금">무통장입금</option>
												<option value="현장결제">현장결제</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>요청사항</th>
										<td>
											<textarea name="cusrequest" rows="3" cols="45" style="resize: none;"></textarea>
										</td>
									</tr>
									<tr>
										<th>예약시간</th>
										<td style="text-align:right;">
											<fmt:formatDate var="todayStr" value="${now }" pattern="yyyy년 MM월 dd일"/>
											<span id="selectDateText">${todayStr }</span>
										 	<span id="selectTimeText"></span>
										 </td>									
									</tr>
									<tr>
										<th>가격</th>
										<td style="text-align:right;">${detailSpacebean.price }원 / ${detailSpacebean.priceunit }</td>									
									</tr>
									<tr>
										<th></th>
										<td style="text-align:right;"><span id="priceFormula"></span></td>
									</tr>
									<tr>
										<th>결제 예정금액</th>
										<td style="text-align:right; font-size:25px; font-weight: bold;">
											<span id="priceText">10000</span>원
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align:center;">
											<button class="btn btn-outline-success" type="submit" onClick="return processing()">예약하기</button>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="spacenum" value="${spacebean.num }">
							<input type="hidden" name="detailspacenum" value="${detailSpacebean.num }">
							</form>
						</div>
						</div>
						</div>
					</div>
				</div>
				</div>
				</section>
		<%-- ******* Main Code END ******* --%>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>
		<script type="text/javascript">
			function processing(){
				var start_time = $('select[name="checkintime"]').val();
				var end_time = $('select[name="checkouttime"]').val();
			
			if($('input[name="person"]').val()==0) {
					alert("최소 인원 1명이상 선택해주세요.");
					$('input[name="person"]').focus();
					return false;
			}
			if($('input[name="reservationdate"]').val()=="") {
				alert("예약날짜 선택해주세요.");
				$('input[name="reservationdate"]').focus();
				return false;
				
			}
			if($('input[name="paymenttype"]').val()=="") {
				alert("결제상태를 선택해주세요.");
				$('input[name="reservationdate"]').focus();
				return false;
			}
			
			var opStime = ${spacebean.operatingtime};
			var opEtime = ${spacebean.operatingendtime};
			if(opStime == 0 && opEtime == 24){
				//24시간 운영
				return true;
			}
			if(parseInt(start_time) > parseInt(end_time)){
				alert("시작시간은 종료시간보다 빨라야 합니다.");
				return false;
			}
			else if(start_time == end_time){
				alert("시작시간과 종료시간이 같을 수 없습니다.");
				return false;
			}
			var inputDate = $('#textdate').val();
			var todayDate = new Date();
			todayDate.setHours(0);
			todayDate.setMinutes(0);
			todayDate.setSeconds(0);
			var lastDate = new Date();
			lastDate.setFullYear(lastDate.getFullYear()+1);
			var curDate = new Date(inputDate);
			if(curDate < todayDate){
				alert("오늘 이전으로 예약할 수 없습니다.");
				return false;
			}if(curDate > lastDate){
				alert("1년 이내로만 예약이 가능합니다.");
				return false;
			}
			return true;
		}
		</script>
		<script type="text/javascript">
			var intValprice;
			var checkoutTime;
			var checkinTime;
			var priceVal;
			var intAmount;
			var cTime;
			var intcheckinTime;
			var intcheckoutTime;
			
			var selTimeCount = 0;
			var selPersonCount = 0;
			function changeTimeText(){
				var selTime1 = $('#selectTextTime1').val();
				var selTime2 = $('#selectTextTime2').val();
				selTimeCount = parseInt(selTime2) - parseInt(selTime1);
				
				var selTimeTxt = $('#selectTextTime1').val()+"시 ~ "+$("#selectTextTime2").val()+"시 ("+selTimeCount+"시간)";
				$('#selectTimeText').empty();
				$('#selectTimeText').text(selTimeTxt);
			}
			
			function changeDateText(){
				var selDate = $('#textdate').val();
				var selDateArr = selDate.split('-');
				var selDateText = selDateArr[0]+"년 "+selDateArr[1]+"월 "+selDateArr[2]+"일";
				$('#selectDateText').empty();
				$('#selectDateText').text(selDateText);
			}
			
			function changePriceText(){
				// 시간 - 시간 * 가격 * 인원
				// 공간 - 시간 * 가격
				var priceunit = '${detailSpacebean.priceunit}';
				var price = '${detailSpacebean.price}';
				var timeCount = selTimeCount;
				var person = $('#selectPerson').val();
				if(priceunit == '시간'){
					var priceFor = selTimeCount+"시간 * "+person+"명 * "+price+"원";
					$('#priceFormula').empty();
					$('#priceFormula').text(priceFor);
					var amount = parseInt(price) * selTimeCount * parseInt(person);
					$('#priceText').empty();
					$('#priceText').text(amount);
				}else{
					var priceFor = selTimeCount+"시간 * "+price+"원";
					$('#priceFormula').empty();
					$('#priceFormula').text(priceFor);
					var amount = parseInt(price) * selTimeCount;
					$('#priceText').empty();
					$('#priceText').text(amount);
				}
			}
			$(function() {
				changeDateText();
				changeTimeText();
				changePriceText();
				
				$('#textdate').change(function() {
					changeDateText();
				});
				$('#selectTextTime1').change(function() {
					//유효성검사
					var opStartTime = '${spacebean.operatingtime}';
					var opEndTime = '${spacebean.operatingendtime}';
					var selTime1 = $('#selectTextTime1').val();
					var selTime2 = $('#selectTextTime2').val();
					if(parseInt(selTime1) >= parseInt(selTime2)){
						alert("시작시간은 종료시간보다 빨라야합니다.");
						$(this).val(opStartTime)
					}
					//
					changeTimeText();
					changePriceText();
				});
				$('#selectTextTime2').change(function() {
					//유효성검사
					var opStartTime = '${spacebean.operatingtime}';
					var opEndTime = '${spacebean.operatingendtime}';
					var selTime1 = $('#selectTextTime1').val();
					var selTime2 = $('#selectTextTime2').val();
					if(parseInt(selTime1) >= parseInt(selTime2)){
						alert("종료시간은 시작시간보다 늦어야합니다.");
						$(this).val(opEndTime)
					}
					changeTimeText();
					changePriceText();
				});
				$('#selectPerson').change(function(){
					//유효성검사
					var minPerson = '${detailSpacebean.minperson}';
					var maxPerson = '${detailSpacebean.maxperson}';
					var personVal = $(this).val();
					if(parseInt(personVal) < parseInt(minPerson)){
						alert('최소 인원은 '+minPerson+'명 입니다.');
						$(this).val(minPerson);
					}
					if(parseInt(personVal) > parseInt(maxPerson)){
						alert('최대 인원은 '+maxPerson+'명 입니다.');
						$(this).val(maxPerson);
					}
					//
					changePriceText();
				});
			});
			
		</script>
		<%-- ******* CUSTOM Script END ******* --%>
</body>